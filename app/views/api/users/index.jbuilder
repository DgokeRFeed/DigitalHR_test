json.array! @users do |user|
  json.partial! 'api/users/user', user:
end
