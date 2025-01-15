module ApplicationHelper

  def log_in_low(current_user)
    if current_user.present?
      low_user_read(current_user)
    else
      p "ログインなし"
    end
  end

  def low_user_read(user)
    if user.read
      p "利用規約を同意しています"
    else
      redirect_to pages_low_path
    end
  end


    def show_meta_tags
      assign_meta_tags if display_meta_tags.blank?
      display_meta_tags
    end

    def default_meta_tags
      {
        site: 'サイト名',
        title: 'タイトル',
        reverse: true,
        separator: '|',   #Webサイト名とページタイトルを区切るために使用されるテキスト
        description: 'ページの説明',
        keywords: 'ページキーワード',   #キーワードを「,」区切りで設定する
        canonical: request.original_url,   #優先するurlを指定する
        noindex: ! Rails.env.production?,
        og: {
          site_name: 'サイト名',
          title: 'タイトル',
          description: 'ページの説明', 
          type: 'website',
          url: request.original_url,
          image: image_url('user.png'),
          locale: 'ja_JP',
        },
        twitter: {
          card: 'summary_large_image',
          site: '@ツイッターのアカウント名',
        },
        fb: {
          app_id: '自身のfacebookのapplication ID'
        }
      }
    end

  def assign_meta_tags(options = {})
    defaults = default_meta_tags
    options.reverse_merge!(defaults)
    site = options[:site]
    title = options[:title]
    description = options[:description]
    keywords = options[:keywords]
    image = options[:image].presence || image_url('user.png')
    configs = {
      separator: '|',
      reverse: true,
      title:,
      description:,
      keywords:,
      canonical: request.original_url,
      icon: {
        href: image_url('user.png')
      },
      og: {
        type: 'website',
        title: title.presence || site,
        description:,
        url: request.original_url,
        image:,
        site_name: site
      },
      twitter: {
        site:,
        card: 'summary_large_image',
        image:
      }
    }
    set_meta_tags(configs)
  end
end
