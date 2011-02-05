var Gallery = {
	gallery_items: [],
	current_index: -1,
	
	init: function() {
		if (this.gallery_items.length > 1) {
			current_index = 1;			
		} else {
			current_index = 0;			
		}
		
		$('div#prev_item p.name').html( this.gallery_items[current_index-1].name );
		$('div#prev_item p.subtext').html( this.gallery_items[current_index-1].subtext );

		// add image
		var img = new Image();
		$('div#prev_item').append( '<img class="item_image" src="' + this.gallery_items[current_index-1].image_url +  '" />' );
		

		$('div#selected_item p.name').html( this.gallery_items[current_index].name );
		$('div#selected_item p.subtext').html( this.gallery_items[current_index].subtext );

		// add image
		var img = new Image();
		$('div#selected_item').append( '<img class="item_image" src="' + this.gallery_items[current_index].image_url +  '" />' );
		
		$('div#next_item p.name').html( this.gallery_items[current_index+1].name );
		$('div#next_item p.subtext').html( this.gallery_items[current_index+1].subtext );

		// add image
		var img = new Image();
		$('div#next_item').append( '<img class="item_image" src="' + this.gallery_items[current_index+1].image_url +  '" />' );
	},
	
	prev: function() { 
		
	},
	
	next: function() { 
		
	}
	
	
}