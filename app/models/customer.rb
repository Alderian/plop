class Customer < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    address :text
    phone :string
    email :string
    source :string
    registered :datetime
    active :boolean
    timestamps
  end

  validates_presence_of :name, :message => "can't be blank"
  validates_uniqueness_of :name, :message => "must be unique"

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
