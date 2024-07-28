<?php

namespace App\Controllers;

use CodeIgniter\Shield\Entities\User;
use CodeIgniter\Shield\Models\UserModel;
use PhpParser\Node\Expr\FuncCall;
use CodeIgniter\Shield\Validation\ValidationRules;


class Users extends BaseController
{

    public function __construct()
    {
        $this->UserModel = new UserModel();
    }

    public function index()
    {


        $users = $this->UserModel->get()->getResultArray();
        $data = [
            'users' => $users,
        ];
        return view('users/index', $data);
    }

    public function tambah()
    {
        $data = [];
        return view('users/tambah', $data);
    }

    public function simpan()
    {
        $post = $this->request->getPost();
        $users = auth()->getProvider();

        // validasi post
        $rules = new ValidationRules();

        if (!$this->validateData($post, $rules->getRegistrationRules())) {
            return redirect()->back()->withInput()->with('pesan', $this->validator->listErrors());
        }

        $user = new User([
            'username' => $post['username'],
            'email'    => $post['email'],
            'password' => $post['password'],
        ]);

        try {
            $users->save($user);
        } catch (\Throwable $th) {
            return redirect()->back()->withInput()->with('pesan', $users->errors());
        }

        // To get the complete user object with ID, we need to get from the database
        $user = $users->findById($users->getInsertID());

        // Add to default group
        $users->addToDefaultGroup($user);

        return redirect()->to('/users')->with('pesan', 'User berhasil ditambahkan');
    }

    public function set_aktifasi()
    {
        $username = $this->request->getPost('username');
        $result = $this->UserModel->where('username', $username)->get()->getRowArray();


        $users = auth()->getProvider();
        $user = $users->findById($result['id']);

        if (empty($result['status'])) $user->ban('Maaf, Anda tidak bisa login saat ini. Hubungi Administrator');
        if (!empty($result['status'])) $user->unBan();

        $users->save($user);

        session()->setFlashdata('pesan', 'data berhasil diperbaharui');

        return redirect()->to('/users');
    }

    public function ganti_password()
    {
        $post = $this->request->getPost();
        if (empty($post)) {
            return view('ganti_password');
        } else {
            // set rule validasi input
            $rule = [
                // 'password_lama' => 'required',
                'password_baru' => 'required|min_length[6]',
                'konfirmasi_password' => 'required|matches[password_baru]',
            ];

            if (!$this->validateData($post, $rule)) {
                return redirect()->back()->withInput()->with('pesan', $this->validator->listErrors());
            }

            $users = auth()->getProvider();
            $user = new User([
                'id' => user_id(),
                'password' => $post['password_baru'],
            ]);
            $users->save($user);

            return redirect()->back()->with('pesan', 'Password telah diganti. Silahkan keluar kemudian login kembali');
        }
    }
}
