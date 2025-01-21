json.array! @skills do |skill|
  json.partial! 'api/skills/skill', skill:
end
