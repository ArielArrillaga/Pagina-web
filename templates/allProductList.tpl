
{include file='templates/header.tpl'} 

<div class="main-product-list-container">
   <div class="filters-container">
   <form action="home" method="post">
        <label for="brand">Filtro de marcas </label>
                    <select name ="brand">
                        <option  value='allbrands'>Todas las marcas</option>         
                        {foreach from=$brands item=$brand}                     
                           <option  value={$brand->id_brand}>{$brand->brand_name}</option>        
                        {/foreach}        
                    </select> 
   <input type="submit" name="submit" value="filtrar" >
</form>              
   </div>
   <div>
      <table class="table table-striped">
         <thead>
            <tr>
               <th scope="col">Producto</th>
               <th scope="col">Marca</th>
               <th scope="col">Precio</th>               
            </tr>
         </thead>
         <tbody>
            {foreach from=$products item=$product}
               <tr>
                  <th scope="row"><a href="showProduct/{$product->id_product}"  data-toggle="tooltip" data-placement="top" title="Ver detalles"> {$product->component}</a></th>
                  <td >{$product->brand_name}</td>
                  <td>{$product->price}</td>
               </tr>
            {/foreach}
         </tbody>
      </table>
   </div>
</div>


{include file='templates/footer.tpl'}

