<div class="content-navigation-childlist">
    <table id="ezwt-sort-list" class="list" cellspacing="0">
    <tr>
        {* Remove column *}
        <th class="remove"><img src={'toggle-button-16x16.gif'|ezimage} alt="{'Invert selection.'|i18n( 'design/admin/node/view/full' )}" title="{'Invert selection.'|i18n( 'design/admin/node/view/full' )}" onclick="ezjs_toggleCheckboxes( document.children, 'DeleteIDArray[]' ); return false;" /></th>

        {* Name column *}
        <th class="name">{'Name'|i18n( 'design/admin/node/view/full' )}</th>

        {* Class type column *}
        <th class="class">{'Type'|i18n( 'design/admin/node/view/full' )}</th>

        {* Priority column *}
        {section show=eq( $node.sort_array[0][0], 'priority' )}
            <th class="priority">{'Priority'|i18n( 'design/admin/node/view/full' )}</th>
        {/section}

        {* Edit column *}
        <th class="edit">&nbsp;</th>
    </tr>

    {section var=Nodes loop=$children sequence=array( bglight, bgdark )}
    {let child_name=$Nodes.item.name|wash
         node_name=$node.name}

        <tr class="{$Nodes.sequence}  ezwt-sort-dragable">

        {* Remove checkbox *}
        <td>
        {section show=$Nodes.item.can_remove}
            <input type="checkbox" name="DeleteIDArray[]" value="{$Nodes.item.node_id}" title="{'Use these checkboxes to select items for removal. Click the "Remove selected" button to actually remove the selected items.'|i18n( 'design/admin/node/view/full' )|wash()}" />
            {section-else}
            <input type="checkbox" name="DeleteIDArray[]" value="{$Nodes.item.node_id}" title="{'You do not have permissions remove this item.'|i18n( 'design/admin/node/view/full' )}" disabled="disabled" />
        {/section}
        </td>

        {* Name *}
	{def $userEnabled='' $userLocked='' $visibility=''}
	{def $nodeContent=fetch( 'content', 'object', hash( 'object_id', $Nodes.item.contentobject_id ) )}
	{if $nodeContent.class_identifier|eq('user')}
		{if not($nodeContent.data_map['user_account'].content.is_enabled)}
		   {set $userEnabled=concat( '<span class="userstatus-disabled">', '(disabled)'|i18n("design/admin/node/view/full") ,'</span>')}
		{/if}
		{if $nodeContent.data_map['user_account'].content.is_locked}
		   {set $userLocked=concat( '<span class="userstatus-disabled">', '(locked)'|i18n("design/admin/node/view/full") ,'</span>')}
		{/if}
	{/if}
    {if $Nodes.item.is_hidden}
        {set $visibility='(hidden)'}
    {elseif $Nodes.item.is_invisible}
        {set $visibility='(parent hidden)'}
    {/if}
        <td>{node_view_gui view=admin_line content_node=$Nodes.item} {$userEnabled} {$userLocked} {$visibility}</td>
    {undef $userEnabled $nodeContent $userLocked $visibility}

        {* Class type *}
        <td class="class">{$Nodes.item.class_name|wash()}</td>

        {* Priority *}
        {section show=eq( $node.sort_array[0][0], 'priority' )}
            <td>
            {section show=$node.can_edit}
                <input class="priority ezwt-priority-input" type="text" name="Priority[]" size="3" value="{$Nodes.item.priority}" title="{'Use the priority fields to control the order in which the items appear. Use positive and negative integers. Click the "Update priorities" button to apply the changes.'|i18n( 'design/admin/node/view/full' )|wash()}" />
                <input type="hidden" name="PriorityID[]" value="{$Nodes.item.node_id}" />
            {section-else}
                <input class="priority ezwt-priority-input" type="text" name="Priority[]" size="3" value="{$Nodes.item.priority}" title="{'You are not allowed to update the priorities because you do not have permissions to edit <%node_name>.'|i18n( 'design/admin/node/view/full',, hash( '%node_name', $node_name ) )|wash}" disabled="disabled" />
            {/section}
            </td>
        {/section}

        {* Edit button *}
        <td>
        {section show=$Nodes.item.can_edit}
            <a href={concat( 'content/edit/', $Nodes.item.contentobject_id )|ezurl}><img src={'edit.gif'|ezimage} alt="{'Edit'|i18n( 'design/admin/node/view/full' )}" title="{'Edit <%child_name>.'|i18n( 'design/admin/node/view/full',, hash( '%child_name', $child_name ) )|wash}" /></a>
        {section-else}
            <img src={'edit-disabled.gif'|ezimage} alt="{'Edit'|i18n( 'design/admin/node/view/full' )}" title="{'You do not have permissions to edit %child_name.'|i18n( 'design/admin/node/view/full',, hash( '%child_name', $child_name ) )|wash}" /></a>
        {/section}
        {section show=$Nodes.item.can_create}
            <a href={concat( 'content/copy/', $Nodes.item.contentobject_id, '?ViewMode=detail' )|ezurl}><img src={'copy.gif'|ezimage} alt="{'Copy'|i18n( 'design/admin/node/view/full' )}" title="{'Copy <%child_name>.'|i18n( 'design/admin/node/view/full',, hash( '%child_name', $child_name ) )|wash}" /></a>
        {section-else}
            <img src={'copy-disabled.gif'|ezimage} alt="{'Copy'|i18n( 'design/admin/node/view/full' )}" title="{'You do not have permissions to copy %child_name.'|i18n( 'design/admin/node/view/full',, hash( '%child_name', $child_name ) )|wash}" /></a>
        {/section}
        </td>
  </tr>

{/let}
{/section}

</table>
</div>

