
atom_feed do |feed|
  feed.title( @feed_title )
  feed.updated( @bendons.last.created_at )
  @bendons.each do |event|
    feed.entry(event) do |entry|
      entry.title( event.store )
      entry.content( event.address, :type => 'html' )
    end
  end
end