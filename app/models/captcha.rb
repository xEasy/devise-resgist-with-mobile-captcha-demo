class Captcha < ActiveRecord::Base
  validates :code, :mobile, presence: true
  validates_uniqueness_of :code, scope: :mobile

  def self.send_to(mobile)
    code = rand(5)
    if captcha = find_by(mobile: mobile)
      captcha.update_attributes(code: code)
    else
      new(mobile: mobile, code: code).save
    end
  end
end
