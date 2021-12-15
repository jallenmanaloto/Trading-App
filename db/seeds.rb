# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#

client = IEX::Api::Client.new(
  publishable_token: 'pk_dea2655fa642467f92990a1f0b4885d9',
  secret_token: 'sk_0810686b64154091a0432199577c12ae',
  endpoint: 'https://cloud.iexapis.com/v1'
)