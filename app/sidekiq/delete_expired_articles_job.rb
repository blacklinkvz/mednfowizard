class DeleteExpiredArticlesJob
  include Sidekiq::Job

  def perform
    # Do something
    article = Article.joins(:travel).where('travels.finish_date < ?', Date.today)
    article.each do |article|
      article.articles_medicaments.destroy_all
      article.articles_diseases.destroy_all
      article.articles_contacts.destroy_all
      article.destroy!
    end
    
    #Programación.
    DeleteExpiredArticlesJob.perform_at(24.hours.from_now)

  end
end
