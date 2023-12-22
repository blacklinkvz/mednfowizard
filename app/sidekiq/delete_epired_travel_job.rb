class DeleteEpiredTravelJob
  include Sidekiq::Job

  def perform
    # Do something
    article = Article.where('finish_date < ?', Date.today)
    articles.each do |article|
      article.destroy
      article.travel.destroy if article.travel
  end
end
