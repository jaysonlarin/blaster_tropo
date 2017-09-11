module Constant
  def app_id
    ENV['APP_ID']
  end

  def app_secret
    ENV['APP_SECRET']
  end

  def caller_id
    "21582994"
  end

  def from_caller_id
    "sip:#{caller_id}@sip.tropo.net"
  end

  def passphrase
    ENV['PASSPHRASE']
  end

  def short_code
    ENV['SHORT_CODE']
  end

  def sms_url
    ENV['SMS_URL']
  end

  def tropo_url
    ENV['TROPO_URL']
  end

  def voice_token
    ENV['VOICE_TOKEN']
  end
end
