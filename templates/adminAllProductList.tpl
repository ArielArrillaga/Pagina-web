
{include file='templates/header.tpl'} 

<div class="main-container">
    <div class="admin-table">
        <table id = "product-table" class="table table-striped table-dark">
            <thead>
                <tr>       
                    <th scope="col">Componente</th>
                    <th scope="col">Marca</th>
                    <th scope="col">Descripcion</th>
                    <th scope="col">Precio</th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody>
                {foreach from=$products item=$product}
                <tr>     
                    <td >{$product->component}</td>
                    <td >{$product->brand_name}</td>
                    <td >{$product->description}</td>
                    <td > $ {$product->price}</td>
                    <td>
                        <button type="button" class="delete-product" data-delete={$product->id_product} >Borrar</button> 
                        <button type="button" class="edit-product" data-price={$product->price} 
                        data-description="{$product->description }"
                         data-idbrand={$product->id_brand} data-component="{$product->component}" data-update={$product->id_product}>Editar</button>
                    </td>
                </tr>   
                {/foreach}    
            </tbody>
        </table>
    </div>    

    <div class="new-form-container">        
        <form id="new-product-form" class="new-row-form product-form"  action="newProduct" method="POST"  class="needs-validation" >
        <div>
            <h3 class="form-title">Carga de producto</h3>
        </div>          
                <div class="col-md-10 mb-3">
                    <label for="product">Producto</label>
                    <input type="text"  name="product" class="form-control" id="validationTooltip01" placeholder="Ej.mouse" value="" required>      
                </div>
                <div class="col-md-10 mb-3">
                    <label for="price">Precio</label>
                    <input type="text"  name="price" class="form-control" id="validationTooltip02" placeholder="precio" value="" required>   
                </div>
                <div class="col-md-10 mb-3">
                    <label for="description">Descripcion</label>
                    <div class="input-group">       
                        <textarea type="text"  name="description" class="form-control" id="validationTooltipUsername"  placeholder="" aria-describedby="validationTooltipUsernamePrepend" required></textarea> 
                    </div>
                </div> 
                <div class="brand-container">
                    <label for="brand">Marca </label>
                    <select  name ="brand">       
                    {foreach from=$brands item=$brand}
                        <option  value={$brand->id_brand}>{$brand->brand_name}</option>        
                    {/foreach}        
                    </select>    
                </div>
                 <div class="form-btn-container">
                    <div class="btn-on">
                        <button  class="btn btn-primary" type="submit">Cargar Producto</button>
                    </div>               
            </div>
        </form>

    <!--edit Form-->
        <form id="edit-product-form" class="new-row-form product-form hide"  action="editProduct" method="POST"  class="needs-validation" >
        <div>
            <h3 class="form-title">Editar producto</h3>
        </div>          
                <div class="col-md-10 mb-3">
                    <label for="product">Producto</label>
                    <input type="text" id="product" name="product" class="form-control" id="validationTooltip01" placeholder="Ej.mouse" value="" required>      
                </div>
                <div class="col-md-10 mb-3">
                    <label for="price">Precio</label>
                    <input type="text" id="price" name="price" class="form-control" id="validationTooltip02" placeholder="precio" value="" required>   
                </div>
                <div class="col-md-10 mb-3">
                    <label for="description">Descripcion</label>
                    <div class="input-group">       
                        <textarea type="text" id="description" name="description" class="form-control" id="validationTooltipUsername"  placeholder="" aria-describedby="validationTooltipUsernamePrepend" required></textarea> 
                    </div>
                </div> 
                <div class="brand-container">
                    <label for="brand">Marca </label>
                    <select id="brand" name ="brand">       
                    {foreach from=$brands item=$brand}
                        <option  value={$brand->id_brand}>{$brand->brand_name}</option>        
                    {/foreach}        
                    </select>    
                </div>
                 <div class="form-btn-container">
                    <div class="btn-on">
                        <button id="idit-product-button" name="id" value="" class="btn btn-primary" type="submit">Editar Producto</button>
                    </div>
                <div class="btn-off">
                    <button id="cancel-product-edit" type="button" >Cancelar</button>
                </div>
            </div>
        </form>  

    </div>
  


         <div class="admin-table">
        <table id = "brand-table" class="table table-striped table-dark">
            <thead>
                <tr>       
                    <th scope="col">Marca</th>
                </tr>
            </thead>
            <tbody>
                {foreach from=$brands item=$brand}
                <tr>     
                    <td >{$brand->brand_name}</td> 
                    <td>
                        <button type="button" class="delete-brand" data-delete={$brand->id_brand}>Borrar</button> 
                        <button type="button" class="get-brand-data" data-name={$brand->brand_name} data-update={$brand->id_brand}>Editar</button>
                    </td>
                </tr>   
                {/foreach}    
            </tbody>
        </table>
    </div> 

        <div class="new-form-container">        
        <form class="new-row-form brand-form"  action="newBrand" method="POST"  class="needs-validation" >
        <div>
            <h3 class="form-title">Carga de marca</h3>
        </div>
          
                <div class="col-md-10 mb-3">
                    <label for="brand">Marca</label>
                    <input type="text" id="brand-name" name="brand" class="form-control" id="validationTooltip01" placeholder="Ej.Lenovo" value="" required>      
                </div>
               
            <div class="form-btn-container">
                <div class="btn-on">
                    <button  class="btn btn-primary" type="submit">cargar marca</button>
                </div>
                <div  class="btn-off">
                    <button id="edit-brand" type="button" >Editar marca</button>               
               </div>   
            </div>
        </form>
</div>







<script type="text/javascript" src="js/admin.js"></script>


{include file='templates/footer.tpl'}