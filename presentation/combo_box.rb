require 'fox16'
include Fox

class App < FXMainWindow

    def initialize app
        super(app,"FXComboBox",width:600,height:600)
        self.set_elements
        self.set_elements_items
        self.set_listeners
    end

    def set_elements
        @combo = FXComboBox.new(self,3,opts:LAYOUT_FILL_X)
        @btn_mostrar = FXButton.new(self,"Presioname")
    end

    def set_elements_items
        @combo.numVisible = 3
        @combo.numColumns.times {|index| @combo.appendItem("Elemento #{index + 1}")}
    end

    def set_listeners
        @btn_mostrar.connect(SEL_COMMAND) {self.btn_mostrar_click}
    end

    def btn_mostrar_click
        FXMessageBox.information(self, MBOX_OK ,"Informacion","Seleccionaste #{@combo.text}")
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
