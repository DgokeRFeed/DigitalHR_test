json.array! @interests do |interest|
  json.partial! 'api/interests/interest', interest:
end
