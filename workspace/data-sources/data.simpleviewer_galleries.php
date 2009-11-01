<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcesimpleviewer_galleries extends Datasource{
		
		public $dsParamROOTELEMENT = 'simpleviewer-galleries';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '999999999';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamPARAMOUTPUT = 'system:id';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'55' => 'yes',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'publish'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Simpleviewer Galleries',
					 'author' => array(
							'name' => 'Carsten de Vries',
							'website' => 'http://localhost/symphony-2.0.6',
							'email' => 'carsten@vrieswerk.nl'),
					 'version' => '1.0',
					 'release-date' => '2009-11-01T18:54:24+00:00');	
		}
		
		public function getSource(){
			return '7';
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

