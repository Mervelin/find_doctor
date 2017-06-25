class Office < ApplicationRecord

  belongs_to :doctor

  def name
    "#{city}, #{street}"
  end
end
