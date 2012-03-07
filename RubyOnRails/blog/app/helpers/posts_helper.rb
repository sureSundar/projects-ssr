module PostsHelper
         def display_comments(comment)
            tree = "<div class =\"nested_comment\"> @" + User.find(comment.user_id).username+" @:"+comment.created_at.to_s + ">"+"#{comment.comment}"+ " "
			tree += link_to "X",comment,method: :delete
			tree += link_to ":<)",new_comment_comment_path(comment) 
			tree += "<br/>"
            if comment.comments.size > 0 
              comment.comments.each do |sub_comment|
                tree += "#{display_comments(sub_comment)}"
              end
            end
            tree += "</div>"
            tree.html_safe 
		end
end
