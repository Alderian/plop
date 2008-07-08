class InvoicesController < ResourceController::Base
  layout 'application'
  auto_complete_for :customer,:name
end