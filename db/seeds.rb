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

["软件学院", "工程学院", "法学院", "农学院"].each do |name|
  Xueyuan.find_or_create_by(name: name)
end

["软件开发", "计算机网络", "计算机应用", "计算机信息管理", "图形图像制作"].each do |name|
  xueyuan = Xueyuan.find_by(name: "软件学院")
  Zhuanye.find_or_create_by(name: name, xueyuan_id: xueyuan.id)
end

["高分子材料与工程专业", "纺织工程专业", "机械设计制造及其自动化专业"].each do |name|
  xueyuan = Xueyuan.find_by(name: "工程学院")
  Zhuanye.find_or_create_by(name: name, xueyuan_id: xueyuan.id)
end

["法学专业", "英语专业", "政治学专业", "行政管理专业", "工商管理专业", "社会工作专业"].each do |name|
  xueyuan = Xueyuan.find_by(name: "法学院")
  Zhuanye.find_or_create_by(name: name, xueyuan_id: xueyuan.id)
end

["园艺技术", "观光农业", "园林技术"].each do |name|
  xueyuan = Xueyuan.find_by(name: "农学院")
  Zhuanye.find_or_create_by(name: name, xueyuan_id: xueyuan.id)
end


["奖学金", "大学生标兵", "优秀大学生"].each do |name|
  Application.find_or_create_by(name: name)
end
