<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcesimpleviewer_images extends Datasource{
		
		public $dsParamROOTELEMENT = 'simpleviewer-images';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '9999999999';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$simpleviewer-gallery-id';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'37' => '{$simpleviewer-gallery-id}',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'description',
				'image-file'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Simpleviewer Images',
					 'author' => array(
							'name' => 'Carsten de Vries',
							'website' => 'http://localhost/symphony-2.0.6',
							'email' => 'carsten@vrieswerk.nl'),
					 'version' => '1.0',
					 'release-date' => '2009-11-01T16:25:40+00:00');	
		}
		
		public function getSource(){
			return '8';
		}
		
		public function allowEditorToParse(){
			return true;
		}
		
		public function grab(&$param_pool){
			$result = new XMLElement($this->dsParamROOTELEMENT);
				
			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}	

			if($this->_force_empty_result) $result = $this->emptyXMLSet();
			return $result;
		}
	}

