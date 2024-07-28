<?= $this->extend('layout/template') ?>
<?= $this->section('content') ?>

<div class="row pt-3">

    <div class="col-md-12">
        <?= view('notifikasi') ?>
    </div>
    <div class="card mt-3">
        <div class="card-header">
            <h4 class="float-left"><strong>DAFTAR KATEGORI BIDANG STUDI</strong></h4>
            <a href="/bidang-studi/tambah" class="btn btn-primary float-right">tambah</a>
        </div>
        <div class="card-body">
            <table class="table table-bordered table-hover datatabel w-100">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Bidang Studi</th>
                        <th>Deskripsi</th>
                        <th width="150">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($bs as $key => $value) : ?>
                        <tr>
                            <td><?= $key + 1 ?></td>
                            <td><?= $value['bidang_studi'] ?></td>
                            <td><?= $value['deskripsi'] ?></td>
                            <td>
                                <a href="/bidang-studi/ubah/<?= enkripsiText($value['id_bidang_studi']) ?>" class="btn btn-secondary btn-sm">ubah</a>
                                <a href="/bidang-studi/hapus/<?= enkripsiText($value['id_bidang_studi']) ?>" class="btn btn-danger btn-sm" onclick="return confirm('Anda yakin menghapus data ini?')">hapus</a>
                            </td>
                        </tr>
                    <?php endforeach ?>
                </tbody>
            </table>
        </div>
    </div>

</div>


<?= $this->endSection() ?>