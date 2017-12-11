<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require APPPATH . 'libraries/REST_Controller.php';
class Merchant extends REST_Controller {
	/*
		Basis 1 = Error Attribute
		100 = field kurang lengkap
		101 = 

		Basis 2 = Error Database
		200 = Akun sudah terdaftar
		201 = Registrasi Gagal
		202 = Token Tidak Valid

		300 = OK
	*/
	private $responses = array();
	private $singleResponses;
	private $code = 404;		
	private $paramspost = null;
	private $table = "merchant";

    function __construct() {
        parent::__construct();       
		$this->code = 300;
		// $this->responses['status'] = "Error";
		// $this->responses['code'] = $this->code;
        $this->load->model('Gmodel', 'model');
        $this->paramspost = $this->post();
    }
    function index_get(){
    	$this->response("Hello, World");
    }
	function register_post(){
		$this->code = 100;
		$this->responses['status'] = "Field Kurang Lengkap";
		$this->responses['code'] = $this->code;
		$this->table = "merchant";
		if (isset($this->paramspost['name'])
			&& isset($this->paramspost['address'])
			&& isset($this->paramspost['email'])
			&& isset($this->paramspost['password'])
			&& isset($this->paramspost['phone'])
			&& isset($this->paramspost['photo'])
			&& isset($this->paramspost['latitude'])
			&& isset($this->paramspost['longitude'])
			&& isset($this->paramspost['id_merchant_category'])
			&& isset($this->paramspost['max_upload'])
			&& isset($this->paramspost['open_at'])
			&& isset($this->paramspost['close_at'])
			&& isset($this->paramspost['point'])
			&& isset($this->paramspost['open_status'])
			&& isset($this->paramspost['status'])
			&& isset($this->paramspost['imei1'])
			&& isset($this->paramspost['imei2'])) {
				$this->code = 201;
				$this->responses['status'] = "Registrasi Gagal";
				$this->responses['code'] = $this->code;


				$dataInsertRegister = array();
				$dataInsertRegister['name'] = $this->paramspost['name'];
				$dataInsertRegister['address'] = $this->paramspost['address'];
				$dataInsertRegister['email'] = $this->paramspost['email'];
				$dataInsertRegister['password'] = md5($this->paramspost['password']);
				$dataInsertRegister['phone'] = $this->paramspost['phone'];
				$dataInsertRegister['photo'] = $this->paramspost['photo'];
				$dataInsertRegister['latitude'] = $this->paramspost['latitude'];
				$dataInsertRegister['longitude'] = $this->paramspost['longitude'];
				$dataInsertRegister['id_merchant_category'] = $this->paramspost['id_merchant_category'];
				$dataInsertRegister['max_upload'] = $this->paramspost['max_upload'];
				$dataInsertRegister['open_at'] = $this->paramspost['open_at'];
				$dataInsertRegister['close_at'] = $this->paramspost['close_at'];
				$dataInsertRegister['point'] = $this->paramspost['point'];
				$dataInsertRegister['open_status'] = $this->paramspost['open_status'];
				$dataInsertRegister['status'] = $this->paramspost['status'];
				$dataInsertRegister['imei1'] = $this->paramspost['imei1'];
				$dataInsertRegister['imei2'] = $this->paramspost['imei2'];
				$getData = $this->model->select($dataInsertRegister, $this->table);
				if ($getData->num_rows() < 1) {
					$this->code = 201;
					// $this->responses['status'] = "Gagal Registrasi";
					$this->responses = $this->code;					
					$insertData = $this->model->insert($dataInsertRegister, $this->table);
					if ($insertData) {
						$this->code = 300;
						// $this->responses['status'] = "Registrasi Berhasil";
						$this->responses = $this->code;
					}
				}
		}
		$this->response($this->responses);
	}
	function login_post(){
		$this->code = 400;
		$this->table = "merchant";		
		if (isset($this->paramspost)
			&& isset($this->paramspost['email']) 
			&& isset($this->paramspost['password'])) {
			$dataSelect['email'] = $this->paramspost['email'];
			$dataSelect['password'] = md5($this->paramspost['password']);
			$selectdata = $this->model->select($dataSelect, $this->table);
			if ($selectdata->num_rows() > 0) {
				// $localResponse = array();
				// $this->responses = array();	
				$localResponse = $selectdata->result_array();
				$this->code = 200;
				$this->responses = $localResponse;
			}
		}
		$this->response($this->responses, $this->code);
	}
	function fetch_info_post(){
		$this->code = 400;
		$this->table = "merchant";		
		if (isset($this->paramspost)
			&& isset($this->paramspost['key'])) {
			$dataSelect['key'] = $this->paramspost['key'];
			$selectdata = $this->model->select($dataSelect, $this->table);
			if ($selectdata->num_rows() > 0) {
				$localResponse = $selectdata->result_array();
				$this->code = 200;
				$this->responses = $localResponse;
			}
		}
		$this->response($this->responses, $this->code);		
	}
	function create_menu_post(){
		$this->code = 202;
		$this->responses['status'] = "Token Tidak Valid";
		$this->responses['code'] = $this->code;
		$this->table = "merchant";
		if (isset($this->paramspost['key'])) {
			$dataSelect['key'] = $this->paramspost['key'];
			$dataMerchant = $this->model->select($dataSelect, $this->table);
			if ($dataMerchant->num_rows() > 0) {
				$idMerchant = $dataMerchant->row()->id_merchant;
				$this->code = 100;
				$this->responses['status'] = "Field Kurang Lengkap";
				$this->responses['code'] = $this->code;
				if (isset($this->paramspost['merchant_menu']) && isset($this->paramspost['id_merchant_menu_category'])
					&& isset($this->paramspost['photo']) && isset($this->paramspost['price'])
					&& isset($this->paramspost['discount']) && isset($this->paramspost['discount_variant'])
					&& isset($this->paramspost['description']) && isset($this->paramspost['status'])) {
					$this->code = 201;
					$this->responses['status'] = "Membuat Menu Gagal";
					$this->responses['code'] = $this->code;
					$this->table = 'merchant_menu';
					$dataInsert['id_merchant'] = $idMerchant;
					$dataInsert['merchant_menu'] = $this->paramspost['merchant_menu'];
					$dataInsert['id_merchant_menu_category'] = $this->paramspost['id_merchant_menu_category'];
					$dataInsert['photo'] = $this->paramspost['photo'];
					$dataInsert['price'] = $this->paramspost['price'];
					$dataInsert['discount'] = $this->paramspost['discount'];
					$dataInsert['discount_variant'] = $this->paramspost['discount_variant'];
					$dataInsert['description'] = $this->paramspost['description'];
					$dataInsert['status'] = $this->paramspost['status'];
					$insert = $this->model->insert($dataInsert, $this->table);
					if ($insert) {
						$this->code = 300;
						// $this->responses['status'] = "Menu Telah Dibuat";
						$this->responses['code'] = $this->code;
					}
				}
			}
		}
		$this->response($this->code);
	}
	function read_menu_post(){
		$this->code = 202;
		$this->responses['status'] = "Token Tidak Valid";
		$this->responses['code'] = $this->code;
		$this->responses = array();
		$this->table = "merchant";
		if (isset($this->paramspost['key'])) {
			$dataSelect['key'] = $this->paramspost['key'];
			$dataMerchant = $this->model->select($dataSelect, $this->table);
			if ($dataMerchant->num_rows() > 0) {
				$idMerchant = $dataMerchant->row()->id_merchant;
				$this->code = 201;
				$this->responses['status'] = "Menu Tidak Ditemukan";
				$this->responses['code'] = $this->code;
				$this->responses = array();
				$this->table = 'merchant_menu';
				$dataSelectMenu['id_merchant'] = $idMerchant;
				$getData = $this->model->select($dataSelectMenu, $this->table);
				if ($getData->num_rows() > 0) {
					$localResponse = array();
					$localResponse = $getData->result_array();
					$this->code = 300;
					$this->responses = $getData->result_array();
					// $this->responses['status'] = "Ok";
					// $this->responses['code'] = $this->code;
				}
			}
		}
		$this->response($this->responses);
	}
	function update_menu_post(){
		$this->code = 202;
		$this->responses['status'] = "Token Tidak Valid";
		$this->responses['code'] = $this->code;
		$this->table = "merchant";
		if (isset($this->paramspost['key'])) {
			$dataSelect['key'] = $this->paramspost['key'];
			$dataMerchant = $this->model->select($dataSelect, $this->table);
			if ($dataMerchant->num_rows() > 0) {
				$idMerchant = $dataMerchant->row()->id_merchant;
				$this->code = 100;
				$this->responses['status'] = "Field Kurang Lengkap";
				$this->responses['code'] = $this->code;
				$this->responses = array();
				if (isset($this->paramspost['id_merchant_menu']) 
					&& isset($this->paramspost['merchant_menu']) && isset($this->paramspost['id_merchant_menu_category'])
					&& isset($this->paramspost['photo']) && isset($this->paramspost['price'])
					&& isset($this->paramspost['discount']) && isset($this->paramspost['discount_variant'])
					&& isset($this->paramspost['description']) && isset($this->paramspost['status'])) {
					$this->code = 201;
					$this->responses['status'] = "Menu Tidak Ditemukan";
					$this->responses['code'] = $this->code;
					$this->table = 'merchant_menu';
					$dataSelect = array();
					$dataSelect['id_merchant_menu'] = $this->paramspost['id_merchant_menu'];
					$select = $this->model->select($dataSelect, $this->table);
					if ($select->num_rows() > 0) {
						$dataUpdate['id_merchant'] = $idMerchant;
						$dataUpdate['merchant_menu'] = $this->paramspost['merchant_menu'];
						$dataUpdate['id_merchant_menu_category'] = $this->paramspost['id_merchant_menu_category'];
						$dataUpdate['photo'] = $this->paramspost['photo'];
						$dataUpdate['price'] = $this->paramspost['price'];
						$dataUpdate['discount'] = $this->paramspost['discount'];
						$dataUpdate['discount_variant'] = $this->paramspost['discount_variant'];
						$dataUpdate['description'] = $this->paramspost['description'];
						$dataUpdate['status'] = $this->paramspost['status'];
						$update = $this->model->update($dataSelect, $dataUpdate, $this->table);
						if ($update) {
							$this->code = 300;
							$this->responses['status'] = "Menu Telah Dirubah";
							$this->responses['code'] = $this->code;
						}
					}
				}
			}
		}
		$this->response($this->code);
	}
	function delete_menu_post(){
		$this->code = 202;
		$this->responses['status'] = "Token Tidak Valid";
		$this->responses['code'] = $this->code;
		$this->table = "merchant";
		if (isset($this->paramspost['key'])) {
			$dataSelect['key'] = $this->paramspost['key'];
			$dataMerchant = $this->model->select($dataSelect, $this->table);
			if ($dataMerchant->num_rows() > 0) {
				$idMerchant = $dataMerchant->row()->id_merchant;
				$this->code = 100;
				$this->responses['status'] = "Field Kurang Lengkap";
				$this->responses['code'] = $this->code;
				if (isset($this->paramspost['id_merchant_menu'])) {
					$this->code = 201;
					$this->responses['status'] = "Menu Tidak Ditemukan";
					$this->responses['code'] = $this->code;
					$this->table = 'merchant_menu';
					$dataSelect = array();
					$dataSelect['id_merchant_menu'] = $this->paramspost['id_merchant_menu'];
					$select = $this->model->select($dataSelect, $this->table);
					if ($select->num_rows() > 0) {
						$dataUpdate['deleted'] = 'Y';
						$update = $this->model->update($dataSelect, $dataUpdate, $this->table);
						if ($update) {
							$this->code = 300;
							$this->responses['status'] = "Menu Telah Dihapus";
							$this->responses['code'] = $this->code;
						}
					}
				}
			}
		}
		$this->response($this->code);
	}	
	function listcategory_get(){
		$this->code = 300;
		$this->responses['status'] = "Kategori Kosong";
		$this->responses['code'] = $this->code;
		$this->responses = array();
		$this->table = 'merchant_category';
		$getData = $this->model->get($this->table);
		if ($getData->num_rows() > 0) {
			$localResponse = array();
			$localResponse = $getData->result_array();
			$this->responses['code'] = $this->code;
			$this->responses = $localResponse;
		}
		$this->response($this->responses);
	}
	function listcategorymenu_get(){
		$this->code = 300;
		$this->responses['status'] = "Kategori Menu Kosong";
		$this->responses['code'] = $this->code;
		$this->responses = array();
		$this->table = 'merchant_menu_category';
		$getData = $this->model->get($this->table);
		if ($getData->num_rows() > 0) {
			$localResponse = array();
			$localResponse = $getData->result_array();
			$this->responses['code'] = $this->code;
			$this->responses = $localResponse;
		}
		$this->response($this->responses);
	}
	function upload_post(){		
        $config['upload_path']          = './uploads/';
        $config['allowed_types']        = 'gif|jpg|png';
        $config['max_size']             = 100;
        $config['max_width']            = 1024;
        $config['max_height']           = 768;
        $config['overwrite'] 			= TRUE;

        $this->load->library('upload', $config);

		$this->code = 202;
		$this->responses['status'] = "Token Tidak Valid";
		$this->responses['code'] = $this->code;
		$this->table = "merchant";
		if (isset($this->paramspost['key'])) {
			$dataSelect['key'] = $this->paramspost['key'];
			$dataMerchant = $this->model->select($dataSelect, $this->table);
			if ($dataMerchant->num_rows() > 0) {
				$idMerchant = $dataMerchant->row()->id_merchant;
				$this->code = 100;
				$this->responses['status'] = "Field Kurang Lengkap";
				$this->responses['code'] = $this->code;
				if (isset($_FILES) && $_FILES != null) {
					$this->code = 201;
					$this->responses['status'] = "Upload Gagal, Silakan diulangi";
					$this->responses['code'] = $this->code;
			        if ($this->upload->do_upload('userfile')){
			        	$localResponse = array();
			        	$localResponse['data'] = $this->upload->data()['file_name'];
						$this->code = 300;
						$this->responses = $localResponse;
						$this->responses['status'] = "Ok";
						$this->responses['code'] = $this->code;
			        }else{
			        	$localResponse = array();
			        	$localResponse['data'] = $this->upload->display_errors();
						$this->code = 201;
						$this->responses = $localResponse;
						$this->responses['status'] = "Gagal Upload";
						$this->responses['code'] = $this->code;
			        }
				}
			}
		}
		$this->response($this->code);
	}
	function update_merchant_post(){
		$this->code = 202;
		$this->responses['status'] = "Token Tidak Valid";
		$this->responses['code'] = $this->code;
		$this->table = "merchant";
		if (isset($this->paramspost['key'])) {
			$dataSelect['key'] = $this->paramspost['key'];
			$dataMerchant = $this->model->select($dataSelect, $this->table);
			if ($dataMerchant->num_rows() > 0) {
				$idMerchant = $dataMerchant->row()->id_merchant;
				$this->code = 100;
				$this->responses['status'] = "Field Kurang Lengkap";
				$this->responses['code'] = $this->code;
				if (isset($this->paramspost) && isset($this->paramspost['field']) && isset($this->paramspost['value'])) {
					$this->code = 201;
					$this->responses['status'] = "Update Data Merchant Gagal";
					$this->responses['code'] = $this->code;
					$dataCondition = array();
					$dataCondition['id_merchant'] = $idMerchant;
					$dataUpdate[$this->paramspost['field']] = $this->paramspost['value'];
					$update = $this->model->update($dataCondition, $dataUpdate, $this->table);
					if ($update) {
						$this->code = 300;
						$this->responses['status'] = "Data Merchant Berhasil Dirubah";
						$this->responses['code'] = $this->code;
					}
				}
			}
		}
		$this->response($this->code);		
	}
}