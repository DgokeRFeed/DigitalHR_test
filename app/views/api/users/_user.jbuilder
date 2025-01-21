json.name user.name
json.surname user.surname
json.patronymic user.patronymic
json.full_name user.full_name

json.email user.email

json.age user.age
json.gender user.gender
json.country user.country
json.nationality user.nationality

json.interests(user.interests.all) do |i|
  json.name i.name
end

json.skills(user.skills.all) do |i|
  json.name i.name
end
