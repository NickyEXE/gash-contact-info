require "google/apis/sheets_v4"
require "googleauth"
require "googleauth/stores/file_token_store"
require "fileutils"

OOB_URI = "urn:ietf:wg:oauth:2.0:oob".freeze
APPLICATION_NAME = "Google Sheets API Ruby Quickstart".freeze
CREDENTIALS_PATH = "credentials.json".freeze
# The file token.yaml stores the user's access and refresh tokens, and is
# created automatically when the authorization flow completes for the first
# time.
TOKEN_PATH = "token.yaml".freeze
SCOPE = Google::Apis::SheetsV4::AUTH_SPREADSHEETS_READONLY

##
# Ensure valid credentials, either by restoring from the saved credentials
# files or intitiating an OAuth2 authorization. If authorization is required,
# the user's default browser will be launched to approve the request.
#
# @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials
def authorize
  client_id = Google::Auth::ClientId.from_file CREDENTIALS_PATH
  token_store = Google::Auth::Stores::FileTokenStore.new file: TOKEN_PATH
  authorizer = Google::Auth::UserAuthorizer.new client_id, SCOPE, token_store
  user_id = "default"
  credentials = authorizer.get_credentials user_id
  if credentials.nil?
    url = authorizer.get_authorization_url base_url: OOB_URI
    code = "4/zQEhvMpbiIbeBuCgQzrNp06KeLAqlbWPFRPTTQBSrjj0_GK6fQik4zY"
    credentials = authorizer.get_and_store_credentials_from_code(
      user_id: user_id, code: code, base_url: OOB_URI
    )
  end
  credentials
end

# byebug
# Initialize the API
service = Google::Apis::SheetsV4::SheetsService.new
service.client_options.application_name = APPLICATION_NAME
service.authorization = authorize


# Create Skills
skills = ["Video Editing", "Image Editing", "Puzzles", "Cryptography", "Writing", "Costuming", "Arts", "Crafts", "Performance", "Singing", "Musical Instrument", "Cooking", "Mixology", "Programming/Development", "Data Science", "Feats of Physical Strength/Endurance", "Gaming", "Tabletop RPGs"]
skills.each{|skill| Skill.create(name: skill)}

# Grab and Create Scavvies
# https://docs.google.com/spreadsheets/d/1BxiMVs0XRA5nFMdKvBdBZjgmUUqptlbs74OgvE2upms/edit
spreadsheet_id = "188yNiOU5MxG6hu---qp-6p5xyMR8k4sw3I4ga7DkWbc"
range = "'Form Responses 1'!B2:L"
response = service.get_spreadsheet_values spreadsheet_id, range
Scavvie.get_scavvies_from_spreadsheet(response.values)