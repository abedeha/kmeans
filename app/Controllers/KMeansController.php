<?php

namespace App\Controllers;

use App\Models\KMeansModel;

class KMeansController extends BaseController
{

    public function index()
    {
        return view('kmeans/index');
    }
    public function proses()
    {
        $request = service('request');

        // Mengambil data dari GET request
        $kluster = $request->getGet('kluster');
        $iterasi = $request->getGet('iterasi');

        $validation = \Config\Services::validation();

        // Aturan validasi
        $rules = [
            'kluster' => 'required|numeric|greater_than[0]|less_than_equal_to[5]',
            'iterasi' => 'required|integer|greater_than[0]|less_than_equal_to[10]',
        ];

        // Validasi data
        if (!$validation->setRules($rules)->run(['kluster' => $kluster, 'iterasi' => $iterasi])) {
            return redirect()->back()->with('pesan', $validation->listErrors());
        }

        $k = $kluster; // Jumlah klaster yang diinginkan
        $fixedIterations = $iterasi; // Jumlah iterasi tetap
        $model = new KMeansModel();
        $result = $model->runKMeans($k, $fixedIterations);


        usort($result['final_clusters'], function ($a, $b) {
            return $a['cluster'] <=> $b['cluster'];
        });


        $data = [
            'iterations' => $result['iterations'],
            'kluster' => $k,
            'results' => $result['results'],
            'final_clusters' => $result['final_clusters']
        ];


        return view('kmeans/proses', $data);
    }
}
