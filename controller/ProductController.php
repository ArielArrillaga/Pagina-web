<?php
require_once 'model/ProductModel.php';
require_once 'view/ProductView.php';
require_once 'view/AdminView.php';
require_once 'model/BrandModel.php';

class ProductController
{

    private $productModel;
    private $productView;
    private $adminView;
    private $brandModel;

    function __construct()
    {
        $this->productModel = new ProductModel();
        $this->productView = new ProductView();
        $this->adminView = new AdminView();     
        $this->brandModel = new BrandModel();  
    }

    public function getAllProducts()
    {
        $products =  $this->productModel->getAll();
        $this->productView->showAllProducts($products);
    }

    public function adminView()
    {    
      
        $products =  $this->productModel->getAll();        
        $brands = $this->brandModel->getAllBrands();
        $this->adminView->showAdminView($products, $brands);
    }

    public function deleteProduct($id)
    {
        try{   
        if($id)    
            $this->productModel->remove($id);
        else 
            $this->adminView->showMessage("Id invalido",400);
        
    } catch (Exception $e) {
        $this->adminView->showMessage("No se pudo eliminar el producto",500);
    }

        header("Location: /tp/admins");
        die();
    }

    public function newProduct()
    {
        try {
            if (isset($_POST['description']['brand']['price']['product']) || empty($_POST['description'])) { 
                $this->adminView->showMessage("Completa todos los campos",400);
                
            } else {
                $this->productModel->add($_POST['description'], $_POST['brand'], $_POST['price'], $_POST['product']);
                header("Location: /tp/admins");
                
            }
        } catch (Exception $e) {
            $this->adminView->showMessage("No se pudo crear el producto",500);
        }
        die();
    }

    public function edit()
    {  
        try {
            $this->productModel->edit($_POST['id'], $_POST['product'], $_POST['description'], $_POST['brand'], $_POST['price']);
            header("Location: /tp/admins");
            die();
        } catch (Exception $e) {  
            $this->adminView->showMessage("Bad request",400);
        }
    }

  
}
