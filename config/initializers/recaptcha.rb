CAPTCHA_CONFIG = YAML.load_file("#{Rails.root}/config/captcha.yml")[Rails.env]
Recaptcha.configure do |config|
  config.public_key  = CAPTCHA_CONFIG['public_key']
  config.private_key = CAPTCHA_CONFIG['private_key']
  #config.proxy = 'http://localhost:3000'
end
