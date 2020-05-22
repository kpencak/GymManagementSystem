5.times do
    User.create({
        surname: Faker::Name.last_name,
        name: Faker::Name.first_name,
        sex: "M"
    })
end
