FactoryBot.define do
  sequence(:name) { |n| "ATM #{n}" }

  factory :atm do
    name
    lat 1.5
    lon 1.5

    factory :atm_f11 do
      name 'Фестивальная 11'
      lat 55.855694
      lon 37.475237
    end

    factory :atm_f7 do
      name 'Фестивальная 7'
      lat 55.855429
      lon 37.474357
    end

    factory :atm_f5 do
      name 'Фестивальная 5'
      lat 55.855199
      lon 37.473477
    end

    factory :atm_f3 do
      name 'Фестивальная 3'
      lat 55.854982
      lon 37.472533
    end

    factory :atm_f1 do
      name 'Фестивальная 1'
      lat 55.854753
      lon 37.471610
    end

    factory :atm_f7a do
      name 'Фестивальная 7А'
      lat 55.855803
      lon 37.473778
    end
  end
end
