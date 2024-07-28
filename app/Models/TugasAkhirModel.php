<?php

namespace App\Models;

use CodeIgniter\Model;

class TugasAkhirModel extends Model
{
    protected $table = 'tbl_tugas_akhir';
    protected $primaryKey = 'id';
    protected $allowedFields = ['judul', 'id_prodi', 'jumlah_halaman', 'tahun_terbit', 'id_bidang_studi'];


    public function get_builder()
    {
        $query = $this->db->table('tbl_tugas_akhir as a')
            ->select('a.*, b.prodi, c.bidang_studi')
            ->join('tbl_prodi as b', 'a.id_prodi=b.id_prodi')
            ->join('tbl_bidang_studi as c', 'c.id_bidang_studi=a.id_bidang_studi');

        return $query;
    }
}
