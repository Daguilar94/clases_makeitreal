require 'csv'
module Makeitreal
  module Reporters
    module Users
      class Csv
        def self.report users
          puts 'Creating a csv report'
          file = CSV.open "users_report.csv", "w+"
          file << ['email', 'fullname', 'role']
          users.each do |user|
            file << [user.email, user.full_name, user.role]
          end
          file.close
          puts 'Done creating report'
          file
        end

        def self.generate users
          puts 'Generating a csv report'

          file = CSV.generate do |csv|
            csv << ['email', 'fullname', 'role']
            users.each do |user|
              csv << [user.email, user.full_name, user.role]
            end
          end

          puts 'Done generating a report'
          file
        end
      end
    end
  end
end
