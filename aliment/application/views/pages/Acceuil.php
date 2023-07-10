<!DOCTYPE html>
<html>
<head>
    <title>Stocker les coordonnées</title>
    <link rel="stylesheet" href="<?php echo base_url('assets/bootstrap/css/bootstrap.min.css'); ?>">
    <link rel="stylesheet" href="<?php echo base_url('assets/fonts/fontawesome-all.min.css'); ?>">
    <link rel="stylesheet" href="<?php echo base_url('assets/css/untitled.css'); ?>">
    <link rel="stylesheet" href="<?php echo base_url('assets/css/list-groups.css'); ?>">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCTtiwq2n58g_FedrVPrIvrfrfHoMww7ic&libraries=places"></script>

</head>
<body>
    <div class="row">
        <div class="col-2">
            <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-4">
                <div class="container-fluid d-flex flex-column p-0">
                    <a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                        <div class="sidebar-brand-icon rotate-n-15"><i class="fas fa-laugh-wink"></i></div>
                        <div class="sidebar-brand-text mx-3"><span>Moove</span></div>
                    </a>
                    <hr class="sidebar-divider my-0">
                    <form id="formD" class="d-none d-sm-inline-block me-auto ms-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group"><input class="bg-light form-control border-0 small" type="text" placeholder="Search for ..." id="ligne"><button class="btn btn-primary btn-dark" type="button"><i class="fas fa-search"></i></button></div>
                    </form>

                    <div class="list-group d-grid gap-2 border-0 w-auto" id = "response"></div>
                </div>
            </nav>
        </div>
        <div class="col-10" id="map"></div>
    </div>
    <script src="<?php echo base_url('assets/js/google_maps.js'); ?>"></script>
    <script src="<?php echo base_url('assets/js/search.js'); ?>"></script>
</body>
</html>