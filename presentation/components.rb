require 'fox16'
include Fox
class App < FXMainWindow
    # FXLaabel, FXText, FXTextField, FXButton y FXTable
    def initialize app
        super(app,"Etiquetas FX",width: 900,height:600)
        self.set_elements
        self.init_elements
        self.set_listeners
    end

    def set_elements
        @lbl_nombre = FXLabel.new(self,"Nombre:",opts:LAYOUT_LEFT)
        @txt_nombre = FXTextField.new(self,30,opts:LAYOUT_LEFT)
        @lbl_descripcion = FXLabel.new(self,"Descripcion:",opts:LAYOUT_LEFT)
        @txt_descripcion = FXText.new(self,opts:LAYOUT_EXPLICIT,width:100,height:100,x:40,y:300)
        @btn_registrar = FXButton.new(self,"Registrar")

        @tbl_datos = FXTable.new(self,opts:LAYOUT_CENTER_X)
    end

    def init_elements
        @tbl_datos.visibleColumns = 6
        @tbl_datos.visibleRows = 6
        @tbl_datos.setTableSize(6,6)


        (@tbl_datos.visibleColumns).times {|item| @tbl_datos.setColumnText(item,"Columna #{item + 1}")}
        (@tbl_datos.visibleRows).times {|item| @tbl_datos.setRowText(item,"Fila #{item}")}


        (0..@tbl_datos.visibleColumns-1).each do |column|
            (0..@tbl_datos.visibleRows-1).each do |row|
                @tbl_datos.setItemText(row,column,"(#{row + 1},#{column + 1})")
            end
        end

    end

    def set_listeners
        @btn_registrar.connect(SEL_COMMAND) { self.btn_registrar_click }
    end

    # Listeners
    def btn_registrar_click
        seleccionados = Array.new
        @tbl_datos.each do |items|
            items.each {|item| seleccionados << item.to_s if item.selected?}
        end
        puts("Seleccionaste: #{seleccionados.length.to_s} elementos")
        puts("Solo debes seleccionar un elemento") if seleccionados.length > 1
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
