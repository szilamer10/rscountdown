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

$sql = array();

$sql[] = 'CREATE TABLE IF NOT EXISTS `' . _DB_PREFIX_ . 'customcountdown` (
    `id_customcountdown` int(11) NOT NULL AUTO_INCREMENT,
    `title` varchar(255) NOT NULL,
    `start_date` varchar(255) NOT NULL,
    `end_date` varchar(255) NOT NULL,
    `description` varchar(255) NOT NULL,
    `voucher_code` varchar(255) NOT NULL,
    `id_lang` int(11) NOT NULL,
    `title_new` varchar(255) NOT NULL,
    `start_date_new` varchar(255) NOT NULL,
    `end_date_new` varchar(255) NOT NULL,
    `description_new` varchar(255) NOT NULL,
    `voucher_code_new` varchar(255) NOT NULL,
    PRIMARY KEY  (`id_customcountdown`)
) ENGINE=' . _MYSQL_ENGINE_ . ' DEFAULT CHARSET=utf8;';

foreach ($sql as $query) {
    if (Db::getInstance()->execute($query) == false) {
        return false;
    }
}
