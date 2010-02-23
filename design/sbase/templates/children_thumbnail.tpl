{* This template displays a collection of child nodes as thumbnails. *}
{* It is included/used from within the children.tpl if the user's viewmode is set to list. *}
<div class="content-navigation-childlist">
<table class="list-thumbnails" cellspacing="0">
    <tr>
    {section var=Nodes loop=$children sequence=array( bglight, bgdark )}
    {let child_name=$Nodes.item.name|wash}
        <td width="25%">
        {*node_view_gui view=admin_thumbnail content_node=$Nodes.item*}
        {node_view_gui view=thumbnail content_node=$Nodes.item}

        <div class="controls">
        {* Remove checkbox *}
        {section show=$Nodes.item.can_remove}
            <input type="checkbox" name="DeleteIDArray[]" value="{$Nodes.item.node_id}" title="{'Use these checkboxes to select items for removal. Click the "Remove selected" button to actually remove the selected items.'|i18n( 'design/admin/node/view/full' )|wash()}" />
            {section-else}
            <input type="checkbox" name="DeleteIDArray[]" value="{$Nodes.item.node_id}" title="{'You do not have permissions to remove this item.'|i18n( 'design/admin/node/view/full' )}" disabled="disabled" />
        {/section}

        {* Edit button *}
        {section show=$Nodes.item.can_edit}
            <a href={concat( 'content/edit/', $Nodes.item.contentobject_id )|ezurl}><img src={'edit.gif'|ezimage} alt="{'Edit'|i18n( 'design/admin/node/view/full' )}" title="{'Edit <%child_name>.'|i18n( 'design/admin/node/view/full',, hash( '%child_name', $child_name ) )|wash}" /></a>
        {section-else}
            <img src={'edit-disabled.gif'|ezimage} alt="{'Edit'|i18n( 'design/admin/node/view/full' )}" title="{'You do not have permissions to edit <%child_name>.'|i18n( 'design/admin/node/view/full',, hash( '%child_name', $child_name ) )|wash}" /></a>
        {/section}
		{* Copy button *}
        {section show=$Nodes.item.can_create}
            <a href={concat( 'content/copy/', $Nodes.item.contentobject_id )|ezurl}><img src={'copy.gif'|ezimage} alt="{'Copy'|i18n( 'design/admin/node/view/full' )}" title="{'Copy <%child_name>.'|i18n( 'design/admin/node/view/full',, hash( '%child_name', $child_name ) )|wash}" /></a>
        {section-else}
            <img src={'copy-disabled.gif'|ezimage} alt="{'Copy'|i18n( 'design/admin/node/view/full' )}" title="{'You do not have permissions to copy %child_name.'|i18n( 'design/admin/node/view/full',, hash( '%child_name', $child_name ) )|wash}" /></a>
        {/section}
        {def $visibility=''}
        {if $Nodes.item.is_hidden}
            {set $visibility='(hidden)'}
        {elseif $Nodes.item.is_invisible}
            {set $visibility='(parent hidden)'}
        {/if}
        <p>{node_view_gui view=admin_line content_node=$Nodes.item} {$visibility}</p>
        {undef $visibility}
        </div>
    {/let}
</td>
{delimiter modulo=4}
</tr><tr>
{/delimiter}
{/section}
</tr>
</table>
</div>
