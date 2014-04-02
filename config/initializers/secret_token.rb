# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use existing token
    File.read(token_file).chomp
  else
    # Generate new token and store it in token_file
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end

  SampleApp::Application.config.secret_key_base = secure_token
end


# SampleApp::Application.config.secret_key_base = 'df2570b76bd728909469e40a316056cf84d5b085d4662feef1d49ea30bc5dcb012683122ef4be55cc4665a68520db07c3348c7e46440da4e1a34bb212a12b603'
