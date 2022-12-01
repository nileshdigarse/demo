require 'csv'
namespace :import do
  desc "Import contact from csv file"
  task :contacts => [:environment] do
    CSV.foreach(Rails.root.join("db/contact.csv"), :headers => true) do |row|
      Contact.create(
        first_name: row[1],
        last_name: row[2],
        email: row[3],
        phone_no: row[4]
      )
    end
  end
end
