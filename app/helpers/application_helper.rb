module ApplicationHelper
#どこのviewからでも共通のアクションを呼び出せるのがヘルパー
	

	def controller?(controller)
		controller.include?(params[:controller])
	end

	#引数が現在のコントローラーと一致したらtrueを返す

	def action?(action)
		action.include?(params[:action])
	end

end
