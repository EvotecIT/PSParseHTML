$Content = @"
<div class="user-detail ">
        <div class="user-name">
            <span class="hand text-underline" onclick="VEP.event.trigger('UserList.OpenProfileCard', '9199125', {position: 'floated', left: event.clientX, top: event.clientY})">
                Joe Smith
            </span>

        </div>
        <div class="clear"></div>
        <!-- `extra1`: jobOfInterest, `extra2`: desiredEmploymentState -->

        <div class="user-title" tooltip="Acme Corp - The Boss">Acme Corp -The Boss</div>

    </div>
    <div class="user-archive">  &nbsp;


    </div>
    <div class="user-icon-list ">

        <div class="user-chat">
            <a class="chat-icon user-online " tooltip="Click to chat">
                <span class="glyphicon glyphicon-comment"></span>
            </a>
            <a class="offline-chat-icon hide">
                <span class="glyphicon glyphicon-comment"></span>
            </a>
        </div>

        <div class="user-linked-in">

        </div>
        <div class="user-message hide">
            <div class="message-icon"></div>
        </div>
        <div class="user-info hide">
            <a class="profile-icon glyphicon glyphicon-user chatting-with-91" title="Click to view profile"></a>
        </div>


    </div>
    <div class="clear" style="float:none;"></div>
</li><li class="ul-user" style="background: rgb(244, 244, 244);">
    <div class="user-picture">
        <img src="http://google.com">
    </div>
"@

$UserTitle = ConvertFrom-HTMLAttributes -Content $Content -Class 'user-title'
$UserName = ConvertFrom-HTMLAttributes -Content $Content -Class 'user-name'

[PSCustomObject] @{
    User  = $UserName.Trim()
    Title = $UserTitle
}