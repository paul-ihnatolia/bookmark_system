require 'active_record'

###
# Active record database configuration
###
ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'

###
# Active record migrator configuration
###
# Rails 7.1+ derives the schema migration table from the connection.
if ActiveRecord.version >= Gem::Version.new('7.1')
  ActiveRecord::MigrationContext.new('spec/db/migrate').migrate
else
  ActiveRecord::MigrationContext.new('spec/db/migrate', ActiveRecord::SchemaMigration).migrate
end
