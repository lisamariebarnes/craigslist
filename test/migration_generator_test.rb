require 'test_helper'
require 'rails/generators'
require 'rails/generators/migration'
require 'generators/craigslist/craigslist_generator'

class MigrationGeneratorTest < Rails::Generators::TestCase
  tests CraigslistGenerator
  destination File.join(File.dirname(__FILE__), 'rails_root')
  arguments [destination_root]

  def setup
    FileUtils.mkdir_p(fake_rails_root)
  end

  def teardown
    FileUtils.rm_r(fake_rails_root)
  end

  def test_generates_correct_file_name
    run_generator
    assert_migration "db/migrate/add_craigslist_postings_table.rb"
  end

  private

    def fake_rails_root
      File.join(File.dirname(__FILE__), 'rails_root')
    end
end
