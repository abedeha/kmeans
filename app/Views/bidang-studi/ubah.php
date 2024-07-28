<?= $this->extend('layout/template') ?>
<?= $this->section('content') ?>

<div class="row pt-3">
    <div class="col-md-6">
        <?= view('notifikasi') ?>

        <div class="card">
            <div class="card-header">
                <div class="card-title">FORM TAMBAH BIDANG STUDI</div>
            </div>
            <div class="card-body">
                <form action="/bidang-studi/simpan" method="POST" role="form">
                    <?= csrf_field() ?>
                    <div class="card-body">
                        <input type="hidden" name="id_bidang_studi" value="<?= $bs['id_bidang_studi'] ?>">
                        <div class="form-group">
                            <label for="bidang_studi">Nama Bidang Studi</label>
                            <input type="text" name="bidang_studi" class="form-control" value="<?= $bs['bidang_studi'] ?>">
                        </div>
                        <div class="form-group">
                            <label for="deskripsi">Deskripsi</label>
                            <textarea name="deskripsi" class="form-control" cols="30" rows="3"><?= $bs['deskripsi'] ?></textarea>
                        </div>

                    </div>
                    <div class="card-footer">
                        <a href="/bidang-studi" class="btn btn-secondary float-left">kembali</a>
                        <button type="submit" class="btn btn-primary float-right">Simpan</button>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>


<?= $this->endSection() ?>