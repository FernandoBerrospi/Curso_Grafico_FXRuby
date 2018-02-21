# gem install fxruby
require 'fox16'
include Fox
class App < FXMainWindow
    def initialize(app)
        super(app,"Curso Interfaces Graficas",width:300,height:300)
    end

    def create
        super
        show(PLACEMENT_SCREEN)
    end
end

app = FXApp.new
App.new(app)
app.create
app.run