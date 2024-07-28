<?= $this->extend('layout/template') ?>
<?= $this->section('content') ?>

<div class="container pt-3">
    <div class="row">
        <div class="col-lg-12 mb-3">
        </div>
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="float-left"><strong>DAFTAR TUGAS AKHIR</strong></h5>
                    <a href="/tugas-akhir/create" class="btn btn-primary float-right">Tambah Tugas Akhir</a>
                </div>
                <div class="card-body">
                    <?= view('notifikasi') ?>
                    <table class="table table-bordered table-striped datatabel">
                        <thead class="thead-dark text-center">
                            <tr>
                                <th>ID</th>
                                <th>Judul Tugas Akhir</th>
                                <th>Prodi</th>
                                <th>Jumlah Hal</th>
                                <th>Tahun Terbit</th>
                                <th>Bidang Studi</th>
                                <th width="100">Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php foreach ($tugas_akhir as $key => $item) : ?>
                                <tr>
                                    <td><?= $key + 1 ?></td>
                                    <td><?= $item['judul'] ?></td>
                                    <td><?= $item['prodi'] ?></td>
                                    <td class="text-center"><?= $item['jumlah_halaman'] ?> halaman</td>
                                    <td class="text-center"><?= $item['tahun_terbit'] ?></td>
                                    <td><?= $item['bidang_studi'] ?></td>
                                    <td class="text-center">
                                        <a href="/tugas-akhir/edit/<?= enkripsiText($item['id']) ?>" class="btn btn-secondary btn-sm">ubah</a>
                                        <a href="/tugas-akhir/delete/<?= enkripsiText($item['id']) ?>" class="btn btn-danger btn-sm" onclick="return confirm('Anda yakin menghapus data ini?')">hapus</a>
                                    </td>
                                </tr>
                            <?php endforeach; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>



<?= $this->endSection() ?>