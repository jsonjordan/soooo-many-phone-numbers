class UserphoneForm
  include ActiveModel::Model

  attr_accessor :username, :phones

  validates :username, presence: true, length: { minimum: 4, maximum: 15}
  validates :phones, presence: true, length: { is: 10 }

  def save
    if valid?
      user = User.where(username: username).first_or_create!
      phone_numbers.each do |number|
        Phone.where(
          user: user,
          number: number
        ).first_or_create!
      end
    end
  end

  private

  def phone_numbers
    phones.split(",").map { |n| n.strip }
  end
end
