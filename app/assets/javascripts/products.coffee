# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(->
	$('a.share-friend').click(->
		wx.onMenuShareAppMessage({
			title:'测试分享到朋友',
			desc:'这里是测试分享到朋友的描述信息。。。',
			link:'http://www.baidu.com',
			imgUrl:'',
			type:'link',
			success:->
				alert('分享后alert')
			cancel:->
				alert('分享取消alert')
		})		
	)


	$('a.share-quan').click(->
		wx.onMenuShareTimeline({
			title:'测试分享到朋友圈',
			link:'http://www.baidu.com',
			imgUrl:'',
			success:->
				alert('分享后alert')
			cancel:->
				alert('分享取消alert')
		})		
	)

)
