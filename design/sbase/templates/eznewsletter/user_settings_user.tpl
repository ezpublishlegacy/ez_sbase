{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{* eZNewsletter - edit newslettertype *}
{ezpagedata_set('site_title', 'Your subscriptions'|i18n( 'design/eznewsletter/user_settings_user' ) )}
<form method="post" action={concat('/newsletter/user_settings/',$hash)|ezurl}>

<input type="hidden" name="original_email" value="{$userData.email}" />

{include uri="design:eznewsletter/user_settings_user_profile.tpl"}

{* Subscription template *}
<div class="box">
<div class="tl">
<div class="tr">
<div class="br">
<div class="bl">
<div class="box-content float-break">

<h1 class="context-title">{'Your subscriptions'|i18n( 'design/eznewsletter/user_settings_user' )}</h1>
<div class="header-mainline"></div>

{* Newsletter type table. *}
<table class="list" cellspacing="0">
<tr>
    <th>{'Name'|i18n( 'design/eznewsletter/user_settings_user' )}</th>
    <th>{'Subscribed'|i18n( 'design/eznewsletter/user_settings_user' )}</th>
    <th>{'Output format'|i18n( 'design/eznewsletter/user_settings_user' )}</th>
</tr>
{if count($subscriptionList)|lt(1)}
    <tr><td>&nbsp;</td><td>{'No subscriptions available'|i18n( 'design/eznewsletter/user_settings_user' )}</td></tr>
{else}
    {def $allowed_formats=array(0,1,2,3,4,5,6)
         $default_format=2}
    {if ezini_hasvariable('NewsletterSettings', 'AllowedOutputFormats', 'sbase.ini')}
        {set $allowed_formats=ezini('NewsletterSettings', 'AllowedOutputFormats', 'sbase.ini') }
    {/if}
    {if ezini_hasvariable('NewsletterSettings', 'DefaultOutputFormat', 'sbase.ini')}
        {set $default_format=ezini('NewsletterSettings', 'DefaultOutputFormat', 'sbase.ini') }
    {/if}
    {foreach $subscriptionList as $subscription
             sequence array( bglight, bgdark ) as $seq}
        <tr class="{$seq}">
        <td><strong>{$subscription.subscription_list.name|wash}</strong>{if $subscription.subscription_list.description|trim|ne('')} - {$subscription.subscription_list.description|wash}{/if}</td>
        <td>
	    <input style="border: 0px none ;" name="Status_{$subscription.id}" value="1" type="checkbox" 
	    {if $removedStatusList|contains($subscription.status)}{else}{'checked="checked"'}{/if}
	    {if $allowedStatusList|contains($subscription.status)}{else}{'disabled="disabled"'}{/if} />
        </td>

        <td>
	<select name="OutputFormat_{$subscription.id}[]" multiple="multiple" title="{'Output format'|i18n( 'design/eznewsletter/user_settings_user' )}" class="halfbox" 
	{if $allowedStatusList|contains($subscription.status)|not}'disabled="disabled"'{/if}>
	{foreach $output_map as $value => $name}
        {if $allowed_formats|contains($value)}
	    <option value="{$value|wash}" {cond( $subscription.outputformat_list|contains($value), 'selected="selected"', '')}>{$name|wash}</option>
        {/if}
	{/foreach}
	</select>
	</td>
        </tr>
    {/foreach}
{/if}
</table>

{* DESIGN: Content END *}

{* Buttons. *}
<div class="controlbar">
{* DESIGN: Control bar START *}
<div class="block">
    <input class="button" type="submit" name="UpdateSubscriptions" value="{'Update'|i18n( 'design/eznewsletter/user_settings_user' )}" title="{'Update settings.'|i18n( 'design/eznewsletter/user_settings_user' )}" />
</div>
{* DESIGN: Control bar END *}
</div>


</div></div></div></div></div></div> </div>

</form>


 <div class="break">
 </div>
