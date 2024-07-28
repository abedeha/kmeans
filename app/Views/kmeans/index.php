<?= $this->extend('layout/template') ?>
<?= $this->section('content') ?>

<div class="container pt-3">
    <div class="row">
        <div class="col-lg-8">
            <div class="card">
                <div class="card-header">
                    <div class="card-title">
                        <h4> KMeans</h4>
                    </div>
                </div>
                <div class="card-body">

                    <?= view('notifikasi') ?>

                    <form action="/algo/proses" method="GET" role="form">
                        <div class="card-body">
                            <div class="form-group row">
                                <label for="kluster" class="col-sm-4">Jumlah klaster yang diinginkan</label>
                                <div class="col-sm-8">
                                    <input type="number" name="kluster" id="kluster" class="form-control" value="<?= old('kluster') ?>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="id_prodi" class="col-sm-4">Jumlah Iterasi/Perulangan</label>
                                <div class="col-sm-8">
                                    <input type="number" name="iterasi" id="iterasi" class="form-control" value="<?= old('iterasi') ?>">
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <button type="submit" class="btn btn-primary float-right">Proses</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<?= $this->endSection() ?>