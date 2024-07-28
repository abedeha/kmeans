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

                                    <div class="col-md-12">
                                        <p><b>Charts:</b></p>
                                        <div class="row">
                                            <div class="col-md-4">
                                                <canvas id="chart<?= $i ?>_1"></canvas>
                                            </div>
                                            <div class="col-md-4">
                                                <canvas id="chart<?= $i ?>_2"></canvas>
                                            </div>
                                            <div class="col-md-4">
                                                <canvas id="chart<?= $i ?>_3"></canvas>
                                            </div>
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
                                                <td class="text-left"><?= $item['judul'] ?></td>
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

<script>
    const iterations = <?= json_encode($results) ?>;
    const colors = ['rgba(255, 99, 132, 0.5)', 'rgba(54, 162, 235, 0.5)', 'rgba(75, 192, 192, 0.5)'];

    function createDataset(label, data, color) {
        return {
            label: label,
            data: data,
            backgroundColor: color,
            borderColor: color.replace('0.5', '1'),
            borderWidth: 1,
            pointRadius: 5
        };
    }

    iterations.forEach((iteration, i) => {
        const clusters = iteration.clusters;
        const centroids = iteration.centroids;

        const data1 = [];
        const data2 = [];
        const data3 = [];

        clusters.forEach((cluster, index) => {
            if (Array.isArray(cluster)) {
                const dataset1 = cluster.map(item => ({
                    x: item.x,
                    y: item.y
                }));
                const dataset2 = cluster.map(item => ({
                    x: item.x,
                    y: item.z
                }));
                const dataset3 = cluster.map(item => ({
                    x: item.y,
                    y: item.z
                }));

                data1.push(createDataset(`Cluster ${index + 1}`, dataset1, colors[index]));
                data2.push(createDataset(`Cluster ${index + 1}`, dataset2, colors[index]));
                data3.push(createDataset(`Cluster ${index + 1}`, dataset3, colors[index]));
            }
        });

        const centroidData1 = centroids.map(c => ({
            x: c.x,
            y: c.y
        }));
        const centroidData2 = centroids.map(c => ({
            x: c.x,
            y: c.z
        }));
        const centroidData3 = centroids.map(c => ({
            x: c.y,
            y: c.z
        }));

        data1.push(createDataset('Centroids', centroidData1, 'rgba(0, 0, 0, 1)'));
        data2.push(createDataset('Centroids', centroidData2, 'rgba(0, 0, 0, 1)'));
        data3.push(createDataset('Centroids', centroidData3, 'rgba(0, 0, 0, 1)'));

        new Chart(document.getElementById(`chart${i}_1`), {
            type: 'scatter',
            data: {
                datasets: data1
            },
            options: {
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: 'Jumlah Halaman'
                        }
                    },
                    y: {
                        title: {
                            display: true,
                            text: 'Tahun Terbit'
                        }
                    }
                }
            }
        });

        new Chart(document.getElementById(`chart${i}_2`), {
            type: 'scatter',
            data: {
                datasets: data2
            },
            options: {
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: 'Jumlah Halaman'
                        }
                    },
                    y: {
                        title: {
                            display: true,
                            text: 'ID Bidang Studi'
                        }
                    }
                }
            }
        });

        new Chart(document.getElementById(`chart${i}_3`), {
            type: 'scatter',
            data: {
                datasets: data3
            },
            options: {
                scales: {
                    x: {
                        title: {
                            display: true,
                            text: 'Tahun Terbit'
                        }
                    },
                    y: {
                        title: {
                            display: true,
                            text: 'ID Bidang Studi'
                        }
                    }
                }
            }
        });
    });
</script>

<?= $this->endSection() ?>