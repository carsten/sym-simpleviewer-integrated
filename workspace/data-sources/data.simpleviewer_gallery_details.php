<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcesimpleviewer_gallery_details extends Datasource{
		
		public $dsParamROOTELEMENT = 'simpleviewer-gallery-details';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'id' => '{$simpleviewer-gallery-id}',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'maximagewidth',
				'maximageheight',
				'textcolor',
				'framecolor',
				'framewidth',
				'stagepadding',
				'navpadding',
				'thumbnailcolumns',
				'thumbnailrows',
				'navposition',
				'valign',
				'halign',
				'enablerightclickopen',
				'background-image',
				'firstimageindex',
				'langopenimage',
				'langabout',
				'preloadercolor',
				'flash-object-width',
				'flash-object-height',
				'background-color',
				'publish'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Simpleviewer Gallery Details',
					 'author' => array(
							'name' => 'Carsten de Vries',
							'website' => 'http://localhost/symphony-2.0.6',
							'email' => 'carsten@vrieswerk.nl'),
					 'version' => '1.0',
					 'release-date' => '2009-11-01T19:11:33+00:00');	
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

