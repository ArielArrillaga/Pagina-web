<?php


class ProductModel
{
    private $db;

    function __construct()
    {
        $this->db = new PDO('mysql:host=localhost;dbname=tpweb;charset=utf8', 'root', '');
    }

    public function getAll()
    {

        $stmt = $this->db->prepare("SELECT p.id_product,p.component,p.description,p.price,b.brand_name,b.id_brand FROM Product p
        INNER JOIN Brand b ON b.id_brand=p.id_brand ORDER BY p.component");
        $stmt->execute();
        $products = $stmt->fetchAll(PDO::FETCH_OBJ);          
        return $products;
    }


    public function remove($id)
    {
        $stmt = $this->db->prepare("DELETE FROM Product WHERE id_product=?");
        $stmt->execute(array($id));       
    
    }

    public function add($description,$id_brand,$price,$component)
    {
        
        $stmt = $this->db->prepare("INSERT INTO Product (component,description,price,id_brand) VALUES (?,?,?,?)");
        $stmt->execute(array($component,$description,$price,$id_brand));       
    
    }

    public function edit($id_product,$product,$description,$id_brand,$price){
        $stmt = $this->db->prepare("UPDATE Product SET component=?, description=?, price=?, id_brand=? WHERE id_product=?");
        $stmt->execute(array($product,$description,$price,$id_brand,$id_product));

    }


    public function get($id)
    {
        $stmt = $this->db->prepare("SELECT p.id_product,p.component,p.description,p.price,b.brand_name,b.id_brand FROM Product p
        INNER JOIN Brand b ON b.id_brand=p.id_brand WHERE p.id_product=?");
        $stmt->execute(array($id));
        $product = $stmt->fetch(PDO::FETCH_OBJ);          
        return $product;
    }

    public function getAllProductsByBrandId($id){  
        $stmt = $this->db->prepare("SELECT p.id_product,p.component,p.description,p.price,b.brand_name,b.id_brand FROM Product p
        INNER JOIN Brand b ON b.id_brand=p.id_brand WHERE b.id_brand=? ORDER BY p.component");
        $stmt->execute(array($id));
        $products = $stmt->fetchAll(PDO::FETCH_OBJ);          
        return $products;
    }
}
