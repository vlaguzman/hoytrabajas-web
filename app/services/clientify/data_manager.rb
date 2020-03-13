class Clientify::DataManager
  URL_CONTACTS = "#{Clientify::ApiAuth::CLIENTIFY_URL_API}contacts/"

  CONTACT_CANDIDATE_TAG = 'candidate'
  CONTACT_COMPANY_TAG = 'employer'

  def initialize(token=nil)
    @token = token || Clientify::ApiAuth.new().token
  end
  
  def create_contact user, user_type
    url = URL_CONTACTS
    body = "{\n    \"email\": \"#{user.email}\",
             \n    \"tags\": [\"#{user_type}\", \"htweb\"]
            }"

    response = HttpRequestManager.new(url, body).build_response(Net::HTTP::Post, token)
    user.clientify_contact_id = convert_response_and_give(response, 'id')
    user.save
    response.read_body
  end 

  def update_contact user
    url = "#{URL_CONTACTS}#{user.clientify_contact_id}/"
    body = "{\n    \"first_name\": \"#{user.name}\",
             \n    \"last_name\": \"#{user.last_name}\",
             \n    \"phone\": \"#{phone_number user}\"
            }"

    response = HttpRequestManager.new(url, body).build_response(Net::HTTP::Put, token)
    response.read_body
  end

  private 

  def phone_number user
    user.is_a? User ? user.contact_number : user.contact_cellphone
  end

  def convert_response_and_give response, data
    hash = JSON.parse response.body.gsub('\:', ':')
    hash[data]
  end
  
  def token
    @token
  end

end
