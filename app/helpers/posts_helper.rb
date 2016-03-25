module PostsHelper
	def get_category(x)
      case x
      when 0
        "快報資訊"      
      when 1
        "求物資"
      else
        "求救"
      end
    end
  def init_post_comment(x)
    puts("x.id"+x.id.to_s)
    x.build_comments unless x.comments
    puts(x.comments)
    x
  end
end
