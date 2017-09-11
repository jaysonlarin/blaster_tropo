class Sms
  # Class Methods
  class << self
    include Constant

    def send(params)
      message = params[:message] rescue ""
      mobtel = params[:mobile_number] rescue ""

      return if message.blank?
      return if mobtel.blank?

      json = sms_json(mobtel, message)

      response = HTTParty.post(send_message_url, body: json)
    end

    def sms_json(mobtel, message)
      {
        'address' => mobtel,
        'deliveryNotification' => 'true',
        'message' => message,
        'passphrase' => passphrase
      }
    end

    def send_message_url
      params = "app_id=#{app_id}&app_secret=#{app_secret}"
      "#{sms_url}/#{short_code}/requests?#{params}"
    end
  end
  # Class Methods

  # Instance Methods
  # Instance Methods
end
