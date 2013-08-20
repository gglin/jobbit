module CompaniesHelper

  def crunchbase_attributes
    [
      :crunchbase_url,
      :homepage_url,
      # :blog_url,
      # :blog_feed_url,
      # :twitter_username,
      # :category_code,
      :number_of_employees,
      # :deadpooled_url,
      :email_address,
      :phone_number,
      :description,
      # :created_at,
      # :updated_at,
      # :overview,
      # :image,
      # :relationships,
      # :competitions,
      # :providerships,
      :total_money_raised,
      # :funding_rounds,
      # :investments,
      # :acquisition,
      # :acquisitions,
      # :offices,
      # :milestones,
      # :ipo,
      # :video_embeds,
      # :screenshots,
      # :external_links,
      :founded,
      # :deadpooled,
      # :products,
      # :date_from_components,
      # :tags,
      # :aliases
    ]
  end

  def linkedin_attributes
    [
      :id,
      :name,
      :"universal-name",
      :"email-domains",
      :"company-type",
      :"website-url",
      :industries,
      :status,
      :"logo-url",
      :"square-logo-url",
      :"blog-rss-url",
      :"twitter-id",
      :"employee-count-range",
      :specialties,
      :locations,
      :description,
      :"founded-year",
      :"end-year",
      :"num-followers"
    ]
  end

end
