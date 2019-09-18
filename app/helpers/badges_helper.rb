module BadgesHelper

  DEFAULT_BADGE_IMAGE_URL = 'badges/achievement_bronze.png'
  BADGE_IMAGE_URLS = %w(badges/achievement_silver.png badges/achievement_gold.png)

  def badge_image(image_url: image_url, image_size: image_size)
    badge_image_size = image_size == "small" ? "badge-image-small" : "badge-image"
    image_tag image_url, class: badge_image_size
  rescue Sprockets::Rails::Helper::AssetNotFound
    image_tag DEFAULT_BADGE_IMAGE_URL, class: badge_image_size
  end

end
