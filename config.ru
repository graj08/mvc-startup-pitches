require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# How do we connect the PitchesController here?

use PitchesController
run ApplicationController
