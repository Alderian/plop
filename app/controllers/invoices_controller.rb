class InvoicesController < ResourceController::Base
  layout 'application'
  auto_complete_for :customer,:name, {:conditions => lambda {|params| ["name LIKE ?","%"+params[:value]+"%"]} }
end