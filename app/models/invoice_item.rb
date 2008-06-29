class InvoiceItem < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    invoice_id :integer
    product_id :integer
    description :string
    quantity :integer
    unit_price :integer
    total :integer
    timestamps
  end

  belongs_to :invoice
  belongs_to :product

  # --- Hobo Permissions --- #

  def creatable_by?(user)
    user.administrator?
  end

  def updatable_by?(user, new)
    user.administrator?
  end

  def deletable_by?(user)
    user.administrator?
  end

  def viewable_by?(user, field)
    true
  end

end
