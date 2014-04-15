# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


$data.user.keys.each do |key|
  user = $data.user.send(key)
  if !User.exists?(username: user.username )
    user=User.new(user)
    user.save(validate: false)
  end
end

["工程学院", "法学院", "农学院", "基础医学院", "护理学院", "软件学院"].each do |name|
  Xueyuan.find_or_create_by(name: name)
end
