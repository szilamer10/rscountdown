<?php
/**
* Resolution-Studio.ro
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Commercial License
 * you can't distribute, modify or sell this code
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file
 * If you need help please contact szilamer.balogh@resolution-studio.ro
 *
 * @author    Szilamer <szilamer.balogh@resolution-studio.ro>
 * @copyright Resolution-Studio.ro
 * @license   commercial
*/

if (!defined('_PS_VERSION_')) {
    exit;
}


class Rscountdown extends Module
{
    protected $config_form = false;

    public function __construct()
    {
        $this->name = 'rscountdown';
        $this->tab = 'market_place';
        $this->version = '1.0.0';
        $this->author = 'Szilamer';
        $this->need_instance = 0;
        $this->module_key = "86d610b37674fea34a5577e84d943047";

        /**
         * Set $this->bootstrap to true if your module is compliant with bootstrap (PrestaShop 1.6)
         */
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Resolution-Studio CountDown');
        $this->description = $this->l('With this module you can display two successive countdowns following each other.');

        $this->confirmUninstall = $this->l('Are you sure you want to uninstall this module?');

        $this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_);
    }

    /**
     * Don't forget to create update methods if needed:
     * http://doc.prestashop.com/display/PS16/Enabling+the+Auto-Update
     */
    public function install()
    {
        Configuration::updateValue('CUSTOMCOUNTDOWN_LIVE_MODE', false);

        include(dirname(__FILE__).'/sql/install.php');

        return parent::install() &&
            $this->registerHook('header') &&
            $this->registerHook('backOfficeHeader') &&
            $this->registerHook('displayHeader') &&
            $this->registerHook('displayNav') &&
            $this->registerHook('displayAfterBreadcrumb') &&
            $this->registerHook('displayTop');
    }

    public function uninstall()
    {
        Configuration::deleteByName('CUSTOMCOUNTDOWN_LIVE_MODE');

        include(dirname(__FILE__).'/sql/uninstall.php');

        return parent::uninstall();
    }

    /**
     * Load the configuration form
     */
    public function getContent()
    {
        /**
         * If values have been submitted in the form, process.
         */
        if (((bool)Tools::isSubmit('submitCustomcountdownModule')) == true) {
            $this->postProcess();
        }
        
        if (Tools::getValue('update_rs')) {
            $selectlanguage=Tools::getValue('shop_name_languages');
            $this->updateAction($selectlanguage);
        }
        if (Tools::getValue('update_next')) {
            $selectlanguage=Tools::getValue('shop_name_languages_new');
            $this->updateSecondAction($selectlanguage);
        }
       
        $sql_query=Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS("SELECT * FROM "._DB_PREFIX_."customcountdown");
        $this->context->smarty->assign([
            'sql_query' => $sql_query,
            'countdown_input_error' => Configuration::get('rps_countdown_input_error'),
            'countdown_error' => Configuration::get('rps_countdown_error'),

        ]);
        Configuration::updateValue('rps_countdown_input_error', false);
        Configuration::updateValue('rps_countdown_error', false);

        $this->context->smarty->assign('module_dir', $this->_path);

        $output = $this->context->smarty->fetch($this->local_path.'views/templates/admin/configure.tpl');

        return $output.$this->renderForm();
    }

    /**
     * Create the form that will be displayed in the configuration of your module.
     */
    protected function renderForm()
    {
        $helper = new HelperForm();

        $helper->show_toolbar = false;
        $helper->table = $this->table;
        $helper->module = $this;
        $helper->default_form_language = $this->context->language->id;
        $helper->allow_employee_form_lang = Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG', 0);

        $helper->identifier = $this->identifier;
        $helper->submit_action = 'submitCustomcountdownModule';
        $helper->currentIndex = $this->context->link->getAdminLink('AdminModules', false)
            .'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');

        $helper->tpl_vars = array(
            'fields_value' => $this->getConfigFormValues(), /* Add values for your inputs */
            'languages' => $this->context->controller->getLanguages(),
            'id_language' => $this->context->language->id,
        );

        return $helper->generateForm(array($this->getConfigForm()));
    }

    /**
     * Create the structure of your form.
     */
    protected function getConfigForm()
    {
    }

    /**
     * Set values for the inputs.
     */
    protected function getConfigFormValues()
    {
        return array(
            'CUSTOMCOUNTDOWN_LIVE_MODE' => Configuration::get('CUSTOMCOUNTDOWN_LIVE_MODE', true),
            'CUSTOMCOUNTDOWN_ACCOUNT_EMAIL' => Configuration::get('CUSTOMCOUNTDOWN_ACCOUNT_EMAIL', 'contact@prestashop.com'),
            'CUSTOMCOUNTDOWN_ACCOUNT_PASSWORD' => Configuration::get('CUSTOMCOUNTDOWN_ACCOUNT_PASSWORD', null),
        );
    }

    /**
     * Save form data.
     */
    protected function postProcess()
    {
        $form_values = $this->getConfigFormValues();

        foreach (array_keys($form_values) as $key) {
            Configuration::updateValue($key, Tools::getValue($key));
        }
    }

    /**
    * Add the CSS & JavaScript files you want to be loaded in the BO.
    */
    public function hookBackOfficeHeader()
    {
        if (Tools::getValue('configure') == $this->name) {
            $this->context->controller->addJS($this->_path.'views/js/back.js');
            $this->context->controller->addCSS($this->_path.'views/css/back.css');
        }
    }

    /**
     * Add the CSS & JavaScript files you want to be added on the FO.
     */
    public function hookHeader()
    {
        $this->context->controller->addJS($this->_path.'/views/js/front.js');
        $this->context->controller->addCSS($this->_path.'/views/css/front.css');
    }

    public function hookDisplayHeader()
    {
        $this->context->controller->addJS($this->_path.'/views/js/front.js');
        $this->context->controller->addCSS($this->_path.'/views/css/front.css');
    }

   
    public function hookDisplayAfterBreadcrumb()
    {
        $iso_code = $this->context->language->iso_code;
        if ($iso_code == 'en') {
            $id_lang = 2;
        } elseif ($iso_code =='fr') {
            $id_lang = 1;
        } else {
            $id_lang = 4;
        }
        
        $sql='SELECT *
        FROM '._DB_PREFIX_.'customcountdown where id_lang='.$id_lang.'';
    
        $countdown=Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql);

        $this->context->smarty->assign('countdown', $countdown);
        $this->context->smarty->assign('countdownJS', Tools::jsonEncode($countdown));
        return $this->display(__FILE__, '/views/templates/hook/topbar.tpl');
    }

    public function hookDisplayTop()
    {
        $sql='SELECT *
        FROM '._DB_PREFIX_.'customcountdown';
    
        $countdown=Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS($sql);
        $this->context->smarty->assign('countdown', $countdown);
        $this->context->smarty->assign('countdownJS', Tools::jsonEncode($countdown));
        return $this->display(__FILE__, '/views/templates/hook/topbar.tpl');
    }
    
    
    public function updateAction($selectlanguage)
    {
        $checkItemsInDatabase=Db::getInstance()->getValue("SELECT count(*) FROM "._DB_PREFIX_."customcountdown where id_lang=".$selectlanguage);

        $title=Tools::getValue('title');
        $title =addslashes($title);
        $start_date=Tools::getValue('start_date');
        $end_date=Tools::getValue('end_date');
        $description=Tools::getValue('description');
        $description =addslashes($description);
        $voucher_code=Tools::getValue('voucher_code');
        $voucher_code =addslashes($voucher_code);
        $start_time=Tools::getValue('start_time');
        $end_time=Tools::getValue('end_time');
        
        
       

        if (!empty($title) && !empty($start_date) && !empty($end_date) && !empty($description) && !empty($voucher_code) && !empty($start_date) && !empty($end_date)) {
            if ($checkItemsInDatabase) {
                if (Configuration::updateValue('Count_Down', 'updated')) {
                    Db::getInstance()->execute("UPDATE `"._DB_PREFIX_."customcountdown` SET id_customcountdown = $selectlanguage, title ='$title',start_date ='$start_date $start_time:59',end_date ='$end_date $end_time:59',description ='$description',voucher_code ='$voucher_code' WHERE id_lang =$selectlanguage");
                    return true;
                } else {
                    return false;
                }
            } else {
                Db::getInstance()->execute("INSERT INTO`"._DB_PREFIX_."customcountdown` (`id_customcountdown`, `title`, `start_date`, `end_date`, `description`, `voucher_code`, `id_lang`, `title_new`, `start_date_new`, `end_date_new`, `description_new`, `voucher_code_new`) VALUES ('$selectlanguage','$title','$start_date $start_time:59','$end_date $end_time:59','$description','$voucher_code','$selectlanguage','No Second Voucher','2021-12-02 00:42:59','2021-12-02 00:42:59','-','-')");
                return true;
            }
        }
    }
    public function updateSecondAction($selectlanguage)
    {
        $title=Tools::getValue('title_next');
        $start_date=Tools::getValue('start_date_next');
        $end_date=Tools::getValue('end_date_next');
        $description=Tools::getValue('description_next');
        $voucher_code=Tools::getValue('voucher_code_next');
        $start_time_next=Tools::getValue('start_time_next');
        $end_time_next=Tools::getValue('end_time_next');

        $checkItemsInDatabase=Db::getInstance()->executeS("SELECT count(*) FROM "._DB_PREFIX_."customcountdown where id_lang=".$selectlanguage);
        
        if (!$checkItemsInDatabase) {
            Configuration::updateValue('rps_countdown_error', true);
            return false;
        }
       
        if (!empty($title) && !empty($start_date) && !empty($end_date) && !empty($description) && !empty($voucher_code) && !empty($start_time_next) && !empty($end_time_next)) {
            if (Configuration::updateValue('Count_Down', 'updated')) {
                Db::getInstance()->execute("UPDATE `"._DB_PREFIX_."customcountdown`  SET title_new ='$title',start_date_new ='$start_date $start_time_next:59',end_date_new  ='$end_date $end_time_next:59',description_new ='$description',voucher_code_new ='$voucher_code' WHERE id_lang =$selectlanguage");
                return true;
            } else {
                Configuration::updateValue('rps_countdown_error', true);
            }
        } else {
            Configuration::updateValue('rps_countdown_input_error', true);
        }
    }
}
