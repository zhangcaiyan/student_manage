module Dict
  class Base < ActiveHash::Base
    include ActiveHash::Associations

    def self.options
      all.map {|t| [t.name, t.id]}
    end

  end

  class Application < Dict::Base

    self.data = [
      {id: 1, name: "奖学金"},
      {id: 2, name: "大学生标兵"},
      {id: 3, name: "优秀大学生"}
    ]
  end

  class Xueyuan < Dict::Base

    self.data = [
      {id: 1, name: "工程学院"},
      {id: 2, name: "法学院"},
      {id: 3, name: "农学院"},
      {id: 4, name: "基础医学院"},
      {id: 5, name: "护理学院"},
      {id: 6, name: "软件学院"}
    ]
  end

  class Political < Dict::Base

    self.data = [
      {id: 1, name: "团员"},
      {id: 2, name: "中共党员"},
      {id: 3, name: "民主党派"},
      {id: 4, name: "无党派人士"},
      {id: 5, name: "群众"},
      {id: 6, name: "保密"}
    ]
  end


  class ScoreCategory < Dict::Base

    self.data = [
      {:id => 1, :name => "年度"},
      {:id => 2, :name => "学期"}
    ]

    has_many :xueqis, class_name: "Dict::Xueqi"
  end

  class Gender < Dict::Base
    self.data = [
      {id: 1, name: "先生"},
      {id: 2, name: "女士"}
    ]
  end

  class Xueqi < Dict::Base

    self.data = [
      {:id => 1, name: "春季", score_category_id: 1},
      {:id => 2, name: "秋季", score_category_id: 1}
    ]

    belongs_to :xueqi, class_name: "Dict::ScoreCategory"

  end

  class Subject < Dict::Base

    self.data = [
      {id: 1, name: "java技术"},
      {id: 2, name: "网站安全与维护"},
      {id: 3, name: "多媒体技"},
      {id: 4, name: "人工智能"},
      {id: 5, name: "计算机控制技术"},
      {id: 6, name: "计算机网络"},
      {id: 7, name: "通信原理"},
      {id: 8, name: "计算机图形学"},
      {id: 9, name: "高等数学"},
      {id: 10, name: "线性代数"},
      {id: 11, name: "概率与统计"},
      {id: 12, name: "马哲"},
      {id: 13, name: "毛概"},
      {id: 14, name: "邓论"},
      {id: 15, name: "英语"},
      {id: 16, name: "模拟电路"}
    ]

  end

  class Score < Dict::Base

    self.data = [
      {id: 1, name: "不及格"},
      {id: 2, name: "及格"},
      {id: 3, name: "优秀"}
    ]


  end


end
