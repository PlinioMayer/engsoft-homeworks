Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

When /I check the following ratings: (.*)/ do |rating_list|
  rating_list.split(%r{,\s*}).each do |rating|
    check('ratings_' + rating)
  end
end

When /I uncheck the following ratings: (.*)/ do |rating_list|
  rating_list.split(%r{,\s*}).each do |rating|
    uncheck('ratings_' + rating)
  end
end

Then /I should see all the movies/ do
  Movie.all.count == 10
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  page.body
  e1_pos = page.body.index(e1)
  e2_pos = page.body.index(e2)
  e1_pos <= e2_pos
end