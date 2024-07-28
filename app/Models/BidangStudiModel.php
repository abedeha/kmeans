<?php

namespace App\Models;

use CodeIgniter\Model;

class BidangStudiModel extends Model
{
    protected $table = 'tbl_bidang_studi';
    protected $primaryKey = 'id_bidang_studi';
    protected $allowedFields = ['bidang_studi', 'deskripsi'];
}
