import tkinter as tk 

#importar modulos tkinter 

from tkinter import *

from tkinter import ttk
from tkinter import messagebox  

from clientes import *

from Conexion import *




class FormularioClientes:
    
    global base
    base = None
    
    global texBoxId
    texBoxId = None 
    
    global texBoxNombres
    texBoxNombres = None 
    
    global texBoxApellidos
    texBoxApellidos = None 
    
    global combo 
    combo = None
    
    global groupBox
    grouoBox = None 
    
    global tree
    tree = None 
    
    def Formulario(): 
        global texBoxId
        global texBoxNombres
        global texBoxApellidos
        global combo 
        global base
        global groupBox
        global tree
    
    
    try:
        base = Tk()
        base.geometry("1200x300")
        base.title("Formulario Python")
        
        groupBox = LabelFrame(base,text="Datos del personal",padx=5,pady=5)
        groupBox.grid(row=0,column=0,padx=10,pady=10)
        
        labelId=Label(groupBox,text="Cedula:",width=13,font=("arial",12)).grid(row=0,column=0)
        texBoxId = Entry(groupBox)
        texBoxId.grid(row=0,column=1)
        
        
        labelNombres=Label(groupBox,text="Nombres:",width=13,font=("arial",12)).grid(row=1,column=0)
        texBoxNombres = Entry(groupBox)
        texBoxNombres.grid(row=1,column=1)
        
        
        labelApellidos=Label(groupBox,text="Apellidos:",width=13,font=("arial",12)).grid(row=2,column=0)
        texBoxApellidos = Entry(groupBox)
        texBoxApellidos.grid(row=2,column=1)
        
        labelSexo=Label(groupBox,text="Sexo:",width=13,font=("arial",12)).grid(row=3,column=0)
        seleccionSexo = tk.StringVar()
        combo= ttk.Combobox(groupBox,values=["Masculino","Femenino"],textvariable=seleccionSexo)
        combo.grid(row=3,column=1)
        seleccionSexo.set("Masculino")
        
        Button(groupBox,text="Guardar",width=10,command=guardarRegistros).grid(row=4,column=0)
        Button(groupBox,text="Modificar",width=10).grid(row=4,column=1)
        Button(groupBox,text="Eliminar",width=10).grid(row=4,column=2)
        
        groupBox =LabelFrame(base,text="Lista del Personal",padx=5,pady=5,)
        groupBox.grid(row=0,column=1,padx=5,pady=5)
        #crear un treeview 
        
        #configurar las columnas 
        
        tree = ttk.Treeview(groupBox,columns=("Cedula","Nombres","Apellidos","Sexo"),show='headings',height=5,)
        tree.column("# 1",anchor=CENTER)
        tree.heading("# 1",text="Cedula")
        tree.column("# 2",anchor=CENTER)
        tree.heading("# 2",text="Nombres")
        tree.column("# 3",anchor=CENTER)
        tree.heading("# 3",text="Apellidos")
        tree.column("# 4",anchor=CENTER)
        tree.heading("# 4",text="Sexo")
        
        #Agregar los datos a la tabla 
        #Mostrar la tabla 
        
        for row in CClientes.mostrarClientes():
            tree.insert("","end",values=row)
            
            
            
            
            
        tree.pack()
        
          
        
        
        
    
        base.mainloop()
            
    except ValueError as error:
         print ("Error al mostrar la interfaz,error: {}" .format(error))

    def guardarRegistros():
    
        global texBoxNombres,texBoxApellidos,combo,groupBox
        
    
  
        
        
        
          

                                