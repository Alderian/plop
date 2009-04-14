class CustomersController < ResourceController::Base
  layout 'application'
  before_filter :require_user
  #protect_from_forgery :except => :autocomplete
  #def autocomplete
  #  @customers = Customer.find(:all,:conditions => ["name LIKE ?", "%#{params[:value]}%"])
  #  respond_to do |wants|
  #    wants.json { render :json=> @customers.collect {|c| [c.name,c.id] }.to_json }
  #  end
  #end
end