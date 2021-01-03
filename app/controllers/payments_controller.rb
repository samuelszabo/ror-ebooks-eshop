# frozen_string_literal: true

class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show edit update destroy]

  # GET /payments
  # GET /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1
  # GET /payments/1.json
  def show
    pr params
    pr payu_verify_return
    # IF payed, push to queue - onl once
    # todo
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit; end

  # POST /payments
  # POST /payments.json
  def create
    order = current_user.orders.find(params[:order_id])
    @payment = Payment.new
    @payment.price = order.price
    @payment.order_id = order.id
    @payment.variable_symbol = order.id.to_s + rand(1..100).to_s.rjust(3, '0')
    url = get_link_url
    @payment.save!

    respond_to do |format|
      if @payment.save
        format.html { redirect_to url }
        format.json { render :show, status: :created, location: url }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1
  # PATCH/PUT /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment.destroy
    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_payment
    @payment = Payment.find(params[:id])
  end

  def payu_verify_return
    response = get_client.get_order(order_id: @payment.payu_order_id)
    raise response.error_message unless response.success?

    pr response.order[:status]
    response.order[:status] == 'COMPLETED'
  end

  def payu_get_token
    Rails.cache.fetch('payu_token', expires_in: 1.hours) do
      response = PayuAPI.authorize(pos_id: ENV['PAYU_POS_ID'], key: ENV['PAYU_CLIENT_SECRET'], sandbox: true) # TODO: sandbox if env
      pr response
      raise 'payu auth_token retrieving failed' unless response.success?

      response.auth_token
    end
  end

  def get_client
    token = payu_get_token
    PayuAPI::Client.new(pos_id: ENV['PAYU_POS_ID'], auth_token: token, sandbox: true)
  end

  def get_link_url
    response = get_client.create_order(
      continueUrl: url_for(@payment),
      customerIp: '127.0.0.1',
      description: 'Order',
      currencyCode: 'PLN',
      totalAmount: @payment.price.cents,
      extOrderId: @payment.variable_symbol,
      buyer: {
        email: 'john.doe@example.com',
        firstName: 'John',
        lastName: 'Doe',
        language: 'en'
      },
      products: [
        {
          name: 'My order',
          unitPrice: @payment.price.cents,
          quantity: 1
        }
      ]
    )

    raise response.error_message unless response.success?

    @payment.payu_order_id = response.order_id

    response.redirect_uri
  end
end
