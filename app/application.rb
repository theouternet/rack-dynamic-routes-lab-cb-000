class Application
  
  @@items = [Item.new("Figs",1.69)]
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
 
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      
      if @@items.detect(item_name)
        resp.write item_name.price
      else 
      resp.write "Item not found"
      resp.status = 400
      end 
      
      resp.write "You requested the songs"
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end