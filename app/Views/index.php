<?= $this->extend('layout/template') ?>
<?= $this->section('content') ?>

<div class="container">
    <h1>Algoritma K-Means</h1>
    <p>Algoritma K-Means adalah salah satu metode pengelompokan data yang populer dalam bidang pembelajaran mesin dan analisis data. Algoritma ini digunakan untuk mengelompokkan data ke dalam sejumlah kelompok (kluster) yang ditentukan sebelumnya (K). Setiap kelompok terdiri dari data yang memiliki karakteristik atau fitur yang mirip satu sama lain.</p>

    <h2>Langkah-langkah Algoritma K-Means:</h2>
    <ol>
        <li><strong>Inisialisasi</strong>:
            <ul>
                <li>Tentukan jumlah kluster <i>K</i>.</li>
                <li>Pilih <i>K</i> titik sebagai pusat awal kluster (centroids). Pusat ini bisa dipilih secara acak dari dataset.</li>
            </ul>
        </li>
        <li><strong>Penugasan Kluster</strong>:
            <ul>
                <li>Untuk setiap titik data, hitung jarak antara titik data tersebut dengan masing-masing pusat kluster.</li>
                <li>Tempatkan titik data ke dalam kluster yang pusatnya memiliki jarak paling dekat.</li>
            </ul>
        </li>
        <li><strong>Perhitungan Pusat Baru</strong>:
            <ul>
                <li>Setelah semua titik data dikelompokkan ke dalam kluster, hitung ulang pusat kluster sebagai rata-rata dari semua titik data dalam kluster tersebut.</li>
            </ul>
        </li>
        <li><strong>Iterasi</strong>:
            <ul>
                <li>Ulangi langkah 2 dan 3 hingga pusat kluster tidak berubah signifikan (konvergen) atau jumlah iterasi yang telah ditentukan tercapai.</li>
            </ul>
        </li>
    </ol>

    <h2>Karakteristik dan Keunggulan:</h2>
    <ul>
        <li><strong>Sederhana dan Efisien</strong>: Algoritma K-Means relatif sederhana dan cepat, sehingga cocok untuk dataset yang besar.</li>
        <li><strong>Konvergensi Cepat</strong>: Algoritma ini biasanya konvergen dalam beberapa iterasi.</li>
        <li><strong>Kestabilan</strong>: Hasil klustering K-Means relatif stabil terhadap dataset yang memiliki struktur yang jelas.</li>
    </ul>

    <h2>Keterbatasan:</h2>
    <ul>
        <li><strong>Penentuan K</strong>: Algoritma memerlukan jumlah kluster <i>K</i> yang harus ditentukan sebelumnya, yang kadang sulit untuk diketahui secara pasti.</li>
        <li><strong>Sensitivitas terhadap Inisialisasi</strong>: Hasil akhir dapat sangat bergantung pada inisialisasi pusat kluster. Pemilihan pusat awal yang berbeda dapat menghasilkan kluster yang berbeda.</li>
        <li><strong>Kluster Berbentuk Non-Sferis</strong>: Algoritma ini lebih cocok untuk kluster yang berbentuk sferis (bulat) dan tidak terlalu baik dalam menangani kluster yang memiliki bentuk yang kompleks.</li>
    </ul>

    <h2>Penerapan:</h2>
    <p>Algoritma K-Means digunakan dalam berbagai aplikasi seperti pengenalan pola, segmentasi citra, kompresi data, analisis pasar, dan banyak lagi. Dalam dunia bisnis, K-Means sering digunakan untuk segmentasi pelanggan berdasarkan perilaku pembelian atau preferensi.</p>

    <p>Dengan pemahaman tentang algoritma K-Means, kita dapat menggunakannya untuk mengeksplorasi dan menganalisis struktur data secara lebih mendalam, memberikan wawasan yang bermanfaat dalam berbagai konteks dan aplikasi.</p>

</div>

<?= $this->endSection() ?>