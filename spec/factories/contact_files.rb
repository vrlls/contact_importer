FactoryBot.define do
  factory :contact_file do
    user
    after(:build) do |contact_file|
      contact_file.csv.attach(
        io: File.open(Rails.root.join('spec', 'support', 'files', 'prueba.csv')),
        filename: 'prueba.csv',
        content_type: 'application/csv'
      )
    end
  end
end
