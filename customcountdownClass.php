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

class CustomcountdownClass extends ObjectModelCore
{
    public $title;
    public $date;
    public $description;
    public $voucher_code;
    public $id;
    public $id_lang;
    public static $definition=array(
    'table'=>'customcountdown',
    'primary' =>'id_customcountdown',
    'multilang' => false,
    'fields' =>array(
        'id_customcountdown' =>  array('type' => self::TYPE_INT, 'validate' => 'isNullOrUnsignedId','required' => true),
        'title' => array('type' => self::TYPE_STRING,'validate'=>'isGenericName','required' => true),
        'start_date' =>  array('type' => self::TYPE_STRING,'validate'=>'isGenericName','required' => true),
        'end_date' =>  array('type' => self::TYPE_STRING,'validate'=>'isGenericName','required' => true),
        'description' => array('type' => self::TYPE_STRING,'validate'=>'isGenericName','required' => true),
        'voucher_code' =>  array('type' => self::TYPE_STRING,'validate'=>'isGenericName','required' => true),
        'id_lang' =>  array('type' => self::TYPE_INT, 'validate' => 'isNullOrUnsignedId','required' => true),
        'title_new' => array('type' => self::TYPE_STRING,'validate'=>'isGenericName','required' => true),
        'start_date_new' =>  array('type' => self::TYPE_STRING,'validate'=>'isGenericName','required' => true),
        'end_date_new' =>  array('type' => self::TYPE_STRING,'validate'=>'isGenericName','required' => true),
        'description_new' => array('type' => self::TYPE_STRING,'validate'=>'isGenericName','required' => true),
        'voucher_code_new' =>  array('type' => self::TYPE_STRING,'validate'=>'isGenericName','required' => true),
        )
    );
}
