# coding: utf-8
Fabricator(:recipe) do
  title{ sequence(:title, 1){|i| "title#{i}" } }
  url{ sequence(:url, 1){|i| "http://example.com/recipe/#{i}" } }
  image_url{ sequence(:image_url, 1){|i| "http://example.com/recipe/#{i}.jpg" } }
  stage{ ['離乳食 初期（5〜6ヶ月）', '離乳食 中期（7〜8ヶ月）', '離乳食 後期（9〜11ヶ月）'].sample }
  after_create do |r|
    next if r.categories.present?
    if r.stage = '離乳食 初期（5〜6ヶ月）'
      ['初めての離乳食', '野菜', 'タンパク質'][0..[0,1,2].sample].each do |cat|
        r.categories << Category.find_or_create_by(title: cat)
      end
    else
      ['主食', '主菜', '副菜'][0..[0,1,2].sample].each do |cat|
        r.categories << Category.find_or_create_by(title: cat)
      end
    end
  end
end
