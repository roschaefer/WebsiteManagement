HighVoltage.routes = false
if Rails.env.test? || Rails.env.cucumber?
  HighVoltage.content_path = "#{Rails.env}/websites/"
else
  HighVoltage.content_path = "websites/"
end
