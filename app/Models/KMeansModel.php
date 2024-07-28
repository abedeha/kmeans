<?php

namespace App\Models;

use CodeIgniter\Model;

class KMeansModel extends Model
{
    protected $table = 'tbl_tugas_akhir'; // Nama tabel yang ada di database
    protected $primaryKey = 'id';
    protected $allowedFields = ['judul', 'tahun_terbit', 'tahun_terbit', 'id_bidang_studi'];

    public function runKMeans($k, $fixedIterations = 10)
    {
        $data = $this->findAll();

        // Ambil fitur yang relevan untuk K-Means
        $dataPoints = array_map(function ($item) {
            return [
                'x' => $item['jumlah_halaman'],
                'y' => $item['tahun_terbit'],
                'z' => $item['id_bidang_studi'],
            ];
        }, $data);

        $centroids = $this->initializeCentroids($dataPoints, $k);
        $iterations = 0;
        $results = []; // Untuk menyimpan hasil setiap iterasi

        while ($iterations < $fixedIterations) {
            $clusters = $this->assignClusters($dataPoints, $centroids);
            $newCentroids = $this->computeCentroids($dataPoints, $clusters, $k);
            $results[$iterations] = [
                'clusters' => $clusters,
                'centroids' => $newCentroids
            ];
            $centroids = $newCentroids;
            $iterations++;
        }

        // Gabungkan data asli dengan hasil klaster
        $finalClusters = [];
        foreach ($data as $index => $item) {
            $finalClusters[] = [
                'judul' => $item['judul'],
                'jumlah_halaman' => $item['jumlah_halaman'],
                'tahun_terbit' => $item['tahun_terbit'],
                'id_bidang_studi' => $item['id_bidang_studi'],
                'cluster' => $results[$fixedIterations - 1]['clusters'][$index]
            ];
        }

        return ['iterations' => $fixedIterations, 'results' => $results, 'final_clusters' => $finalClusters];
    }

    private function initializeCentroids($data, $k)
    {
        $keys = array_rand($data, $k);
        $centroids = [];
        foreach ($keys as $key) {
            $centroids[] = $data[$key];
        }
        return $centroids;
    }

    private function assignClusters($data, $centroids)
    {
        $clusters = [];
        foreach ($data as $point) {
            $distances = [];
            foreach ($centroids as $centroid) {
                $distances[] = $this->euclideanDistance($point, $centroid);
            }
            $clusters[] = array_search(min($distances), $distances);
        }
        return $clusters;
    }

    private function computeCentroids($data, $clusters, $k)
    {
        $centroids = array_fill(0, $k, [
            'x' => 0,
            'y' => 0,
            'z' => 0,
        ]);
        $counts = array_fill(0, $k, 0);

        foreach ($data as $index => $point) {
            $centroidIndex = $clusters[$index];
            $centroids[$centroidIndex]['x'] += $point['x'];
            $centroids[$centroidIndex]['y'] += $point['y'];
            $centroids[$centroidIndex]['z'] += $point['z'];
            $counts[$centroidIndex]++;
        }

        foreach ($centroids as $index => $centroid) {
            if ($counts[$index] > 0) {
                $centroids[$index]['x'] /= $counts[$index];
                $centroids[$index]['y'] /= $counts[$index];
                $centroids[$index]['z'] /= $counts[$index];
            }
        }

        return $centroids;
    }

    private function euclideanDistance($point1, $point2)
    {
        return sqrt(pow($point1['x'] - $point2['x'], 2) + pow($point1['y'] - $point2['y'], 2) + pow($point1['z'] - $point2['z'], 2));
    }
}
