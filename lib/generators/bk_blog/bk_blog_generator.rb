class BkBlogGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  source_root File.expand_path('../templates', __FILE__)

  def self.next_migration_number(path)
    Time.now.utc.to_i
  end

  def create_migration_file
    migration_template "migration.rb", "db/migrate/create_blogs.rb"
  end
end
