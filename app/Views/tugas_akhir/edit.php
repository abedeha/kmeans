<?= $this->extend('layout/template') ?>
<?= $this->section('content') ?>

<div class="container pt-3">
    <div class="row">
        <div class="col-lg-8">
            <div class="card">
                <div class="card-header">
                    <div class="card-title">
                        <h4> Tambah Tugas Akhir</h4>
                    </div>
                </div>
                <div class="card-body">

                    <?= view('notifikasi') ?>

                    <form action="/tugas-akhir/update/<?= enkripsiText($ta['id'])  ?>" method="post" role="form">
                        <?= csrf_field() ?>
                        <div class="card-body">
                            <div class="form-group row">
                                <label for="judul" class="col-sm-4">Judul</label>
                                <div class="col-sm-8">
                                    <input type="text" name="judul" id="judul" class="form-control" value="<?= $ta['judul'] ?>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="id_prodi" class="col-sm-4">Program Studi</label>
                                <div class="col-sm-8">
                                    <select name="id_prodi" class="form-control">
                                        <?php foreach (prodi() as $key => $value) : ?>
                                            <?php ($ta['id_prodi'] == $value['id_prodi']) ? $select = 'selected' : $select = ""; ?>
                                            <option value="<?= $value['id_prodi'] ?>" <?= $select ?>><?= $value['prodi'] ?></option>
                                        <?php endforeach ?>
                                    </select>
                                </div>

                            </div>
                            <div class="form-group row">
                                <label for="jumlah_halaman" class="col-sm-4">Jumlah Halaman:</label>
                                <div class="col-sm-8">
                                    <input type="number" name="jumlah_halaman" id="jumlah_halaman" class="form-control" value="<?= $ta['jumlah_halaman'] ?>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="tahun_terbit" class="col-sm-4">Tahun Terbit</label>
                                <div class="col-sm-8">
                                    <input type="number" name="tahun_terbit" id="tahun_terbit" class="form-control" value="<?= $ta['tahun_terbit'] ?>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="id_bidang_studi" class="col-sm-4">Bidang Studi</label>
                                <div class="col-sm-8">
                                    <select name="id_bidang_studi" class="form-control">
                                        <?php foreach (bidangStudi() as $key => $value) : ?>
                                            <?php ($ta['id_bidang_studi'] == $value['id_bidang_studi']) ? $select = 'selected' : $select = ""; ?>

                                            <option value="<?= $value['id_bidang_studi'] ?>" <?= $select ?>><?= $value['bidang_studi'] ?></option>
                                        <?php endforeach ?>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <a href="/tugas-akhir" class="btn btn-secondary float-left">Kembali</a>

                            <button type="submit" class="btn btn-primary float-right">Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<?= $this->endSection() ?>