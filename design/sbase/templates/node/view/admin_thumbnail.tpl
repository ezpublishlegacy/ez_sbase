<div class="content-view-thumbnail">
{def $can_create_classes = $node.classes_js_array
	 $disable_createHere_menu = cond( $can_create_classes|eq("''"),"'child-menu-create-here'", '-1' ) }
<a href={concat('/content/view/detail/',$node.node_id)|ezurl} onclick="ezpopmenu_showTopLevel( event, 'SubitemsContextMenu', ez_createAArray( new Array( '%nodeID%', {$:node.node_id}, '%objectID%', {$:node.object.id}, '%languages%', {$:node.object.language_js_array}, '%classList%', {$can_create_classes} ) ) , '{$:node.object.name|shorten(18)|wash}', {$:node.node_id}, {$disable_createHere_menu} ); return false;">{$node.class_identifier|class_icon( normal, '[%classname] Click on the icon to get a context sensitive menu.'|i18n( 'design/admin/node/view/thumbnail',, hash( '%classname', $node.class_name ) ) )}</a>
{undef $can_create_classes $disable_createHere_menu}
</div>
