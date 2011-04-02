var Gallery = {
	current_id: null,
	current_index: null,
	item_count: null,
	
	init: function() {
		Gallery.item_count = $('div#gallery_dialog div#gallery li.gallery_item').length;
		
		if (Gallery.item_count <= 0) {  
			return;
		}
		
		Gallery.current_index = Math.min( 1, Gallery.item_count-1);
		Gallery.render();
	},
	
	next: function() { 
		Gallery.current_index += 1;		
		Gallery.render();
	},
	
	prev: function() { 
		Gallery.current_index -= 1;
		Gallery.render();
	},
	
	render: function() { 		
		// remove all current curr, next, prev and click handlers
		$('div#gallery_dialog div#gallery li.gallery_item').removeClass('next');
		$('div#gallery_dialog div#gallery li.gallery_item').removeClass('prev');
		$('div#gallery_dialog div#gallery li.gallery_item').removeClass('curr');
		
		$('div#gallery_dialog div#gallery div#prev_arrow').unbind('click');
		$('div#gallery_dialog div#gallery div#next_arrow').unbind('click');
		
		$('div#gallery_dialog div#gallery div#prev_arrow, div#gallery_dialog div#gallery div#next_arrow').unbind('click');
		$('div#gallery_dialog div#gallery div#prev_arrow, div#gallery_dialog div#gallery div#next_arrow').fadeTo(0, 0.2);
		
		
		// set current_id
		Gallery.current_id = $('div#gallery_dialog div#gallery li.gallery_item:nth-child(' + (Gallery.current_index+1) + ') input').attr('value');
		
		// set curr, next and prev
		$('div#gallery_dialog div#gallery li.gallery_item:nth-child(' + (Gallery.current_index+1) + ')').addClass('curr');
		$('div#gallery_dialog div#gallery li.gallery_item:nth-child(' + (Gallery.current_index) + ')').addClass('prev');
		$('div#gallery_dialog div#gallery li.gallery_item:nth-child(' + (Gallery.current_index+2) + ')').addClass('next');
		
		
		// add click handlers if applicable
		if (Gallery.current_index > 0) { 
			$('div#gallery_dialog div#gallery div#prev_arrow').click(Gallery.prev);
			$('div#gallery_dialog div#gallery div#prev_arrow').fadeTo(0, 1);
		}
		
		if (Gallery.current_index < Gallery.item_count - 1){
			$('div#gallery_dialog div#gallery div#next_arrow').click(Gallery.next);					
			$('div#gallery_dialog div#gallery div#next_arrow').fadeTo(0, 1);
			
		}
	}
	
	
	
	
}