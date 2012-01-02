Factory.define :post do |p|
  p.poster "Fedor"
  p.body "Post Body"
end

Factory.define :invalid_post, :class => "Post" do |p|
  p.poster "Fedor"
  p.body nil
end
