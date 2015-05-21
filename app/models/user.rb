class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :mobile, presence: true, uniqueness: true
  validate :captcha_valuable, on: :create

  attr_accessor :captcha

  private
  def captcha_valuable
    unless Captcha.where('code = ? AND mobile = ? AND created_at > ?', self.captcha.to_i, self.mobile, Time.now - 10.minutes).exists?
      errors.add(:captcha, '无效的验证码')
    end
  end

  protected
  def email_required?
    false
  end
end
