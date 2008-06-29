class Invoice < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    customer_id :integer
    note :text
    date :datetime
    state :string
    timestamps
  end

  has_many :invoice_items,:dependent => :destroy
  belongs_to :customer

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
