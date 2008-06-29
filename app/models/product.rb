class Product < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name :string
    stock :integer
    price :decimal,  :precision => 8, :scale => 2
    available :boolean
    timestamps
  end


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
