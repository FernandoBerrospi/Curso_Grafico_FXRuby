require 'fox16'
include Fox

class AppText < FXMainWindow

    def initialize app
        super(app,"FXDialog",width:600,height:600)
        self.set_elements
        self.set_listeners
    end

    def set_elements
        @btn_buscar = FXButton.new(self,"Buscar")
        @btn_guardar = FXButton.new(self,"Guardar")
        @txt_mostrar = FXText.new(self,opts:LAYOUT_FILL_X|LAYOUT_FILL_Y)
    end

    def set_listeners
        @btn_buscar.connect(SEL_COMMAND) {self.btn_buscar_click}
        @btn_guardar.connect(SEL_COMMAND) {self.btn_guardar_click}
    end

    def btn_buscar_click
        dialog = FXFileDialog.new(self,"Abrir Archivo")
        dialog.patternList = ["*.txt","*.rb"]
        if dialog.execute != 0
            puts("Ruta: #{dialog.filename}")
            @file_path = dialog.filename
            @txt_mostrar.setText(File.open(@file_path,"r").read.to_s)

        end
    end

    def btn_guardar_click
        text = @txt_mostrar.getText
        file = File.open(@file_path,"w") # r+ para lectura y escritura
        file.write(text)
    end

    def create
        super
        show(PLACEMENT_SCREEN)
    end
end

# app = FXApp.new()
# AppText.new(app)
# app.create
# app.run
