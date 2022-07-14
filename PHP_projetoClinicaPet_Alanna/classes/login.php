<?php

include_once("../classes/Conexao.php");
include_once("../classes/Utilidades.php");
function verificar($email,$senha){      
   $objConexao= new Conexao();
   $conexaoBD= $objConexao->getConexao();
   $utilidades= new Utilidades();
   $sql="select * from adm where email_adm='$email' and senha_adm='$senha'";
   $result = mysqli_query($conexaoBD,$sql);
   if(mysqli_num_rows($result)>0){
      session_start();
      $_SESSION['administrador'] = true;
      echo "<script>alert('Seja bem vindo!!')</script>";
      $utilidades->redireciona("../produto/admin.php");
   }else{
      echo "<script>alert('Usuário ou senha incorretos!!')</script>";
      $utilidades->redireciona("index.php");

   }

}
?>