<?php

namespace App\Models;

use CodeIgniter\Model;

class ProdiModel extends Model
{
    protected $table = 'tbl_prodi';
    protected $primaryKey = 'id';
    protected $allowedFields = ['prodi', 'id_fakultas'];


    public function get_builder()
    {
        $query = $this->db->table('tbl_prodi as a')
            ->select('a.*, b.fakultas')
            ->join('tbl_fakultas as b', 'a.id_fakultas=b.id_fakultas');

        return $query;
    }
}
