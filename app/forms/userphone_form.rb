class UserphoneForm
  include ActiveModel::Model

  attr_accessor :username, :phones

  validates :username, presence: true, length: { minimum: 4, maximum: 15}
  validate :phones_are_valid

  def save
    if valid?
      user = User.where(username: username).first_or_create!
      phone_numbers.each do |number|
        Phone.where(
          user: user,
          number: number.strip
        ).first_or_create!
      end
    end
  end

  private

  def phones_are_valid
    bad_numbers = phone_numbers.reject do |phone|
      phone.length == 10
    end

    if bad_numbers.any?
      errors.add "phones[]", "Entered an invalid phone number"
    end
  end

  def phone_numbers
    phones.select { |n| n != ""}
  end
end
