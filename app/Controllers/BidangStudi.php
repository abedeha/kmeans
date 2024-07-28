<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use CodeIgniter\HTTP\ResponseInterface;
use App\Models\BidangStudiModel;

class BidangStudi extends BaseController
{
    public function __construct()
    {
        $this->BidangStudiModel = new BidangStudiModel();
    }
    public function index()
    {
        $bs = $this->BidangStudiModel->findAll();

        $data = ['bs' => $bs];

        return view('bidang-studi/index', $data);
    }

    public function tambah()
    {
        return view('bidang-studi/tambah');
    }

    public function simpan()
    {
        $post = $this->request->getPost();

        $rule = [
            'bidang_studi' => 'required',
        ];

        // lakukan validasi input
        if (!$this->validateData($post, $rule)) {
            return redirect()->back()->withInput()->with('pesan', $this->validator->listErrors());
        }

        $this->BidangStudiModel->save($post);

        return redirect()->to('/bidang-studi')->with('pesan', 'data berhasil disimpan');
    }

    public function ubah($id)
    {
        $id = dekripsiText($id);
        $bs = $this->BidangStudiModel->find($id);

        return view('bidang-studi/ubah', ['bs' => $bs]);
    }

    public function hapus($id)
    {
        $id = dekripsiText($id);
        $this->BidangStudiModel->delete($id);

        return redirect()->to('/bidang-studi')->with('pesan', 'data berhasil dihapus');
    }
}
