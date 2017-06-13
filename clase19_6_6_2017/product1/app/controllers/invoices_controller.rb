class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all
  end

  def create
    invoice = params.require(:invoice)
    .permit(:total, :user_id, :status, :order_id)
    @invoice = Invoice.new invoice
    if @invoice.save
      redirect_to invoice_path(@invoice)
    else
      render :new
    end
  end

  def new
    @invoice = Invoice.new
  end

  def edit
    begin
      @invoice = Invoice.find params[:id]
    rescue ActiveRecordNotFount => e
      #render :not_found
      redirect_to invoices_path
    end
  end

  def show
    begin
      @invoice = Invoice.find params[:id]
    rescue ActiveRecordNotFount => e
      #render :not_found
      redirect_to invoices_path
    end
  end

  def update
    invoice = params
    .require(:invoice)
    .permit(:total, :user_id, :status, :order_id)
    #@invoice.update_attributes invoice
    @invoice.total = invoice[:total]
    if @invoice.save
      redirect_to invoice_path(@invoice)
    else
      render :edit
    end
  end

  def destroy
    @invoice = Invoice.destroy params[:id]
  end
end
