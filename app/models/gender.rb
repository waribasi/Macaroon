class Gender < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '男性' },
    { id: 3, name: '女性' },
    { id: 4, name: '秘密' },
  ]

  include ActiveHash::Associations
  has_many :users
end