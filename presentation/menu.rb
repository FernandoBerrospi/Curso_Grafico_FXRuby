require 'fox16'
include Fox

class App < FXMainWindow
    def initialize(app)
        super(app,"Menus",width:500,height:500)
        self.set_elements
        self.set_listeners
    end

    def set_elements
        @menu_bar = FXMenuBar.new(self,LAYOUT_SIDE_TOP|LAYOUT_FILL_X|FRAME_RIDGE)
        @menu_pane = FXMenuPane.new(self)
        @opciones = Array.new
        @opciones << FXMenuCommand.new(@menu_pane,"Opcion 01")
        @opciones << FXMenuCommand.new(@menu_pane,"Opcion 02")
        @menu_title = FXMenuTitle.new(@menu_bar,"Elemento 01",popupMenu: @menu_pane)


    end

    def set_listeners
        @opciones.each {|item| item.connect(SEL_COMMAND) {FXMessageBox.information(self, MBOX_YES_NO ,"Informacion","Pesionaste: #{item.to_s}")}}
    end

    def create
        super
        show(PLACEMENT_SCREEN)

    end
end

app = FXApp.new()
App.new(app)
app.create
app.run

puts()