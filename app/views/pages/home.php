<?php

include_once URL_APP . '/views/custom/header.php';

include_once URL_APP . '/views/custom/navbar.php';

?>

<div class="container mt-3">
    <div class="row">
        <!-- Columna perfil -->
        <div class="col-md-3">
            <div class="container-style-main">
                <div class="perfil-usuario-main">
                    <div class="background-usuario-main"></div>
                    <img src="<?php echo URL_PROJECT . '/' . $datos['perfil']->fotoPerfil ?>" alt="">
                    <div class="foto-separation"></div>
                    <a href="<?php echo URL_PROJECT ?>/perfil/<?php echo $datos['usuario']->usuario ?>" class="links"><div class="text-center nombre-perfil"><?php echo $datos['perfil']->nombreCompleto ?></div></a>
                    <div class="tabla-estadisticas">
                        <a href="#">Publicaciones <br> 0 </a>
                        <a href="#">Me gustas <br> 0</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Columna principal -->
        <div class="col-md-6">
            <div class="container-style-main">
                <div class="container-usuario-publicar">
                    <a href="<?php echo URL_PROJECT ?>/perfil/<?php echo $datos['usuario']->usuario ?>"><img src="<?php echo URL_PROJECT . '/' . $datos['perfil']->fotoPerfil ?>" class="image-border " alt=""></a>
                    <form action="" class="form-publicar ml-2">
                        <textarea name="" id="" class="published mb-0" name="post" placeholder="Que estas pensando?" required></textarea>
                        <div class="image-upload-file">
                            <div class="upload-photo">
                                <img src="<?php echo URL_PROJECT ?>/img/image.png" alt="" class="image-public">
                                <div class="input-file">
                                    <input type="file" name="imagen" id="imagen">
                                </div>
                                <span class="ml-1">Subir foto</span>
                            </div>
                            <button class="btn-publi">Publicar</button>
                        </div>

                    </form>
                </div>
                <div class="container-usuarios-publicaciones">

                </div>
            </div>
        </div>
        <!-- Columna eventos -->
        <div class="col-md-3">
            <div class="container-style-main">

            </div>
        </div>
    </div>
</div>


<?php

include_once URL_APP . '/views/custom/footer.php';

?>