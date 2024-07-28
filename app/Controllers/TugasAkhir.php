<?php

namespace App\Controllers;

use App\Models\TugasAkhirModel;

class TugasAkhir extends BaseController
{
    protected $tugasAkhirModel;

    public function __construct()
    {
        $this->tugasAkhirModel = new TugasAkhirModel();
    }

    public function index()
    {

        $data['tugas_akhir'] = $this->tugasAkhirModel->get_builder()->get()->getResultArray();
        return view('tugas_akhir/index', $data);
    }

    public function create()
    {
        return view('tugas_akhir/create');
    }

    public function store()
    {
        $validationRules = [
            'judul' => 'required|max_length[255]',
            'id_prodi' => 'required|integer',
            'jumlah_halaman' => 'required|integer',
            'tahun_terbit' => 'required|numeric|exact_length[4]',
            'id_bidang_studi' => 'required|integer',
        ];

        if (!$this->validate($validationRules)) {
            return redirect()->back()->withInput()->with('pesan', $this->validator->listErrors());
        }

        $data = [
            'judul' => $this->request->getPost('judul'),
            'id_prodi' => $this->request->getPost('id_prodi'),
            'jumlah_halaman' => $this->request->getPost('jumlah_halaman'),
            'tahun_terbit' => $this->request->getPost('tahun_terbit'),
            'id_bidang_studi' => $this->request->getPost('id_bidang_studi'),
        ];

        $this->tugasAkhirModel->save($data);
        return redirect()->to('/tugas-akhir')->with('pesan', 'Data berhasil disimpan');
    }

    public function edit($id)
    {
        $id = dekripsiText($id);
        $data['ta'] = $this->tugasAkhirModel->find($id);
        return view('tugas_akhir/edit', $data);
    }

    public function update($id)
    {
        $id = dekripsiText($id);

        $validationRules = [
            'judul' => 'required|max_length[255]',
            'id_prodi' => 'required|integer',
            'jumlah_halaman' => 'required|integer',
            'tahun_terbit' => 'required|integer',
            'id_bidang_studi' => 'required|integer',
        ];

        if (!$this->validate($validationRules)) {
            return redirect()->back()->withInput()->with('pesan', $this->validator->listErrors());
        }

        $data = [
            'judul' => $this->request->getPost('judul'),
            'id_prodi' => $this->request->getPost('id_prodi'),
            'jumlah_halaman' => $this->request->getPost('jumlah_halaman'),
            'tahun_terbit' => $this->request->getPost('tahun_terbit'),
            'id_bidang_studi' => $this->request->getPost('id_bidang_studi'),
        ];

        $this->tugasAkhirModel->update($id, $data);
        return redirect()->to('/tugas-akhir')->with('pesan', 'Data berhasil diupdate');
    }

    public function delete($id)
    {
        $id = dekripsiText($id);
        $this->tugasAkhirModel->delete($id);
        return redirect()->back()->with('pesan', 'Data berhasil dihapus');
    }
}
