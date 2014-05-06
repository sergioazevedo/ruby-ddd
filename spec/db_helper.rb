RSpec.configure do |config|
  config.before(type: :model) do
    require 'nulldb_rspec'
    ActiveRecord::Base.establish_connection adapter: :nulldb, schema: 'db/schema.rb'
  end
end

