class InvoiceItem < ActiveRecord::Base

  hobo_model # Don't put anything above this

  belongs_to :invoice
  belongs_to :product
  fields do
    invoice_id :integer
    product_id :integer
    description :string
    quantity :integer
    unit_price :integer
    total :integer
    timestamps
  end


  # --- Hobo Permissions --- #

  def creatable_by?(user)
    !user.guest?
  end

  def updatable_by?(user, new)
    !user.guest?
  end

  def deletable_by?(user)
    !user.guest?
  end

  def viewable_by?(user, field)
    true
  end

end
