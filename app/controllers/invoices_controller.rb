class InvoicesController < ApplicationController

  hobo_model_controller

  auto_actions :all,:write_only, :show, :edit, :new, :create_invoice_item

end
