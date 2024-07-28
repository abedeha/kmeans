<?= $this->extend('layout/template') ?>
<?= $this->section('content') ?>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<div class="container pt-3">
    <div class="card">
        <div class="card-header">
            <div class="card-title">
                <h4>Hasil K-Means</h4>
            </div>
        </div>
        <div class="card-body">

            <p>
                <strong>Jumlah Kluster:</strong> <?= $kluster ?> <br>
                <strong>Jumlah Iterasi:</strong> <?= $iterations ?>
            </p>

            <div class="row">
                <div class="col-md-12">
                    <div class="timeline">
                        <div class="time-label">
                            <span class="bg-info">Iterasi/Perulangan</span>
                        </div>
                        <?php for ($i = 0; $i < $iterations; $i++) : ?>
                            <div>
                                <i class="fas bg-info"><?= $i + 1 ?></i>
                                <div class="timeline-item">
                                    <div class="container row">
                                        <div class="col-md-12">
                                            <p><b>Centroid:</b></p>
                                            <table class="table table-bordered table-sm w-100 text-center">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>No</th>
                                                        <th>Jumlah Halaman</th>
                                                        <th>Tahun Terbit</th>
                                                        <th>Bidang Studi</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php foreach ($results[$i]['centroids'] as $index => $centroid) : ?>
                                                        <tr>
                                                            <td><?= $index + 1 ?></td>
                                                            <td><?= $centroid['x'] ?></td>
                                                            <td><?= $centroid['y'] ?></td>
                                                            <td><?= $centroid['z'] ?></td>
                                                        </tr>
                                                    <?php endforeach; ?>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="col-md-12">
                                            <p> <b>Klusters:</b></p>
                                            <table class="table table-bordered table-sm text-center datatabel">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th>No</th>
                                                        <th>Judul</th>
                                                        <th>Kluster</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <?php foreach ($results[$i]['clusters'] as $index => $cluster) : ?>
                                                        <tr>
                                                            <td><?= $index + 1 ?></td>
                                                            <td class="text-left"><?= htmlspecialchars($final_clusters[$index]['judul']) ?></td>
                                                            <td><?= $cluster + 1 ?></td>
                                                        </tr>
                                                    <?php endforeach; ?>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        <?php endfor; ?>
                        <div class="time-label">
                            <span class="bg-success">Hasil Akhir</span>
                        </div>
                        <div>
                            <div class="timeline-item">
                                <table class="table table-bordered table-sm w-100 text-center datatabel">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th>No</th>
                                            <th>Judul</th>
                                            <th>Kategori Bidang Studi</th>
                                            <th>Kluster</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php foreach ($final_clusters as $index => $item) : ?>
                                            <tr>
                                                <td><?= $index + 1 ?></td>
                                                <td class=" text-left"><?= $item['judul'] ?></td>
                                                <td class="text-left"><?= bidangStudi($item['id_bidang_studi'])['bidang_studi'] ?></td>
                                                <td class="bg-success text-white"><?= $item['cluster'] + 1 ?></td>
                                            </tr>
                                        <?php endforeach; ?>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>

<?= $this->endSection() ?>