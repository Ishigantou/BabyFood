Fabricator(:user) do
  name{ sequence(:name, 1){|i| "name#{i}" } }
  password 'password'
  baby_birthday{ [5.month.ago, 7.month.ago, 9.month.ago].sample }
end
