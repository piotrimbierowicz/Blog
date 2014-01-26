require 'date'
class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Taggable

  field :body, type: String
  field :title, type: String
  field :archived, type: Boolean, default: false


  validates_presence_of :body, :title

  belongs_to :user
  has_many :comments

  default_scope ->{ ne(archived: true) }

  def archive!
    update_attribute :archived, true
  end

  def hotness    
    if (Time.now - (24*60*60) < self.created_at and self.created_at < Time.now)  
      return self.comments.length>=3 ? 4 : 3
    elsif (Time.now - (24*60*60) > self.created_at and self.created_at > Time.now - (3*24*60*60))
      return self.comments.length>=3 ? 3 : 2
    elsif (Time.now - (3*24*60*60) > self.created_at and self.created_at > Time.now - (7*24*60*60))
      return self.comments.length>=3 ? 2 : 1
    elsif (self.created_at < Time.now - (7*24*60*60))
      return self.comments.length>=3 ? 1 : 0
    end  
  end
end
