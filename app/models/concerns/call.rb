class Call
  # Class Methods
  class << self
    include Constant

    def proceed(params={})
      number = params[:phone_number]
      msg = params[:message].gsub("\r\n","")

      HTTParty.get(call_url(number, msg), :verify => false)
    end

    def call_url(mobile_number, msg)
      params = "token=#{voice_token}"\
        "&mobile_number=#{mobile_number}"\
        "&message=#{msg}"

      "#{tropo_url}/sessions?action=create&#{params}"
    end

    def calling(params = {})
      mobile_number = params[:session][:parameters][:mobile_number] rescue ""
      message = params[:session][:parameters][:message] rescue ".Sample Message"

      return if mobile_number.blank?
      return if message.blank?

      t = Tropo::Generator.new
      t.call(to: mobile_number,
             from: from_caller_id)
      t.say message
      t.on event: 'continue', next: "/home/hangup"
      t.on event: 'hangup', next: '/home/hangup'
      t.on event: 'incomplete', next: "/home/incomplete-call"
      t.on event: 'error', next: "/home/error"
      t.response
    end

  end
  # Class Methods

  # Instance Methods
  # Instance Methods
end
