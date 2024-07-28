<?= $this->extend('layout/template') ?>
<?= $this->section('content') ?>

<div class="col-xl-6">
    <!-- panggil halaman notifikasi -->
    <?= view('notifikasi') ?>
</div>

<div class="container pt-3">

    <div class="row">
        <div class="col-xl-6">
            <div class="card ">
                <div class="card-body">
                    <form action="ganti-password" method="POST" class="row g-3">
                        <?= csrf_field() ?>
                        <div class="col-md-12">
                            <label for="password_baru" class="form-label">Password Baru</label>
                            <input type="password" class="form-control" name="password_baru" id="password_baru" placeholder="password baru">
                        </div>
                        <div class="col-md-12">
                            <label for="konfirmasi_password" class="form-label">Konfirmasi Password</label>
                            <input type="password" class="form-control" name="konfirmasi_password" id="konfirmasi_password" placeholder="konfirmasi password">
                        </div>
                        <div class="col-12">
                            <button type="submit" class="btn btn-primary float-right">Ganti</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



<?= $this->endSection() ?>