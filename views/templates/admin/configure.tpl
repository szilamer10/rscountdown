{*
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
*}
<script src="https://cdn.jsdelivr.net/timepicker.js/latest/timepicker.min.js"></script>
<link href="https://cdn.jsdelivr.net/timepicker.js/latest/timepicker.min.css" rel="stylesheet" />

{if $countdown_error}
    <div class="countdown_error">An error occurred whit saveing the data.</div>
{/if}
{if $countdown_input_error}
    <div class="countdown_error">Input fields was emptys.</div>
{/if}

<div>
    <div class="button_container"><span>Count-down list</span> <button><i class="icon-new"></i></button></div>

    <div class="table_container">
        <table class="table tableDnD" style="width:100%;border-collapse:collapse;">
            <tr style="background-color: #90dffb;">

                <th>{l s='Title' mod='rscountdown'}</th>
                <th>{l s='Start Date' mod='rscountdown'}</th>
                <th>{l s='End Date' mod='rscountdown'}</th>
                <th>{l s='Description' mod='rscountdown'}</th>
                <th>{l s='Voucher Code' mod='rscountdown'}</th>

                <th>{l s='Next Title ' mod='rscountdown'}</th>
                <th>{l s='Next Start Date' mod='rscountdown'}</th>
                <th>{l s='Next End Date' mod='rscountdown'}</th>
                <th>{l s='Next Description' mod='rscountdown'}</th>
                <th>{l s='Next Voucher Code' mod='rscountdown'}</th>
            </tr>

            {if $sql_query|@count}
                <form action="#" method="post">
                    {foreach from=$sql_query item=row}

                        <tr>

                            <td>
                                <b class="totprod">{$row.title|escape:'htmlall':'UTF-8'}</b><br />
                            </td>
                            <td>
                                {$row.start_date|escape:'htmlall':'UTF-8'}
                            </td>
                            <td>
                                {$row.end_date|escape:'htmlall':'UTF-8'}
                            </td>
                            <td>
                                {$row.description|escape:'htmlall':'UTF-8'}
                            </td>
                            <td>
                                {$row.voucher_code|escape:'htmlall':'UTF-8'}
                            </td>

                            <td>
                                <b class="totprod">{$row.title_new|escape:'htmlall':'UTF-8'}</b><br />
                            </td>
                            <td>
                                {$row.start_date_new|escape:'htmlall':'UTF-8'}
                            </td>
                            <td>
                                {$row.end_date_new|escape:'htmlall':'UTF-8'}
                            </td>
                            <td>
                                {$row.description_new|escape:'htmlall':'UTF-8'}
                            </td>
                            <td>
                                {$row.voucher_code_new|escape:'htmlall':'UTF-8'}
                            </td>

                        </tr>
                    {/foreach}
                    <input type="hidden" id="deleteItem" name="deleteItem" value="0" />
                </form>
            {else}
                <tr>
                    <td colspan="6">
                        <div class="warn">{l s='No countdown was registered' mod='rscountdown'}</div>
                    </td>
                </tr>
            {/if}
        </table>
    </div>

    <div class="add_offer_container">
        <div style="width:50%; margin-right:10px;" class="first_offer_container" id="first_offer_container">
            <h2>
               <span> Update the first offer</span> <div class="eu_us_container"><span class="first-second">First</span><span class="custom-checkbox"><input name="optin" id="ff_optin" type="checkbox" value="1"><span><i class="fa fa-check rtl-no-flip checkbox-checked" aria-hidden="true"></i></span></span><span class="first-second">Second</span></div>
            </h2>

            <form action="#" method="POST">
                <div class="title_languange">
                    <div>
                    <label for="css">Title</label>
                    <input type="text" id="title" name="title">
                    <br>
                    </div>
                    <div>
                    {* <label for="language">Language</label> *}
                    <select name="shop_name_languages" id="shop_name_languages" class="form-control lcp formfield">
                        {foreach from=$module_languages key=key item=value}
                            <option name="language" value="{$value.id_lang|escape:'quotes':'UTF-8'}">
                                {$value.iso_code|escape:'quotes':'UTF-8'}</option>
                        {/foreach}
                    </select>
                    </div>
                </div>
                <div class="gmt_time"><span>GMT TIME + 02:00</span></div>
                <label for="javascript">Start Date</label>
                <div class="start_date_time">
                    <input type="date" id="start_date" name="start_date" style="margin-bottom:5px;">
                    <input type="time" id="time" placeholder="Time" name="start_time">
                </div>
                <br>

                <label for="catb">End Date</label>
                <div class="start_date_time">
                    <input type="date" id="end_date" name="end_date">
                    <input type="time" id="time0" placeholder="Time" name="end_time">
                </div>
                <br>
                <label for="javascript">Description</label>
                <input type="text" id="description" name="description">
                <br>
                <label for="javascript">Voucher Code</label>
                <input type="text" id="voucher_code" name="voucher_code">
                <br>
               <div class="submit_button"> <input type="submit" name="update_rs" value="Update first countdown"> </div>
            </form>

        </div>
        <div class="add_offer_container">
        <div class="second_countdown first_offer_container" style="width:50%">
            <h2> <span>Update the second offer</span> <div class="count_down"><span class="first-second">First</span><span class="custom-checkbox"><input name="optin" id="ff_optin" type="checkbox" value="1"><span><i class="fa fa-check rtl-no-flip checkbox-checked" aria-hidden="true"></i></span></span><span class="first-second">Second</span></div></h2>
            <form action="#" method="POST">
            <div class="title_languange">
            <div>
            <label for="css">Next Title</label>
            <input type="text" id="title_next" name="title_next">
            <br>
            </div>
            <div>
                {* <label for="language">Language</label> *}
                <select name="shop_name_languages_new" id="shop_name_languages_new" class="form-control lcp formfield"
                    style="width: 100px;">
                    {foreach from=$module_languages key=key item=value}
                        <option name="language" value="{$value.id_lang|escape:'quotes':'UTF-8'}">
                            {$value.iso_code|escape:'quotes':'UTF-8'}</option>
                    {/foreach}
                </select>
                </div>
               
                </div>
                <div class="gmt_time"><span>GMT TIME + 02:00</span></div>
                <label for="javascript">Next Start Date</label>
                <div class="start_date_time">
                    <input type="date" id="start_date_next" name="start_date_next" style="margin-bottom:5px;">
                    <input type="time" id="time" placeholder="Time" name="start_time_next">
                </div>
                <br>

                <label for="catb">Next End Date</label>
                <div class="start_date_time">
                    <input type="date" id="end_date_next" name="end_date_next">
                    <input type="time" id="time" placeholder="Time" name="end_time_next">
                </div>
                <br>
                <label for="javascript">Next Description</label>
                <input type="text" id="description_next" name="description_next">
                <br>
                <label for="javascript">Next Voucher Code</label>
                <input type="text" id="voucher_code_next" name="voucher_code_next">
                <br>
                <div class="submit_button"> <input type="submit" name="update_next" value="Update second CountDown"></div>
            </form>

        </div>
        </div>
    </div>
</div>