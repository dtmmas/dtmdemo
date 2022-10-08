<x-app-layout>
    <x-slot name="titulo_pagina">
        {{ __('Listado de subCategorias: '.$category->name) }} 
    </x-slot>
    <x-slot name="opciones_nav">
        <ol class="breadcrumb ms-auto">
            
        </ol>
    </x-slot>
   
    @livewire('subcategory-component', ['category_id'=>$category->id])

    <x-slot name="script">
        
        <script type="text/javascript">            
            window.livewire.on('subcategoryUpdateStore', (message) => {
                swal(message, {icon: "success",});
                $('#exampleModal').modal('hide');
            });
            window.livewire.on('subcategoryEditCreate', (message) => {
                $('#exampleModal').modal('show');
                $('.titulo_pagina').html(message)
            });
            function EliminarSubcategory(id, name){
                swal({
                    title: "¿Estas seguro?",
                    text: "Se eliminara la subcategoria "+name+". Esta accion es irreversible",
                    icon: "warning",
                    buttons: {
                        cancel: "Cancelar",
                        catch: {
                            text: "Si, Eliminar",
                            closeModal: false,
                            className: 'swal-button--danger'
                        },
                    },
                  })
                .then((willDelete) => {
                    if (willDelete) {
                        window.livewire.emit('onDeleteRow',id)
                        window.livewire.on('subcategoryDelete', () => {
                            swal('Subcategoria Eliminada', {icon: "success",});
                        });
                    }
                });
            }
        </script>
    </x-slot>
</x-app-layout>