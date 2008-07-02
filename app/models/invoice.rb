class Invoice < ActiveRecord::Base

  hobo_model # Don't put anything above this

  has_many :invoice_items,:dependent => :destroy
  belongs_to :customer

  fields do
    customer_id :integer
    note :text
    date :datetime
    state :string
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
