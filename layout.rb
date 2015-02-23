module Lay
def layout(&block)
   content = '<!DOCTYPE HTML><br/><head> <title> My Store </title> <br/>'
   content << '<link rel="stylesheet" type="text/css" href="public/style.css">'
   content << '</head><br/><body ><div align="center">'
   content << yield
   content << '<a href="http://localhost:9292/">Go to Home</a> </div></body> </html>'
end
end
