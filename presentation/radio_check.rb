require 'fox16'
include Fox
class App < FXMainWindow

    def initialize(app)
        super(app,"Radio y Check",width:600,height:600)
        self.set_elements
        self.set_listeners
    end

    def set_elements
        # Radio Button
        @group_box = FXGroupBox.new(self,"Generos")
        @data_target_radio = FXDataTarget.new(2)
        @radio_button_m = FXRadioButton.new(@group_box ,"Masculino",@data_target_radio,FXDataTarget::ID_OPTION)
        @radio_button_f = FXRadioButton.new(@group_box ,"Femenino",@data_target_radio,FXDataTarget::ID_OPTION+1)
        @radio_button_o = FXRadioButton.new(@group_box ,"Otros",@data_target_radio,FXDataTarget::ID_OPTION+2)

        @checks_items = Array.new
        @checks_items << FXCheckButton.new(self,"Item 1")
        @checks_items << FXCheckButton.new(self,"Item 2")
        @btn_check = FXButton.new(self,"Aceptar")
    end

    def set_listeners
        @data_target_radio.connect(SEL_COMMAND){self.data_target_click}
        @btn_check.connect(SEL_COMMAND){self.btn_check_click}
    end

    def btn_check_click
        @checks_items.each {|item| puts("Marcaste: " + item.getText) if item.check}
    end

    def data_target_click
        puts(@data_target_radio.value)
    end


    # Manejo de Variables estaticas y get y set
    @@estatica = "hola"
    def self.estatica=(estatica)
        @@estatica = estatica
    end
    def self.estatica
        return @@estatica
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