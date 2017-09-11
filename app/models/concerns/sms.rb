class Sms
  include Constant

  # Class Methods
  class << self
    def send(params)
      message = params[:message] rescue ""
      mobtel = params[:mobile_number] rescue ""

      return if message.blank?
      return if mobtel.blank?

      json = sms_json(mobtel, message)

      response = HTTParty.post(sms_params, body: json)
    end

    def sms_json
      {
        'address' => mobtel,
        'deliveryNotification' => 'true',
        'message' => message,
        'passphrase' => passphrase
      }
    end

    def sms_url
      params = "app_id=#{app_id}&app_secret=#{app_secret}"
      sms_params = "#{sms_url}/#{short_code}/requests?#{params}"
    end
  end
  # Class Methods

  # Instance Methods
  # Instance Methods
end
