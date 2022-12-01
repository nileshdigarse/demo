require 'csv'
namespace :export do
  desc "Export contact from csv file"
  task :contacts => [:environment] do
    file = Rails.root.join('public/contact.csv')
    headers = %w[id first_name last_name email phone_no].freeze

    CSV.open(file, 'w', write_headers: true, headers: headers) do |writer|
      Contact.select do |attribute|
        writer << [attribute.id ,attribute.first_name, attribute.last_name, attribute.email, attribute.phone_no]
      end
    end
    puts 'CSV generated'
  end
end
