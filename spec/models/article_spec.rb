require 'rails_helper'

RSpec.describe Article, type: :model do
let(:blog){Article.new(title:"everything is awesome", body: "everything is cool when you're part of a team.")}
let(:blog_no_title){Article.new(body: "rireilkm")}
let(:blog_no_body){Article.new(title: "hello")}

describe 'validations for article' do
  it 'saves the article when the fields are not blank' do
    expect{blog.save}.to change{Article.count}.by(1)
  end
end

context 'validations for errors' do
 it 'should not make article when title is blank' do
    blog_no_title.save
    expect(blog_no_title.errors[:title]).to include("can't be blank")
 end

   it 'should raise error if body is blank'do
   blog_no_body.save
   expect(blog_no_body.errors[:body]).to include("can't be blank")
  end
end

 end
