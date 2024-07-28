<?php

/**
 * The goal of this file is to allow developers a location
 * where they can overwrite core procedural functions and
 * replace them with their own. This file is loaded during
 * the bootstrap process and is called during the framework's
 * execution.
 *
 * This can be looked at as a `master helper` file that is
 * loaded early on, and may also contain additional functions
 * that you'd like to use throughout your entire application
 *
 * @see: https://codeigniter.com/user_guide/extending/common.html
 */

use CodeIgniter\Model;


if (!function_exists("generateRandomString")) {
    function generateRandomString($length = 4)
    {
        $charset = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $str = '';
        $count = strlen($charset);
        for ($i = 0; $i < $length; $i++) {
            $str .= $charset[random_int(0, $count - 1)];
        }
        return $str;
    }
}

if (!function_exists("enkripsiText")) {
    function enkripsiText($text)
    {
        $encrypter = service('encrypter');
        $result = bin2hex($encrypter->encrypt($text));

        return $result;
    }
}

if (!function_exists("dekripsiText")) {
    function dekripsiText($text)
    {
        $encrypter = service('encrypter');
        $result = $encrypter->decrypt(hex2bin($text));

        return $result;
    }
}

if (!function_exists("tgl_indo")) {
    function tgl_indo($tanggal)
    {
        $bulan = array(
            1 =>   'Januari',
            'Februari',
            'Maret',
            'April',
            'Mei',
            'Juni',
            'Juli',
            'Agustus',
            'September',
            'Oktober',
            'November',
            'Desember'
        );
        $pecahkan = explode('-', $tanggal);

        return $pecahkan[2] . ' ' . $bulan[(int)$pecahkan[1]] . ' ' . $pecahkan[0];
    }
}

if (!function_exists("username")) {
    function username()
    {
        $model = model('CodeIgniter\Shield\Models\UserModel');
        $result = $model->select('username')
            ->where('id', user_id())
            ->get()->getRowArray();

        return $result['username'];
    }
}

if (!function_exists("bidangStudi")) {
    function bidangStudi($id = null)
    {
        $model = model('App\Models\BidangStudiModel');

        if (empty($id)) return $model->findAll();
        if (!empty($id)) return $model->find($id);
    }
}


if (!function_exists("prodi")) {
    function prodi($id_prodi = null)
    {
        $model = model('App\Models\ProdiModel');

        if (empty($id_prodi)) return $model->get_builder()->orderBy('id_prodi', 'ASC')->get()->getResultArray();
        if (!empty($id_prodi)) return $model->get_builder($id_prodi)
            ->get()->getRowArray();
    }
}

if (!function_exists("fakultas")) {
    function fakultas($id_fakultas = null)
    {
        $model = model('App\Models\FakultasModel');
        if (empty($id_fakultas)) return $model->findAll();
        if (!empty($id_fakultas)) return $model->find($id_fakultas);
    }
}
