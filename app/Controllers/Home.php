<?php

namespace App\Controllers;

use CodeIgniter\Shield\Models\UserModel;


class Home extends BaseController
{
    public function __construct()
    {
        $this->UserModel = new UserModel();
    }
    public function index()
    {
        return view('index.php');
    }
}
