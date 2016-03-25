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

end
