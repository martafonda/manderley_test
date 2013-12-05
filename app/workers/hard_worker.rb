class TweetWorker
  include Sidekiq::Worker
  def perform(movie_id, user_id)
    user = User.find(user_id)
    movie = Movie.find(movie_id)
    post_tweet(user, movie)
  end
  def post_tweet(u, m)
    puts "#{u.email} thinks #{m.title} is great!"
  end 
end