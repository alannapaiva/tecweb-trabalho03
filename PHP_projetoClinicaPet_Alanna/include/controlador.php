<?php
include_once("../classes/Cliente.php");
//Get
if (isset($_GET['rota'])) {
    switch ($_GET['rota']) {
        case "cadastrar_cliente":
            include("../include/cadastrarCliente.php");
            break;

        case "visualizar_cliente":
            include("../include/visualizarCliente.php");
            break;

        case "editar_cliente":
            include("../include/editarCliente.php");
            break;
            case "cadastrar_pet":
                include("../include/cadastrarPET.php");
                break;     
            case "visualizar_pet":
                include("../include/visualizarPET.php");
                break;   
            case "editar_pet":
                include("../include/editarPET.php");
                break;
            case "consulta":
                include("../include/cadastrarConsulta.php");
                break;
            case "visualizar_consulta":
                include("../include/visualizarConsulta.php");
                break;
    }
}


//Post
if (isset($_POST['formCadastrarCliente'])) {
    $objCliente = new Cliente();
    $objCliente->setNome($_POST['nomeCliente']);
    $objCliente->setCPF($_POST['cpfCliente']);
    $objCliente->setEmail($_POST['emailCliente']);
   
    $objCliente->cadastrar();

} else if (isset($_POST['formEditarCliente'])) {
    $objCliente = new Cliente();
    $objCliente->setNome($_POST['nomeCliente']);
    $objCliente->setCPF($_POST['cpfCliente']);
    $objCliente->setEmail($_POST['emailCliente']);
    $objCliente->setID($_POST['idCliente']);
    $objCliente->editar();

}