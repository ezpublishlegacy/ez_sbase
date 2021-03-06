{def $newsletter=fetch( 'newsletter', 'newsletter_by_object', hash( 'contentobject_id', $objectID, 'contentobject_version', $objectVersion ) )}

{if $newsletter}
{* DESIGN: Header START *}
<div class="box-header">
    <div class="box-tc">
    <div class="box-ml">
    <div class="box-mr">
    <div class="box-tl">
    <div class="box-tr">
        <h1 class="context-title">{'Edit newsletter'|i18n( 'design/eznewsletter/edit_newsletter_object' )}</h1>
{* DESIGN: Mainline *}
    <div class="header-mainline"></div>

{* DESIGN: Header END *}
    </div>
    </div>
    </div>
    </div>
    </div>
</div>

<div class="box-ml">
    <div class="box-mr">
        <div class="box-content">
{* DESIGN: Content START *}
    <input type="hidden" name="NewsletterID" value ="{$newsletter.id}"/>

    <div class="context-attributes">

        {* Name. *}
        <div class="block float-break">
            <label>{'Name'|i18n( 'design/eznewsletter/edit_newsletter_object' )}:</label>
            <input class="box" id="newsletterName" type="text" name="NewsletterName" value="{$newsletter.name|wash}" />
        </div>

        {* Newsletter send date *}
        <div class="block float-break">
            <label>{'Newsletter send date'|i18n( 'design/eznewsletter/edit_newsletter_object' )}:</label>
            <div class="date">
                <div class="element">
                    <label>{'Year'|i18n( 'design/standard/content/datatype' )}:</label>
                    <input type="text" name="NewsletterYear" size="5" value="{$newsletter.send_year|wash}" />
                </div>
                <div class="element">
                    <label>{'Month'|i18n( 'design/standard/content/datatype' )}:</label>
                    <input type="text" name="NewsletterMonth" size="3" value="{$newsletter.send_month|wash}" />
                </div>

                <div class="element">
                    <label>{'Day'|i18n( 'design/standard/content/datatype' )}:</label>
                    <input type="text" name="NewsletterDay" size="3" value="{$newsletter.send_day|wash}" />
                </div>
            </div>

            <div class="time">
                <div class="element">
                    <label>{'Hour'|i18n( 'design/standard/content/datatype' )}:</label>
                    <input type="text" name="NewsletterHour" size="3" value="{$newsletter.send_hour|wash}" />
                </div>

                <div class="element">
                    <label>{'Minute'|i18n( 'design/standard/content/datatype' )}:</label>
                    <input type="text" name="NewsletterMinute" size="3" value=" {$newsletter.send_minute|wash}" />
                </div>

            </div>
        </div>
        {* Newsletter category
        <div class="block float-break">
            <label>{'Newsletter category'|i18n( 'design/eznewsletter/edit_newsletter_object' )}:</label>
            <input class="box" type="text" name="NewsletterCategory" value="{$newsletter.category}" />
        </div> *}
{*
 *        <div class="block float-break">
 *             <label>{'Pretext'|i18n( 'design/eznewsletter/edit_newsletter_object' )}:</label>
 *            <textarea cols="80" rows="6" name="pretext">{$newsletter.pretext}</textarea>
 *        </div>
 *
 *        <div class="block float-break">
 *            <label>{'Posttext'|i18n( 'design/eznewsletter/edit_newsletter_object' )}:</label>
 *            <textarea cols="80" rows="6" name="posttext">{$newsletter.posttext}</textarea>
 *        </div>
 *}

        {* choose a format for this newsletter, available are set in type *}
        <div class="block float-break">
            <label>{'Design to use'|i18n( 'design/eznewsletter/edit_newsletter_object' )}:</label>
            {def $allowed_designs = $newsletter.newsletter_type.allowed_designs_array}
            
            <ul class="NewsletterDesignList">
            {def $design_name  = false()}
            {def $design_image = false()}
            {foreach $allowed_designs as $design}
                {set $design_name = ezini( $design, 'Description', 'newsletterdesigns.ini' )}
                {set $design_image = ezini( $design, 'PreviewImage', 'newsletterdesigns.ini' )}
                <li>
                <img alt="{$design_name|wash()}" src={$design_image|ezimage()}>
                <input type="radio" name="TemplateToUse" value="{$design}" {cond( eq($design, $newsletter.template_to_use), 'checked="checked"')}>{$design_name|wash}
                </li>
            {/foreach}
            </ul>
        </div>
        {* Choose the template to use for mail output generation *}
        <div class="block float-break">
            <label>{'Output format'|i18n( 'design/eznewsletter/edit_newsletter_object' )}:</label>
            <select name="NewsletterOutputFormat[]" multiple="multiple" title="OutputFormat">
                {foreach $newsletter.output_format_name_map as $value => $name}
                    {if $newsletter.newsletter_type.allowed_output_formats_array|contains( $value )}
                    <option value="{$value|wash}" {cond( $newsletter.output_format_list|contains( $value ), 'selected="selected"', '')}>{$name|wash}</option>
                    {/if}
                {/foreach}
            </select>
        </div>
        {* View online preview *}
        <div class="block float-break">
            <input class="button" type="Submit" name="NewsletterPreview" value="{'Preview'|i18n( 'design/eznewsletter/edit_newsletter_object' )}" />
        </div>

        {* Send preview fields *}
        <div class="block float-break">
            <label>{'Send preview address'|i18n( 'design/eznewsletter/edit_newsletter_object' )}</label>
            <input class="box" type="text" name="NewsletterPreviewEmail" value="{$newsletter.preview_email|wash}" />
        </div>

        {*<div class="block float-break">
            <label>{'Send preview mobile number'|i18n( 'design/eznewsletter/edit_newsletter_object' )}</label>
            <input class="box" type="text" name="NewsletterPreviewMobile" value="{$newsletter.preview_mobile|wash}" />
        </div>*}
  
    </div>

{* DESIGN: Content END *}
        </div>
    </div>
</div>

<div class="controlbar">
{* DESIGN: Control bar START *}
    <div class="box-bc">
    <div class="box-ml">
    <div class="box-mr">
    <div class="box-tc">
    <div class="box-bl">
    <div class="box-br">
        <div class="block float-break">
            <input class="button" type="Submit" name="NewsletterSendPreview" value="{'Send preview'|i18n( 'design/eznewsletter/edit_newsletter_object' )}" />
        </div>
{* DESIGN: Control bar END *}
    </div>
    </div>
    </div>
    </div>
    </div>
    </div>
</div>

<div class="break"></div>
{/if}
