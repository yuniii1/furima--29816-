class Condition < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '新品、未使用' },
    { id: 3, name: '未使用に近い' },
    { id: 4, name: '目立った傷やよごれなし' },
    { id: 5, name: 'やや傷やよごれあり' },
    { id: 6, name: '傷やよごれあり' },
    { id: 7, name: '全体的に状態が悪い' },
  ]
end
