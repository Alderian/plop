class Product < ActiveRecord::Base

  hobo_model # Don't put anything above this

  belongs_to :category

  fields do
    name :string
    code :string
    stock :integer
    price :decimal,  :precision => 8, :scale => 2
    available :boolean
    timestamps
  end

  validates_presence_of :name, :message => "can't be blank"
  validates_uniqueness_of :name, :message => "must be unique"
  validates_presence_of :price, :message => "can't be blank"
  validates_uniqueness_of :code, :message => "must be unique",:unless => Proc.new { |product| product.code.blank? }

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
