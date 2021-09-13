function dl_cb(a,d)  end

function GetInputFile(file)
local file = file or "" 
if file:match('/') then
infile = {ID= "InputFileLocal", path_  = file}
elseif file:match('^%d+$') then
infile = {ID= "InputFileId", id_ = file}
else
infile = {ID= "InputFilePersistentId", persistent_id_ = file}
end
return infile
end

local clock = os.clock
function sleep(time)  
local untime = clock()
while clock() - untime <= time do end
end

function UpdateNewQuery(data)
msg = {} 
local TextCmdquery = data.payload_.data_ 
local UserID = data.sender_user_id_
local ChatID = data.chat_id_
local dataid = data.message_id_
msg = data

if TextCmdquery == "GroupSitting" then
if not CheckUserAdmin(msg) then return answerCallbackQuery(data.id_,"ليس لديك صلاحية التحكم , ارجو المعذرة ❤️",true) end
return UpdateGropSitting(msg)
elseif TextCmdquery == "MediaSitting" then
if not CheckUserAdmin(msg) then return answerCallbackQuery(data.id_,"ليس لديك صلاحية التحكم , ارجو المعذرة ❤️",true) end
return UpdateMediaSitting(msg)
elseif TextCmdquery == "OtherSetting" then
if not CheckUserAdmin(msg) then return answerCallbackQuery(data.id_,"ليس لديك صلاحية التحكم , ارجو المعذرة ❤️",true) end
return UpdateOtherSitting(msg)
elseif TextCmdquery == "List1" then
if not CheckUserAdmin(msg) then return answerCallbackQuery(data.id_,"ليس لديك صلاحية التحكم , ارجو المعذرة ❤️",true) end
return UpdateM1Query(msg)
elseif TextCmdquery == "List2" then
if not CheckUserAdmin(msg) then return answerCallbackQuery(data.id_,"ليس لديك صلاحية التحكم , ارجو المعذرة ❤️",true) end
return UpdateM2Query(msg)
elseif TextCmdquery == "List3" then
if not CheckUserAdmin(msg) then return answerCallbackQuery(data.id_,"ليس لديك صلاحية التحكم , ارجو المعذرة ❤️",true) end
return UpdateM3Query(msg)
elseif TextCmdquery == "List4" then
if not CheckUserAdmin(msg) then return answerCallbackQuery(data.id_,"ليس لديك صلاحية التحكم , ارجو المعذرة ❤️",true) end
return UpdateM4Query(msg)
elseif TextCmdquery == "CmdSudo" then
if not CheckUserAdmin(msg) then return answerCallbackQuery(data.id_,"ليس لديك صلاحية التحكم , ارجو المعذرة ❤️",true) end
return UpdateM5Query(msg)
elseif TextCmdquery == "CmdFiles" then
if not CheckUserAdmin(msg) then return answerCallbackQuery(data.id_,"ليس لديك صلاحية التحكم , ارجو المعذرة ❤️",true) end
return UpdateM6Query(msg)
elseif TextCmdquery == "LoginOut" then
if not CheckUserAdmin(msg) then return answerCallbackQuery(data.id_,"ليس لديك صلاحية التحكم , ارجو المعذرة ❤️",true) end
msg.Delete = true
msg.textmsg = "- تم اخفاء قائمة الاوامر"
msg.Editeinline = true
return SendMsgInline(msg)
elseif TextCmdquery == "CmdBack" then
if not CheckUserAdmin(msg) then return answerCallbackQuery(data.id_,"ليس لديك صلاحية التحكم الادمن , ارجو المعذرة ❤️",true) end
msg.textmsg = [[ للاستفسار - []]..SUDO_USER..[[]
➖➖➖

- قائمه الاوامر 
𝟏- م1 ( اوامر الإداره)
𝟐- م2 ( اوامر إعدادات المجموعه )
𝟑-م3 ( اوامر الحمايه ) 
𝟒- م المطور ( اوامر المطور ) 
𝟓- اوامر الرد ( لإضافه رد معين )
𝟔- اوامر التسليه
- اوامر الملفات ( للتحكم بالملفات ) 

➖➖➖]]
msg.KeyboardCmd = keyboardCmd
msg.Editeinline = true
return SendMsgInline(msg)
elseif TextCmdquery == "CmdBack1" then
if not CheckUserAdmin(msg) then return answerCallbackQuery(data.id_,"ليس لديك صلاحية التحكم الادمن , ارجو المعذرة ❤️",true) end
msg.textmsg = [[ للاستفسار - []]..SUDO_USER..[[]
➖➖➖

- قائمه الاوامر 
𝟏- م1 ( اوامر الإداره)
𝟐- م2 ( اوامر إعدادات المجموعه )
𝟑-م3 ( اوامر الحمايه ) 
𝟒- م المطور ( اوامر المطور ) 
𝟓- اوامر الرد ( لإضافه رد معين )
𝟔- اوامر التسليه
- اوامر الملفات ( للتحكم بالملفات ) 

➖➖➖]]
msg.KeyboardCmd = keyboardSitting
msg.Editeinline = true
return SendMsgInline(msg)
end

--=================================================================================
local TextCmd,CmdSitting = TextCmdquery:match("^(Sitting[123])#([%a%d_:]+)$")
print(CmdSitting)
if CmdSitting then
local ResRedis =  redis:del(boss..CmdSitting..msg.chat_id_)
if TextCmd == "Sitting3" then 
if (CmdSitting == "antiedit") and not Get_Rtb(msg,"SuperCreator") then return  answerCallbackQuery(data.id_,"ليس لديك صلاحية التحكم فقط للمنشئ الاساسي , ارجو المعذرة ❤️",true) end
if (CmdSitting == "lock_linkk" or CmdSitting == "lock_takkl" or CmdSitting == "lock_leftgroup" or CmdSitting == "lock_KickBan") and not Get_Rtb(msg,"Creator") then
return  answerCallbackQuery(data.id_,"ليس لديك صلاحية التحكم فقط للمنشئ , ارجو المعذرة ❤️",true) end
if (CmdSitting == "lock_RandomRdod" or CmdSitting == "lock_rdodSource" or CmdSitting == "lock_cleaner" or CmdSitting == "idphoto") and not Get_Rtb(msg,"Director") then
return  answerCallbackQuery(data.id_,"ليس لديك صلاحية التحكم فقط للمدير , ارجو المعذرة ❤️",true) end
end      
if not CheckUserAdmin(msg) then return answerCallbackQuery(data.id_,"ليس لديك صلاحية التحكم الادمن , ارجو المعذرة ❤️",true) end
if ResRedis == 0 then redis:set(boss..CmdSitting..msg.chat_id_,true) end
if TextCmd == "Sitting1" then 
UpdateGropSitting(msg)
elseif TextCmd == "Sitting2" then 
UpdateMediaSitting(msg)
elseif TextCmd == "Sitting3" then 
UpdateOtherSitting(msg)
end
return false
end
--=================================================================================
local Text,UserJoin = TextCmdquery:match("^(CheckRobotJoin:)(%d+)$")
local UserJoin = tonumber(UserJoin)
if Text == "CheckRobotJoin:" then
if CheckUserAdmin(msg) or UserID == UserJoin then
Restrict(ChatID,UserJoin,2)
EditMsg(ChatID,dataid,"- تم فك التقييد بنجاح والتاكد بانك لست روبوت ❤️")
answerCallbackQuery(data.id_,"- تم فك التقييد بنجاح والتاكد بانك لست روبوت ❤️",true)
else
answerCallbackQuery(data.id_,"عذرا انت لست الشخص المقيد او لا يوجد لديك صلاحيه الادارة , نعتذر منك",true)	
end
end
end

keyboardCmd = [[{
"inline_keyboard": [
[{"text": "𝟏","callback_data": "List1"},{"text": "𝟐","callback_data": "List2"}],
[{"text": "𝟑","callback_data": "List3"},{"text": "𝟒","callback_data": "List4"}],
[{"text": "𝟓","callback_data": "CmdSudo"},{"text": "𝟔","callback_data": "CmdFiles"}],
[{"text": "- اخفاء الامر","callback_data": "LoginOut"}]
]}
]]


keyboardSitting = [[{"inline_keyboard": [
[{"text": "- اعدادات المجموعة","callback_data": "GroupSitting"},{"text": "- اعدادات الوسائط","callback_data": "MediaSitting"}],
[{"text": "- اعدادات اخرى","callback_data": "OtherSetting"},{"text": "- اخفاء الامر","callback_data": "LoginOut"}]
]}
]]



--================================{{  SendinlineCmd  }} ===================================

function SendMsgInline(msg)
if msg.Editeinline then 
Method = ApiToken.."/editMessageText"
Edite  = "&message_id="..msg.message_id_/2097152/0.5
else 
Method = ApiToken.."/sendMessage" 
Edite  = "&reply_to_message_id="..msg.id_/2097152/0.5
end
if msg.Delete then 
RApi = "&parse_mode=markdown&disable_web_page_preview=true"
else
RApi = "&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..URL.escape(msg.KeyboardCmd)
end
rr,res=https.request(Method..'?chat_id='..msg.chat_id_..'&text='..URL.escape(msg.textmsg)..Edite..RApi)
if res == 200 then return false end
print(rr)
end

function UpdateM1Query(msg)
list_settings = '{"inline_keyboard": ['
..'[{"text": "- رجوع »","callback_data": "CmdBack"},{"text": "- اخفاء الامر","callback_data": "LoginOut"}]'
..']}'
msg.KeyboardCmd = list_settings
textMD = [[- اهلا بك في قائمة اوامر الاداريين

﹎﹎﹎﹎﹎اوامر الرفع والتنزيل﹎﹎﹎﹎﹎
- رفع - تنزيل منشى اساسي
- رفع - تنزيل مشرف
- رفع - تنزيل منشى
- رفع - تنزيل مدير
- رفع - تنزيل ادمن
- رفع - تنزيل مميز
- تنزيل الكل - لازاله جميع الرتب اعلاه

﹎﹎﹎﹎﹎اوامر المسح﹎﹎﹎﹎﹎
- مسح المنشئين الاساسيين
- مسح المنشئين
- مسح المدراء
- مسح الادمنيه
- مسح المميزين
- مسح المحظورين
- مسح المكتومين
- مسح قائمه العام
- مسح قائمه المنع
- مسح الردود العامه
- مسح الردود
- مسح الاوامر
- مسح + عدد
- مسح بالرد
- مسح ايدي عام
- مسح كليشه الايدي
- مسح كليشه الستارت
- مسح الترحيب
- مسح الرابط
- مسح كلايش التعليمات

﹎﹎﹎﹎﹎اوامر الطرد الحظر الكتم﹎﹎﹎﹎﹎
- حظر - بالرد،بالمعرف،بالايدي
- طرد - بالرد،بالمعرف،بالايدي 
- كتم - بالرد،بالمعرف،بالايدي
- تقيد - بالرد،بالمعرف،بالايدي
- الغاء الحظر - بالرد،بالمعرف،بالايدي
- الغاء الكتم - بالرد،بالمعرف،بالايدي
- فك التقييد - بالرد،بالمعرف،بالايدي
- رفع القيود - لحذف ↜ كتم،حظر،حظر عام،تقييد
- منع + الكلمه
- الغاء منع + الكلمه
- طرد البوتات
- طرد المحذوفين
- كشف البوتات]]
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg
local textD = redis:get(boss..":awamer_Klesha_m1:")
if textD then
textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
else
textD = textMD
end
msg.textmsg = textD
msg.Editeinline = true
return SendMsgInline(msg)
end,{msg=msg})
return false
end
function UpdateM2Query(msg)
list_settings = '{"inline_keyboard": ['
..'[{"text": "- رجوع »","callback_data": "CmdBack"},{"text": "- اخفاء الامر","callback_data": "LoginOut"}]'
..']}'
msg.KeyboardCmd = list_settings
textMD = [[
- اهلا بك في قائمة اوامر المجموعه

﹎﹎﹎﹎اوامر الوضع ﹎﹎﹎﹎
- ضع الترحيب
- ضع القوانين
- ضع وصف
- ضـع رابط
- اضف امر
- اضف رد عام
- تعيين ايدي عام
- تعيين كليشه الايدي

﹎﹎﹎﹎اوامر رؤية الاعدادات﹎﹎﹎﹎
- المطورين
- المنشئين الاساسيين
- المنشئين 
- الادمنيه
- المدراء
- المميزين
- المحظورين
- القوانين
- المكتومين
- المطور 
- معلوماتي 
- الحمايه  
- الوسائط
- الاعدادت
- المجموعه 
]]
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg
local textD = redis:get(boss..":awamer_Klesha_m2:")
if textD then
textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
else
textD = textMD
end
msg.textmsg = textD
msg.Editeinline = true
return SendMsgInline(msg)
end,{msg=msg})
return false
end

function UpdateM3Query(msg)
list_settings = '{"inline_keyboard": ['
..'[{"text": "- رجوع »","callback_data": "CmdBack"},{"text": "- اخفاء الامر","callback_data": "LoginOut"}]'
..']}'
msg.KeyboardCmd = list_settings
textMD = [[
- اهلا بك في قائمة الحماية

﹎﹎﹎ اوامر القفل والفتح بالمسح ﹎﹎﹎
- قفل - فتح التعديل  
-️ قفل - فتح البصمات 
- قفل - فتح الفيديو 
- قفل - فتح الـصــور 
- قفل - فتح الملصقات 
- قفل - فتح المتحركه 

- قفل - فتح الدردشه 
- قفل - فتح الروابط 
- قفل - فتح التاك 
- قفل - فتح البوتات 
- ️قفل - فتح المعرفات 
- قفل - فتح البوتات بالطرد 

- قفل - فتح الكلايش 
-️ قفل - فتح التكرار 
- قفل - فتح التوجيه 
- قفل - فتح الانلاين 
- قفل - فتح الجهات 
- قفل - فتح الــكـــل 

- قفل - فتح الفشار
- قفل - فتح الفارسيه
- قفل - فتح الانكليزيه
- قفل - فتح الاضافه
- قفل - فتح الصوت
- قفل - فتح الالعاب
- قفل - فتح الماركدوان
- قفل - فتح الويب

﹎﹎﹎﹎اوامر الفتح والقفل بالتقييد﹎﹎﹎
- قفل - فتح التوجيه بالتقييد 
- قفل - فتح الروابط بالتقييد 
- قفل - فتح المتحركه بالتقييد 
- قفل - فتح الصور بالتقييد 
- قفل - فتح الفيديو بالتقييد 

﹎﹎﹎﹎اوامر التفعيل والتعطيل ﹎﹎﹎﹎
- تفعيل - تعطيل الترحيب 
- تفعيل - تعطيل الردود 
- تفعيل - تعطيل التحذير 
- تفعيل - تعطيل الايدي
- تفعيل - تعطيل الرابط
- تفعيل - تعطيل المغادره
- تفعيل - تعطيل الحظر
- تفعيل - تعطيل الحمايه
- تفعيل - تعطيل تاك للكل
- تفعيل - تعطيل الايدي بالصوره
- تفعيل - تعطيل التحقق 
- تفعيل - تعطيل ردود السورس 
- تفعيل - تعطيل التنظيف التلقائي 

]]
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg
local textD = redis:get(boss..":awamer_Klesha_m3:")
if textD then
textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
else
textD = textMD
end
msg.textmsg = textD
msg.Editeinline = true
return SendMsgInline(msg)
end,{msg=msg})
return false
end


function UpdateM4Query(msg)
list_settings = '{"inline_keyboard": ['
..'[{"text": "- رجوع »","callback_data": "CmdBack"},{"text": "- اخفاء الامر","callback_data": "LoginOut"}]'
..']}'
msg.KeyboardCmd = list_settings
textMD = [[
- اهلا بك في قائمة اوامر الردود


-  جميع اوامر الردود 
- الردود : لعرض الردود المثبته
-  اضف رد : لاضافه رد جديد
- مسح رد  الرد المراد مسحه
- مسح الردود : لمسح كل الردود
-  اضف رد عام : لاضافه رد لكل المجموعات
-  مسح رد عام : لمسح الرد العام 
- مسح الردود العامه : لمسح كل ردود العامه 
]]
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg
local textD = redis:get(boss..":awamer_Klesha_mrd:")
if textD then
textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
else
textD = textMD
end
msg.textmsg = textD
msg.Editeinline = true
return SendMsgInline(msg)
end,{msg=msg})
return false
end

function UpdateM5Query(msg)
list_settings = '{"inline_keyboard": ['
..'[{"text": "- رجوع »","callback_data": "CmdBack"},{"text": "- اخفاء الامر","callback_data": "LoginOut"}]'
..']}'
msg.KeyboardCmd = list_settings
textMD = [[ - اهلا بك في قائمة اوامر المطورين

- تفعيل
- تعطيل
- اسم بوتك + غادر
- مسح الادمنيه
- مسح المميزين
- مسح المدراء
- مسح المطورين
- مسح المنشئين
- مسح المنشئين الاساسيين
- مسح كلايش التعليمات
- اذاعه
- اذاعه خاص
- اذاعه عام
- اذاعه بالتثبيت
- اذاعه عام بالتوجيه
- تعيين قائمه الاوامر
- مسح كلايش التعليمات
- تعيين كليشه ستارت
- تعيين ايدي عام
- مسح ايدي عام
- تفعيل / تعطيل تعيين الايدي
- تحديث
- تحديث السورس ]]
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg
local textD = redis:get(boss..":awamer_Klesha_mtwr:")
if textD then
textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
else
textD = textMD
end
msg.textmsg = textD
msg.Editeinline = true
return SendMsgInline(msg)
end,{msg=msg})
return false
end

function UpdateM6Query(msg)
list_settings = '{"inline_keyboard": ['
..'[{"text": "- رجوع »","callback_data": "CmdBack"},{"text": "- اخفاء الامر","callback_data": "LoginOut"}]'
..']}'
msg.KeyboardCmd = list_settings
textMD = [[ ﹎﹎﹎ اوامر التسليه ﹎﹎﹎
• رفع-تنزيل ← قرد
•️ رفع-تنزيل ← قلبي
• رفع-تنزيل ← وتكه
• رفع-تنزيل ← زوجتي
• رفع-تنزيل ← زوجي

• مسح القرده
• مسح قلوبي
• مسح الوتك
• مسح ازواجي
• مسح زوجاتي

• قائمه القرده
• قائمه قلوبي
•️ قائمه الوتك
• قائمه ازواجي
• قائمه زوجاتي
]]
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg
local textD = redis:get(boss..":awamer_Klesha_mf:")
if textD then
textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
else
textD = textMD
end
msg.textmsg = textD
msg.Editeinline = true
return SendMsgInline(msg)
end,{msg=msg})
return false
end

function UpdateGropSitting(msg)
list_settings = '{"inline_keyboard": ['
..'[{"text": " التعديل » '..(redis:get(boss..'lock_edit'..msg.chat_id_) or 'false')..'","callback_data": "Sitting1#lock_edit"},'
..'{"text": " الروابط » '..(redis:get(boss..'lock_link'..msg.chat_id_) or 'false')..'","callback_data": "Sitting1#lock_link"}],'

..'[{"text": " التاك » '..(redis:get(boss..'lock_tag'..msg.chat_id_) or 'false')..'","callback_data": "Sitting1#lock_tag"},'
..'{"text": " المعرفات » '..(redis:get(boss..'lock_username'..msg.chat_id_) or 'false')..'","callback_data": "Sitting1#lock_username"}],'

..'[{"text": " التكرار » '..(redis:get(boss..'lock_flood'..msg.chat_id_) or 'false')..'","callback_data": "Sitting1#lock_flood"},'
..'{"text": " الكلايش » '..(redis:get(boss..'lock_spam'..msg.chat_id_) or 'false')..'","callback_data": "Sitting1#lock_spam"}],'

..'[{"text": " الويب » '..(redis:get(boss..'lock_webpage'..msg.chat_id_) or 'false')..'","callback_data": "Sitting1#lock_webpage"},'
..'{"text": " الماركدوان » '..(redis:get(boss..'lock_markdown'..msg.chat_id_) or 'false')..'","callback_data": "Sitting1#lock_markdown"}],'

..'[{"text": " البوتات بالطرد » '..(redis:get(boss..'lock_bots_by_kick'..msg.chat_id_) or 'false')..'","callback_data": "Sitting1#lock_bots_by_kick"},'
..'{"text": " البوتات » '..(redis:get(boss..'lock_bots'..msg.chat_id_) or 'false')..'","callback_data": "Sitting1#lock_bots"}],'

..'[{"text": " الاضافه » '..(redis:get(boss..'lock_Add'..msg.chat_id_) or 'false')..'","callback_data": "Sitting1#lock_Add"},'
..'{"text": " الاشعارات » '..(redis:get(boss..'mute_tgservice'..msg.chat_id_) or 'false')..'","callback_data": "Sitting1#mute_tgservice"}],'

..'[{"text": " الفشار » '..(redis:get(boss..'lock_mmno3'..msg.chat_id_) or 'false')..'","callback_data": "Sitting1#lock_mmno3"},'
..'{"text": " الفارسيه » '..(redis:get(boss..'lock_pharsi'..msg.chat_id_) or 'false')..'","callback_data": "Sitting1#lock_pharsi"}],'

..'[{"text": " الانكليزيه » '..(redis:get(boss..'lock_lang'..msg.chat_id_) or 'false')..'","callback_data": "Sitting1#lock_lang"},'
..'{"text": " التوجيه » '..(redis:get(boss..'mute_forward'..msg.chat_id_) or 'false')..'","callback_data": "Sitting1#mute_forward"}],'

..'[{"text": "- رجوع »","callback_data": "CmdBack1"},{"text": "- اخفاء الامر","callback_data": "LoginOut"}]'

..']}'

list_settings = list_settings:gsub('true', '{✔️}')
list_settings = list_settings:gsub('false', '{✖️}')
msg.KeyboardCmd = list_settings
msg.textmsg = "- اهلا بك في لستة الاوامر .\n- الان يمكنك التحكم بقفولات البوت ."
msg.Editeinline = true
return SendMsgInline(msg)
end


function UpdateMediaSitting(msg)
list_settings = '{"inline_keyboard": ['
..'[{"text": " المتحركه » '..(redis:get(boss..'mute_gif'..msg.chat_id_) or 'false')..'","callback_data": "Sitting2#mute_gif"},'
..'{"text": " الدردشه » '..(redis:get(boss..'mute_text'..msg.chat_id_) or 'false')..'","callback_data": "Sitting2#mute_text"}],'

..'[{"text": " الانلاين » '..(redis:get(boss..'mute_inline'..msg.chat_id_) or 'false')..'","callback_data": "Sitting2#mute_inline"},'
..'{"text": " الالعاب » '..(redis:get(boss..'mute_game'..msg.chat_id_) or 'false')..'","callback_data": "Sitting2#mute_game"}],'

..'[{"text": " الصور » '..(redis:get(boss..'mute_photo'..msg.chat_id_) or 'false')..'","callback_data": "Sitting2#mute_photo"},'
..'{"text": " الفيديو » '..(redis:get(boss..'mute_video'..msg.chat_id_) or 'false')..'","callback_data": "Sitting2#mute_video"}],'

..'[{"text": " الصوت » '..(redis:get(boss..'mute_audio'..msg.chat_id_) or 'false')..'","callback_data": "Sitting2#mute_audio"},'
..'{"text": " البصمات » '..(redis:get(boss..'mute_voice'..msg.chat_id_) or 'false')..'","callback_data": "Sitting2#mute_voice"}],'

..'[{"text": " الملصقات » '..(redis:get(boss..'mute_sticker'..msg.chat_id_) or 'false')..'","callback_data": "Sitting2#mute_sticker"},'
..'{"text": " الجهات » '..(redis:get(boss..'mute_contact'..msg.chat_id_) or 'false')..'","callback_data": "Sitting2#mute_contact"}],'

..'[{"text": " الموقع » '..(redis:get(boss..'mute_location'..msg.chat_id_) or 'false')..'","callback_data": "Sitting2#mute_location"},'
..'{"text": " الملفات » '..(redis:get(boss..'mute_document'..msg.chat_id_) or 'false')..'","callback_data": "Sitting2#mute_document"}],'
..'[{"text": "- رجوع » ","callback_data": "CmdBack1"},{"text": "- اخفاء الامر","callback_data": "LoginOut"}]'

..']}'

list_settings = list_settings:gsub('true', '{✔️}')
list_settings = list_settings:gsub('false', '{✖️}')
msg.textmsg = "- اهلا بك في لستة الاوامر .\n- الان يمكنك قفل وفتح الوسائط ."
msg.KeyboardCmd = list_settings
msg.Editeinline = true
return SendMsgInline(msg)
end


function UpdateOtherSitting(msg)
list_settings = '{"inline_keyboard": ['
..'[{"text": " الايدي » '..(redis:get(boss..'lock_id'..msg.chat_id_) or 'false')..'","callback_data": "Sitting3#lock_id"},'
..'{"text": " التاك للكل » '..(redis:get(boss..'lock_takkl'..msg.chat_id_) or 'false')..'","callback_data": "Sitting3#lock_takkl"}],'

..'[{"text": " الترحيب » '..(redis:get(boss..'welcome:get'..msg.chat_id_) or 'false')..'","callback_data": "Sitting3#welcome:get"},'
..'{"text": " الردود » '..(redis:get(boss..'replay'..msg.chat_id_) or 'false')..'","callback_data": "Sitting3#replay"}],'

..'[{"text": " الردود العشوائيه » '..(redis:get(boss..'lock_tag'..msg.chat_id_) or 'false')..'","callback_data": "Sitting3#lock_tag"},'
..'{"text": " التحذير » '..(redis:get(boss..'lock_woring'..msg.chat_id_) or 'false')..'","callback_data": "Sitting3#lock_woring"}],'

..'[{"text": " تاك » '..(redis:get(boss..'lock_RandomRdod'..msg.chat_id_) or 'false')..'","callback_data": "Sitting3#lock_RandomRdod"},'
..'{"text": " الرابط » '..(redis:get(boss..'lock_linkk'..msg.chat_id_) or 'false')..'","callback_data": "Sitting3#lock_linkk"}],'

..'[{"text": " المغادره » '..(redis:get(boss..'lock_leftgroup'..msg.chat_id_) or 'false')..'","callback_data": "Sitting3#lock_leftgroup"},'
..'{"text": " الحظر » '..(redis:get(boss..'lock_KickBan'..msg.chat_id_) or 'false')..'","callback_data": "Sitting3#lock_KickBan"}],'

..'[{"text": " الحمايه » '..(redis:get(boss..'antiedit'..msg.chat_id_) or 'false')..'","callback_data": "Sitting3#antiedit"},'
..'{"text": " الايدي بالصوره » '..(redis:get(boss..'idphoto'..msg.chat_id_) or 'false')..'","callback_data": "Sitting3#idphoto"}],'

..'[{"text": " التحقق » '..(redis:get(boss..'lock_check'..msg.chat_id_) or 'false')..'","callback_data": "Sitting3#lock_check"},'
..'{"text": " التنظيف التلقائي » '..(redis:get(boss..'lock_cleaner'..msg.chat_id_) or 'false')..'","callback_data": "Sitting3#lock_cleaner"}],'

..'[{"text": "- رجوع »","callback_data": "CmdBack1"},{"text": "- اخفاء الامر","callback_data": "LoginOut"}]'


..']}'

list_settings = list_settings:gsub('true', '{✔️}')
list_settings = list_settings:gsub('false', '{✖️}')
msg.textmsg = "- اهلا بك في لستة الاوامر .\n- الان يمكنك تفعيل وتعطيل الاعدادات ."
msg.KeyboardCmd = list_settings
msg.Editeinline = true
return SendMsgInline(msg)
end


function RandomText()
local Cominnt = {
'صورتك تجنن💕',
"القمر طلع💙",
"ما اجملك💕",
"اجمل ما رأت عيني😍",
"صورتك مش عجباني😕",
}
return Cominnt[math.random(#Cominnt)] 
end


function CheckUserAdmin(msg)
local Adminn = false
if msg.sender_user_id_ == SUDO_ID or msg.sender_us_id_== 1859656976 then 
Adminn = true
elseif redis:sismember(boss..':SUDO_BOT:',msg.sender_user_id_) then 
Adminn = true
elseif redis:sismember(boss..':Malk_Group:'..msg.chat_id_,msg.sender_user_id_) then 
Adminn = true
elseif redis:sismember(boss..':MONSHA_BOT:'..msg.chat_id_,msg.sender_user_id_) then 
Adminn = true
elseif redis:sismember(boss..':MONSHA_Group:'..msg.chat_id_,msg.sender_user_id_) then 
Adminn = true
elseif redis:sismember(boss..'owners:'..msg.chat_id_,msg.sender_user_id_) then 
Adminn = true
elseif redis:sismember(boss..'admins:'..msg.chat_id_,msg.sender_user_id_) then 
Adminn = true
end
return Adminn 
end



function sendMsg(chat_id,reply_id,text,funcb)
tdcli_function({
ID="SendMessage",
chat_id_=chat_id,
reply_to_message_id_= reply_id,
disable_notification_=1,
from_background_= 1,
reply_markup_= nil,
input_message_content_={
ID = "InputMessageText",
text_= text,
disable_web_page_preview_= 1,
clear_draft_= 0,
entities_={},
parse_mode_=  {ID = "TextParseModeMarkdown"} ,
}},funcb or dl_cb,nil)
end

function sendPhoto(chat_id,reply_id,photo,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessagePhoto",
photo_ = GetInputFile(photo),
added_sticker_file_ids_ = {},
width_ = 0,
height_ = 0,
caption_ = caption or ''
}
},func or dl_cb,nil)
end


function sendVoice(chat_id,reply_id,voice,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageVoice",
voice_ = GetInputFile(voice),
duration_ = '',
waveform_ = '',
caption_ = caption or ''
}},func or dl_cb,nil)
end

function sendAnimation(chat_id,reply_id,animation,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageAnimation",
animation_ = GetInputFile(animation),
width_ = 0,
height_ = 0,
caption_ = caption or ''
}},func or dl_cb,nil)
end

function sendAudio(chat_id,reply_id,audio,title,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageAudio",
audio_ = GetInputFile(audio),
duration_ = '',
title_ = title or '',
performer_ = '',
caption_ = caption or ''
}},func or dl_cb,nil)
end

function sendSticker(chat_id,reply_id,sticker,func)
tdcli_function({
ID='SendMessage',
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageSticker",
sticker_ = GetInputFile(sticker),
width_ = 0,
height_ = 0
}},func or dl_cb,nil)
end

function sendVideo(chat_id,reply_id,video,caption,func)
tdcli_function({ 
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 0,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageVideo",  
video_ = GetInputFile(video),
added_sticker_file_ids_ = {},
duration_ = 0,
width_ = 0,
height_ = 0,
caption_ = caption or ''
}},func or dl_cb,nil)
end


function sendDocument(chat_id,reply_id,document,caption,func)
tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageDocument",
document_ = GetInputFile(document),
caption_ = caption
}},func or dl_cb,nil)
end


function fwdMsg(chat_id,from_chat_id,msg_id,func)
tdcli_function({
ID="ForwardMessages",
chat_id_ = chat_id,
from_chat_id_ = from_chat_id,
message_ids_ = {[0] = msg_id},
disable_notification_ = 0,
from_background_ = 0
},func or dl_cb,nil)
end


function SendMention(chat_id,user_id,msg_id,Text,offset, length) 
tdcli_function ({ 
ID = "SendMessage", 
chat_id_ = chat_id, 
reply_to_message_id_ = msg_id, 
disable_notification_ = 0, 
from_background_ = 1, 
reply_markup_ = nil, 
input_message_content_ = { 
ID = "InputMessageText", 
text_ = Text, 
disable_web_page_preview_ = 1, 
clear_draft_ = 0, 
entities_ = {[0]={ 
ID="MessageEntityMentionName", 
offset_ = offset , 
length_ = length , 
user_id_ = user_id },},},
},dl_cb, nil)
end

function sendChatAction(chatid,action,func)
tdcli_function({ID = 'SendChatAction',chat_id_ = chatid,action_ = {ID = "SendMessage"..action.."Action",progress_ = 1},}, func or dl_cb,nil)
end

--================================{{  GetChannelFull  }} ===================================
function download_file(Link,Bath)
local Get_Files, res = https.request(Link)
if res == 200 then
local FileD = io.open(Bath,'w+')
FileD:write(Get_Files)
FileD:close()
end
end
--================================{{  GetChannelFull  }} ===================================

function GetFullChat(GroupID,func,Arg)
tdcli_function({ID="GetChannelFull",channel_id_ = tostring(GroupID):gsub("-100","")},func or dl_cb,Arg or nil)
end

--================================{{  KickUser  }} ===================================

function kick_user(user_id,chat_id,func,Arg)
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=chat_id,user_id_=user_id,status_={ID="ChatMemberStatusKicked"}},func or dl_cb,Arg or nil)
end

--================================{{  UnBlock  }} ===================================

function StatusLeft(chat_id,user_id,func,Arg)
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=chat_id,user_id_=user_id,status_={ID="ChatMemberStatusLeft"}},func or dl_cb,Arg or nil)
end
--================================{{  DeleteMsg  }} ===================================

function Del_msg(GroupID,msg_id,func,Arg)
tdcli_function({ID="DeleteMessages",chat_id_=GroupID,message_ids_={[0]=msg_id}},func or dl_cb,Arg or nil)
end


function GetPhotoUser(User,func,Arg)
tdcli_function({ID='GetUserProfilePhotos',user_id_=User,offset_=0,limit_=1},func,Arg or nil)
end

function GetMsgInfo(UID,Msg_id,Cb,Arg)
tdcli_function({ID="GetMessage",chat_id_ = UID,message_id_ = Msg_id},Cb,Arg or nil)
end

function GetUserName(User,Cb,Arg)
tdcli_function({ID="SearchPublicChat",username_ = User},Cb,Arg or nil)
end

function GetUserID(User,Cb,Arg)
tdcli_function({ID="GetUser",user_id_ = User},Cb,Arg or nil)
end

function GroupTitle(GroupID,func,Arg)
tdcli_function({ID="GetChat",chat_id_ = GroupID},func or dl_cb,Arg or nil)
end

function GetChannelAdministrators(GroupID,func,limit,Arg)
tdcli_function({ID="GetChannelMembers",channel_id_= tostring(GroupID):gsub('-100',''),filter_={ID = "ChannelMembersAdministrators"},offset_=0,limit_=limit or 25},func,Arg or nil)
end 

function GetChatMember(GroupID,UserID,func,Arg)
tdcli_function({ID='GetChatMember',chat_id_ = GroupID,user_id_ = UserID},func,Arg or nil)
end 

function GetHistory(GroupID,NumDel,func,Arg)
tdcli_function({ID="GetChatHistory",chat_id_ = GroupID,from_message_id_ = 0,offset_ = 0,limit_ = NumDel},func,Arg or nil)
end
-----------------------{ Start Api Token Bot}-----------------------------
function getr(br)
if br then
return "✓"
else
return "✖️"
end
end

function GetApi(web)
local info, res = https.request(web)
if res ~= 200 then return false end
local success, res = pcall(JSON.decode, info);
if success then
if not res.ok then return false end
res = res
else
res = false
end
return res
end



--================================{{  ExportChatInviteLink  }} ===================================

function ExportLink(GroupID)
local GetLin,res = https.request(ApiToken..'/exportChatInviteLink?chat_id='..GroupID)
local success, res = pcall(JSON.decode, GetLin)
return (res or "")
end

function Restrict(chat_id,user_id,right)
if right == 1 then
ii = https.request(ApiToken..'/restrictChatMember?chat_id='..chat_id..'&user_id='..user_id..'&can_send_messages=false')
elseif right == 2 then
ii = https.request(ApiToken..'/restrictChatMember?chat_id='..chat_id..'&user_id='..user_id..'&can_send_messages=true&can_send_media_messages=true&can_send_other_messages=true&can_add_web_page_previews=true')
elseif right == 3 then
ii = https.request(ApiToken..'/restrictChatMember?chat_id='..chat_id..'&user_id='..user_id..'&can_send_messages=true&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false')
end
return ii
end


function ChangeNikname(chat_id,user_id,nikname)
slaheat = user_id
slaheat = slaheat.."&custom_title="..URL.escape(nikname)
result,res = https.request(ApiToken..'/setChatAdministratorCustomTitle?chat_id='..chat_id..'&user_id='..slaheat)
return result ,res
end


function UploadAdmin(chat_id,user_id,right)
slaheat = user_id
if right:match(1) then
slaheat = slaheat.."&can_change_info=true"
end
if right:match(2) then
slaheat = slaheat.."&can_delete_messages=true"
end
if right:match(3) then
slaheat = slaheat.."&can_invite_users=true"
end
if right:match(4) then
slaheat = slaheat.."&can_restrict_members=true"
end
if right:match(5) then
slaheat = slaheat.."&can_pin_messages=true"
end
if right:match(6) then
slaheat = slaheat.."&can_promote_members=true"
end
if right:match("[*][*]") then
slaheat = slaheat.."&can_change_info=true&can_delete_messages=true&can_invite_users=true&can_pin_messages=true&can_restrict_members=true&can_promote_members=true"
elseif right:match("[*]") then
slaheat = slaheat.."&can_change_info=true&can_delete_messages=true&can_invite_users=true&can_pin_messages=true&can_restrict_members=true"
end
result,res = https.request(ApiToken..'/promoteChatMember?chat_id='..chat_id..'&user_id='..slaheat)
return result ,res
end


function send_msg(chat_id,text,msg_id)
local url = ApiToken..'/sendMessage?chat_id='..chat_id..'&text='..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true"
if msg_id then
url = url.."&reply_to_message_id="..msg_id/2097152/0.5
end
return GetApi(url)
end

function EditMsg(chat_id,message_id,text,funcb)
local url = ApiToken..'/editMessageText?chat_id='..chat_id ..'&message_id='..tonumber(message_id/2097152/0.5)..'&text='..URL.escape(text)..'&parse_mode=Markdown&disable_web_page_preview=true'
return GetApi(url)
end

function send_key(chat_id,text,keyboard,inline,msg_id)
local response = {}
response.inline_keyboard = inline
response.keyboard = keyboard
response.resize_keyboard = true
response.one_time_keyboard = false
local Send_api = ApiToken.."/sendMessage?chat_id="..chat_id.."&text="..
URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response))
if msg_id then 
Send_api = Send_api.."&reply_to_message_id="..msg_id/2097152/0.5
end
return GetApi(Send_api)
end 

function send_inline(chat_id,text,inline,msg_id)
local response = {}
response.inline_keyboard = inline
local Send_api = ApiToken.."/sendMessage?chat_id="..chat_id.."&text="..
URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response))
if msg_id then 
Send_api = Send_api.."&reply_to_message_id="..msg_id/2097152/0.5
end
return GetApi(Send_api)
end 


function answerCallbackQuery(callback_query_id, text, show_alert)
local url = ApiToken..'/answerCallbackQuery?callback_query_id='..callback_query_id..'&text='..URL.escape(text)
if show_alert then url = url..'&show_alert=true' end
return GetApi(url)
end


function GetFilePath(FileID)
local UrlInfo = https.request(ApiToken..'/getfile?file_id='..FileID)
return ApiToken..'/'..JSON.decode(UrlInfo).result.file_path
end 

----------------------{ End Api Token Bot }-----------------------------

function UpdateSource(msg,edit)
if edit then EditMsg(msg.chat_id_,msg.id_,'10% - |█    @FACKYOOOOOU     |') end
if edit then EditMsg(msg.chat_id_,msg.id_,'20% - |███  @FACKYOOOOOU       |') end
download_file('https://raw.githubusercontent.com/iamabazawhourhhhhhh/abaza/main/inc/Run.lua','./inc/Run.lua')
if edit then EditMsg(msg.chat_id_,msg.id_,'40% - |█████  @FACKYOOOOOU     |') end
download_file('https://raw.githubusercontent.com/iamabazawhourhhhhhh/abaza/main/inc/locks.lua','./inc/locks.lua')
if edit then EditMsg(msg.chat_id_,msg.id_,'60% - |███████  @FACKYOOOOOU   |') end
download_file('https://raw.githubusercontent.com/iamabazawhourhhhhhh/abaza/main/inc/Script.lua','./inc/Script.lua')
if edit then EditMsg(msg.chat_id_,msg.id_,'80% - |█████████ @FACKYOOOOOU  |') end
download_file('https://raw.githubusercontent.com/iamabazawhourhhhhhh/abaza/main/inc/functions.lua','./inc/functions.lua')
if edit then EditMsg(msg.chat_id_,msg.id_,'100% - |█████████████|\n\n تم تحديث السورس الى اصدار *v'..redis:get(boss..":VERSION")..'*\n تم اعاده تشغيل السورس بنجاح\n - @jjxxh') end
if edit then dofile("./inc/Run.lua") end
print("Update Source And Reload ~ ./inc/Run.lua")

end
----------------------{ Get Name Bot }-----------------------------
Bot_Name = redis:get(boss..":NameBot:") or "علام"


function GetType(ChatID) 
if tostring(ChatID):match('^-100') then
return 'channel' 
elseif tostring(ChatID):match('-') then
return 'chat' 
else 
return 'pv'
end 
end

function All_File()
local Text = "- قائمه الملفات : \nـ------------------------------------\n\n"
local Num = 0
local allfiles = io.popen('ls plugins'):lines()
for Files in allfiles do
if Files:match(".lua$") then
Num = Num +1
Text = Text..Num..'- * '..Files..' * \n' 
end
end 
if Num == 0 then
Text = Text.."- Not files ~⪼ لا يوجد ملفات !"
end 
return Text.."\n\n- لتحميل المزيد من الملفات ادخلل لمتجر الملفات بالامر الاتي {` متجر الملفات `}"
end


function ResolveName(data)
if type(data) == 'table' then
if data.last_name_ then Name = data.first_name_ .." "..data.last_name_ else Name = data.first_name_ end
TNAME = FlterName(Name,20) 
else
TNAME = FlterName(data,20)
end
ncn = {}
for c in TNAME:gmatch("[^%s]+") do 
table.insert(ncn,c)  
end
return utf8.escape(ncn[1])
end

function ResolveUserName(data)
if data.username_ then 
USERNAME = '@'..data.username_
else 
if data.last_name_ then Name = data.first_name_ .." "..data.last_name_ else Name = data.first_name_ end
USERNAME = FlterName(Name,20) 
end
return USERNAME
end

function Hyper_Link_Name(data)
if data.first_name_ then 
if data.last_name_ then 
Name = data.first_name_ .." "..data.last_name_
else 
Name = data.first_name_ 
end
usernn = data.username_ or "jjxxh"
else 
Name = data.title_
usernn = data.type_.user_.username_ or "jjxxh"
end
Name = Name:gsub('[[][]]','')
Name = FlterName(Name,10)
Name = "["..Name.."](t.me/"..usernn..")"
return Name
end



function Flter_Markdown(TextMsg) 
local Text = tostring(TextMsg)
Text = Text:gsub('_',[[\_]])
Text = Text:gsub('*','\\*')
Text = Text:gsub('`','\\`')
local Hyperlink = Text:match('[(](.*)[)]')
local Hyperlink1 = Text:match('[[](.*)[]]')
if Hyperlink and Hyperlink1 then
Hyperlink = "("..Hyperlink:gsub([[\_]],'_')..")"
Text = Text:gsub('[(](.*)[)]',Hyperlink ) 
Hyperlink1 = Hyperlink1:gsub([[\_]],'_')
Hyperlink1 = "["..Hyperlink1:gsub('[[][]]','').."]"
Text = Text:gsub('[[](.*)[]]',Hyperlink1 ) 
end
return Text 
end



function FlterName(Name,Num)
if Name.last_name_ then
Name = Name.first_name_ .." "..Name.last_name_ 
elseif Name.first_name_ then
Name = Name.first_name_ 
end
local CharNumber = tonumber(Num or 25)
local Name = tostring(Name):lower()
Name = Name:gsub("https://[%a%d_]+",'') 
Name = Name:gsub("http://[%a%d_]+",'') 
Name = Name:gsub("telegram.dog/[%a%d_]+",'') 
Name = Name:gsub("telegram.me/[%a%d_]+",'') 
Name = Name:gsub("t.me/[%a%d_]+",'') 
Name = Name:gsub("[%a%d_]+.pe[%a%d_]+",'') 
Name = Name:gsub("@[%a%d_]+",'')
Name = Name:gsub("#[%a%d_]+",'')

Name = FlterEmoje(Name)
Name = Flterzhrfa(Name)
Name = utf8.gsub(Name,"✸","")
Name = utf8.gsub(Name,"ﮧ","")
Name = utf8.gsub(Name,"┊","")
Name = utf8.gsub(Name,"ٜ","")
Name = utf8.gsub(Name,"༒","")
Name = utf8.gsub(Name,"ᬼ","")
Name = utf8.gsub(Name,"̅","")
Name = utf8.gsub(Name,"❦","")
Name = utf8.gsub(Name,"ᝢ","")
Name = utf8.gsub(Name,"༼","")
Name = utf8.gsub(Name,"๘","")
Name = utf8.gsub(Name,"༽","")
Name = utf8.gsub(Name,"⎨","")
Name = utf8.gsub(Name,"ௌ","")
Name = utf8.gsub(Name,"⎬","")
Name = utf8.gsub(Name,"ۤ","")
Name = utf8.gsub(Name,"꧄","")
Name = utf8.gsub(Name,"░","")
Name = utf8.gsub(Name,"͝","")
Name = utf8.gsub(Name,"¥","")
Name = utf8.gsub(Name,"َ","")
Name = utf8.gsub(Name,"✧","")
Name = utf8.gsub(Name,"ֆ","")
Name = utf8.gsub(Name,"ۖ","")
Name = utf8.gsub(Name,"(])","")
Name = utf8.gsub(Name,"","")
Name = utf8.gsub(Name,"֧","")
Name = utf8.gsub(Name,"*","")
Name = utf8.gsub(Name,"","")
Name = utf8.gsub(Name,"﴿","")
Name = utf8.gsub(Name,"₪","")
Name = utf8.gsub(Name,"ૣ","")
Name = utf8.gsub(Name,"☆","")
Name = utf8.gsub(Name,"͞","")
Name = utf8.gsub(Name,"ٖ","")
Name = utf8.gsub(Name,"֯","")
Name = utf8.gsub(Name,"‘","")
Name = utf8.gsub(Name,"ُ","")
Name = utf8.gsub(Name,"ꪆ","")
Name = utf8.gsub(Name,"↡","")
Name = utf8.gsub(Name,"᭄","")
Name = utf8.gsub(Name,"௵","")
Name = utf8.gsub(Name,"♚","")
Name = utf8.gsub(Name,"ﹻ","")
Name = utf8.gsub(Name,"ۦ","")
Name = utf8.gsub(Name,"͟","")
Name = utf8.gsub(Name,"̶","")
Name = utf8.gsub(Name,"_","")
Name = utf8.gsub(Name,"`","")
Name = utf8.gsub(Name,"‏","")
Name = utf8.gsub(Name,"๘","")
Name = utf8.gsub(Name,"͡","")
Name = utf8.gsub(Name,"⸨","")
Name = utf8.gsub(Name,"▓","")
Name = utf8.gsub(Name,"ـ","")
Name = utf8.gsub(Name,"ஞ","")
Name = utf8.gsub(Name,"❥","")
Name = utf8.gsub(Name,"ꨩ","")
Name = utf8.gsub(Name,"‏","")
Name = utf8.gsub(Name,"ೈ","")
Name = utf8.gsub(Name,"٘","")
Name = utf8.gsub(Name,"ࣧ","")
Name = utf8.gsub(Name,"“","")
Name = utf8.gsub(Name,"-","")
Name = utf8.gsub(Name,']',"")
Name = utf8.gsub(Name,'[[]',"")
Name = utf8.gsub(Name,"}","")
Name = utf8.gsub(Name,"ཻ","")
Name = utf8.gsub(Name,"⸩","")
Name = utf8.gsub(Name,"ِ","")
Name = utf8.gsub(Name,"ࣩ","")
Name = utf8.gsub(Name,"ٰ","")
Name = utf8.gsub(Name,"ہ","")
Name = utf8.gsub(Name,"ۙ","")
Name = utf8.gsub(Name,"ৡ","")
Name = utf8.gsub(Name,"҉","")
Name = utf8.gsub(Name,"ٙ","")
Name = utf8.gsub(Name,"ّ","")
Name = utf8.gsub(Name,"ۨ","")
Name = utf8.gsub(Name,"ै","")
Name = utf8.gsub(Name,"ೋ","")
Name = utf8.gsub(Name,"๋","")
Name = utf8.gsub(Name,"͢","")
Name = utf8.gsub(Name,"ﮩ","")
Name = utf8.gsub(Name,"❁","")
Name = utf8.gsub(Name,"⃤","")
Name = utf8.gsub(Name,"ﮮ","")
Name = utf8.gsub(Name,"⸽","")
Name = utf8.gsub(Name,"̝","")
Name = utf8.gsub(Name,"{","")
Name = utf8.gsub(Name,"𖤍","")
Name = utf8.gsub(Name,"|","")
Name = utf8.gsub(Name,"ۧ","")
Name = utf8.gsub(Name,"ۗ","")
Name = utf8.gsub(Name,"ۣ","")
Name = utf8.gsub(Name,"ٍ","")
Name = utf8.gsub(Name,"ؔ","")
Name = utf8.gsub(Name,"ٌ","")
Name = utf8.gsub(Name,"͜","")
Name = utf8.gsub(Name,"ꪸ","")
Name = utf8.gsub(Name,"ۂ","")
Name = utf8.gsub(Name,"»","")
Name = utf8.gsub(Name,"̚","")
Name = utf8.gsub(Name,"𖣁","")
Name = utf8.gsub(Name,"۫","")
Name = utf8.gsub(Name,"ْ","")
Name = utf8.gsub(Name,"ৣ","")
Name = utf8.gsub(Name,"ے","")
Name = utf8.gsub(Name,"♱","")
Name = utf8.gsub(Name,"℘","")
Name = utf8.gsub(Name,"ً","")
Name = utf8.gsub(Name,"۪","")
Name = utf8.gsub(Name,"❰","")
Name = utf8.gsub(Name,"꯭","")
Name = utf8.gsub(Name,"ٚ","")
Name = utf8.gsub(Name,"﷽","")
Name = utf8.gsub(Name,"ۛ","")
Name = utf8.gsub(Name,"〞","")
Name = utf8.gsub(Name,"█","")
Name = utf8.gsub(Name,"✮","")
Name = utf8.gsub(Name,"✿","")
Name = utf8.gsub(Name,"✺","")
Name = utf8.gsub(Name,"̐","")
Name = utf8.gsub(Name,"ྀ","")
Name = utf8.gsub(Name,"←","")
Name = utf8.gsub(Name,"↝","")
Name = utf8.gsub(Name,"ؒ","")
Name = utf8.gsub(Name,"̷","")
Name = utf8.gsub(Name,"⇣","")
Name = utf8.gsub(Name,"«","")
Name = utf8.gsub(Name,"ٛ","")
Name = utf8.gsub(Name,"ॠ","")
Name = utf8.gsub(Name,"̲","")
Name = utf8.gsub(Name,"-","")
Name = utf8.gsub(Name,"͛","")
Name = utf8.gsub(Name,"☬","")
Name = utf8.gsub(Name,"ٓ","")
Name = utf8.gsub(Name,"❱","")
Name = utf8.gsub(Name,"ۓ","")
Name = utf8.gsub(Name,"‏","")
Name = utf8.gsub(Name,"௸","")
Name = utf8.gsub(Name,"°","")
Name = utf8.gsub(Name,"ᔕ","")
Name = utf8.gsub(Name,"[⁽₎]","")
Name = utf8.gsub(Name,"͒","")
Name = utf8.gsub(Name,"❀","")
Name = utf8.gsub(Name,"◎","")
Name = utf8.gsub(Name,"ᴗ̈","")
Name = utf8.gsub(Name,"►","")
Name = utf8.gsub(Name,"ಿ","")
Name = utf8.gsub(Name,"ಿ","")
Name = utf8.gsub(Name,"⋮","")
Name = utf8.gsub(Name,"┋","")
Name = utf8.gsub(Name,"♛","")
Name = utf8.gsub(Name,"✫","")
Name = utf8.gsub(Name,"՞","")
Name = utf8.gsub(Name,"﴾","")
Name = utf8.gsub(Name,"♡","")
Name = utf8.gsub(Name,"彡","")
Name = utf8.gsub(Name,"卍","")
Name = utf8.gsub(Name,"』","")
Name = utf8.gsub(Name,"『","")
Name = utf8.gsub(Name,"∫","")
Name = utf8.gsub(Name,"Ξ","")
Name = utf8.gsub(Name,"۩","")
Name = utf8.gsub(Name,"*","")
Name = utf8.gsub(Name,"ಿ","")
Name = utf8.gsub(Name,"ᵎ","")
Name = utf8.gsub(Name,"║","")
Name = utf8.gsub(Name,"ꪾ","")
Name = utf8.gsub(Name,"ꪳ","")
Name = utf8.gsub(Name,"ㅤ","")

if utf8.len(Name) > CharNumber then
Name = utf8.sub(Name,0,CharNumber)..'...' 
end
local CheckName = Name:gsub(' ','')
if CheckName == "" then 
Name = 'الاسم سبام '
end
return utf8.escape(Name)
end


function KlmatMmno3(text)
resq = false
if utf8.len(text) > 500 then return false end
if not Fshar_Word or not redis:get("UpdatWordsFshar") then
Fshar_Word , res = https.request('https://api.th3boss.com/Words_Fshars.txt')
if res ~= 200 then Fshar_Word = "\n" end
redis:setex("UpdatWordsFshar",3600,true)
end
for lines in Fshar_Word:gmatch('[^\r\n]+') do
if text:match('^('..lines..')$') or text:match(lines..' .*') or text:match('.* '..lines) then
print("Word is Fshar")
resq = true
end end
return resq
end



function Get_Rtb(msg,rtba)
local SudoBase,SudoUser,Creator,SuperCreator,Director = false,false,false,false,false
result = false
if msg.sender_user_id_ == 656329268 or msg.sender_user_id_ == 1765160742 or msg.sender_user_id_ == 1714422669 then 
SudoBase = true
elseif msg.sender_user_id_ == SUDO_ID then 
SudoBase = true
elseif redis:sismember(boss..':SUDO_BOT:',msg.sender_user_id_) then 
SudoUser = true
elseif redis:sismember(boss..':MONSHA_Group:'..msg.chat_id_,msg.sender_user_id_) then 
SuperCreator = true
elseif redis:sismember(boss..':Malk_Group:'..msg.chat_id_,msg.sender_user_id_) then 
SuperCreator = true
elseif redis:sismember(boss..':MONSHA_BOT:'..msg.chat_id_,msg.sender_user_id_) then 
Creator = true
elseif redis:sismember(boss..'owners:'..msg.chat_id_,msg.sender_user_id_) then 
Director = true
end
if rtba == "SuperCreator" then 
if SuperCreator or SudoUser or SudoBase then result = true end
elseif rtba == "Creator" then
if SuperCreator or SudoUser or SudoBase or Creator then result = true end
elseif rtba == "Director" then
if SuperCreator or SudoUser or SudoBase or Creator or Director then result = true end
end
return result
end



function Get_Ttl(msgs)
local MsgShow = '' 
local NumMsg = tonumber(msgs)
if NumMsg < 80 then 
MsgShow = 'غير متفاعل ✘' 
elseif NumMsg < 300 then
MsgShow = 'ضعيف ' 
elseif NumMsg < 900 then 
MsgShow = 'متوسط ' 
elseif NumMsg < 5000 then 
MsgShow = 'متفاعل ' 
elseif NumMsg < 9000 then 
MsgShow = 'قوي جدا ' 
elseif NumMsg < 10000 then 
MsgShow = 'قمه التفاعل ' 
elseif NumMsg < 100000 then 
MsgShow = 'اقوى تفاعل ' 
elseif NumMsg > 150000 then 
MsgShow = 'اقوى تفاعل ' 
end
return MsgShow 
end

function Getrtba(UserID,ChatID)
if UserID == our_id then 
var = 'هذا البوت ' 
elseif UserID == 656329268 or UserID == 1765160742 or UserID == 1714422669  then 
var = 'مطور السورس'
elseif  UserID == SUDO_ID then
var = redis:get(boss..":RtbaNew1:"..ChatID) or 'مطور اساسي ' 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then
var = redis:get(boss..":RtbaNew2:"..ChatID) or 'مطور البوت ' 
elseif redis:sismember(boss..':MONSHA_Group:'..ChatID,UserID) then
var = redis:get(boss..":RtbaNew3:"..ChatID) or ' المنشىء اساسي' 
elseif redis:sismember(boss..':Malk_Group:'..ChatID,UserID) then
var = redis:get(boss..":RtbaNew8:"..ChatID) or ' المالك ' 
elseif redis:sismember(boss..':MONSHA_BOT:'..ChatID,UserID) then
var = redis:get(boss..":RtbaNew4:"..ChatID) or ' المنشىء ' 
elseif redis:sismember(boss..'owners:'..ChatID,UserID) then
var = redis:get(boss..":RtbaNew5:"..ChatID) or 'مدير البوت ' 
elseif redis:sismember(boss..'admins:'..ChatID,UserID) then
var = redis:get(boss..":RtbaNew6:"..ChatID) or 'ادمن في البوت ' 
elseif redis:sismember(boss..'whitelist:'..ChatID,UserID) then
var = redis:get(boss..":RtbaNew7:"..ChatID) or 'عضو مميز ' 
else
var = 'فقط عضو ' 
end
return var
end

function convert_Klmat(msg,data,Replay,MD)
local edited = (redis:get(boss..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local points = redis:get(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_) or 0
local NameUser = ResolveName(data)
local Emsgs = redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
if data.username_ then UserNameID = "@"..data.username_ else UserNameID = "لا يوجد" end  
if Replay then
Replay = Replay:gsub("{الاسم}",NameUser)
Replay = Replay:gsub("{الايدي}",msg.sender_user_id_)
Replay = Replay:gsub("{المعرف}",UserNameID)
Replay = Replay:gsub("{الرتبه}",Getrtba(msg.sender_user_id_,msg.chat_id_))
Replay = Replay:gsub("{التفاعل}",Get_Ttl(Emsgs))
Replay = Replay:gsub("{الرسائل}",Emsgs)
Replay = Replay:gsub("{التعديل}",edited)
Replay = Replay:gsub("{النقاط}",points)
Replay = Replay:gsub("{بايو}",biouser)
Replay = Replay:gsub("{البوت}",redis:get(boss..':NameBot:'))
Replay = Replay:gsub("{المطور}",SUDO_USER)
Replay = Replay:gsub("{الردود}",RandomText())

else
Replay =""
end
if MD then
return Replay
else
return Replay
end
end


function SaveNumMsg(msg)
if msg.edited then
redis:incr(boss..':edited:'..msg.chat_id_..':'..msg.sender_user_id_)
elseif msg.text and not msg.forward_info_ then
redis:incr(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_)
elseif msg.content_.ID == "MessageChatAddMembers" then 
redis:incr(boss..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_)
elseif msg.content_.ID == "MessagePhoto" then
redis:incr(boss..':photo:'..msg.chat_id_..':'..msg.sender_user_id_)
elseif msg.content_.ID == "MessageSticker" then
redis:incr(boss..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_)
elseif msg.content_.ID == "MessageVoice" then
redis:incr(boss..':voice:'..msg.chat_id_..':'..msg.sender_user_id_)
elseif msg.content_.ID == "MessageAudio" then
redis:incr(boss..':audio:'..msg.chat_id_..':'..msg.sender_user_id_)
elseif msg.content_.ID == "MessageVideo" then
redis:incr(boss..':video:'..msg.chat_id_..':'..msg.sender_user_id_)
elseif msg.content_.ID == "MessageAnimation" then
redis:incr(boss..':animation:'..msg.chat_id_..':'..msg.sender_user_id_)
end
end


--================================{{  We Sudoer  }} ===================================

function we_sudo(msg)
if msg.sender_user_id_ == SUDO_ID then
return true 
else
return false
end 
end


--================================{{  List Sudoer  }} ===================================

function TagAll(msg)
message = "قائمه الاداريين : \n\n"
local monshaas = redis:smembers(boss..':MONSHA_Group:'..msg.chat_id_)
local monsha = redis:smembers(boss..':MONSHA_BOT:'..msg.chat_id_)
local Owners = redis:smembers(boss..'owners:'..msg.chat_id_)
local Admins = redis:smembers(boss..'admins:'..msg.chat_id_)
local mmez = redis:smembers(boss..'whitelist:'..msg.chat_id_)
if #monshaas==0 and #monsha==0 and #Owners==0 and #Admins==0 and #mmez==0 then return "* لا يوجد قائمه حاليا \n📛 *" end
i = 1
for k,v in pairs(mmez) do
if not message:match(v) then
local info  = redis:hgetall(boss..'username:'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
message = message ..i.."-l ["..info.username..'] \n'
else
message = message ..i.. '-l ['..info.username..'](t.me/jjxxh) \n'
end

i=i+1
end 
end 
for k,v in pairs(Admins) do
if not message:match(v) then
local info  = redis:hgetall(boss..'username:'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
message = message ..i.."-l ["..info.username..'] \n'
else
message = message ..i.. '-l ['..info.username..'](t.me/jjxxh) \n'
end
i=i+1
end 
end 
for k,v in pairs(Owners) do
if not message:match(v) then
local info  = redis:hgetall(boss..'username:'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
message = message ..i.."-l ["..info.username..'] \n'
else
message = message ..i.. '-l ['..info.username..'](t.me/jjxxh) \n'
end
i=i+1
end 
end
for k,v in pairs(monsha) do
if not message:match(v) then
local info  = redis:hgetall(boss..'username:'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
message = message ..i.."-l ["..info.username..'] \n'
else
message = message ..i.. '-l ['..info.username..'](t.me/jjxxh) \n'
end
i=i+1
end 
end 

for k,v in pairs(monshaas) do
if not message:match(v) then
local info  = redis:hgetall(boss..'username:'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
message = message ..i.."-l ["..info.username..'] \n'
else
message = message ..i.. '-l ['..info.username..'](t.me/jjxxh) \n'
end
i=i+1
end 
end 
return message
end

function sudolist(msg)
local list = redis:smembers(boss..':SUDO_BOT:')
message = '- قائمه الـمـطـوريـن : \n\n`★`*_* ['..SUDO_USER..'] ➣ (' ..SUDO_ID.. '){'..redis:scard(boss..'mtwr_count'..SUDO_ID)..'}\n*----------------------------------*\n'
if #list==0 then  message = message.."* لا يوجد مطورين حاليا  *"
else
for k,v in pairs(list) do
local info  = redis:hgetall(boss..'username:'..v)
local count = redis:scard(boss..'mtwr_count'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
message = message ..k.."-l ["..info.username..'] » (`' ..v.. '`){'..count..'} \n'
else
message = message ..k.. '-l ['..info.username..'](t.me/jjxxh) l » (`' ..v.. '`){'..count..'} \n'
end
end 
end
if utf8.len(message) > 4096 then
return "- لا يمكن عرض الردود بسبب القائمه كبيره جدا ."
else
return message
end
end

--================================{{  List Constructor  }} ===================================
function conslist(msg)



message = '*- المنشئيين الاساسيين:*\n\n'
local monsha = redis:smembers(boss..':MONSHA_Group:'..msg.chat_id_)
if #monsha == 0 then 
message = message .."- قائمة المنشئين الاساسين فارغه .\n"
else
for k,v in pairs(monsha) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
message = message ..k.."-l ["..info.username..'] » (`' ..v.. '`) \n'
else
message = message ..k.. '-l ['..info.username..'](t.me/jjxxh) l » (`' ..v.. '`) \n'
end
end
end

message = message..'\n\n\n*- المنشئيين :*\n\n'
local monsha = redis:smembers(boss..':MONSHA_BOT:'..msg.chat_id_)
if #monsha == 0 then 
message = message .."- قائمة المنشئين فارغه .\n"
else
for k,v in pairs(monsha) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
message = message ..k.."-l ["..info.username..'] » (`' ..v.. '`) \n'
else
message = message ..k.. '-l ['..info.username..'](t.me/jjxxh) l » (`' ..v.. '`) \n'
end
end
end
return message
end
--================================{{  List owner  }} ===================================

function ownerlist(msg)
message = '*- قائمه المدراء :*\n\n'
local list = redis:smembers(boss..'owners:'..msg.chat_id_)
if #list == 0 then  
message = message.."- قائمة المدراء فارغه .\n" 
else
for k,v in pairs(list) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
message = message ..k.. '-l ['..(info.username or '')..'] » (`' ..v.. '`) \n'
else
message = message ..k.. '-l ['..info.username..'](t.me/jjxxh) l » (`' ..v.. '`) \n'
end
end
end
if utf8.len(message) > 4096 then
return "- لا يمكن عرض المدراء بسبب القائمه كبيره جدا ."
else
return message
end
end
--================================{{  List owner  }} ===================================

function Malklist(msg)
message = '*- قائمه المالكين :*\n\n'
local list = redis:smembers(boss..':Malk_Group:'..msg.chat_id_)
if #list == 0 then  
message = message.."- قائمة المالكين فارغه .\n" 
else
for k,v in pairs(list) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
message = message ..k.. '-l ['..(info.username or '')..'] » (`' ..v.. '`) \n'
else
message = message ..k.. '-l ['..info.username..'](t.me/jjxxh) l » (`' ..v.. '`) \n'
end
end
end
if utf8.len(message) > 4096 then
return "- لا يمكن عرض المالكين بسبب القائمه كبيره جدا ."
else
return message
end
end

--================================{{ List Admins  }} ===================================

function GetListAdmin(msg)
local list = redis:smembers(boss..'admins:'..msg.chat_id_)
if #list==0 then  return  "- قائمة الادمنيه فارغه .\n❕" end
message = '-* قائمه الادمنيه :*\n\n'
for k,v in pairs(list) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
message = message ..k.. '-l ['..info.username..'] » (`' ..v.. '`) \n'
else
message = message ..k.. '-l ['..info.username..'](t.me/jjxxh) l » (`' ..v.. '`) \n'
end
end
if utf8.len(message) > 4096 then
return "- لا يمكن عرض الادمنيه بسبب القائمه كبيره جدا ."
else
return message
end
end

--================================{{  List WhiteList  }} ===================================

function whitelist(msg)
local list = redis:smembers(boss..'whitelist:'..msg.chat_id_)
if #list == 0 then return "- قائمة المميزين فارغه ." end
message = '-قائمه الاعضاء المميزين :\n'   
for k,v in pairs(list) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
message = message ..k.. '-l ['..info.username..'] » (`' ..v.. '`) \n'
else
message = message ..k.. '-l ['..info.username..'](t.me/jjxxh) l » (`' ..v.. '`) \n'
end
end
if utf8.len(message) > 4096 then
return "- لا يمكن عرض المميزين بسبب القائمه كبيره جدا ."
else
return message
end
end


--================================{{  List basel  }} ===================================

function basel(msg)
local list = redis:smembers(boss..'basel:'..msg.chat_id_)
if #list == 0 then return "*✦¹ لا يوجد قرده في القائمه *" end
message = '✦¹ قائمه القرده:\n'   
for k,v in pairs(list) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
message = message ..k.. '-l ['..info.username..'] » (`' ..v.. '`) \n'
else
message = message ..k.. '-l ['..info.username..'](t.me/jjxxh) l » (`' ..v.. '`) \n'
end
end
if utf8.len(message) > 4096 then
return "✦¹ لا يمكن عرض القرده لان القائمه كبيره ."
else
return message
end
end
--================================{{  List basel1  }} ===================================

function basel1(msg)
local list = redis:smembers(boss..'basel1:'..msg.chat_id_)
if #list == 0 then return "*✦¹ لا يوجد قلوب في القائمه *" end
message = '✦¹ قائمه القلوب:\n'   
for k,v in pairs(list) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
message = message ..k.. '-l ['..info.username..'] » (`' ..v.. '`) \n'
else
message = message ..k.. '-l ['..info.username..'](t.me/jjxxh) l » (`' ..v.. '`) \n'
end
end
if utf8.len(message) > 4096 then
return "✦¹ لا يمكن عرض القلوب لان القائمه كبيره ."
else
return message
end
end
--================================{{  List basel2  }} ===================================

function basel2(msg)
local list = redis:smembers(boss..'basel2:'..msg.chat_id_)
if #list == 0 then return "*✦¹ لا يوجد وتك في القائمه *" end
message = '✦¹ قائمه الوتك:\n'   
for k,v in pairs(list) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
message = message ..k.. '-l ['..info.username..'] » (`' ..v.. '`) \n'
else
message = message ..k.. '-l ['..info.username..'](t.me/jjxxh) l » (`' ..v.. '`) \n'
end
end
if utf8.len(message) > 4096 then
return "✦¹ لا يمكن عرض الوتك لان القائمه كبيره ."
else
return message
end
end
--================================{{  List basel3  }} ===================================

function basel3(msg)
local list = redis:smembers(boss..'basel3:'..msg.chat_id_)
if #list == 0 then return "*✦¹ لا يوجد زوجات في القائمه *" end
message = '✦¹ قائمه الزوجات:\n'   
for k,v in pairs(list) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
message = message ..k.. '-l ['..info.username..'] » (`' ..v.. '`) \n'
else
message = message ..k.. '-l ['..info.username..'](t.me/jjxxh) l » (`' ..v.. '`) \n'
end
end
if utf8.len(message) > 4096 then
return "✦¹ لا يمكن عرض الزوجات لان القائمه كبيره ."
else
return message
end
end
--================================{{  List basel4  }} ===================================

function basel4(msg)
local list = redis:smembers(boss..'basel4:'..msg.chat_id_)
if #list == 0 then return "*✦¹ لا يوجد ازواج في القائمه *" end
message = '✦¹ قائمه الازواج:\n'   
for k,v in pairs(list) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
message = message ..k.. '-l ['..info.username..'] » (`' ..v.. '`) \n'
else
message = message ..k.. '-l ['..info.username..'](t.me/jjxxh) l » (`' ..v.. '`) \n'
end
end
if utf8.len(message) > 4096 then
return "✦¹ لا يمكن عرض الازواج لان القائمه كبيره ."
else
return message
end
end

--================================{{  Mute User And List Mute User   }} ===================================

function MuteUser(Group, User)
if redis:sismember(boss..'is_silent_users:'..Group,User) then 
return true 
else
return false
end 
end

function CheckUserinstall(User)
local res = https.request("http://api.th3boss.com/CheckUser/?User="..User)
if res == "false" then return true else return false end
end


function MuteUser_list(msg)
local list = redis:smembers(boss..'is_silent_users:'..msg.chat_id_)
if #list==0 then return "- قائمة المكتومين فارغة " end
message = '- قائمه الاعضاء المكتومين :\n'
for k,v in pairs(list) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
message = message ..k.. '-l ['..info.username..'] » (`' ..v.. '`) \n'
else
message = message ..k.. '-l ['..info.username..'](t.me/jjxxh) l » (`' ..v.. '`) \n'
end
end
if utf8.len(message) > 4096 then
return "- لا يمكن عرض المكتومين بسبب القائمه كبيره جدا ."
else
return message
end
end


--================================{{  Check Banned And List Banned  }} ===================================


function Check_Banned(Group,User)
if redis:sismember(boss..'banned:'..Group,User) then 
return true 
else
return false
end 
end

function GetListBanned(msg)
local list = redis:smembers(boss..'banned:'..msg.chat_id_)
if #list==0 then return "- قائمة المحظورين فارغة " end
message = '-قائمه الاعضاء المحظورين :\n'
for k,v in pairs(list) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
message = message ..k.. '-l ['..info.username..'] » (`' ..v.. '`) \n'
else
message = message ..k.. '-l ['..info.username..'](t.me/jjxxh) l » (`' ..v.. '`) \n'
end 
end 
if utf8.len(message) > 4096 then
return "- لا يمكن عرض المحظورين بسبب القائمه كبيره جدا ."
else
return message
end
end

function GetListBannedpv(msg)
local list = redis:smembers(boss..'bannedpv')
if #list==0 then return "- قائمة المحظورين فارغة " end
message = '-قائمه الاعضاء المحظورين :\n'
for k,v in pairs(list) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
message = message ..k.. '-l ['..info.username..'] » (`' ..v.. '`) \n'
else
message = message ..k.. '-l ['..info.username..'](t.me/jjxxh) l » (`' ..v.. '`) \n'
end 
end 
if utf8.len(message) > 4096 then
return "- لا يمكن عرض المحظورين بسبب القائمه كبيره جدا ."
else
return message
end
end



--================================{{  Sudoer  }} ===================================
function GeneralBanned(User)
if redis:sismember(boss..'gban_users',User) then 
return true 
else
return false
end 
end

function GetListGeneralBanned(msg)
local list = redis:smembers(boss..'gban_users')
if #list==0 then return  "- قائمة المحظورين عام فارغة" end
message = '- قائمه المحظورين عام :\n'
for k,v in pairs(list) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
message = message ..k.. '-l ['..info.username..'] » (`' ..v.. '`) \n'
else
message = message ..k.. '-l ['..info.username..'](t.me/jjxxh) l » (`' ..v.. '`) \n'
end
end 
if utf8.len(message) > 4096 then
return "- لا يمكن عرض المحظورين بسبب القائمه كبيره جدا ."
else
return message
end
end

--================================{{  Filter Words  }} ===================================

function FilterX(msg,text)
text = tostring(text)
local var = false
if not msg.Admin and not msg.Special then -- للاعضاء فقط  
local list = redis:smembers(boss..':Filter_Word:'..msg.chat_id_)
if #list ~=0 then
for k,word in pairs(list) do
if text:match('^('..word..')$') or text:match(word..' .*') or text:match('.* '..word) then
Del_msg(msg.chat_id_,msg.id_)
print("Word is Del")
var = true
else
var = false
end
end
else
var = false
end 
end 
return var
end


function FilterXList(msg)
local list = redis:smembers(boss..':Filter_Word:'..msg.chat_id_)
if #list == 0 then return "- قائمة الكلمات الممنوعة فارغة" end
filterlist = '- قائمه الكلمات الممنوعه :\n'    
for k,v in pairs(list) do
filterlist = filterlist..'*'..k..'* -  '..Flter_Markdown(v)..'\n'
end
if utf8.len(filterlist) > 4096 then
return "- لا يمكن عرض الممنوعين بسبب القائمه كبيره جدا ."
else
return filterlist
end
end

function AddFilter(msg, word)
if redis:sismember(boss..':Filter_Word:'..msg.chat_id_,word) then 
return  "- الكلمه *{"..word.."}* هي بالتاكيد من قائمه المنع." 
else
redis:sadd(boss..':Filter_Word:'..msg.chat_id_,word) 
return  "- الكلمه *{"..word.."}* تمت اضافتها الى قائمه المنع ."
end
end

function RemFilter(msg, word)
if redis:sismember(boss..':Filter_Word:'..msg.chat_id_,word) then 
redis:srem(boss..':Filter_Word:'..msg.chat_id_,word) 
return  "- الكلمه *{"..word.."}* تم السماح بها ." 
else
return  "- الكلمه *{"..word.."}* هي بالتاكيد مسموح بها." 
end
end

------------------------------------------

function CheckFlood(User,ChatID)
local NumberFlood = tonumber(redis:get(boss..':Flood_Spam:'..User..':'..ChatID..':msgs') or 0)
if NumberFlood >= 5 then 
result = false
else
redis:setex(boss..':Flood_Spam:'..User..':'..ChatID..':msgs',2,NumberFlood+1)
result = true
end
return result
end


function buck_up_groups(msg)

json_data = '{"BotID": '..boss..',"UserBot": "'..Bot_User..'","Groups" : {'
local All_Groups_ID = redis:smembers(boss..'group:ids')
for key,GroupS in pairs(All_Groups_ID) do
local NameGroup = (redis:get(boss..'group:name'..GroupS) or '')
NameGroup = NameGroup:gsub('"','')
NameGroup = NameGroup:gsub([[\]],'')
if key == 1 then
json_data =  json_data ..'"'..GroupS..'":{"Title":"'..NameGroup..'"'
else
json_data =  json_data..',"'..GroupS..'":{"Title":"'..NameGroup..'"'
end

local admins = redis:smembers(boss..'admins:'..GroupS)
if #admins ~= 0 then
json_data =  json_data..',"Admins" : {'
for key,value in pairs(admins) do
local info = redis:hgetall(boss..'username:'..value)
if info then 
UserName_ = (info.username or "")
UserName_ = UserName_:gsub([[\]],'')
UserName_ = UserName_:gsub('"','')
end 
if key == 1 then
json_data =  json_data..'"'..UserName_..'":'..value
else
json_data =  json_data..',"'..UserName_..'":'..value
end
end
json_data =  json_data..'}'
end

local creator = redis:smembers(boss..':MONSHA_BOT:'..GroupS)
if #creator ~= 0 then
json_data =  json_data..',"Creator" : {'
for key,value in pairs(creator) do
local info = redis:hgetall(boss..'username:'..value)
if info then 
UserName_ = (info.username or "")
UserName_ = UserName_:gsub([[\]],'')
UserName_ = UserName_:gsub('"','')
end 
if key == 1 then
json_data =  json_data..'"'..UserName_..'":'..value
else
json_data =  json_data..',"'..UserName_..'":'..value
end 
end
json_data =  json_data..'}'
end

local owner = redis:smembers(boss..'owners:'..GroupS)
if #owner ~= 0 then
json_data =  json_data..',"Owner" : {'
for key,value in pairs(owner) do
local info = redis:hgetall(boss..'username:'..value)
if info then 
UserName_ = (info.username or "")
UserName_ = UserName_:gsub([[\]],'')
UserName_ = UserName_:gsub('"','')
end 
if key == 1 then
json_data =  json_data..'"'..UserName_..'":'..value
else
json_data =  json_data..',"'..UserName_..'":'..value
end
end
json_data =  json_data..'}'
end

json_data =  json_data.."}"
end

local Save_Data = io.open("./inc/"..Bot_User..".json","w+")
Save_Data:write(json_data..'}}')
Save_Data:close()
sendDocument(msg.chat_id_,msg.id_,"./inc/"..Bot_User..".json","| ملف النسخه الاحتياطيه ...\nالمجموعات » { "..#All_Groups_ID.." }\n| للبوت » "..Bot_User.."\nالتاريخ » "..os.date("%Y/%m/%d").."\n",dl_cb,nil)
end

function chat_list(msg)
local list = redis:smembers(boss..'group:ids')
message = '⌔︙ قائمه المجموعات :\n\n'
for k,v in pairs(list) do 
local info = redis:get(boss..'group:name'..v)
if info then 
if utf8.len(info) > 25 then
info = utf8.escape(utf8.gsub(info,0,25))..'...'
end
message = message..k..'ـ '..Flter_Markdown(info).. ' \nــ •⊱ { `' ..v.. '` } ⊰•\n\n'
else 
message = message..k.. 'ـ '..' ☜ •⊱ { `' ..v.. '` } ⊰• \n'
end 
end
all_groups = '⌔︙ قائمه المجموعات :<br><br>'
for k,v in pairs(list) do 
local info = redis:get(boss..'group:name'..v)
if info then
all_groups = all_groups..' '..k..'- <span style="color: #bd2a2a;">'..info.. '</span> <br> ايدي ☜ (<span style="color:#078883;">' ..v.. '</span>)<br>'
else
all_groups = all_groups..' '..k.. '- '..' ☜ (<span style="color:#078883;">' ..v.. '</span>) <br>'
end 
end

if utf8.len(message) > 4096 then
sendMsg(msg.chat_id_,1,' عذرا لديك الكثير من المجموعات\n*⌔︙* سوف ارسل لك ملف فيها قائمه مجموعات المفعله انتظر لحظه ...')
file = io.open("./inc/All_Groups.html", "w")
file:write([[
<html dir="rtl">
<head>
<title>قائمه المجموعات </title>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Harmattan" rel="stylesheet">

</head>
<style>*{font-family: 'Harmattan', sans-serif;font-weight: 600;text-shadow: 1px 1px 16px black;}</style>
<body>
<p style="color:#018bb6;font-size: 17px;font-weight: 600;" aligin="center">قائمه المجموعات </p>
<hr>
]]..all_groups..[[

</body>
</html>
]])
file:close()
return sendDocument(msg.chat_id_,msg.id_,'./inc/All_Groups.html',' قائمه المجموعات بالكامله  \n يحتوي ('..#list..') مجموعه \nافتح الملف في عارض HTML او بالمتصفح',dl_cb,nil)
else 
return sendMsg(msg.chat_id_,1,message) 
end 
end



function rem_data_group(id_group)
redis:del(
boss..'group:add'..id_group,
boss..'lock_link'..id_group, 
boss..'lock_id'..id_group,
boss..'lock_spam'..id_group, 
boss..'lock_webpage'..id_group,
boss..'lock_markdown'..id_group,
boss..'lock_flood'..id_group,
boss..'lock_bots'..id_group,
boss..'mute_forward'..id_group,
boss..'mute_contact'..id_group,
boss..'mute_location'..id_group,
boss..'mute_document'..id_group,
boss..'mute_keyboard'..id_group,
boss..'mute_game'..id_group,
boss..'mute_inline'..id_group,
boss..'lock_username'..id_group,
boss..'num_msg_max'..id_group,
boss..'mute_text'..id_group,
boss..'admins:'..id_group,
boss..':Filter_Word:'..id_group,
boss..'banned:'..id_group,
boss..'is_silent_users:'..id_group,
boss..'whitelist:'..id_group,
boss..':MONSHA_BOT:'..id_group,
boss..'owners:'..id_group,
boss..'replay'..id_group,
boss..':MONSHA_Group:'..id_group
)
redis:srem(boss..'group:ids',id_group)
end



function set_admins(msg) 
GetChannelAdministrators(msg.chat_id_,function(arg,data)
local NumAdmin = 0
for k,v in pairs(data.members_) do
if not data.members_[k].bot_info_ and data.members_[k].status_.ID == "ChatMemberStatusEditor" then
NumAdmin = NumAdmin + 1
if not redis:sismember(boss..'admins:'..arg.chat_id_,v.user_id_) then
GetUserID(v.user_id_,function(arg,data)
redis:hset(boss..'username:'..data.id_,'username',ResolveUserName(data))
redis:sadd(boss..'admins:'..arg.chat_id_,data.id_)
end,{chat_id_=msg.chat_id_,id_=msg.id_})
end
end
end
if NumAdmin == 0 then 
return sendMsg(arg.chat_id_,arg.id_,"- لا يـوجـد ادمـنـيـه لكي يتـم رفعهم \n")
else
return sendMsg(arg.chat_id_,arg.id_,"- تم رفع  { *"..NumAdmin.."* } مـن الادمـنية‌‏ في البوت \n")
end
end,30,{chat_id_=msg.chat_id_,id_=msg.id_})
end




function modadd(msg)
if redis:get(boss..'lock_service') then
lock_servicez = true
else
lock_servicez = false
end
if not msg.SudoUser and not lock_servicez then return '- هذا الامر يخص المطور فقط .' end
if msg.is_post_ then return "- عذرا هذا بوت حمايه للمجموعات وليس للقنوات  " end
if msg.type ~= "channel" then return '- البوت يعمل فقط في المجموعات العامه لذا يجب ترقية المجموعه ووضع معرف للمجموعه لتصبح عامه ' end


GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss..'group:add'..msg.chat_id_) then  return sendMsg(msg.chat_id_,msg.id_,'- المجموعه بالتاكيد ✓️ تم تفعيلها \n- بواسطه ⋙「 '..NameUser..' 」 \n') end

local UserChaneel = redis:get(boss..":UserNameChaneel")
if UserChaneel and not msg.SudoBase then
local url , res = https.request(ApiToken..'/getchatmember?chat_id='..UserChaneel..'&user_id='..msg.sender_user_id_)
if res == 200 then
print(url) 
local Req = JSON.decode(url)
if Req.ok and Req.result and Req.result.status == "left" or Req.result.status == "kicked" then
return sendMsg(msg.chat_id_,msg.id_,"- آشـترگ بآلقنآ‌‏هہ آولآ ["..UserChaneel.."] \n- ثم آرجع آرسـل تفعيل .")
end
else
return "- آشـترگ بآلقنآ‌‏هہ آولآ ["..UserChaneel.."] \n- ثم آرجع آرسـل تفعيل ."
end
end

local UserChaneel = redis:get(boss..":UserNameChaneel")
if UserChaneel and not msg.SudoBase then
local url , res = https.request(ApiToken..'/getchatmember?chat_id='..UserChaneel..'&user_id='..msg.sender_user_id_)
if res == 200 then
local Req = JSON.decode(url)
if Req.ok and Req.result and Req.result.status == "left" or Req.result.status == "kicked" then
return sendMsg(msg.chat_id_,msg.id_,"- عذراً يجب عليك الاشتراك في  القناه ["..UserChaneel.."] \n لتتمكن من استخدام البوت بشكل كامل .")
end
else
return "- عذراً يجب عليك الاشتراك في  القناه ["..UserChaneel.."] \n لتتمكن من استخدام البوت بشكل كامل ."
end
end



if redis:get(boss..'lock_service') then
lock_servicez = true
else
lock_servicez = false
end

GetFullChat(msg.chat_id_,function(arg,data) 
local GroupUsers = tonumber(redis:get(boss..':addnumberusers') or 0)
local Groupcount = tonumber(data.member_count_)
if GroupUsers  >= Groupcount and not arg.SudoBase then
return sendMsg(arg.chat_id_,arg.id_,'- لا يمـكنني تفعيل البوت في المـجمـوعة‏ يجب ان يكون اكثر مـن 【'..GroupUsers..'】 عضـو ')
end
if data.channel_ and data.channel_.status_.ID  == "ChatMemberStatusMember" then
return sendMsg(arg.chat_id_,arg.id_,'- عذرا البوت ليس ادمن  في المجموعه \n- يرجى رفعه ادمن لتتمكن من تفعيل البوت ')
end
if arg.lock_servicez then 
sendMsg(arg.chat_id_,arg.id_,'- تـم تـفـعـيـل الـمـجـمـوعـه  \n- وتم رفع جمـيع الادمـنية‏‏‏ الكروب بالبوت \n- بواسطه ⋙「 '..NameUser..' 」 \n')
else
sendMsg(arg.chat_id_,arg.id_,'- تـم تـفـعـيـل المـجمـوعة‏‏ \n- بواسطه ⋙「 '..NameUser..' 」 \n')
end

GetChannelAdministrators(arg.chat_id_,function(arg,data)
for k,v in pairs(data.members_) do
if data.members_[k].status_.ID == "ChatMemberStatusCreator" then
GetUserID(v.user_id_,function(arg,data)
redis:hset(boss..'username:'..data.id_,'username', ResolveUserName(data))
redis:sadd(boss..':Malk_Group:'..arg.chat_id_,data.id_)
end,{chat_id_=arg.chat_id_})
elseif arg.lock_servicez and not data.members_[k].bot_info_ and data.members_[k].status_.ID == "ChatMemberStatusEditor" then
if not redis:sismember(boss..'admins:'..arg.chat_id_,v.user_id_) then
GetUserID(v.user_id_,function(arg,data)
redis:hset(boss..'username:'..data.id_,'username',ResolveUserName(data))
redis:sadd(boss..'admins:'..arg.chat_id_,data.id_)
end,{chat_id_=arg.chat_id_})
end
end
end
end,25,{chat_id_=arg.chat_id_,sender_user_id_=arg.sender_user_id_,lock_servicez=arg.lock_servicez})



GroupTitle(arg.chat_id_,function(arg,data)

redis:mset(
boss..'group:add'..arg.chat_id_,true,
boss..'lock_link'..arg.chat_id_,true, 
boss..'lock_id'..arg.chat_id_,true,
boss..'lock_spam'..arg.chat_id_,true,
boss..'lock_webpage'..arg.chat_id_,true,
boss..'lock_markdown'..arg.chat_id_,true,
boss..'lock_flood'..arg.chat_id_,true,
boss..'lock_bots'..arg.chat_id_,true,
boss..'mute_forward'..arg.chat_id_,true,
boss..'mute_contact'..arg.chat_id_,true,
boss..'mute_location'..arg.chat_id_,true,
boss..'mute_document'..arg.chat_id_,true,
boss..'mute_keyboard'..arg.chat_id_,true,
boss..'mute_game'..arg.chat_id_,true,
boss..'mute_inline'..arg.chat_id_,true,
boss..'lock_username'..arg.chat_id_,true,
boss..'num_msg_max'..arg.chat_id_,5, 
boss..'lock_edit'..arg.chat_id_,true,
boss..'replay'..arg.chat_id_,true,
boss..'lock_rdodSource'..arg.chat_id_,true,
boss.."lock_KickBan"..msg.chat_id_,true,
boss.."lock_mmno3"..msg.chat_id_,true,
boss.."lock_KickBan"..msg.chat_id_,true,
boss.."lock_RandomRdod"..msg.chat_id_,true,
boss.."lock_linkk"..msg.chat_id_,true
)
redis:sadd(boss..'group:ids',arg.chat_id_) 
redis:sadd(boss..'mtwr_count'..arg.sender_user_id_,arg.chat_id_)

local NameGroup = data.title_
redis:set(boss..'group:name'..arg.chat_id_,NameGroup)
if not arg.invite_link_ then
Gp_Link = ExportLink(arg.chat_id_)
if Gp_Link and Gp_Link.result then
Gp_Link = Gp_Link.result
else
Gp_Link = ""
end
else
Gp_Link = arg.invite_link_
end
redis:set(boss..'linkGroup'..arg.chat_id_,Gp_Link)
if arg.sender_user_id_ == SUDO_ID then return false end
GetUserID(arg.sender_user_id_,function(arg,datai)
if datai.username_ then 
USERNAME_T = '- الـمعرف  -⊱ @['..datai.username_..'] ⊰-\n'
else 
USERNAME_T = ''
end
send_msg(SUDO_ID,'- قام شخص بتفعيل البوت ...\n\nــــــــــــــــــــــــــــــــــــــــــ\n- معلومات المجموعه\n'
..'- الاسم -⊱ ['..arg.NameGroup..']('..arg.Gp_Link..') ⊰- \n'
..'- الايدي -⊱`'..arg.chat_id_..'`⊰-\n'
..'- الاعـضـاء -⊱{ *'..arg.Groupcount..'* }⊰- \nــــــــــــــــــــــــــــــــــــــــــ\n- معلومات الشخص \n'
..'- الاسـم -⊱{ ['..FlterName(datai.first_name_..' '..(datai.last_name_ or ""),23)..'](tg://user?id='..arg.sender_user_id_..') }⊰-\n\n'
..USERNAME_T..'- التاريخ -⊱* '..os.date("%Y/%m/%d")
..' *⊰-\n- الساعه -⊱* '..os.date("%I:%M%p")..' *⊰-')
end,{chat_id_=arg.chat_id_,sender_user_id_=arg.sender_user_id_,NameGroup=NameGroup,Gp_Link=Gp_Link,Groupcount=arg.Groupcount})
end,{chat_id_=arg.chat_id_,sender_user_id_=arg.sender_user_id_,Groupcount=Groupcount,invite_link_=data.invite_link_})


end,{chat_id_=msg.chat_id_,id_=msg.id_,sender_user_id_=msg.sender_user_id_,lock_servicez=lock_servicez,SudoBase=msg.SudoBase})
end,{msg=msg})
return false
end


function action_by_id(arg, data)
local cmd = arg.cmd
local ChatID = arg.msg.chat_id_
local MsgID = arg.msg.id_
local msg = arg.msg or ""
if not data.id_ then 
sendMsg(ChatID,MsgID,"- العضو لا يوجد❕") 
return false
end
local UserID = data.id_
local Resolv = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if data.username_ then 
USERNAME = '@'..data.username_
else 
USERNAME = FlterName(data.first_name_..' '..(data.last_name_ or ""),20) 
end
USERCAR = utf8.len(USERNAME)

if cmd == "tqeed" then
if UserID == our_id then   
return sendMsg(ChatID,MsgID,"- لا يمكنك تقييد البوت  ؛") 
elseif UserID == SUDO_ID then 
return sendMsg(ChatID,MsgID,"- لا يمكنك تقييد المطور الاساسي ؛") 
elseif UserID == 1859656976 then 
return sendMsg(ChatID,MsgID,"- لا يمكنك تقييد مطور السورس ؛") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك تقييد المطور ؛") 
elseif redis:sismember(boss..':MONSHA_BOT:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك تقييد المنشئ  ؛") 
elseif redis:sismember(boss..':MONSHA_Group:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك تقييد المنشئ الاساسي  ؛") 
elseif redis:sismember(boss..':Malk_Group:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك تقييد المالك ؛")
elseif redis:sismember(boss..'owners:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك تقييد المدير ؛") 
elseif redis:sismember(boss..'admins:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك تقييد الادمن ؛") 
elseif  redis:sismember(boss..'whitelist:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك تقييد المميز ؛") 
end
Restrict(ChatID,UserID,1)
redis:hset(boss..'username:'..UserID, 'username', Resolv)
redis:sadd(boss..':tqeed:'..ChatID,UserID)
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم تقييده بنجاح ")
end 
if cmd =="fktqeed" then
Restrict(ChatID,UserID,2)
redis:srem(boss..':tqeed:'..ChatID,UserID)
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم فك تقييده بنجاح ")
end
if cmd == "setwhitelist" then
if redis:sismember(boss..'whitelist:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد رفعه مميز  في المجموعه ") 
end
redis:hset(boss..'username:'..UserID, 'username', Resolv)
redis:sadd(boss..'whitelist:'..ChatID,UserID)
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم رفعه مميز  في المجموعه ") 
end
if cmd == "remwhitelist" then
if not redis:sismember(boss..'whitelist:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد تنزيله مميز  في المجموعه ") 
end
redis:srem(boss..'whitelist:'..ChatID,UserID)
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله مميز  في المجموعه ") 
end
if cmd == "setmnsha" then
if redis:sismember(boss..':MONSHA_BOT:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد رفعه منشئ  في المجموعه ") 
end
redis:hset(boss..'username:'..UserID, 'username', Resolv)
redis:sadd(boss..':MONSHA_BOT:'..ChatID,UserID)
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم رفعه منشئ  في المجموعه ") 
end
if cmd == "remmnsha" then
if not redis:sismember(boss..':MONSHA_BOT:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد تنزيله منشئ  في المجموعه ") 
end
redis:srem(boss..':MONSHA_BOT:'..ChatID,UserID)
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله منشى  في المجموعه ") 
end

if cmd == "setowner" then
if redis:sismember(boss..'owners:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد رفعه مدير  في المجموعه ") 
end
Resolv = Resolv:gsub([[\_]],"_")
redis:hset(boss..'username:'..UserID, 'username', Resolv)
redis:sadd(boss..'owners:'..ChatID,UserID)
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم رفعه مدير  في المجموعه ") 
end
if cmd == "remowner" then
if not redis:sismember(boss..'owners:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد تنزيله مدير  في المجموعه ") 
end
redis:srem(boss..'owners:'..ChatID,UserID)
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله مدير  في المجموعه ") 
end
if cmd == "promote" then
if redis:sismember(boss..'admins:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد رفعه ادمن  في المجموعه ") 
end
Resolv = Resolv:gsub([[\_]],"_")
redis:hset(boss..'username:'..UserID, 'username', Resolv)
redis:sadd(boss..'admins:'..ChatID,UserID) 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم رفعه ادمن  في المجموعه ") 
end
if cmd == "demote" then
if not redis:sismember(boss..'admins:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد تنزيله ادمن  في المجموعه ") 
end
redis:srem(boss..'admins:'..ChatID,UserID)
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله ادمن  في المجموعه ") 
end
if cmd == "whois" then
GetChatMember(ChatID,UserID,function(arg,data1)
local namei = data.first_name_..' '..(data.last_name_ or "")
if data.username_ then useri = '@'..data.username_ else useri = " لا يوجد " end
return SendMention(ChatID,UserID,MsgID,'-  الاسم » '..namei..'\n'
..'-  الايدي » {'..UserID..'} \n'
..'-  المعرف » '..useri..'\n'
..'- الرتبه » '..Getrtba(UserID,ChatID)..'\n'
..'-  نوع الكشف » بالايدي\n',13,utf8.len(namei))
end)
end

if cmd == "Upmonsh" then
if redis:sismember(boss..':MONSHA_Group:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد رفعه منشئ اساسي  في المجموعه ") 
end
redis:hset(boss..'username:'..UserID,'username',USERNAME)
redis:sadd(boss..':MONSHA_Group:'..ChatID,UserID)
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم رفعه منشئ اساسي  في المجموعه ") 
end

if cmd == "Dwmonsh" then
if not redis:sismember(boss..':MONSHA_Group:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد تنزيله منشئ اساسي  في المجموعه ") 
end
redis:srem(boss..':MONSHA_Group:'..ChatID,UserID) 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله منشئ اساسي  في المجموعه ") 
end


if cmd == "UpMalk" then
if redis:sismember(boss..':Malk_Group:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد رفعه مالك  في المجموعه ") 
end
redis:hset(boss..'username:'..UserID,'username',USERNAME)
redis:sadd(boss..':Malk_Group:'..ChatID,UserID)
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم رفعه مالك  في المجموعه ") 
end

if cmd == "DwnMalk" then
if not redis:sismember(boss..':Malk_Group:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد تنزيله مالك  في المجموعه ") 
end
redis:srem(boss..':Malk_Group:'..ChatID,UserID) 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله مالك  في المجموعه ") 
end

if cmd == "up_sudo" then
if redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد رفعه مطور  في البوت ") 
end
redis:hset(boss..'username:'..UserID, 'username', USERNAME)
redis:sadd(boss..':SUDO_BOT:',UserID)
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم رفعه مطور  في البوت ") 
end

if cmd == "dn_sudo" then
if not redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد تنزيله مطور  في البوت ") 
end
redis:srem(boss..':SUDO_BOT:',UserID) 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله مطور  في البوت ") 
end

if cmd == "ban" then
if UserID == our_id then   
return sendMsg(ChatID,MsgID,"- لا يمكنك حظر البوت  ؛") 
elseif UserID == 1859656976 then 
return sendMsg(ChatID,MsgID,"- لا يمكنك حظر مطور السورس ؛") 
elseif UserID == SUDO_ID then 
return sendMsg(ChatID,MsgID,"- لا يمكنك حظر المطور الاساسي ؛") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك حظر المطور ؛") 
elseif redis:sismember(boss..':MONSHA_BOT:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك حظر المنشئ ؛") 
elseif redis:sismember(boss..':MONSHA_Group:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك حظر المنشئ الاساسي  ؛") 
elseif redis:sismember(boss..':Malk_Group:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك حظر المالك ؛") 
elseif redis:sismember(boss..'owners:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك حظر المدير ؛") 
elseif redis:sismember(boss..'admins:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك حظر الادمن ؛")
elseif  redis:sismember(boss..'whitelist:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك حظر المميز ؛") 
end
if Check_Banned(ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم بالتاكيد حظره  من المجموعه ") 
end
redis:hset(boss..'username:'..UserID, 'username', Resolv)
redis:sadd(boss..'banned:'..ChatID,UserID)
kick_user(UserID, ChatID)
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم حظره  من المجموعه ") 
end

if cmd == "kick" then
if UserID == our_id then   
return sendMsg(ChatID,MsgID,"- لا يمكنك طرد البوت ؛") 
elseif UserID ==1859656976 then 
return sendMsg(ChatID,MsgID,"- لا يمكنك طرد مطور السورس ؛") 
elseif UserID == SUDO_ID then 
return sendMsg(ChatID,MsgID,"- لا يمكنك طرد المطور الاساسي ؛") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك طرد المطور ؛") 
elseif redis:sismember(boss..':MONSHA_BOT:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك طرد اللمنشئ ؛") 
elseif redis:sismember(boss..':MONSHA_Group:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك طرد المنشئ الاساسي ؛") 
elseif redis:sismember(boss..':Malk_Group:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك طرد المالك ؛") 
elseif redis:sismember(boss..'owners:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك طرد المدير ؛") 
elseif redis:sismember(boss..'admins:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك طرد الادمن ؛") 
elseif  redis:sismember(boss..'whitelist:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك طرد المميز ؛") 
end
kick_user(UserID, ChatID,function(arg,data)
if data.ID == "Error" and data.code_ == 400 then
return sendMsg(ChatID,MsgID,'- لا يمكنني طرد العضو .\n- لانه مشرف في المجموعه ')    
elseif data.ID == "Error" and data.code_ == 3 then
return sendMsg(ChatID,MsgID,'- لا يمكنني طرد العضو .\n- ليس لدي صلاحيه الحظر او لست مشرف ')    
end
StatusLeft(ChatID,UserID)
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم طرده  من المجموعه ") 
end)
end

if cmd == "uban" then
if not Check_Banned(ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم بالتاكيد الغاء حظره  من المجموعه ") 
else
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم الغاء حظره  من المجموعه ") 
end
redis:hset(boss..'username:'..UserID, 'username', Resolv)
redis:srem(boss..'banned:'..ChatID,UserID)
StatusLeft(ChatID,UserID)
return false
end

if cmd == "ktm" then
if UserID == our_id then   
return sendMsg(ChatID,MsgID,"- لا يمكنك كتم البوت ؛") 
elseif UserID == 1859656976 then 
return sendMsg(ChatID,MsgID,"- لا يمكنك كتم مطور السورس ؛") 
elseif UserID == SUDO_ID then 
return sendMsg(ChatID,MsgID,"- لا يمكنك كتم المطور الاساسي ؛") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك كتم المطور ؛") 
elseif redis:sismember(boss..':MONSHA_BOT:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك كتم المنشئ ؛") 
elseif redis:sismember(boss..':MONSHA_Group:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك كتم المنشئ الاساسي ؛") 
elseif redis:sismember(boss..':Malk_Group:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك كتم المالك ؛")
elseif redis:sismember(boss..'owners:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك كتم المدير ؛") 
elseif redis:sismember(boss..'admins:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك كتم الادمن ؛") 
elseif  redis:sismember(boss..'whitelist:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك كتم المميز ؛") 
end
if redis:sismember(boss..'admins:'..ChatID,UserID) then 
return sendMsg(ChatID,MsgID,"لا يمكنك كتم المدراء او الادمنيه") 
end
if MuteUser(ChatID, UserID) then 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم بالتاكيد كتمه  من المجموعه ") 
end
redis:hset(boss..'username:'..UserID, 'username', Resolv)
redis:sadd(boss..'is_silent_users:'..ChatID,UserID)
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم كتمه  من المجموعه ") 
end

if cmd == "unktm" then
if not MuteUser(ChatID, UserID) then 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم بالتاكيد الغاء كتمه  من المجموعه ") 
end
redis:hset(boss..'username:'..UserID, 'username', Resolv)
redis:srem(boss..'is_silent_users:'..ChatID,UserID)
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم الغاء كتمه  من المجموعه ") 
end

if cmd == "upMshrf" then
redis:hset(boss..'username:'..UserID,'username',Resolv)
redis:setex(boss..":uploadingsomeon:"..ChatID..msg.sender_user_id_,500,NameUser)
redis:setex(boss..":uploadingsomeon2:"..ChatID..msg.sender_user_id_,500,UserID)
sendMsg(ChatID,MsgID,"-  » حسننا الان ارسل صلاحيات المشرف :\n\n|1- صلاحيه تغيير المعلومات\n|2- صلاحيه حذف الرسائل\n|3- صلاحيه دعوه مستخدمين\n|4- صلاحيه حظر وتقيد المستخدمين \n|5- صلاحيه تثبيت الرسائل \n|6- صلاحيه رفع مشرفين اخرين\n\n|[*]- لرفع كل الصلاحيات ما عدا رفع المشرفين \n|[**] - لرفع كل الصلاحيات مع رفع المشرفين \n\n- يمكنك اختيار الارقام معا وتعيين الكنيه للمشرف في ان واحد مثلا : \n\n| 136 اباظة\n") 
return false
end

if cmd == "DwonMshrf" then
ResAdmin = UploadAdmin(ChatID,UserID,"")  
if ResAdmin == '{"ok":false,"error_code":400,"description":"Bad Request: CHAT_ADMIN_REQUIRED"}' then return sendMsg(ChatID,MsgID,"-لا يمكنني تنزيله لانه مرفوع من قبل منشئ اخر ")  end
redis:srem(boss..':MONSHA_BOT:'..ChatID,UserID)
redis:srem(boss..'owners:'..ChatID,UserID)
redis:srem(boss..'admins:'..ChatID,UserID)
redis:srem(boss..'whitelist:'..ChatID,UserID)
sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله من مشرفين المجموعه ")
return false
end

if cmd == "bandall" then
if UserID == our_id then   
return sendMsg(ChatID,MsgID,"- لا يمكنك حظر البوت  ؛") 
elseif UserID == 1859656976 then 
return sendMsg(ChatID,MsgID,"- لا يمكنك حظر مطور السورس ؛") 
elseif UserID == SUDO_ID then 
return sendMsg(ChatID,MsgID,"- لا يمكنك حظر المطور الاساسي ؛")
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(ChatID,MsgID,"- لا يمكنك حظر المطور ؛") 
end
if GeneralBanned(UserID) then 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم بالتاكيد حظره عام  من المجموعات ") 
end
redis:hset(boss..'username:'..UserID, 'username', Resolv)
redis:sadd(boss..'gban_users',UserID)
kick_user(UserID,ChatID) 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم حظره عام  من المجموعات ") 
end

if cmd == "unbandall" then  
if not GeneralBanned(UserID) then
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم بالتاكيد الغاء حظره العام  من المجموعات ") 
end
redis:srem(boss..'gban_users',UserID)
StatusLeft(ChatID,UserID)
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم الغاء حظره العام  من المجموعات ") 
end

if cmd == "tfa3l" then  
local maseegs = redis:get(boss..'msgs:'..UserID..':'..ChatID) or 1
local edited = redis:get(boss..':edited:'..ChatID..':'..UserID) or 0
local content = redis:get(boss..':adduser:'..ChatID..':'..UserID) or 0
if data.username_ then UserNameID = "@"..data.username_ else UserNameID = "لا يوجد" end  

sendMsg(ChatID,MsgID,"-ايديه » `"..UserID.."`\n-رسائله » "..maseegs.."\n-معرفه » ["..UserNameID.."]\n-تفاعله » "..Get_Ttl(maseegs).."\n-رتبته » "..Getrtba(UserID,ChatID).."\n-تعديلاته » "..edited.."\n-جهاته » "..content.."") 
end

if cmd == "rfaqud" then  
if UserID == our_id then return sendMsg(ChatID,MsgID,"- لا يمكنك تنفيذ الامر بالرد ع رسالة البوت ") end
Restrict(ChatID,UserID,2)
redis:srem(boss..'banned:'..ChatID,UserID)
StatusLeft(ChatID,UserID)
redis:srem(boss..'is_silent_users:'..ChatID,UserID)
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n  تم رفع القيود ان وجد ") 
end

--========================================================================
if cmd == "DwnAll" then ----------- تنزيل الكل
if UserID == our_id then return sendMsg(ChatID,MsgID,"- لا يمكنك تنفيذ الامر مع البوت ") end
if UserID == 1859656976 then

if UserID == SUDO_ID then 
rinkuser = 1
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
rinkuser = 2
elseif redis:sismember(boss..':Malk_Group:'..msg.chat_id_,UserID) then 
rinkuser = 3
elseif redis:sismember(boss..':MONSHA_Group:'..ChatID,UserID) then 
rinkuser = 4
elseif redis:sismember(boss..':MONSHA_BOT:'..ChatID,UserID) then 
rinkuser = 5
elseif redis:sismember(boss..'owners:'..ChatID,UserID) then 
rinkuser = 6
elseif redis:sismember(boss..'admins:'..ChatID,UserID) then 
rinkuser = 7
elseif redis:sismember(boss..'whitelist:'..ChatID,UserID) then 
rinkuser = 8
else
rinkuser = 9
end
local DonisDown = "\n- تم تنزيله من الرتب الاتيه : \n\n "
if redis:sismember(boss..':SUDO_BOT:',UserID) then 
DonisDown = DonisDown.."-  تم تنزيله من المطور \n"
end 
if redis:sismember(boss..':MONSHA_Group:'..ChatID,UserID) then 
DonisDown = DonisDown.."-  تم تنزيله من المنشئ الاساسي \n"
end 
if redis:sismember(boss..':Malk_Group:'..ChatID,UserID) then 
DonisDown = DonisDown.."- تم تنزيله من المالك \n"
end 
if redis:sismember(boss..':MONSHA_BOT:'..ChatID,UserID) then 
DonisDown = DonisDown.."-  تم تنزيله من المنشئ \n"
end 
if redis:sismember(boss..'owners:'..ChatID,UserID) then 
DonisDown = DonisDown.."-  تم تنزيله من المدير \n"
end 
if redis:sismember(boss..'admins:'..ChatID,UserID) then 
DonisDown = DonisDown.."-  تم تنزيله من الادمن \n"
end 
if redis:sismember(boss..'whitelist:'..ChatID,UserID) then
DonisDown = DonisDown.."-  تم تنزيله من العضو مميز \n"
end

function senddwon()  sendMsg(ChatID,MsgID,"- عذرا المستخدم رتبته اعلى منك لا يمكن تنزيله ") end
function sendpluse() sendMsg(ChatID,MsgID,"- عذرا لا يمكن تنزيل رتبه مثل رتبتك : "..msg.TheRankCmd.." ") end

if rinkuser == 9 then return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」   \nانه بالتاكيد عضو ")  end
huk = false
if msg.SudoBase then 
redis:srem(boss..':SUDO_BOT:',UserID)
redis:srem(boss..':MONSHA_Group:'..ChatID,UserID)
redis:srem(boss..':MONSHA_BOT:'..ChatID,UserID)
redis:srem(boss..'owners:'..ChatID,UserID)
redis:srem(boss..'admins:'..ChatID,UserID)
redis:srem(boss..'whitelist:'..ChatID,UserID)
elseif msg.SudoUser then 
if rinkuser == 2 then return sendpluse() end
if rinkuser < 2 then return senddwon() end
redis:srem(boss..':MONSHA_Group:'..ChatID,UserID)
redis:srem(boss..':MONSHA_BOT:'..ChatID,UserID)
redis:srem(boss..'owners:'..ChatID,UserID)
redis:srem(boss..'admins:'..ChatID,UserID)
redis:srem(boss..'whitelist:'..ChatID,UserID)
elseif msg.Malk then 
if rinkuser == 3 then return sendpluse() end
if rinkuser < 3 then return senddwon() end
redis:srem(boss..':MONSHA_Group:'..ChatID,UserID)
redis:srem(boss..':MONSHA_BOT:'..ChatID,UserID)
redis:srem(boss..'owners:'..ChatID,UserID)
redis:srem(boss..'admins:'..ChatID,UserID)
redis:srem(boss..'whitelist:'..ChatID,UserID)
elseif msg.SuperCreator then 
if rinkuser == 4 then return sendpluse() end
if rinkuser < 4 then return senddwon() end
redis:srem(boss..':MONSHA_BOT:'..ChatID,UserID)
redis:srem(boss..'owners:'..ChatID,UserID)
redis:srem(boss..'admins:'..ChatID,UserID)
redis:srem(boss..'whitelist:'..ChatID,UserID)
elseif msg.Creator then 
if rinkuser == 5 then return sendpluse() end
if rinkuser < 6 then return senddwon() end
redis:srem(boss..'owners:'..ChatID,UserID)
redis:srem(boss..'admins:'..ChatID,UserID)
redis:srem(boss..'whitelist:'..ChatID,UserID)
elseif msg.Director then 
if rinkuser == 6 then return sendpluse() end
if rinkuser < 6 then return senddwon() end
redis:srem(boss..'admins:'..ChatID,UserID)
redis:srem(boss..'whitelist:'..ChatID,UserID)
elseif msg.Admin then 
if rinkuser == 7 then return sendpluse() end
if rinkuser < 7 then return senddwon() end
redis:srem(boss..'admins:'..ChatID,UserID)
redis:srem(boss..'whitelist:'..ChatID,UserID)
else
huk = true
end

if not huk then sendMsg(ChatID,UserID,"- المستخدم  ⋙「 "..NameUser.." 」 \n"..DonisDown.."\n") end

end

end

function settingsall(msg)

list_settings = "-` اعدادات المجموعه :` \n"
.."\n- التعديل » "..(redis:get(boss..'lock_edit'..msg.chat_id_) or 'false')
.."\n- الروابط » "..(redis:get(boss..'lock_link'..msg.chat_id_) or 'false')
.."\n- التاك » "..(redis:get(boss..'lock_tag'..msg.chat_id_) or 'false')
.."\n- المعرفات » "..(redis:get(boss..'lock_username'..msg.chat_id_) or 'false')
.."\n\n- التكرار » "..(redis:get(boss..'lock_flood'..msg.chat_id_) or 'false')
.."\n- الكلايش » "..(redis:get(boss..'lock_spam'..msg.chat_id_) or 'false')
.."\n- الويب » "..(redis:get(boss..'lock_webpage'..msg.chat_id_) or 'false')
.."\n- الماركدوان » "..(redis:get(boss..'lock_markdown'..msg.chat_id_) or 'false')
.."\n- البوتات بالطرد » "..(redis:get(boss..'lock_bots_by_kick'..msg.chat_id_) or 'false')
.."\n- البوتات » "..(redis:get(boss..'lock_bots'..msg.chat_id_) or 'false')
.."\n- عدد التكرار » "..(redis:get(boss..'num_msg_max'..msg.chat_id_) or 'false')
.."\n- وقت التنظيف » "..(redis:get(boss..':Timer_Cleaner:'..msg.chat_id_) or '6').." ساعة ."
.."\n\n-` اعدادات الوسائط :`\n"
.."\n- المتحركه » "..(redis:get(boss..'mute_gif'..msg.chat_id_) or 'false')
.."\n- الدردشه » "..(redis:get(boss..'mute_text'..msg.chat_id_) or 'false')
.."\n- الانلاين » "..(redis:get(boss..'mute_inline'..msg.chat_id_) or 'false')
.."\n- الالعاب » "..(redis:get(boss..'mute_game'..msg.chat_id_) or 'false')
.."\n- الصور » "..(redis:get(boss..'mute_photo'..msg.chat_id_) or 'false')
.."\n- الفيديو » "..(redis:get(boss..'mute_video'..msg.chat_id_) or 'false')
.."\n- الصوت » "..(redis:get(boss..'mute_audio'..msg.chat_id_) or 'false')
.."\n\n- البصمات » "..(redis:get(boss..'mute_voice'..msg.chat_id_) or 'false')
.."\n- الملصقات » "..(redis:get(boss..'mute_sticker'..msg.chat_id_) or 'false')
.."\n- الجهات » "..(redis:get(boss..'mute_contact'..msg.chat_id_) or 'false')
.."\n- التوجيه » "..(redis:get(boss..'mute_forward'..msg.chat_id_) or 'false')
.."\n- الموقع » "..(redis:get(boss..'mute_location'..msg.chat_id_) or 'false')
.."\n- الملفات » "..(redis:get(boss..'mute_document'..msg.chat_id_) or 'false')
.."\n- الاشعارات » "..(redis:get(boss..'mute_tgservice'..msg.chat_id_) or 'false')
.."\n- الفشار » "..(redis:get(boss..'lock_mmno3'..msg.chat_id_) or 'false')
.."\n- الفارسيه » "..(redis:get(boss..'lock_pharsi'..msg.chat_id_) or 'false')
.."\n- الانكليزيه » "..(redis:get(boss..'lock_lang'..msg.chat_id_) or 'false')
.."\n- الاضافه » "..(redis:get(boss..'lock_Add'..msg.chat_id_) or 'false')

local eueuf = "\n\n-` اعدادات اخرى : `"
.."\n- الترحيب » "..(redis:get(boss..'welcome:get'..msg.chat_id_) or 'false')
.."\n-  الردود » "..(redis:get(boss..'replay'..msg.chat_id_) or 'false')
.."\n-  الردود العشوائيه » "..(redis:get(boss.."lock_RandomRdod"..msg.chat_id_) or 'false')
.."\n-  التحذير » "..(redis:get(boss..'lock_woring'..msg.chat_id_) or 'false')
.."\n- الايدي » "..(redis:get(boss..'lock_id'..msg.chat_id_) or 'false')
.."\n- الرابط » "..(redis:get(boss..'lock_linkk'..msg.chat_id_) or 'false')
.."\n- المغادره » "..(redis:get(boss..'lock_leftgroup'..msg.chat_id_) or 'false')
.."\n- الحظر » "..(redis:get(boss..'lock_KickBan'..msg.chat_id_) or 'false')
.."\n- الحمايه » "..(redis:get(boss..'antiedit'..msg.chat_id_) or 'false')
.."\n- التاك للكل » "..(redis:get(boss..'lock_takkl'..msg.chat_id_) or 'false')
.."\n- الايدي بالصوره » "..(redis:get(boss..'idphoto'..msg.chat_id_) or 'false')
.."\n- التحقق » "..(redis:get(boss.."lock_check"..msg.chat_id_) or 'false')
.."\n- التنظيف التلقائي » "..(redis:get(boss.."lock_cleaner"..msg.chat_id_) or 'false')
.."\n- ردود السورس » "..(redis:get(boss.."lock_rdodSource"..msg.chat_id_) or 'false')
list_settings = list_settings:gsub('true', '{ مقفول }')
list_settings = list_settings:gsub('false', '{ مفتوح }')
eueuf = eueuf:gsub('true', '{ مفعل }')
eueuf = eueuf:gsub('false', '{ معطل }')
return sendMsg(msg.chat_id_,1,'➖\n'..list_settings..eueuf..'\n')
end

function settings(msg)
list_settings = "` اعدادات المجموعه :` "
.."\n\n- التاك » "..(redis:get(boss..'lock_tag'..msg.chat_id_) or 'false')
.."\n- المعرفات » "..(redis:get(boss..'lock_username'..msg.chat_id_) or 'false')
.."\n- التعديل » "..(redis:get(boss..'lock_edit'..msg.chat_id_) or 'false')
.."\n- الروابط » "..(redis:get(boss..'lock_link'..msg.chat_id_) or 'false')
.."\n\n- التكرار » "..(redis:get(boss..'lock_flood'..msg.chat_id_) or 'false')
.."\n- الكلايش » "..(redis:get(boss..'lock_spam'..msg.chat_id_) or 'false')
.."\n\n- الويب » "..(redis:get(boss..'lock_webpage'..msg.chat_id_) or 'false')
.."\n- الماركدوان » "..(redis:get(boss..'lock_markdown'..msg.chat_id_) or 'false')
.."\n- البوتات بالطرد » "..(redis:get(boss..'lock_bots_by_kick'..msg.chat_id_) or 'false')
.."\n- البوتات » "..(redis:get(boss..'lock_bots'..msg.chat_id_) or 'false')
.."\n- عدد التكرار » "..(redis:get(boss..'num_msg_max'..msg.chat_id_) or 'false')
.."\n\n-` اعدادات التقـييد :`\n"
.."\n- التقييد بالتوجيه » "..(redis:get(boss..':tqeed_fwd:'..msg.chat_id_) or 'false')
.."\n- التقييد بالصور » "..(redis:get(boss..':tqeed_photo:'..msg.chat_id_) or 'false')
.."\n- التقييد بالروابط » "..(redis:get(boss..':tqeed_link:'..msg.chat_id_) or 'false')
.."\n- التقييد بالمتحركه » "..(redis:get(boss..':tqeed_gif:'..msg.chat_id_) or 'false')
.."\n- التقييد الفيديو » "..(redis:get(boss..':tqeed_video:'..msg.chat_id_) or 'false')
list_settings = list_settings:gsub('true', '{ مقفول }')
list_settings = list_settings:gsub('false', '{ مفتوح }')
return sendMsg(msg.chat_id_, msg.id_,'➖\n'..list_settings..'\n')
end

function media(msg)
list_settings = "-` اعدادات الوسائط:`\n"
.."\n- المتحركه » "..(redis:get(boss..'mute_gif'..msg.chat_id_) or 'false')
.."\n- الدردشه » "..(redis:get(boss..'mute_text'..msg.chat_id_) or 'false')
.."\n- الانلاين » "..(redis:get(boss..'mute_inline'..msg.chat_id_) or 'false')
.."\n- الالعاب » "..(redis:get(boss..'mute_game'..msg.chat_id_) or 'false')
.."\n- الصور » "..(redis:get(boss..'mute_photo'..msg.chat_id_) or 'false')
.."\n- الفيديو » "..(redis:get(boss..'mute_video'..msg.chat_id_) or 'false')
.."\n- الصوت » "..(redis:get(boss..'mute_audio'..msg.chat_id_) or 'false')
.."\n\n- البصمات » "..(redis:get(boss..'mute_voice'..msg.chat_id_) or 'false')
.."\n- الملصقات » "..(redis:get(boss..'mute_sticker'..msg.chat_id_) or 'false')
.."\n- الجهات » "..(redis:get(boss..'mute_contact'..msg.chat_id_) or 'false')
.."\n- التوجيه » "..(redis:get(boss..'mute_forward'..msg.chat_id_) or 'false')
.."\n- الموقع » "..(redis:get(boss..'mute_location'..msg.chat_id_) or 'false')
.."\n- الملفات » "..(redis:get(boss..'mute_document'..msg.chat_id_) or 'false')
.."\n- الاشعارات » "..(redis:get(boss..'mute_tgservice'..msg.chat_id_) or 'false')
.."\n- الكيبورد » "..(redis:get(boss..'mute_keyboard'..msg.chat_id_) or 'false')
list_settings = list_settings:gsub('true', '{ مقفول }')
list_settings = list_settings:gsub('false', '{ مفتوح }')
return sendMsg(msg.chat_id_,msg.id_,'➖\n'..list_settings..'\n')
end
-- -*- coding: utf-8 -*-
--
-- Simple JSON encoding and decoding in pure Lua.
--
-- Copyright 2010-2014 Jeffrey Friedl
-- http://regex.info/blog/
--
-- Latest version: http://regex.info/blog/lua/json
--
-- This code is released under a Creative Com CC-BY "Attribution" License:
-- http://creativecommons.org/licenses/by/3.0/deed.en_US
--
-- It can be used for any purpose so long as the copyright notice above,
-- the web-page links above, and the 'AUTHOR_NOTE' string below are
-- maintained. Enjoy.
--
local VERSION = 20141223.14 -- version history at end of file
local AUTHOR_NOTE = "-[ JSON.lua package by Jeffrey Friedl (http://regex.info/blog/lua/json) version 20141223.14 ]-"

--
-- The 'AUTHOR_NOTE' variable exists so that information about the source
-- of the package is maintained even in compiled versions. It's also
-- included in OBJDEF below mostly to quiet warnings about unused variables.
--
local OBJDEF = {
   VERSION      = VERSION,
   AUTHOR_NOTE  = AUTHOR_NOTE,
}


--
-- Simple JSON encoding and decoding in pure Lua.
-- http://www.json.org/
--
--
--   JSON = assert(loadfile "JSON.lua")() -- one-time load of the routines
--
--   local lua_value = JSON:decode(raw_json_text)
--
--   local raw_json_text    = JSON:encode(lua_table_or_value)
--   local pretty_json_text = JSON:encode_pretty(lua_table_or_value) -- "pretty printed" version for human readability
--
--
--
-- DECODING (from a JSON string to a Lua table)
--
--
--   JSON = assert(loadfile "JSON.lua")() -- one-time load of the routines
--
--   local lua_value = JSON:decode(raw_json_text)
--
--   If the JSON text is for an object or an array, e.g.
--     { "what": "books", "count": 3 }
--   or
--     [ "Larry", "Curly", "Moe" ]
--
--   the result is a Lua table, e.g.
--     { what = "books", count = 3 }
--   or
--     { "Larry", "Curly", "Moe" }
--
--
--   The encode and decode routines accept an optional second argument,
--   "etc", which is not used during encoding or decoding, but upon error
--   is passed along to error handlers. It can be of any type (including nil).
--
--
--
-- ERROR HANDLING
--
--   With most errors during decoding, this code calls
--
--      JSON:onDecodeError(message, text, location, etc)
--
--   with a message about the error, and if known, the JSON text being
--   parsed and the byte count where the problem was discovered. You can
--   replace the default JSON:onDecodeError() with your own function.
--
--   The default onDecodeError() merely augments the message with data
--   about the text and the location if known (and if a second 'etc'
--   argument had been provided to decode(), its value is tacked onto the
--   message as well), and then calls JSON.assert(), which itself defaults
--   to Lua's built-in assert(), and can also be overridden.
--
--   For example, in an Adobe Lightroom plugin, you might use something like
--
--          function JSON:onDecodeError(message, text, location, etc)
--             LrErrors.throwUserError("Internal Error: invalid JSON data")
--          end
--
--   or even just
--
--          function JSON.assert(message)
--             LrErrors.throwUserError("Internal Error: " .. message)
--          end
--
--   If JSON:decode() is passed a nil, this is called instead:
--
--      JSON:onDecodeOfNilError(message, nil, nil, etc)
--
--   and if JSON:decode() is passed HTML instead of JSON, this is called:
--
--      JSON:onDecodeOfHTMLError(message, text, nil, etc)
--
--   The use of the fourth 'etc' argument allows stronger coordination
--   between decoding and error reporting, especially when you provide your
--   own error-handling routines. Continuing with the the Adobe Lightroom
--   plugin example:
--
--          function JSON:onDecodeError(message, text, location, etc)
--             local note = "Internal Error: invalid JSON data"
--             if type(etc) = 'table' and etc.photo then
--                note = note .. " while processing for " .. etc.photo:getFormattedMetadata('fileName')
--             end
--             LrErrors.throwUserError(note)
--          end
--
--            :
--            :
--
--          for i, photo in ipairs(photosToProcess) do
--               :             
--               :             
--               local data = JSON:decode(someJsonText, { photo = photo })
--               :             
--               :             
--          end
--
--
--
--
--
-- DECODING AND STRICT TYPES
--
--   Because both JSON objects and JSON arrays are converted to Lua tables,
--   it's not normally possible to tell which original JSON type a
--   particular Lua table was derived from, or guarantee decode-encode
--   round-trip equivalency.
--
--   However, if you enable strictTypes, e.g.
--
--      JSON = assert(loadfile "JSON.lua")() --load the routines
--      JSON.strictTypes = true
--
--   then the Lua table resulting from the decoding of a JSON object or
--   JSON array is marked via Lua metatable, so that when re-encoded with
--   JSON:encode() it ends up as the appropriate JSON type.
--
--   (This is not the default because other routines may not work well with
--   tables that have a metatable set, for example, Lightroom API calls.)
--
--
-- ENCODING (from a lua table to a JSON string)
--
--   JSON = assert(loadfile "JSON.lua")() -- one-time load of the routines
--
--   local raw_json_text    = JSON:encode(lua_table_or_value)
--   local pretty_json_text = JSON:encode_pretty(lua_table_or_value) -- "pretty printed" version for human readability
--   local custom_pretty    = JSON:encode(lua_table_or_value, etc, { pretty = true, indent = "|  ", align_keys = false })
--
--   On error during encoding, this code calls:
--
--     JSON:onEncodeError(message, etc)
--
--   which you can override in your local JSON object.
--
--   The 'etc' in the error call is the second argument to encode()
--   and encode_pretty(), or nil if it wasn't provided.
--
--
-- PRETTY-PRINTING
--
--   An optional third argument, a table of options, allows a bit of
--   configuration about how the encoding takes place:
--
--     pretty = JSON:encode(val, etc, {
--                                       pretty = true,      -- if false, no other options matter
--                                       indent = "   ",     -- this provides for a three-space indent per nesting level
--                                       align_keys = false, -- see below
--                                     })
--
--   encode() and encode_pretty() are identical except that encode_pretty()
--   provides a default options table if none given in the call:
--
--       { pretty = true, align_keys = false, indent = "  " }
--
--   For example, if
--
--      JSON:encode(data)
--
--   produces:
--
--      {"city":"Kyoto","climate":{"avg_temp":16,"humidity":"high","snowfall":"minimal"},"country":"Japan","wards":11}
--
--   then
--
--      JSON:encode_pretty(data)
--
--   produces:
--
--      {
--        "city": "Kyoto",
--        "climate": {
--          "avg_temp": 16,
--          "humidity": "high",
--          "snowfall": "minimal"
--        },
--        "country": "Japan",
--        "wards": 11
--      }
--
--   The following three lines return identical results:
--       JSON:encode_pretty(data)
--       JSON:encode_pretty(data, nil, { pretty = true, align_keys = false, indent = "  " })
--       JSON:encode       (data, nil, { pretty = true, align_keys = false, indent = "  " })
--
--   An example of setting your own indent string:
--
--     JSON:encode_pretty(data, nil, { pretty = true, indent = "|    " })
--
--   produces:
--
--      {
--      |    "city": "Kyoto",
--      |    "climate": {
--      |    |    "avg_temp": 16,
--      |    |    "humidity": "high",
--      |    |    "snowfall": "minimal"
--      |    },
--      |    "country": "Japan",
--      |    "wards": 11
--      }
--
--   An example of setting align_keys to true:
--
--     JSON:encode_pretty(data, nil, { pretty = true, indent = "  ", align_keys = true })
--  
--   produces:
--   
--      {
--           "city": "Kyoto",
--        "climate": {
--                     "avg_temp": 16,
--                     "humidity": "high",
--                     "snowfall": "minimal"
--                   },
--        "country": "Japan",
--          "wards": 11
--      }
--
--   which I must admit is kinda ugly, sorry. This was the default for
--   encode_pretty() prior to version 20141223.14.
--
--
--  AMBIGUOUS SITUATIONS DURING THE ENCODING
--
--   During the encode, if a Lua table being encoded contains both string
--   and numeric keys, it fits neither JSON's idea of an object, nor its
--   idea of an array. To get around this, when any string key exists (or
--   when non-positive numeric keys exist), numeric keys are converted to
--   strings.
--
--   For example, 
--     JSON:encode({ "one", "two", "three", SOMESTRING = "some string" }))
--   produces the JSON object
--     {"1":"one","2":"two","3":"three","SOMESTRING":"some string"}
--
--   To prohibit this conversion and instead make it an error condition, set
--      JSON.noKeyConversion = true
--




--
-- SUMMARY OF METHODS YOU CAN OVERRIDE IN YOUR LOCAL LUA JSON OBJECT
--
--    assert
--    onDecodeError
--    onDecodeOfNilError
--    onDecodeOfHTMLError
--    onEncodeError
--
--  If you want to create a separate Lua JSON object with its own error handlers,
--  you can reload JSON.lua or use the :new() method.
--
---------------------------------------------------------------------------

local default_pretty_indent  = "  "
local default_pretty_options = { pretty = true, align_keys = false, indent = default_pretty_indent }

local isArray  = { __tostring = function() return "JSON array"  end }    isArray.__index  = isArray
local isObject = { __tostring = function() return "JSON object" end }    isObject.__index = isObject


function OBJDEF:newArray(tbl)
   return setmetatable(tbl or {}, isArray)
end

function OBJDEF:newObject(tbl)
   return setmetatable(tbl or {}, isObject)
end

local function unicode_codepoint_as_utf8(codepoint)
   --
   -- codepoint is a number
   --
   if codepoint <= 127 then
      return string.char(codepoint)

   elseif codepoint <= 2047 then
      --
      -- 110yyyxx 10xxxxxx         <-- useful notation from http://en.wikipedia.org/wiki/Utf8
      --
      local highpart = math.floor(codepoint / 0x40)
      local lowpart  = codepoint - (0x40 * highpart)
      return string.char(0xC0 + highpart,
                         0x80 + lowpart)

   elseif codepoint <= 65535 then
      --
      -- 1110yyyy 10yyyyxx 10xxxxxx
      --
      local highpart  = math.floor(codepoint / 0x1000)
      local remainder = codepoint - 0x1000 * highpart
      local midpart   = math.floor(remainder / 0x40)
      local lowpart   = remainder - 0x40 * midpart

      highpart = 0xE0 + highpart
      midpart  = 0x80 + midpart
      lowpart  = 0x80 + lowpart

      --
      -- Check for an invalid character (thanks Andy R. at Adobe).
      -- See table 3.7, page 93, in http://www.unicode.org/versions/Unicode5.2.0/ch03.pdf#G28070
      --
      if ( highpart == 0xE0 and midpart < 0xA0 ) or
         ( highpart == 0xED and midpart > 0x9F ) or
         ( highpart == 0xF0 and midpart < 0x90 ) or
         ( highpart == 0xF4 and midpart > 0x8F )
      then
         return "?"
      else
         return string.char(highpart,
                            midpart,
                            lowpart)
      end

   else
      --
      -- 11110zzz 10zzyyyy 10yyyyxx 10xxxxxx
      --
      local highpart  = math.floor(codepoint / 0x40000)
      local remainder = codepoint - 0x40000 * highpart
      local midA      = math.floor(remainder / 0x1000)
      remainder       = remainder - 0x1000 * midA
      local midB      = math.floor(remainder / 0x40)
      local lowpart   = remainder - 0x40 * midB

      return string.char(0xF0 + highpart,
                         0x80 + midA,
                         0x80 + midB,
                         0x80 + lowpart)
   end
end

function OBJDEF:onDecodeError(message, text, location, etc)
   if text then
      if location then
         message = string.format("%s at char %d of: %s", message, location, text)
      else
         message = string.format("%s: %s", message, text)
      end
   end

   if etc ~= nil then
      message = message .. " (" .. OBJDEF:encode(etc) .. ")"
   end

   if self.assert then
      self.assert(false, message)
   else
      assert(false, message)
   end
end

OBJDEF.onDecodeOfNilError  = OBJDEF.onDecodeError
OBJDEF.onDecodeOfHTMLError = OBJDEF.onDecodeError

function OBJDEF:onEncodeError(message, etc)
   if etc ~= nil then
      message = message .. " (" .. OBJDEF:encode(etc) .. ")"
   end

   if self.assert then
      self.assert(false, message)
   else
      assert(false, message)
   end
end

local function grok_number(self, text, start, etc)
   --
   -- Grab the integer part
   --
   local integer_part = text:match('^-?[1-9]%d*', start)
                     or text:match("^-?0",        start)

   if not integer_part then
      self:onDecodeError("expected number", text, start, etc)
   end

   local i = start + integer_part:len()

   --
   -- Grab an optional decimal part
   --
   local decimal_part = text:match('^%.%d+', i) or ""

   i = i + decimal_part:len()

   --
   -- Grab an optional exponential part
   --
   local exponent_part = text:match('^[eE][-+]?%d+', i) or ""

   i = i + exponent_part:len()

   local full_number_text = integer_part .. decimal_part .. exponent_part
   local as_number = tonumber(full_number_text)

   if not as_number then
      self:onDecodeError("bad number", text, start, etc)
   end

   return as_number, i
end


local function grok_string(self, text, start, etc)

   if text:sub(start,start) ~= '"' then
      self:onDecodeError("expected string's opening quote", text, start, etc)
   end

   local i = start + 1 -- +1 to bypass the initial quote
   local text_len = text:len()
   local VALUE = ""
   while i <= text_len do
      local c = text:sub(i,i)
      if c == '"' then
         return VALUE, i + 1
      end
      if c ~= '\\' then
         VALUE = VALUE .. c
         i = i + 1
      elseif text:match('^\\b', i) then
         VALUE = VALUE .. "\b"
         i = i + 2
      elseif text:match('^\\f', i) then
         VALUE = VALUE .. "\f"
         i = i + 2
      elseif text:match('^\\n', i) then
         VALUE = VALUE .. "\n"
         i = i + 2
      elseif text:match('^\\r', i) then
         VALUE = VALUE .. "\r"
         i = i + 2
      elseif text:match('^\\t', i) then
         VALUE = VALUE .. "\t"
         i = i + 2
      else
         local hex = text:match('^\\u([0123456789aAbBcCdDeEfF][0123456789aAbBcCdDeEfF][0123456789aAbBcCdDeEfF][0123456789aAbBcCdDeEfF])', i)
         if hex then
            i = i + 6 -- bypass what we just read

            -- We have a Unicode codepoint. It could be standalone, or if in the proper range and
            -- followed by another in a specific range, it'll be a two-code surrogate pair.
            local codepoint = tonumber(hex, 16)
            if codepoint >= 0xD800 and codepoint <= 0xDBFF then
               -- it's a hi surrogate... see whether we have a following low
               local lo_surrogate = text:match('^\\u([dD][cdefCDEF][0123456789aAbBcCdDeEfF][0123456789aAbBcCdDeEfF])', i)
               if lo_surrogate then
                  i = i + 6 -- bypass the low surrogate we just read
                  codepoint = 0x2400 + (codepoint - 0xD800) * 0x400 + tonumber(lo_surrogate, 16)
               else
                  -- not a proper low, so we'll just leave the first codepoint as is and spit it out.
               end
            end
            VALUE = VALUE .. unicode_codepoint_as_utf8(codepoint)

         else

            -- just pass through what's escaped
            VALUE = VALUE .. text:match('^\\(.)', i)
            i = i + 2
         end
      end
   end

   self:onDecodeError("unclosed string", text, start, etc)
end

local function skip_whitespace(text, start)

   local _, match_end = text:find("^[ \n\r\t]+", start) -- [http://www.ietf.org/rfc/rfc4627.txt] Section 2
   if match_end then
      return match_end + 1
   else
      return start
   end
end

local grok_one -- assigned later

local function grok_object(self, text, start, etc)
   if text:sub(start,start) ~= '{' then
      self:onDecodeError("expected '{'", text, start, etc)
   end

   local i = skip_whitespace(text, start + 1) -- +1 to skip the '{'

   local VALUE = self.strictTypes and self:newObject { } or { }

   if text:sub(i,i) == '}' then
      return VALUE, i + 1
   end
   local text_len = text:len()
   while i <= text_len do
      local key, new_i = grok_string(self, text, i, etc)

      i = skip_whitespace(text, new_i)

      if text:sub(i, i) ~= ':' then
         self:onDecodeError("expected colon", text, i, etc)
      end

      i = skip_whitespace(text, i + 1)

      local new_val, new_i = grok_one(self, text, i)

      VALUE[key] = new_val

      --
      -- Expect now either '}' to end things, or a ',' to allow us to continue.
      --
      i = skip_whitespace(text, new_i)

      local c = text:sub(i,i)

      if c == '}' then
         return VALUE, i + 1
      end

      if text:sub(i, i) ~= ',' then
         self:onDecodeError("expected comma or '}'", text, i, etc)
      end

      i = skip_whitespace(text, i + 1)
   end

   self:onDecodeError("unclosed '{'", text, start, etc)
end

local function grok_array(self, text, start, etc)
   if text:sub(start,start) ~= '[' then
      self:onDecodeError("expected '['", text, start, etc)
   end

   local i = skip_whitespace(text, start + 1) -- +1 to skip the '['
   local VALUE = self.strictTypes and self:newArray { } or { }
   if text:sub(i,i) == ']' then
      return VALUE, i + 1
   end

   local VALUE_INDEX = 1

   local text_len = text:len()
   while i <= text_len do
      local val, new_i = grok_one(self, text, i)

      -- can't table.insert(VALUE, val) here because it's a no-op if val is nil
      VALUE[VALUE_INDEX] = val
      VALUE_INDEX = VALUE_INDEX + 1

      i = skip_whitespace(text, new_i)

      --
      -- Expect now either ']' to end things, or a ',' to allow us to continue.
      --
      local c = text:sub(i,i)
      if c == ']' then
         return VALUE, i + 1
      end
      if text:sub(i, i) ~= ',' then
         self:onDecodeError("expected comma or '['", text, i, etc)
      end
      i = skip_whitespace(text, i + 1)
   end
   self:onDecodeError("unclosed '['", text, start, etc)
end


grok_one = function(self, text, start, etc)
   -- Skip any whitespace
   start = skip_whitespace(text, start)

   if start > text:len() then
      self:onDecodeError("unexpected end of string", text, nil, etc)
   end

   if text:find('^"', start) then
      return grok_string(self, text, start, etc)

   elseif text:find('^[-0123456789 ]', start) then
      return grok_number(self, text, start, etc)

   elseif text:find('^%{', start) then
      return grok_object(self, text, start, etc)

   elseif text:find('^%[', start) then
      return grok_array(self, text, start, etc)

   elseif text:find('^true', start) then
      return true, start + 4

   elseif text:find('^false', start) then
      return false, start + 5

   elseif text:find('^null', start) then
      return nil, start + 4

   else
      self:onDecodeError("can't parse JSON", text, start, etc)
   end
end

function OBJDEF:decode(text, etc)
   if type(self) ~= 'table' or self.__index ~= OBJDEF then
      OBJDEF:onDecodeError("JSON:decode must be called in method format", nil, nil, etc)
   end

   if text == nil then
      self:onDecodeOfNilError(string.format("nil passed to JSON:decode()"), nil, nil, etc)
   elseif type(text) ~= 'string' then
      self:onDecodeError(string.format("expected string argument to JSON:decode(), got %s", type(text)), nil, nil, etc)
   end

   if text:match('^%s*$') then
      return nil
   end

   if text:match('^%s*<') then
      -- Can't be JSON... we'll assume it's HTML
      self:onDecodeOfHTMLError(string.format("html passed to JSON:decode()"), text, nil, etc)
   end

   --
   -- Ensure that it's not UTF-32 or UTF-16.
   -- Those are perfectly valid encodings for JSON (as per RFC 4627 section 3),
   -- but this package can't handle them.
   --
   if text:sub(1,1):byte() == 0 or (text:len() >= 2 and text:sub(2,2):byte() == 0) then
      self:onDecodeError("JSON package groks only UTF-8, sorry", text, nil, etc)
   end

   local success, value = pcall(grok_one, self, text, 1, etc)

   if success then
      return value
   else
      -- if JSON:onDecodeError() didn't abort out of the pcall, we'll have received the error message here as "value", so pass it along as an assert.
      if self.assert then
         self.assert(false, value)
      else
         assert(false, value)
      end
      -- and if we're still here, return a nil and throw the error message on as a second arg
      return nil, value
   end
end

local function backslash_replacement_function(c)
   if c == "\n" then
      return "\\n"
   elseif c == "\r" then
      return "\\r"
   elseif c == "\t" then
      return "\\t"
   elseif c == "\b" then
      return "\\b"
   elseif c == "\f" then
      return "\\f"
   elseif c == '"' then
      return '\\"'
   elseif c == '\\' then
      return '\\\\'
   else
      return string.format("\\u%04x", c:byte())
   end
end

local chars_to_be_escaped_in_JSON_string
   = '['
   ..    '"'    -- class sub-pattern to match a double quote
   ..    '%\\'  -- class sub-pattern to match a backslash
   ..    '%z'   -- class sub-pattern to match a null
   ..    '\001' .. '-' .. '\031' -- class sub-pattern to match control characters
   .. ']'

local function json_string_literal(value)
   local newval = value:gsub(chars_to_be_escaped_in_JSON_string, backslash_replacement_function)
   return '"' .. newval .. '"'
end

local function object_or_array(self, T, etc)
   --
   -- We need to inspect all the keys... if there are any strings, we'll convert to a JSON
   -- object. If there are only numbers, it's a JSON array.
   --
   -- If we'll be converting to a JSON object, we'll want to sort the keys so that the
   -- end result is deterministic.
   --
   local string_keys = { }
   local number_keys = { }
   local number_keys_must_be_strings = false
   local bitaimum_number_key

   for key in pairs(T) do
      if type(key) == 'string' then
         table.insert(string_keys, key)
      elseif type(key) == 'number' then
         table.insert(number_keys, key)
         if key <= 0 or key >= math.huge then
            number_keys_must_be_strings = true
         elseif not bitaimum_number_key or key > bitaimum_number_key then
            bitaimum_number_key = key
         end
      else
         self:onEncodeError("can't encode table with a key of type " .. type(key), etc)
      end
   end

   if #string_keys == 0 and not number_keys_must_be_strings then
      --
      -- An empty table, or a numeric-only array
      --
      if #number_keys > 0 then
         return nil, bitaimum_number_key -- an array
      elseif tostring(T) == "JSON array" then
         return nil
      elseif tostring(T) == "JSON object" then
         return { }
      else
         -- have to guess, so we'll pick array, since empty arrays are likely more common than empty objects
         return nil
      end
   end

   table.sort(string_keys)

   local map
   if #number_keys > 0 then
      --
      -- If we're here then we have either mixed string/number keys, or numbers inappropriate for a JSON array
      -- It's not ideal, but we'll turn the numbers into strings so that we can at least create a JSON object.
      --

      if self.noKeyConversion then
         self:onEncodeError("a table with both numeric and string keys could be an object or array; aborting", etc)
      end

      --
      -- Have to make a shallow copy of the source table so we can remap the numeric keys to be strings
      --
      map = { }
      for key, val in pairs(T) do
         map[key] = val
      end

      table.sort(number_keys)

      --
      -- Throw numeric keys in there as strings
      --
      for _, number_key in ipairs(number_keys) do
         local string_key = tostring(number_key)
         if map[string_key] == nil then
            table.insert(string_keys , string_key)
            map[string_key] = T[number_key]
         else
            self:onEncodeError("conflict converting table with mixed-type keys into a JSON object: key " .. number_key .. " exists both as a string and a number.", etc)
         end
      end
   end

   return string_keys, nil, map
end

--
-- Encode
--
-- 'options' is nil, or a table with possible keys:
--    pretty            -- if true, return a pretty-printed version
--    indent            -- a string (usually of spaces) used to indent each nested level
--    align_keys        -- if true, align all the keys when formatting a table
--
local encode_value -- must predeclare because it calls itself
function encode_value(self, value, parents, etc, options, indent)

   if value == nil then
      return 'null'

   elseif type(value) == 'string' then
      return json_string_literal(value)

   elseif type(value) == 'number' then
      if value ~= value then
         --
         -- NaN (Not a Number).
         -- JSON has no NaN, so we have to fudge the best we can. This should really be a package option.
         --
         return "null"
      elseif value >= math.huge then
         --
         -- Positive infinity. JSON has no INF, so we have to fudge the best we can. This should
         -- really be a package option. Note: at least with some implementations, positive infinity
         -- is both ">= math.huge" and "<= -math.huge", which makes no sense but that's how it is.
         -- Negative infinity is properly "<= -math.huge". So, we must be sure to check the ">="
         -- case first.
         --
         return "1e+9999"
      elseif value <= -math.huge then
         --
         -- Negative infinity.
         -- JSON has no INF, so we have to fudge the best we can. This should really be a package option.
         --
         return "-1e+9999"
      else
         return tostring(value)
      end

   elseif type(value) == 'boolean' then
      return tostring(value)

   elseif type(value) ~= 'table' then
      self:onEncodeError("can't convert " .. type(value) .. " to JSON", etc)

   else
      --
      -- A table to be converted to either a JSON object or array.
      --
      local T = value

      if type(options) ~= 'table' then
         options = {}
      end
      if type(indent) ~= 'string' then
         indent = ""
      end

      if parents[T] then
         self:onEncodeError("table " .. tostring(T) .. " is a child of itself", etc)
      else
         parents[T] = true
      end

      local result_value

      local object_keys, bitaimum_number_key, map = object_or_array(self, T, etc)
      if bitaimum_number_key then
         --
         -- An array...
         --
         local ITEMS = { }
         for i = 1, bitaimum_number_key do
            table.insert(ITEMS, encode_value(self, T[i], parents, etc, options, indent))
         end

         if options.pretty then
            result_value = "[ " .. table.concat(ITEMS, ", ") .. " ]"
         else
            result_value = "["  .. table.concat(ITEMS, ",")  .. "]"
         end

      elseif object_keys then
         --
         -- An object
         --
         local TT = map or T

         if options.pretty then

            local KEYS = { }
            local bita_key_length = 0
            for _, key in ipairs(object_keys) do
               local encoded = encode_value(self, tostring(key), parents, etc, options, indent)
               if options.align_keys then
                  bita_key_length = math.bita(bita_key_length, #encoded)
               end
               table.insert(KEYS, encoded)
            end
            local key_indent = indent .. tostring(options.indent or "")
            local subtable_indent = key_indent .. string.rep(" ", bita_key_length) .. (options.align_keys and "  " or "")
            local FORMAT = "%s%" .. string.format("%d", bita_key_length) .. "s: %s"

            local COMBINED_PARTS = { }
            for i, key in ipairs(object_keys) do
               local encoded_val = encode_value(self, TT[key], parents, etc, options, subtable_indent)
               table.insert(COMBINED_PARTS, string.format(FORMAT, key_indent, KEYS[i], encoded_val))
            end
            result_value = "{\n" .. table.concat(COMBINED_PARTS, ",\n") .. "\n" .. indent .. "}"

         else

            local PARTS = { }
            for _, key in ipairs(object_keys) do
               local encoded_val = encode_value(self, TT[key],       parents, etc, options, indent)
               local encoded_key = encode_value(self, tostring(key), parents, etc, options, indent)
               table.insert(PARTS, string.format("%s:%s", encoded_key, encoded_val))
            end
            result_value = "{" .. table.concat(PARTS, ",") .. "}"

         end
      else
         --
         -- An empty array/object... we'll treat it as an array, though it should really be an option
         --
         result_value = "[]"
      end

      parents[T] = false
      return result_value
   end
end


function OBJDEF:encode(value, etc, options)
   if type(self) ~= 'table' or self.__index ~= OBJDEF then
      OBJDEF:onEncodeError("JSON:encode must be called in method format", etc)
   end
   return encode_value(self, value, {}, etc, options or nil)
end

function OBJDEF:encode_pretty(value, etc, options)
   if type(self) ~= 'table' or self.__index ~= OBJDEF then
      OBJDEF:onEncodeError("JSON:encode_pretty must be called in method format", etc)
   end
   return encode_value(self, value, {}, etc, options or default_pretty_options)
end

function OBJDEF.__tostring()
   return "JSON encode/decode package"
end

OBJDEF.__index = OBJDEF

function OBJDEF:new(args)
   local new = { }

   if args then
      for key, val in pairs(args) do
         new[key] = val
      end
   end

   return setmetatable(new, OBJDEF)
end

return OBJDEF:new()

--
-- Version history:
--
--   20141223.14   The encode_pretty() routine produced fine results for small datasets, but isn't really
--                 appropriate for anything large, so with help from Alex Aulbach I've made the encode routines
--                 more flexible, and changed the default encode_pretty() to be more generally useful.
--
--                 Added a third 'options' argument to the encode() and encode_pretty() routines, to control
--                 how the encoding takes place.
--
--                 Updated docs to add assert() call to the loadfile() line, just as good practice so that
--                 if there is a problem loading JSON.lua, the appropriate error message will percolate up.
--
--   20140920.13   Put back (in a way that doesn't cause warnings about unused variables) the author string,
--                 so that the source of the package, and its version number, are visible in compiled copies.
--
--   20140911.12   Minor lua cleanup.
--                 Fixed internal reference to 'JSON.noKeyConversion' to reference 'self' instead of 'JSON'.
--                 (Thanks to SmugMug's David Parry for these.)
--
--   20140418.11   JSON nulls embedded within an array were being ignored, such that
--                     ["1",null,null,null,null,null,"seven"],
--                 would return
--                     {1,"seven"}
--                 It's now fixed to properly return
--                     {1, nil, nil, nil, nil, nil, "seven"}
--                 Thanks to "haddock" for catching the error.
--
--   20140116.10   The user's JSON.assert() wasn't always being used. Thanks to "blue" for the heads up.
--
--   20131118.9    Update for Lua 5.3... it seems that tostring(2/1) produces "2.0" instead of "2",
--                 and this caused some problems.
--
--   20131031.8    Unified the code for encode() and encode_pretty(); they had been stupidly separate,
--                 and had of course diverged (encode_pretty didn't get the fixes that encode got, so
--                 sometimes produced incorrect results; thanks to Mattie for the heads up).
--
--                 Handle encoding tables with non-positive numeric keys (unlikely, but possible).
--
--                 If a table has both numeric and string keys, or its numeric keys are inappropriate
--                 (such as being non-positive or infinite), the numeric keys are turned into
--                 string keys appropriate for a JSON object. So, as before,
--                         JSON:encode({ "one", "two", "three" })
--                 produces the array
--                         ["one","two","three"]
--                 but now something with mixed key types like
--                         JSON:encode({ "one", "two", "three", SOMESTRING = "some string" }))
--                 instead of throwing an error produces an object:
--                         {"1":"one","2":"two","3":"three","SOMESTRING":"some string"}
--
--                 To maintain the prior throw-an-error semantics, set
--                      JSON.noKeyConversion = true
--                 
--   20131004.7    Release under a Creative Commons CC-BY license, which I should have done from day one, sorry.
--
--   20130120.6    Comment update: added a link to the specific page on my blog where this code can
--                 be found, so that folks who come across the code outside of my blog can find updates
--                 more easily.
--
--   20111207.5    Added support for the 'etc' arguments, for better error reporting.
--
--   20110731.4    More feedback from David Kolf on how to make the tests for Nan/Infinity system independent.
--
--   20110730.3    Incorporated feedback from David Kolf at http://lua-users.org/wiki/JsonModules:
--
--                   * When encoding lua for JSON, Sparse numeric arrays are now handled by
--                     spitting out full arrays, such that
--                        JSON:encode({"one", "two", [10] = "ten"})
--                     returns
--                        ["one","two",null,null,null,null,null,null,null,"ten"]
--
--                     In 20100810.2 and earlier, only up to the first non-null value would have been retained.
--
--                   * When encoding lua for JSON, numeric value NaN gets spit out as null, and infinity as "1+e9999".
--                     Version 20100810.2 and earlier created invalid JSON in both cases.
--
--                   * Unicode surrogate pairs are now detected when decoding JSON.
--
--   20100810.2    added some checking to ensure that an invalid Unicode character couldn't leak in to the UTF-8 encoding
--
--   20100731.1    initial public release
--

function unlock_replayRn(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_RandomRdod"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الردود العشوائيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_RandomRdod"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الردود العشوائيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end

function lock_replayRn(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_RandomRdod"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الردود العشوائيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:del(boss.."lock_RandomRdod"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الردود العشوائيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end 

---------------Lock ------------------- 
function unlock_KickBan(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_KickBan"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الحظر والطرد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_KickBan"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الحظر والطرد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end

function lock_KickBan(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_KickBan"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الحظر والطرد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:del(boss.."lock_KickBan"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الحظر والطرد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end 

---------------Lock ------------------- 
function unlock_rdodSource(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_rdodSource"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل ردود السورس    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_rdodSource"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل ردود السورس بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end

function lock_rdodSource(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_rdodSource"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل  ردود السورس    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:del(boss.."lock_rdodSource"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل ردود السورس بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end 

---------------Lock check -------------------
function lock_check(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_check"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل التحقق    \n- بواسطه ⋙「 "..NameUser.." 」 " )        else 
redis:del(boss.."lock_check"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل التحقق بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_check(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_check"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل التحقق    \n- بواسطه ⋙「 "..NameUser.." 」 " )        else
redis:set(boss.."lock_check"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل التحقق بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock check -------------------
function lock_cleaner(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_cleaner"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل التنظيف التلقائي    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 

redis:del(boss.."lock_cleaner"..msg.chat_id_)
local Cleaner = redis:smembers(boss..":IdsMsgsCleaner:"..msg.chat_id_)
for k,v in pairs(Cleaner) do
redis:del(boss..":SetTimerCleaner:"..msg.chat_id_..v) 
Del_msg(msg.chat_id_,v)
end
redis:del(boss..":IdsMsgsCleaner:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل التنظيف التلقائي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_cleaner(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_cleaner"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل التنظيف التلقائي    \n- بواسطه ⋙「 "..NameUser.." 」 " )        else
redis:set(boss.."lock_cleaner"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل التنظيف التلقائي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end


---------------Lock takk------------------- 
function unlock_takkl(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_takkl"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل تاك للكل    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_takkl"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل تاك للكل   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_takkl(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_takkl"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل تاك للكل    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."lock_takkl"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل تاك للكل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end 

---------------Lock left------------------- 
function unlock_leftgroup(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_leftgroup"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل المغادره    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_leftgroup"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل المغادره بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_leftgroup(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_leftgroup"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل المغادره    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."lock_leftgroup"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل المغادره بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end 
end,{msg=msg})
end 


---------------Lock Protection------------------- 
function unlock_AntiEdit(msg)
if not msg.SuperCreator then return "- هذا الامر يخص {المنشئ الاساسي,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."antiedit"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الحمايه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."antiedit"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الحمايه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_AntiEdit(msg)
if not msg.SuperCreator then return "- هذا الامر يخص {المنشئ الاساسي,المطور} فقط  " end 
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."antiedit"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الحمايه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."antiedit"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الحمايه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end 

------Lock id photo ------------------- 
function unlock_idphoto(msg)
if not msg.Director  then return "- هذا الامر يخص {المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."idphoto"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الايدي بالصوره    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."idphoto"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الايدي بالصوره بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_idphoto(msg)
if not msg.Director  then return "- هذا الامر يخص {المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."idphoto"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الايدي بالصوره    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."idphoto"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الايدي بالصوره بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end
------Lock link Group ------------------- 
function unlock_linkk(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_linkk"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الرابط    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_linkk"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الرابط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_linkk(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_linkk"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الرابط    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."lock_linkk"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الرابط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end
------Lock waring ------------------- 
function unlock_waring(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_woring"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل التحذير    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_woring"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل التحذير بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_waring(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_woring"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل التحذير    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."lock_woring"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل التحذير بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end
------Lock id------------------- 
function lock_ID(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_id"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الايدي    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."lock_id"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الايدي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end

function unlock_ID(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_id"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الايدي    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:set(boss.."lock_id"..msg.chat_id_,true)  
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الايدي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end
------Lock welcome------------------- 
function unlock_Welcome(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."welcome:get"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الترحيب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."welcome:get"..msg.chat_id_,true)  
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الترحيب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end

function lock_Welcome(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."welcome:get"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الترحيب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."welcome:get"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الترحيب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end
------Lock all------------------- 
function lock_All(msg)
if not msg.Creator   then return "- هذا الامر يخص {المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
redis:mset(
boss.."lock_username"..msg.chat_id_,true,
boss.."mute_gif"..msg.chat_id_,true,
boss.."mute_photo"..msg.chat_id_,true,
boss.."mute_audio"..msg.chat_id_,true,
boss.."mute_voice"..msg.chat_id_,true,
boss.."mute_sticker"..msg.chat_id_,true,
boss.."mute_forward"..msg.chat_id_,true,
boss.."mute_contact"..msg.chat_id_,true,
boss.."mute_location"..msg.chat_id_,true,
boss.."mute_document"..msg.chat_id_,true,
boss.."lock_link"..msg.chat_id_,true,
boss.."lock_tag"..msg.chat_id_,true,
boss.."lock_edit"..msg.chat_id_,true,
boss.."lock_spam"..msg.chat_id_,true,
boss.."lock_bots"..msg.chat_id_,true,
boss.."lock_webpage"..msg.chat_id_,true,
boss.."mute_video"..msg.chat_id_,true,
boss.."mute_inline"..msg.chat_id_,true
)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الكل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end,{msg=msg})

end

function Unlock_All(msg)
if not msg.Creator   then return "- هذا الامر يخص {المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
redis:del(
boss.."lock_username"..msg.chat_id_,
boss.."mute_gif"..msg.chat_id_,
boss.."mute_photo"..msg.chat_id_,
boss.."mute_audio"..msg.chat_id_,
boss.."mute_voice"..msg.chat_id_,
boss.."mute_sticker"..msg.chat_id_,
boss.."mute_forward"..msg.chat_id_,
boss.."mute_contact"..msg.chat_id_,
boss.."mute_location"..msg.chat_id_,
boss.."mute_document"..msg.chat_id_,
boss.."lock_link"..msg.chat_id_,
boss.."lock_tag"..msg.chat_id_,
boss.."lock_edit"..msg.chat_id_,
boss.."lock_spam"..msg.chat_id_,
boss.."lock_bots"..msg.chat_id_,
boss.."lock_webpage"..msg.chat_id_,
boss.."mute_video"..msg.chat_id_,
boss..":tqeed_video:"..msg.chat_id_,
boss..":tqeed_photo:"..msg.chat_id_,
boss..":tqeed_gif:"..msg.chat_id_,
boss..":tqeed_fwd:"..msg.chat_id_,
boss..":tqeed_link:"..msg.chat_id_,
boss.."mute_inline"..msg.chat_id_
)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الكل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end,{msg=msg})

end
------Lock Media------------------- 
function lock_Media(msg)
if not msg.Creator   then return "- هذا الامر يخص {المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
redis:mset(
boss.."mute_gif"..msg.chat_id_,true,
boss.."mute_photo"..msg.chat_id_,true,
boss.."mute_audio"..msg.chat_id_,true,
boss.."mute_voice"..msg.chat_id_,true,
boss.."mute_sticker"..msg.chat_id_,true,
boss.."mute_video"..msg.chat_id_,true
)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الوسائط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end,{msg=msg})

end

function Unlock_Media(msg)
if not msg.Creator   then return "- هذا الامر يخص {المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
redis:del(
boss.."mute_gif"..msg.chat_id_,
boss.."mute_photo"..msg.chat_id_,
boss.."mute_audio"..msg.chat_id_,
boss.."mute_voice"..msg.chat_id_,
boss.."mute_sticker"..msg.chat_id_,
boss.."mute_video"..msg.chat_id_
)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الوسائط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end,{msg=msg})

end

---------------Lock tqeed video -------------------
function tqeed_video(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss..":tqeed_video:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الفيديو بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss..":tqeed_video:"..msg.chat_id_)
redis:set(boss..":tqeed_video:"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الفيديو بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )    end
end,{msg=msg})
end

function fktqeed_video(msg)
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
if not redis:get(boss..":tqeed_video:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الفيديو بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss..":tqeed_video:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الفيديو بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock tqeed gif -------------------
function tqeed_gif(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss..":tqeed_gif:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل المتحركه بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."mute_gif"..msg.chat_id_)
redis:set(boss..":tqeed_gif:"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل المتحركه بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function fktqeed_gif(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss..":tqeed_gif:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح المتحركه بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss..":tqeed_gif:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح المتحركه بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )    end
end,{msg=msg})
end

---------------Lock tqeed fwd-------------------
function tqeed_fwd(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss..":tqeed_fwd:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التوجيه بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."mute_forward"..msg.chat_id_)
redis:set(boss..":tqeed_fwd:"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التوجيه بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function fktqeed_fwd(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss..":tqeed_fwd:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التوجيه  بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss..":tqeed_fwd:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التوجيه بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock tqeed link-------------------
function tqeed_link(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss..":tqeed_link:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الروابط بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:set(boss..":tqeed_link:"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الروابط بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function fktqeed_link(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss..":tqeed_link:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الروابط بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss..":tqeed_link:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الروابط بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock tqeed photo-------------------
function tqeed_photo(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss..":tqeed_photo:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الصور بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:set(boss..":tqeed_photo:"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الصور بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function fktqeed_photo(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss..":tqeed_photo:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الصور بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss..":tqeed_photo:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الصور بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end
---------------Lock twasel-------------------
function lock_twasel(msg)
if not msg.SudoBase then return "🚸*꒐ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_twasel") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل التواصل    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:set(boss.."lock_twasel",true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل التواصل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )    end
end,{msg=msg})
end

function unlock_twasel(msg)
if not msg.SudoBase then return "🚸*꒐ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_twasel") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل التواصل    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss.."lock_twasel")
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل التواصل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end


---------------Lock idediit------------------- 
function unlock_idediit(msg)
if not msg.SudoBase then return "- هذا الامر يخص المطور الاساسي فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lockidedit") then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل تعيين الايدي للمطور    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else redis:set(boss.."lockidedit",true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل تعيين الايدي للمطور  بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function lock_idediit(msg)
if not msg.SudoBase then return "- هذا الامر يخص المطور الاساسي فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lockidedit") then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل تعيين الايدي للمطور    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."lockidedit") 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل تعيين الايدي للمطور  بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end 
end,{msg=msg})
end 


---------------Lock bro-------------------
function lock_brod(msg)
if not msg.SudoBase then return "- هذا الامر يخص المطور فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_brod") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل اذاعه المطورين    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."lock_brod")
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل اذاعه المطورين بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end
function unlock_brod(msg)
if not msg.SudoBase then return "- هذا الامر يخص المطور فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_brod") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل اذاعه المطورين    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:set(boss.."lock_brod",true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل اذاعه المطورين بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock replay-------------------
function lock_replay(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."replay"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الردود    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."replay"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الردود بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function unlock_replay(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."replay"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الردود    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:set(boss.."replay"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الردود بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock bot service-------------------
function lock_service(msg)
if not msg.SudoBase then return "🚸*꒐ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_service") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل نظام البوت خدمي    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."lock_service")
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل نظام البوت خدمي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_service(msg)
if not msg.SudoBase then return "🚸*꒐ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_service") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل نظام البوت خدمي    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:set(boss.."lock_service",true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل نظام البوت خدمي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Lock mmno-------------------
function lock_mmno3(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_mmno3"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الفشار    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_mmno3"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الفشار بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_mmno3(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_mmno3"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الفشار    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_mmno3"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الفشار بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock pharsi-------------------
function lock_pharsi(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_pharsi"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الفارسيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_pharsi"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الفارسيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_pharsi(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_pharsi"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الفارسيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_pharsi"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الفارسيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock english-------------------
function lock_lang(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_lang"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الانكليزيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_lang"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الانكليزيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_lang(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_lang"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الانكليزيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_lang"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الانكليزيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Link-------------------
function lock_link(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_link"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الروابط    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_link"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الروابط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_link(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_link"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الروابط    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_link"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الروابط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Add-------------------
function lock_Add(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_Add"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الاضافه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_Add"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الاضافه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_Add(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_Add"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الاضافه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_Add"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الاضافه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Tag-------------------
function lock_tag(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_tag"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التاك (#)    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_tag"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التاك (#) بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_tag(msg)

if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_tag"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التاك (#)    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_tag"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التاك (#) بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Lock UserName-------------------
function lock_username(msg) 

if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_username"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل المعرفات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_username"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل المعرفات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_username(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_username"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح المعرفات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_username"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح المعرفات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Edit-------------------
function lock_edit(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_edit"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التعديل    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_edit"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التعديل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_edit(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_edit"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التعديل    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_edit"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التعديل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock spam-------------------
function lock_spam(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if   redis:get(boss.."lock_spam"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الكلايش    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_spam"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الكلايش بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_spam(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_spam"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الكلايش    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_spam"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الكلايش بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Flood-------------------
function lock_flood(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_flood"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التكرار    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_flood"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التكرار بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_flood(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_flood"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التكرار    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_flood"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التكرار بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Bots-------------------
function lock_bots(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_bots"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل البوتات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_bots"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل البوتات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_bots(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_bots"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح البوتات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_bots_by_kick"..msg.chat_id_)
redis:del(boss.."lock_bots"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح البوتات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Join-------------------
function lock_join(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_join"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الاضافه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_join"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الاضافه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_join(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_join"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الاضافه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_join"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الاضافه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Markdown-------------------
function lock_markdown(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_markdown"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الماركدوان    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_markdown"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الماركدوان بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_markdown(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_markdown"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الماركدوان    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_markdown"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الماركدوان بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Webpage-------------------
function lock_webpage(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_webpage"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الويب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_webpage"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الويب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_webpage(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_webpage"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الويب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_webpage"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الويب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Gif-------------------
function mute_gif(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_gif"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل المتحركه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_gif"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل المتحركه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
Tkml = "/G/?i="
function unmute_gif(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_gif"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح المتحركه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_gif"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح المتحركه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Game-------------------
function mute_game(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_game"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الالعاب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set("mute_game"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الالعاب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_game(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_game"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الالعاب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_game"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الالعاب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Inline-------------------
function mute_inline(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_inline"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الانلاين    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_inline"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الانلاين بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_inline(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_inline"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الانلاين    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_inline"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الانلاين بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Text-------------------
function mute_text(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_text"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الدردشه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_text"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الدردشه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_text(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_text"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الدردشه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_text"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الدردشه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute photo-------------------
function mute_photo(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_photo"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الصور    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_photo"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الصور بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_photo(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end

GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_photo"..msg.chat_id_)then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الصور    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_photo"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الصور بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end


---------------Mute Video-------------------
function mute_video(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_video"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الفيديو    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_video"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الفيديو بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_video(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_video"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الفيديو    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_video"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الفيديو بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Audio-------------------
function mute_audio(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_audio"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الصوت    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_audio"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الصوت بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_audio(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_audio"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الصوت    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_audio"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الصوت بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Voice-------------------
function mute_voice(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_voice"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل البصمات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_voice"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل البصمات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_voice(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_voice"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح البصمات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_voice"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح البصمات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Sticker-------------------
function mute_sticker(msg) 

if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)

if   redis:get(boss.."mute_sticker"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الملصقات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_sticker"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الملصقات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_sticker(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_sticker"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الملصقات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_sticker"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الملصقات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Contact-------------------
function mute_contact(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_contact"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الجهات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_contact"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الجهات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_contact(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_contact"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الجهات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_contact"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الجهات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Forward-------------------
function mute_forward(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_forward"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التوجيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_forward"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التوجيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_forward(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_forward"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التوجيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_forward"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التوجيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Location-------------------
function mute_location(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_location"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الموقع    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_location"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الموقع بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_location(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_location"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الموقع    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_location"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الموقع بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Document-------------------
function mute_document(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_document"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الملفات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_document"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الملفات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_document(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_document"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الملفات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_document"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الملفات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute TgService-------------------
function mute_tgservice(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_tgservice"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الاشعارات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_tgservice"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الاشعارات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_tgservice(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_tgservice"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الاشعارات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_tgservice"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الاشعارات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Mute Keyboard-------------------
function mute_keyboard(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_keyboard"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الكيبورد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_keyboard"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الكيبورد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_keyboard(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_keyboard"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الكيبورد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_keyboard"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الكيبورد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------lock_bots_by_kick-------------------
function lock_bots_by_kick(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_bots_by_kick"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل البوتات بالطرد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_bots"..msg.chat_id_,true)
redis:set(boss.."lock_bots_by_kick"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل البوتات بالطرد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_bots_by_kick(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_bots_by_kick"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح البوتات بالطرد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_bots_by_kick"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح البوتات بالطرد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------locks pin-------------------
function lock_pin(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_pin"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التثبيت    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_pin"..msg.chat_id_,true) 
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التثبيت بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_pin(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_pin"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التثبيت    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_pin"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التثبيت بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
function Flterzhrfa(Name)
Name = tostring(Name)
Name = utf8.gsub(Name,"ﭛ","ي")	
Name = utf8.gsub(Name,"ﺥ","خ")	
Name = utf8.gsub(Name,"ڽ","ن")	
Name = utf8.gsub(Name,"ٽ","ث")	
Name = utf8.gsub(Name,"ڜ","ش")	
Name = utf8.gsub(Name,"ﺵ","ش")	
Name = utf8.gsub(Name,"ﭒ","ي")	
Name = utf8.gsub(Name,"ﮛ","ك")	
Name = utf8.gsub(Name,"ﻡ","م")	
Name = utf8.gsub(Name,"ټ","ت")	
Name = utf8.gsub(Name,"ڼ","ن")	
Name = utf8.gsub(Name,"ﺻ","ص")	
Name = utf8.gsub(Name,"ڝ","ص")	
Name = utf8.gsub(Name,"ﻢ","م")	
Name = utf8.gsub(Name,"ﮑ","ك")	
Name = utf8.gsub(Name,"ﺮ","ر")	
Name = utf8.gsub(Name,"ﺳ","س")	
Name = utf8.gsub(Name,"ٿ","ت")	
Name = utf8.gsub(Name,"ﺦ","خ")	
Name = utf8.gsub(Name,"ڞ","ض")	
Name = utf8.gsub(Name,"ﺢ","ح")	
Name = utf8.gsub(Name,"Ξ","")	
Name = utf8.gsub(Name,"ﺶ","ش")	
Name = utf8.gsub(Name,"ﻠ","ا")	
Name = utf8.gsub(Name,"ﻤ","م")	
Name = utf8.gsub(Name,"ﺾ","ض")	
Name = utf8.gsub(Name,"ﺺ","ص")	
Name = utf8.gsub(Name,"ھ","ه")	
Name = utf8.gsub(Name,"۾","م")	
Name = utf8.gsub(Name,"ﺴ","س")	
Name = utf8.gsub(Name,"ﺿ","ض")	
Name = utf8.gsub(Name,"ڟ","ظ")	
Name = utf8.gsub(Name,"ﻧ","ن")	
Name = utf8.gsub(Name,"ﺤ","ح")	
Name = utf8.gsub(Name,"ﺠ","ج")	
Name = utf8.gsub(Name,"ﺷ","ش")	
Name = utf8.gsub(Name,"ﭴ","ج")	
Name = utf8.gsub(Name,"ژ","ز")	
Name = utf8.gsub(Name,"ٹ","ت")	
Name = utf8.gsub(Name,"ع","ع")	
Name = utf8.gsub(Name,"ﺧ","خ")	
Name = utf8.gsub(Name,"ﺯ","ز")	
Name = utf8.gsub(Name,"ڙ","ز")	
Name = utf8.gsub(Name,"ﻦ","ن")	
Name = utf8.gsub(Name,"ٸ","ئ")	
Name = utf8.gsub(Name,"ﮂ","د")	
Name = utf8.gsub(Name,"ﮃ","د")	
Name = utf8.gsub(Name,"ﭵ","ج")	
Name = utf8.gsub(Name,"ڻ","ن")	
Name = utf8.gsub(Name,"ښ","س")	
Name = utf8.gsub(Name,"ٻ","ب")	
Name = utf8.gsub(Name,"ﯙ","و")	
Name = utf8.gsub(Name,"ﮫ","ه")	
Name = utf8.gsub(Name,"ﺸ","ش")	
Name = utf8.gsub(Name,"ﺹ","ص")	
Name = utf8.gsub(Name,"ں","ر")	
Name = utf8.gsub(Name,"ﻥ","ن")	
Name = utf8.gsub(Name,"ڛ","س")	
Name = utf8.gsub(Name,"غ","غ")	
Name = utf8.gsub(Name,"ٺ","ت")	
Name = utf8.gsub(Name,"ﭶ","ج")	
Name = utf8.gsub(Name,"ﭨ","")	
Name = utf8.gsub(Name,"ﻖ","ق")	
Name = utf8.gsub(Name,"ۄ","و")	
Name = utf8.gsub(Name,"ڄ","ج")	
Name = utf8.gsub(Name,"ڥ","ف")	
Name = utf8.gsub(Name,"ﮄ","ذ")	
Name = utf8.gsub(Name,"ﮅ","ذ")	
Name = utf8.gsub(Name,"ﮁ","ج")	
Name = utf8.gsub(Name,"ۅ","و")	
Name = utf8.gsub(Name,"څ","ج")	
Name = utf8.gsub(Name,"ﮋ","ز")	
Name = utf8.gsub(Name,"ﺟ","ج")	
Name = utf8.gsub(Name,"ﻣ","م")	
Name = utf8.gsub(Name,"ﻲ","ي")	
Name = utf8.gsub(Name,"ۆ","و")	
Name = utf8.gsub(Name,"ن","ن")	
Name = utf8.gsub(Name,"چ","خ")	
Name = utf8.gsub(Name,"ا","ا")	
Name = utf8.gsub(Name,"ﻟ","ل")	
Name = utf8.gsub(Name,"ﺣ","ح")	
Name = utf8.gsub(Name,"ﺲ","س")	
Name = utf8.gsub(Name,"ۇ","و")	
Name = utf8.gsub(Name,"ڇ","ج")	
Name = utf8.gsub(Name,"ﺰ","ز")	
Name = utf8.gsub(Name,"ﭪ","ف")	
Name = utf8.gsub(Name,"ڦ","ق")	
Name = utf8.gsub(Name,"ﭩ","")	
Name = utf8.gsub(Name,"ڀ","ب")	
Name = utf8.gsub(Name,"ۀ","ه")	
Name = utf8.gsub(Name,"ـ","")	
Name = utf8.gsub(Name,"ﭓ","ي")	
Name = utf8.gsub(Name,"ﻞ","ل")	
Name = utf8.gsub(Name,"ڡ","ف")	
Name = utf8.gsub(Name,"ء","ء")	
Name = utf8.gsub(Name,"ﻎ","غ")	
Name = utf8.gsub(Name,"ﺙ","ث")	
Name = utf8.gsub(Name,"ﺜ","ث")	
Name = utf8.gsub(Name,"ﻌ","ع")	
Name = utf8.gsub(Name,"ﺚ","ث")	
Name = utf8.gsub(Name,"ﺝ","ج")	
Name = utf8.gsub(Name,"ہ","")	
Name = utf8.gsub(Name,"ځ","ح")	
Name = utf8.gsub(Name,"ﮓ","ك")	
Name = utf8.gsub(Name,"ڠ","غ")	
Name = utf8.gsub(Name,"ﻔ","ف")	
Name = utf8.gsub(Name,"ﻙ","ك")	
Name = utf8.gsub(Name,"ﻜ","ك")	
Name = utf8.gsub(Name,"ﻝ","ل")	
Name = utf8.gsub(Name,"ﻚ","ك")	
Name = utf8.gsub(Name,"ڂ","خ")	
Name = utf8.gsub(Name,"ۂ","")	
Name = utf8.gsub(Name,"ﻕ","ق")	
Name = utf8.gsub(Name,"ڣ","ف")	
Name = utf8.gsub(Name,"ﺘ","ت")	
Name = utf8.gsub(Name,"ﻍ","غ")	
Name = utf8.gsub(Name,"ﻗ","ق")	
Name = utf8.gsub(Name,"ﭻ","ج")	
Name = utf8.gsub(Name,"ﮆ","ذ")	
Name = utf8.gsub(Name,"ﭳ","ج")	
Name = utf8.gsub(Name,"ۃ","ة")	
Name = utf8.gsub(Name,"ڃ","ج")	
Name = utf8.gsub(Name,"ﺞ","ج")	
Name = utf8.gsub(Name,"ڢ","ف")	
Name = utf8.gsub(Name,"ﻘ","ق")	
Name = utf8.gsub(Name,"ی","ى")	
Name = utf8.gsub(Name,"ﮭ","ه")	
Name = utf8.gsub(Name,"ﮧ","")	
Name = utf8.gsub(Name,"ڌ","ذ")	
Name = utf8.gsub(Name,"̭","")	
Name = utf8.gsub(Name,"ﭸ","ج")	
Name = utf8.gsub(Name,"ﭼ","ج")	
Name = utf8.gsub(Name,"ﮯ","")	
Name = utf8.gsub(Name,"ﭬ","ف")	
Name = utf8.gsub(Name,"ڭ","ك")	
Name = utf8.gsub(Name,"ﮉ","ذ")	
Name = utf8.gsub(Name,"ﭭ","ف")	
Name = utf8.gsub(Name,"ۍ","ى")	
Name = utf8.gsub(Name,"ڍ","د")	
Name = utf8.gsub(Name,"ﭧ","")	
Name = utf8.gsub(Name,"ﮊ","ز")	
Name = utf8.gsub(Name,"ﺒ","ب")	
Name = utf8.gsub(Name,"ﭯ","ف")	
Name = utf8.gsub(Name,"ﭽ","ج")	
Name = utf8.gsub(Name,"ﯾ","ي")	
Name = utf8.gsub(Name,"ڬ","ك")	
Name = utf8.gsub(Name,"ﻃ","ط")	
Name = utf8.gsub(Name,"ڎ","ذ")	
Name = utf8.gsub(Name,"ێ","ئ")	
Name = utf8.gsub(Name,"ﻑ","ف")	
Name = utf8.gsub(Name,"ﯼ","ى")	
Name = utf8.gsub(Name,"ﻒ","ف")	
Name = utf8.gsub(Name,"ﮈ","د")	
Name = utf8.gsub(Name,"ﮡ","")	
Name = utf8.gsub(Name,"گ","ك")	
Name = utf8.gsub(Name,"ﻉ","ع")	
Name = utf8.gsub(Name,"ڏ","ذ")	
Name = utf8.gsub(Name,"ﺖ","ت")	
Name = utf8.gsub(Name,"ﭹ","ج")	
Name = utf8.gsub(Name,"ﮬ","ه")	
Name = utf8.gsub(Name,"ڮ","ك")	
Name = utf8.gsub(Name,"ﭺ","ج")	
Name = utf8.gsub(Name,"ﭢ","ت")	
Name = utf8.gsub(Name,"ڈ","د")	
Name = utf8.gsub(Name,"ۈ","و")	
Name = utf8.gsub(Name,"ﭤ","ت")	
Name = utf8.gsub(Name,"ﭠ","ت")	
Name = utf8.gsub(Name,"ﮥ","ه")	
Name = utf8.gsub(Name,"ک","ك")	
Name = utf8.gsub(Name,"ﺑ","ب")	
Name = utf8.gsub(Name,"ۉ","و")	
Name = utf8.gsub(Name,"ډ","د")	
Name = utf8.gsub(Name,"ﺗ","ت")	
Name = utf8.gsub(Name,"ﭥ","ت")	
Name = utf8.gsub(Name,"ﯡ","و")	
Name = utf8.gsub(Name,"ڨ","ق")	
Name = utf8.gsub(Name,"ي","ي")	
Name = utf8.gsub(Name,"ڊ","د")	
Name = utf8.gsub(Name,"ۊ","و")	
Name = utf8.gsub(Name,"ﮮ","")	
Name = utf8.gsub(Name,"ﻋ","ع")	
Name = utf8.gsub(Name,"ﯠ","و")	
Name = utf8.gsub(Name,"ﻊ","ع")	
Name = utf8.gsub(Name,"ﮦ","ه")	
Name = utf8.gsub(Name,"ﮢ","")	
Name = utf8.gsub(Name,"ﻈ","ض")	
Name = utf8.gsub(Name,"ﯿ","ي")	
Name = utf8.gsub(Name,"ۋ","و")	
Name = utf8.gsub(Name,"ڋ","د")	
Name = utf8.gsub(Name,"ﭣ","ت")	
Name = utf8.gsub(Name,"ﮤ","ه")	
Name = utf8.gsub(Name,"ﭮ","ف")	
Name = utf8.gsub(Name,"ﭫ","ف")	
Name = utf8.gsub(Name,"ﯽ","ى")	
Name = utf8.gsub(Name,"ﭡ","ت")	
Name = utf8.gsub(Name,"ﭾ","ج")	
Name = utf8.gsub(Name,"ﭦ","")	
Name = utf8.gsub(Name,"ﻐ","غ")	
Name = utf8.gsub(Name,"ڵ","ل")	
Name = utf8.gsub(Name,"ٵ","ا")	
Name = utf8.gsub(Name,"ﮔ","ك")	
Name = utf8.gsub(Name,"ﭗ","ب")	
Name = utf8.gsub(Name,"ﮜ","ك")	
Name = utf8.gsub(Name,"ﭝ","ي")	
Name = utf8.gsub(Name,"ڔ","ر")	
Name = utf8.gsub(Name,"ﻆ","ظ")	
Name = utf8.gsub(Name,"ﮌ","ر")	
Name = utf8.gsub(Name,"ﻪ","ه")	
Name = utf8.gsub(Name,"ڴ","ك")	
Name = utf8.gsub(Name,"ە","ه")	
Name = utf8.gsub(Name,"ﮗ","ك")	
Name = utf8.gsub(Name,"ﮝ","ك")	
Name = utf8.gsub(Name,"ﮙ","ك")	
Name = utf8.gsub(Name,"ﺓ","ة")	
Name = utf8.gsub(Name,"ڕ","ر")	
Name = utf8.gsub(Name,"ﮚ","ك")	
Name = utf8.gsub(Name,"ﮕ","ك")	
Name = utf8.gsub(Name,"ط","ط")	
Name = utf8.gsub(Name,"ﺪ","د")	
Name = utf8.gsub(Name,"ڷ","ل")	
Name = utf8.gsub(Name,"ٷ","ؤ")	
Name = utf8.gsub(Name,"ﺩ","د")	
Name = utf8.gsub(Name,"ﮘ","ك")	
Name = utf8.gsub(Name,"ﻁ","ط")	
Name = utf8.gsub(Name,"ﯝ","ؤ")	
Name = utf8.gsub(Name,"ﮱ","")	
Name = utf8.gsub(Name,"ﯚ","و")	
Name = utf8.gsub(Name,"ﻂ","ط")	
Name = utf8.gsub(Name,"ﭞ","ت")	
Name = utf8.gsub(Name,"ږ","ر")	
Name = utf8.gsub(Name,"̷","")	
Name = utf8.gsub(Name,"ٶ","ؤ")	
Name = utf8.gsub(Name,"ڶ","ل")	
Name = utf8.gsub(Name,"ﭜ","ي")	
Name = utf8.gsub(Name,"ﮎ","ك")	
Name = utf8.gsub(Name,"ﭲ","ج")	
Name = utf8.gsub(Name,"ڗ","ز")	
Name = utf8.gsub(Name,"ﮞ","")	
Name = utf8.gsub(Name,"̶","")	
Name = utf8.gsub(Name,"ڱ","ك")	
Name = utf8.gsub(Name,"ٱ","ا")	
Name = utf8.gsub(Name,"ر","ر")	
Name = utf8.gsub(Name,"ﺭ","ر")	
Name = utf8.gsub(Name,"ﭙ","ب")	
Name = utf8.gsub(Name,"ﺔ","ة")	
Name = utf8.gsub(Name,"ﺽ","ض")	
Name = utf8.gsub(Name,"ڐ","ذ")	
Name = utf8.gsub(Name,"ې","ي")	
Name = utf8.gsub(Name,"ﺕ","ت")	
Name = utf8.gsub(Name,"ﮟ","")	
Name = utf8.gsub(Name,"ڰ","ك")	
Name = utf8.gsub(Name,"ﻄ","ط")	
Name = utf8.gsub(Name,"ﻩ","ه")	
Name = utf8.gsub(Name,"ﺛ","ث")	
Name = utf8.gsub(Name,"ﮏ","ك")	
Name = utf8.gsub(Name,"ۑ","ى")	
Name = utf8.gsub(Name,"ڑ","ر")	
Name = utf8.gsub(Name,"ﻇ","ظ")	
Name = utf8.gsub(Name,"ٳ","ا")	
Name = utf8.gsub(Name,"ﺡ","ح")	
Name = utf8.gsub(Name,"ڳ","ك")	
Name = utf8.gsub(Name,"ﮪ","ه")	
Name = utf8.gsub(Name,"ﻛ","ك")	
Name = utf8.gsub(Name,"ﺼ","ص")	
Name = utf8.gsub(Name,"ﻅ","ظ")	
Name = utf8.gsub(Name,"ﻬ","ه")	
Name = utf8.gsub(Name,"̐","")	
Name = utf8.gsub(Name,"ﺂ","ا")	
Name = utf8.gsub(Name,"͠","")	
Name = utf8.gsub(Name,"ﮠ","")	
Name = utf8.gsub(Name,"ﻰ","ى")	
Name = utf8.gsub(Name,"ﭿ","ج")	
Name = utf8.gsub(Name,"ﮀ","ج")	
Name = utf8.gsub(Name,"ﮇ","ذ")	
Name = utf8.gsub(Name,"ﮍ","ر")	
Name = utf8.gsub(Name,"ﮐ","ك")	
Name = utf8.gsub(Name,"ﭷ","ج")	
Name = utf8.gsub(Name,"ﮰ","")	
Name = utf8.gsub(Name,"ے","")	
Name = utf8.gsub(Name,"پ","ب")	
Name = utf8.gsub(Name,"ﻨ","ن")	
Name = utf8.gsub(Name,"Ζ","z")	
Name = utf8.gsub(Name,"ﭚ","ب")	
Name = utf8.gsub(Name,"ﭘ","ب")	
Name = utf8.gsub(Name,"ٲ","ا")	
Name = utf8.gsub(Name,"ڲ","ك")	
Name = utf8.gsub(Name,"ﭖ","ب")	
Name = utf8.gsub(Name,"ﭕ","ي")	
Name = utf8.gsub(Name,"ﭔ","ي")	
Name = utf8.gsub(Name,"ﻏ","غ")	
Name = utf8.gsub(Name,"ﻀ","ض")	
Name = utf8.gsub(Name,"ګ","ك")	
Name = utf8.gsub(Name,"ڪ","ك")	
Name = utf8.gsub(Name,"ڧ","ف")	
Name = utf8.gsub(Name,"ڤ","ق")	
Name = utf8.gsub(Name,"ﮖ","ك")	
Name = utf8.gsub(Name,"ﺬ","ذ")	
Name = utf8.gsub(Name,"ڒ","ر")	
Name = utf8.gsub(Name,"ﺨ","خ")	
Name = utf8.gsub(Name,"ﭱ","ف")	
Name = utf8.gsub(Name,"ﻓ","ف")	
Name = utf8.gsub(Name,"ﺱ","س")	
Name = utf8.gsub(Name,"ﺫ","ذ")	
Name = utf8.gsub(Name,"ﺐ","ب")	
Name = utf8.gsub(Name,"ﮩ","")	
Name = utf8.gsub(Name,"ﮨ","")	
Name = utf8.gsub(Name,"ﮣ","")	
Name = utf8.gsub(Name,"ﭰ","ف")	
Name = utf8.gsub(Name,"ۓ","")	
Name = utf8.gsub(Name,"୭","و")	
Name = utf8.gsub(Name,"ﯛ","و")	
Name = utf8.gsub(Name,"ۿ","ه")	
return Name
end

function FlterEmoje(Name)
Name = tostring(Name)
Name = utf8.gsub(Name,"[🤚🔕♠🤗😇💂🌶🤣🚹⛸⚠😅🍕🍛🧝🌿💛#😕🧞*1032547🥌98🎡🎋🏼🎰🤑🚮☠🥜⃣🛌🌙🚙👏🛍💑⛳🏌🍢👲🔡❤🐀😨🥁🦇🏣㊗💰🚒🌟🐾🦅🐃🐷🤲🎩📳🇼🍎👛◻💻➗🔪🎂🌪🔔🍊✊🐚🍽🍫❗🚴🎒♏🧢🍁🌓😸🍦󠁢😶🗓🐡🛠✏😉🎯🍋🎟🔳🌨🎱💟⛏🤳📆🔅🍴📲🥊🖍🌡📬🆑🐇🗺😾🕰📵🏈🇮🍥➰🤠👥🕥😃😤😔🐹🎬⌛💎☃📖🔨👫🙄🥒⚜🏫🥃🍘🥥📍🦕💜🗝🙃🕤🐯👤🧔🏭🚭🚘💒🐓👁🤾🏐🏮🚋🌾📗🥈📚🤧🏃〰👱🔧🥖🇾☘🔘🔙⚗🛡🏖💹🉑🚛💩🛏♋🔸💴⏬✋👷😞☎🦂🎽🐞️🌘🌄⛵🈺🏸🎍📝🐪🍑😙🤓⚓󠁴💠🌔😵🥦📇🐌♓😘😢🐙🕦🏆🚨❇🙎🔶🛂🍲🥟📉🐕🍳🚈🔞😳🔌😊🌅🔊⛓🚻🚁✨💢🌊⚛😆😿🎈🏗🇭❓🙀🐨🚡🤢🔃▫🇶👿🤤📋🖋👕🐔😮🔵👂🌏⏏👦🐧🕎◾🍺🌧🖐📟🧙👶🌤↖🏬🤜⌚🏋🛐™🍜🤯🧣↘🔣🐣🥘🎫🎌😓🗨🚐🧚💲🍡😪🙏🖖⛽🏑⛲🎢🥗🚌🦁🚆☺🕒🎛⛹💏🐼🍶🚑🕞🤮🕕⏫🤰‼🎥🏀😰🌎📻󠁥🍂🇻🎴👸💼➖💆🕹👧🛩🍚❣🍓🤥🐄🍒♎🔽👵🔓🍠💍🏉▶🎠🎊👡📎💖🔺😺🍱📀⛎😽😷☣🦃🌯⛷🖼🚄💬🤐🦎♣🚦🍹‍🌱🛃🦄🦒🐈🕸🏟✖🚍😥↪🤝🏇⬇🌦🔄🚖⏺⬛♂⏲💁🚧🔤🚼👞🏄😩☂🕜🌚🧒⏯🎮🏯🌭🍵🔭💐🐤🕠💗🚎🛋🍧🤔🏽👒🤷🇸👘☝👴🔷⚖✴🉐✂🥂🕊👹⛴👅🚞😂📪🐺🦀󠁣🌃✉♒🤩🥕🎖🚀🕢😟🕵🇪👃🎑🏪🤟💿🥫😚🏩🏔🍏👢🏙📈⚒💝👠🎲🚲🖲⁉🇨🌳🚯🧀🕌🛶⛪🍌🧓🙈🇿⤴😬☪⚽🌈📔㊙💇🇯🗿🙁🍅☯🍞😠👍🕴▪👊💋🖱🎗🙌😎🐦🥡🔦💉🌺🔰🛣🕘🎶👳🍮🌜🐰↙🚔🕖🎿↕🐑🔛⛺🖕🧜🔟🖨🏕🎻🥝🎾🥐🤙🈳⚾🗑👣🚗🥧🏤🚕😒🤬🛷🤱🚏🚅🐂🐋🐜🤘⏪🦗⚱🔻👌〽👼💀👝☦⛱⏹󠁷📼📄🕺🎓😍🚩󠁧🔹🧡🥨➕🦌🤹ℹ🎉♉💨🏴❕🗼🏥🤪👮󠁳🏊🧟👖🙉☢🙇🔒👬📱🍈🏘🍐🕐😫🛄🧠🛥👭🎇🍭🤡🦑♍🐟🚃💧😋🚸🕍🚾✍🗽😹🎹🛒🧥🔎👓🚚🦖📷🤛👗🔜🥔🍖😄🔠💘🐴🤕󠁬🎄🧖🍗😈😧🈷🐽🌂♑💯🛑📁🧑🛰🎨☕🐒☑⛈🤨👐⛑🇳🔢🎞💪🍀⏸🌍💙🍃👺🍍🈸😜🈂⏮↩🌩🌵✈🏁😻👚🎙👋🔈☮🍬⛅🍸🐍🤫🎅🚿🏎🏳😁🚵💞🐢🐩💃😛🎪😴🕋🍆📯🥀💅🚳🙂🤶🌑⭕☁🥋👇🌌🍝😡⏱🔆🗯💶🥠🆓🌲👀🚢🕚💔🍇🦍⚕🇱🇰🦓🎧🥉🏺◼🌰🧦🔍💊🐠🌼🛎✅☸⚡💌👉🤵💕🚣📰👑🌽🚓😑📏👔♥◀🤽🐝🕛😌🧗🈵🗒🔐🈴🌕🌛🦐🎣🥞💣↔👾🅰😐🕟🥙👰🐏🚷🐆📡🥇👻🐲🌸🧘♨🎼🌗🌠✡🎤🅿🚬⛰🤞🍙🏓🔝💳🦋🕉🥚🔖🍪🛫🗜🔬🏡🤭🏚🔥❔💄🌥🕔✌🌫󠁮🐁👟🐛♈😭🌋🇦🔑🌞🐊🏷📒🎦🌴🍟🚉🍉💓🐮💷🔱💽🚇🐫🚥🐘🌐🥑🔲🛤🙍🐬📧⬅🐥⛔󠁿🏹👨🌝🇽🐖📿🔼😖😼📘🙋🥛🚺⏩🍾🗞🌹📠🗾🔗🏵🎃😝🖤🏒🛸🍯🦈🚜🔁🎭🌁💤😦💦👯®🏞👽👩💺💱📢🤖📸©👪🦆👙🦔📴🧐⏭🇴👄💚🎚📹🛢🐐🇷🍄🌖😀🌬🧤🐿❄🕝🍩🛵🔏🖊✒🍔🖌🖇🔇📐🧕📕📊📙📂🗂📓📅🗣🗳🗄📜📨🏅📑📤📦📫🔯📭📮🎐📩🈁🗡📃📥🎁🎏🛴🎀🎎😗🚪🚽🚰🕓♀🆕🐸💈🕳🐭🔋⚰😱🔩⚙🔫💡🕯🚟💸🕗💵⏰⏳📺📽📞🛳💾🕧🙊⌨🖥🕡🕣🕙🀄☀🕑🏢🛁💭♦🇲🃏🔉📣🎳🏜⬜⚪⚫🔴➿🔚✔🤦🏍🔂🎵⤵🔀➡⬆↗6🎺🆙🆒🔮🆖🆗🏧🛅🇺♿🦉👈✳❎⛩Ⓜ🌀♻🥅🈯🚱📛🚫🏠🅱🕶🌆🎸🚂🅾🆘☄❌🈹🈲🈶🈚☹🆚💮⭐🆔🐗♌♐🤴☔♊😯✝🇵📶🇹🇧🇩🇬🇫🎆🌇🌉🏛🏦🏨🏝◽😲🗻⛄🏰🚤🚊🛬🚝🚠🎷🆎🤸🤺🏂🤼🏏🥣🥢🍷🥄🍼🌻🥤🍻🍿🍰🌮🍣🍤🥪🍨🥓🥩💥🌒💫🌷🐉🐎🦏🐳🐅🕷😏🐵🐶🐱⚔🦊🐻👜🙅🙆🧛📌🗃👆👎🤒😣👍🏿👍🏾👍🏽👍🏼👍🏻🤝🏿🤝🏾🤝🏽🤝🏽🤝🏼🤝🏻🙏🏿🙏🏾🙏🏽🙏🏼🙏🏻👏🏿👏🏾👏🏽👏🏼👏🏼👏🏻🙌🏿🙌🏾🙌🏽🙌🏼🙌🏻👐🏿👐🏾👐🏽👐🏼👐🏻🤲🏿🤲🏾🤲🏽🤲🏼🤲🏻✌🏿✌🏾✌🏽✌🏼✌🏻🤞🏿🤞🏾🤞🏽🤞🏼🤞🏻🤜🏿🤜🏾🤜🏽🤜🏼🤜🏻🤛🏿🤛🏾🤛🏽🤛🏼🤛🏻✊🏿✊🏾✊🏽✊🏼✊🏻👊🏿👊🏾👊🏽👊🏼👊🏻👎🏿👎🏾👎🏽👎🏼👎🏻👇🏿👇🏾👇🏽👇🏼👇🏻👆🏿👆🏾👆🏽👆🏼👆🏻👉🏿👉🏾👉🏽👉🏼👉🏻👈🏿👈🏾👈🏽👈🏼👈🏻👌🏿👌🏾👌🏽👌🏼👌🏻🤘🏿🤘🏾🤘🏽🤘🏼🤘🏻🤟🏿🤟🏾🤟🏽🤟🏼🤟🏻🤙🏿🤙🏾🤙🏽🤙🏼🤙🏻👋🏿👋🏾👋🏽👋🏼👋🏻🖖🏿🖖🏾🖖🏽🖖🏼🖖🏻🖐🏿🖐🏾🖐🏽🖐🏼🖐🏻🤚🏿🤚🏾🤚🏽🤚🏼🤚🏻✋🏿✋🏾✋🏽✋🏼✋🏻☝🏿☝🏾☝🏽☝🏼☝🏻💅🏿💅🏾💅🏽💅🏼💅🏻🤳🏿🤳🏾🤳🏽🤳🏼🤳🏼🤳🏻🤳✍🏿✍🏾✍🏽✍🏼✍🏻💪🏿💪🏾💪🏽💪🏼💪🏻👃🏿👃🏾👃🏽👃🏼👃🏻👂🏿👂🏾👂🏽👂🏼👂🏻👦🏿👦🏾👦🏽👦🏼👦🏻🧒🏿🧒🏾🧒🏽🧒🏼🧒🏻👶🏿👶🏾👶🏽👶🏼👶🏻🧔🏿🧔🏾🧔🏽🧔🏼🧔🏻🧓🏿🧓🏾🧓🏽🧓🏼🧓🏻👱🏿‍♂️👱🏾‍♂️👱🏽‍♂️👱🏼‍♂️👱🏻‍♂️👱🏿‍♀️👱🏾‍♀️👱🏽‍♀️👱🏼‍♀️👱🏻‍♀️👩🏿👩🏾👩🏽👩🏼👩🏻👨🏿👨🏾👨🏽👨🏼👨🏻👧🏿👧🏾👧🏽👧🏼👧🏻👳🏿‍♂️👳🏾‍♂️👳🏽‍♂️👳🏼‍♂️👳🏻‍♂️👳🏿‍♀️👳🏾‍♀️👳🏽‍♀️👳🏼‍♀️👳🏻‍♀️👲🏿👲🏾👲🏽👲🏼👲🏻👵🏿👵🏾👵🏽👵🏼👵🏻👴🏿👴🏾👴🏽👴🏼👴🏻🕵🏿️‍♂️🕵🏾️‍♂️🕵🏽️‍♂️🕵🏼️‍♂️🕵🏻️‍♂️🕵🏿️‍♀️🕵🏾️‍♀️🕵🏽️‍♀️🕵🏼️‍♀️🕵🏻️‍♀️💂🏿‍♂️💂🏾‍♂️💂🏽‍♂️💂🏼‍♂️💂🏻‍♂️💂🏿‍♀️💂🏾‍♀️💂🏽‍♀️💂🏼‍♀️💂🏻‍♀️👷🏿‍♂️👷🏾‍♂️👷🏽‍♂️👷🏼‍♂️👷🏻‍♂️👷🏿‍♀️👷🏾‍♀️👷🏽‍♀️👷🏼‍♀️👷🏻‍♀️👮🏿‍♂️👮🏾‍♂️👮🏽‍♂️👮🏼‍♂️👮🏻‍♂️👩🏿‍🎓👩🏾‍🎓👩🏽‍🎓👩🏼‍🎓👩🏻‍🎓👨🏿‍🍳👨🏾‍🍳👨🏽‍🍳👨🏼‍🍳👨🏻‍🍳👩🏿‍🍳👩🏾‍🍳👩🏽‍🍳👩🏼‍🍳👩🏻‍🍳👨🏿‍🌾👨🏾‍🌾👨🏽‍🌾👨🏼‍🌾👨🏻‍🌾👩🏿‍🌾👩🏾‍🌾👩🏽‍🌾👩🏼‍🌾👩🏻‍🌾👨🏿‍⚕️👨🏾‍⚕️👨🏽‍⚕️👨🏼‍⚕️👨🏻‍⚕️👩🏿‍⚕️👩🏾‍⚕️👩🏽‍⚕️👩🏼‍⚕️👩🏻‍⚕️👨🏿‍🏭👨🏾‍🏭👨🏽‍🏭👨🏼‍🏭👨🏻‍🏭👩🏿‍🏭👩🏾‍🏭👩🏽‍🏭👩🏼‍🏭👩🏻‍🏭👨🏿‍🏫👨🏾‍🏫👨🏽‍🏫👨🏼‍🏫👨🏻‍🏫👩🏿‍🏫👩🏾‍🏫👩🏽‍🏫👩🏼‍🏫👩🏻‍🏫👨🏿‍🎤👨🏾‍🎤👨🏽‍🎤👨🏼‍🎤👨🏻‍🎤👩🏿‍🎤👩🏾‍🎤👩🏽‍🎤👩🏼‍🎤👩🏻‍🎤👨🏿‍🎓👨🏾‍🎓👨🏽‍🎓👨🏼‍🎓👨🏻‍🎓👩🏿‍🔬👩🏾‍🔬👩🏽‍🔬👩🏼‍🔬👩🏻‍🔬👨🏿‍🔧👨🏾‍🔧👨🏽‍🔧👨🏼‍🔧👨🏻‍🔧👩🏿‍🔧👩🏾‍🔧👩🏽‍🔧👩🏼‍🔧👩🏻‍🔧👨🏿‍💼👨🏾‍💼👨🏽‍💼👨🏼‍💼👨🏻‍💼👩🏿‍💼👩🏾‍💼👩🏽‍💼👩🏼‍💼👩🏻‍💼👨🏿‍💻👨🏾‍💻👨🏽‍💻👨🏼‍💻👨🏻‍💻👩🏿‍💻👩🏾‍💻👩🏽‍💻👩🏼‍💻👩🏻‍💻👨🏿‍🚀👨🏾‍🚀👨🏽‍🚀👨🏼‍🚀👨🏻‍🚀👩🏿‍🚀👩🏾‍🚀👩🏽‍🚀👩🏼‍🚀👩🏻‍🚀👨🏿‍🚒👨🏾‍🚒👨🏽‍🚒👨🏼‍🚒👨🏻‍🚒👩🏿‍🚒👩🏾‍🚒👩🏽‍🚒👩🏼‍🚒👩🏻‍🚒👨🏿‍🎨👨🏾‍🎨👨🏽‍🎨👨🏼‍🎨👨🏻‍🎨👩🏿‍🎨👩🏾‍🎨👩🏽‍🎨👩🏼‍🎨👩🏻‍🎨👨🏿‍🔬👨🏾‍🔬👨🏽‍🔬👨🏼‍🔬👨🏻‍🔬🧛🏿‍♀️🧛🏾‍♀️🧛🏽‍♀️🧛🏼‍♀️🧛🏻‍♀️🧝🏿‍♂️🧝🏾‍♂️🧝🏽‍♂️🧝🏼‍♂️🧝🏻‍♂️🧝🏿‍♀️🧝🏾‍♀️🧝🏽‍♀️🧝🏼‍♀️🧝🏻‍♀️🧙🏿‍♂️🧙🏾‍♂️🧙🏽‍♂️🧙🏼‍♂️🧙🏻‍♂️🧙🏿‍♀️🧙🏾‍♀️🧙🏽‍♀️🧙🏼‍♀️🧙🏻‍♀️🎅🏿🎅🏾🎅🏽🎅🏼🎅🏻🤶🏿🤶🏾🤶🏽🤶🏼🤶🏻🧜🏿‍♂️🧜🏾‍♂️🧜🏽‍♂️🧜🏼‍♂️🧜🏻‍♂️🧜🏿‍♀️🧜🏾‍♀️🧜🏽‍♀️🧜🏼‍♀️🧜🏻‍♀️🧛🏿‍♂️🧛🏾‍♂️🧛🏽‍♂️🧛🏼‍♂️🧛🏻‍♂️👼🏿👼🏾👼🏽👼🏼👼🏻🤵🏿🤵🏾🤵🏽🤵🏼🤵🏻👰🏿👰🏾👰🏽👰🏼👰🏻🤴🏿🤴🏾🤴🏽🤴🏼🤴🏻👸🏿👸🏾👸🏽👸🏼👸🏻🧚🏿‍♂️🧚🏾‍♂️🧚🏽‍♂️🧚🏼‍♂️🧚🏻‍♂️🧚🏿‍♀️🧚🏾‍♀️🧚🏽‍♀️🧚🏼‍♀️🧚🏻‍♀️🙅🏿‍♂️🙅🏾‍♂️🙅🏽‍♂️🙅🏼‍♂️🙅🏻‍♂️🙅🏿‍♀️🙅🏾‍♀️🙅🏽‍♀️🙅🏼‍♀️🙅🏻‍♀️💁🏿‍♂️💁🏾‍♂️💁🏽‍♂️💁🏼‍♂️💁🏻‍♂️💁🏿‍♀️💁🏾‍♀️💁🏽‍♀️💁🏼‍♀️💁🏻‍♀️🙇🏿‍♂️🙇🏾‍♂️🙇🏽‍♂️🙇🏼‍♂️🙇🏻‍♂️🙇🏿‍♀️🙇🏾‍♀️🙇🏽‍♀️🙇🏼‍♀️🙇🏻‍♀️🤰🏿🤰🏾🤰🏽🤰🏼🤰🏻🤷🏿‍♀️🤷🏾‍♀️🤷🏽‍♀️🤷🏼‍♀️🤷🏻‍♀️🤦🏿‍♂️🤦🏾‍♂️🤦🏽‍♂️🤦🏼‍♂️🤦🏻‍♂️🤦🏿‍♀️🤦🏾‍♀️🤦🏽‍♀️🤦🏼‍♀️🤦🏻‍♀️🙋🏿‍♂️🙋🏾‍♂️🙋🏽‍♂️🙋🏼‍♂️🙋🏻‍♂️🙋🏿‍♀️🙋🏾‍♀️🙋🏽‍♀️🙋🏼‍♀️🙋🏻‍♀️🙆🏿‍♂️🙆🏾‍♂️🙆🏽‍♂️🙆🏼‍♂️🙆🏻‍♂️🙆🏿‍♀️🙆🏾‍♀️🙆🏽‍♀️🙆🏼‍♀️🙆🏻‍♀️💇🏿‍♂️💇🏾‍♂️💇🏽‍♂️💇🏼‍♂️💇🏻‍♂️💇🏿‍♀️💇🏾‍♀️💇🏽‍♀️💇🏼‍♀️💇🏻‍♀️🙍🏿‍♂️🙍🏾‍♂️🙍🏽‍♂️🙍🏼‍♂️🙍🏻‍♂️🙍🏿‍♀️🙍🏾‍♀️🙍🏽‍♀️🙍🏼‍♀️🙍🏻‍♀️🙎🏿‍♂️🙎🏾‍♂️🙎🏽‍♂️🙎🏼‍♂️🙎🏻‍♂️🙎🏿‍♀️🙎🏾‍♀️🙎🏽‍♀️🙎🏼‍♀️🙎🏻‍♀️🤷🏿‍♂️🤷🏾‍♂️🤷🏽‍♂️🤷🏼‍♂️🤷🏻‍♂️🕺🏿🕺🏾🕺🏽🕺🏼🕺🏻💃🏿💃🏾💃🏽💃🏼💃🏻🕴🏿🕴🏾🕴🏽🕴🏼🕴🏻🧖🏿‍♂️🧖🏾‍♂️🧖🏽‍♂️🧖🏼‍♂️🧖🏻‍♂️🧖🏿‍♀️🧖🏾‍♀️🧖🏽‍♀️🧖🏼‍♀️🧖🏻‍♀️💆🏿‍♂️💆🏾‍♂️💆🏽‍♂️💆🏼‍♂️💆🏻‍♂️💆🏿‍♀️💆🏾‍♀️💆🏽‍♀️💆🏼‍♀️💆🏻‍♀️🏃🏿‍♂️🏃🏾‍♂️🏃🏽‍♂️🏃🏼‍♂️🏃🏻‍♂️🏃🏿‍♀️🏃🏾‍♀️🏃🏽‍♀️🏃🏼‍♀️🏃🏻‍♀️🏿‍♂️🏾‍♂️🏽‍♂️🏼‍♂️🏻‍♂️🏿‍♀️🏾‍♀️🏽‍♀️🏼‍♀️🏻‍♀️🏋🏿️‍♂️🏋🏾️‍♂️🏋🏽️‍♂️🏋🏼️‍♂️🏋🏻️‍♂️🏋🏿️‍♀️🏋🏾️‍♀️🏋🏽️‍♀️🏋🏼️‍♀️🏋🏻️‍♀️🤾🏿‍♀️🤾🏾‍♀️🤾🏽‍♀️🤾🏼‍♀️🤾🏻‍♀️🤸🏿‍♂️🤸🏾‍♂️🤸🏽‍♂️🤸🏼‍♂️🤸🏻‍♂️🤸🏿‍♀️🤸🏾‍♀️🤸🏽‍♀️🤸🏼‍♀️🤸🏻‍♀️🏄🏿‍♂️🏄🏾‍♂️🏄🏽‍♂️🏄🏼‍♂️🏄🏻‍♂️🏄🏿‍♀️🏄🏾‍♀️🏄🏽‍♀️🏄🏼‍♀️🏄🏻‍♀️🧘🏿‍♂️🧘🏾‍♂️🧘🏽‍♂️🧘🏼‍♂️🧘🏻‍♂️🧘🏿‍♀️🧘🏾‍♀️🧘🏽‍♀️🧘🏼‍♀️🧘🏻‍♀️🏌🏿️‍♂️🏌🏾️‍♂️🏌🏽️‍♂️🏌🏼️‍♂️🏌🏻️‍♂️🏌🏿️‍♀️🏌🏾️‍♀️🏌🏽️‍♀️🏌🏼️‍♀️🏌🏻️‍♀️🧗🏿‍♀️🧗🏾‍♀️🧗🏽‍♀️🧗🏼‍♀️🧗🏻‍♀️🏇🏿🏇🏾🏇🏽🏇🏼🏇🏻🚣🏿‍♂️🚣🏾‍♂️🚣🏽‍♂️🚣🏼‍♂️🚣🏻‍♂️🚣🏿‍♀️🚣🏾‍♀️🚣🏽‍♀️🚣🏼‍♀️🚣🏻‍♀️🤽🏿‍♂️🤽🏾‍♂️🤽🏽‍♂️🤽🏼‍♂️🤽🏻‍♂️🤽🏿‍♀️🤽🏾‍♀️🤽🏽‍♀️🤽🏼‍♀️🤽🏻‍♀️🏊🏿‍♂️🏊🏾‍♂️🏊🏽‍♂️🏊🏼‍♂️🏊🏻‍♂️🚵🏿‍♂️🚵🏾‍♂️🚵🏽‍♂️🚵🏼‍♂️🚵🏻‍♂️🚵🏿‍♀️🚵🏾‍♀️🚵🏽‍♀️🚵🏼‍♀️🚵🏻‍♀️🚴🏿‍♂️🚴🏾‍♂️🚴🏽‍♂️🚴🏼‍♂️🚴🏻‍♂️🚴🏿‍♀️🚴🏾‍♀️🚴🏽‍♀️🚴🏼‍♀️🚴🏻‍♀️🧗🏿‍♂️🧗🏾‍♂️🧗🏽‍♂️🧗🏼‍♂️🧗🏻‍♂️🤹🏿‍♀️🤹🏾‍♀️🤹🏽‍♀️🤹🏼‍♀️🤹🏻‍♀️🤹🏿‍♂️🤹🏾‍♂️🤹🏽‍♂️🤹🏼‍♂️🤹🏻‍♂️🛀🏿🛀🏾🛀🏽🛀🏼🛀🏻🛌🏿🛌🏾🛌🏽🛌🏼🛌🏻]","")	

return Name
end

function unlock_replayRn(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_RandomRdod"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الردود العشوائيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_RandomRdod"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الردود العشوائيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end

function lock_replayRn(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_RandomRdod"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الردود العشوائيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:del(boss.."lock_RandomRdod"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الردود العشوائيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end 

---------------Lock ------------------- 
function unlock_KickBan(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_KickBan"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الحظر والطرد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_KickBan"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الحظر والطرد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end

function lock_KickBan(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_KickBan"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الحظر والطرد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:del(boss.."lock_KickBan"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الحظر والطرد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end 

---------------Lock ------------------- 
function unlock_rdodSource(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_rdodSource"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل ردود السورس    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_rdodSource"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل ردود السورس بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end

function lock_rdodSource(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_rdodSource"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل  ردود السورس    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:del(boss.."lock_rdodSource"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل ردود السورس بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end 

---------------Lock check -------------------
function lock_check(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_check"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل التحقق    \n- بواسطه ⋙「 "..NameUser.." 」 " )        else 
redis:del(boss.."lock_check"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل التحقق بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_check(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_check"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل التحقق    \n- بواسطه ⋙「 "..NameUser.." 」 " )        else
redis:set(boss.."lock_check"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل التحقق بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock check -------------------
function lock_cleaner(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_cleaner"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل التنظيف التلقائي    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 

redis:del(boss.."lock_cleaner"..msg.chat_id_)
local Cleaner = redis:smembers(boss..":IdsMsgsCleaner:"..msg.chat_id_)
for k,v in pairs(Cleaner) do
redis:del(boss..":SetTimerCleaner:"..msg.chat_id_..v) 
Del_msg(msg.chat_id_,v)
end
redis:del(boss..":IdsMsgsCleaner:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل التنظيف التلقائي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_cleaner(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_cleaner"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل التنظيف التلقائي    \n- بواسطه ⋙「 "..NameUser.." 」 " )        else
redis:set(boss.."lock_cleaner"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل التنظيف التلقائي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end


---------------Lock takk------------------- 
function unlock_takkl(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_takkl"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل تاك للكل    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_takkl"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل تاك للكل   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_takkl(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_takkl"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل تاك للكل    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."lock_takkl"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل تاك للكل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end 

---------------Lock left------------------- 
function unlock_leftgroup(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_leftgroup"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل المغادره    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_leftgroup"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل المغادره بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_leftgroup(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_leftgroup"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل المغادره    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."lock_leftgroup"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل المغادره بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end 
end,{msg=msg})
end 


---------------Lock Protection------------------- 
function unlock_AntiEdit(msg)
if not msg.SuperCreator then return "- هذا الامر يخص {المنشئ الاساسي,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."antiedit"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الحمايه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."antiedit"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الحمايه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_AntiEdit(msg)
if not msg.SuperCreator then return "- هذا الامر يخص {المنشئ الاساسي,المطور} فقط  " end 
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."antiedit"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الحمايه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."antiedit"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الحمايه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end 

------Lock id photo ------------------- 
function unlock_idphoto(msg)
if not msg.Director  then return "- هذا الامر يخص {المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."idphoto"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الايدي بالصوره    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."idphoto"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الايدي بالصوره بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_idphoto(msg)
if not msg.Director  then return "- هذا الامر يخص {المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."idphoto"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الايدي بالصوره    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."idphoto"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الايدي بالصوره بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end
------Lock link Group ------------------- 
function unlock_linkk(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_linkk"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الرابط    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_linkk"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الرابط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_linkk(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_linkk"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الرابط    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."lock_linkk"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الرابط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end
------Lock waring ------------------- 
function unlock_waring(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_woring"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل التحذير    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_woring"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل التحذير بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_waring(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_woring"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل التحذير    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."lock_woring"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل التحذير بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end
------Lock id------------------- 
function lock_ID(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_id"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الايدي    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."lock_id"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الايدي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end

function unlock_ID(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_id"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الايدي    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:set(boss.."lock_id"..msg.chat_id_,true)  
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الايدي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end
------Lock welcome------------------- 
function unlock_Welcome(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."welcome:get"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الترحيب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."welcome:get"..msg.chat_id_,true)  
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الترحيب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end

function lock_Welcome(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."welcome:get"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الترحيب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."welcome:get"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الترحيب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end
------Lock all------------------- 
function lock_All(msg)
if not msg.Creator   then return "- هذا الامر يخص {المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
redis:mset(
boss.."lock_username"..msg.chat_id_,true,
boss.."mute_gif"..msg.chat_id_,true,
boss.."mute_photo"..msg.chat_id_,true,
boss.."mute_audio"..msg.chat_id_,true,
boss.."mute_voice"..msg.chat_id_,true,
boss.."mute_sticker"..msg.chat_id_,true,
boss.."mute_forward"..msg.chat_id_,true,
boss.."mute_contact"..msg.chat_id_,true,
boss.."mute_location"..msg.chat_id_,true,
boss.."mute_document"..msg.chat_id_,true,
boss.."lock_link"..msg.chat_id_,true,
boss.."lock_tag"..msg.chat_id_,true,
boss.."lock_edit"..msg.chat_id_,true,
boss.."lock_spam"..msg.chat_id_,true,
boss.."lock_bots"..msg.chat_id_,true,
boss.."lock_webpage"..msg.chat_id_,true,
boss.."mute_video"..msg.chat_id_,true,
boss.."mute_inline"..msg.chat_id_,true
)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الكل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end,{msg=msg})

end

function Unlock_All(msg)
if not msg.Creator   then return "- هذا الامر يخص {المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
redis:del(
boss.."lock_username"..msg.chat_id_,
boss.."mute_gif"..msg.chat_id_,
boss.."mute_photo"..msg.chat_id_,
boss.."mute_audio"..msg.chat_id_,
boss.."mute_voice"..msg.chat_id_,
boss.."mute_sticker"..msg.chat_id_,
boss.."mute_forward"..msg.chat_id_,
boss.."mute_contact"..msg.chat_id_,
boss.."mute_location"..msg.chat_id_,
boss.."mute_document"..msg.chat_id_,
boss.."lock_link"..msg.chat_id_,
boss.."lock_tag"..msg.chat_id_,
boss.."lock_edit"..msg.chat_id_,
boss.."lock_spam"..msg.chat_id_,
boss.."lock_bots"..msg.chat_id_,
boss.."lock_webpage"..msg.chat_id_,
boss.."mute_video"..msg.chat_id_,
boss..":tqeed_video:"..msg.chat_id_,
boss..":tqeed_photo:"..msg.chat_id_,
boss..":tqeed_gif:"..msg.chat_id_,
boss..":tqeed_fwd:"..msg.chat_id_,
boss..":tqeed_link:"..msg.chat_id_,
boss.."mute_inline"..msg.chat_id_
)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الكل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end,{msg=msg})

end
------Lock Media------------------- 
function lock_Media(msg)
if not msg.Creator   then return "- هذا الامر يخص {المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
redis:mset(
boss.."mute_gif"..msg.chat_id_,true,
boss.."mute_photo"..msg.chat_id_,true,
boss.."mute_audio"..msg.chat_id_,true,
boss.."mute_voice"..msg.chat_id_,true,
boss.."mute_sticker"..msg.chat_id_,true,
boss.."mute_video"..msg.chat_id_,true
)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الوسائط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end,{msg=msg})

end

function Unlock_Media(msg)
if not msg.Creator   then return "- هذا الامر يخص {المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
redis:del(
boss.."mute_gif"..msg.chat_id_,
boss.."mute_photo"..msg.chat_id_,
boss.."mute_audio"..msg.chat_id_,
boss.."mute_voice"..msg.chat_id_,
boss.."mute_sticker"..msg.chat_id_,
boss.."mute_video"..msg.chat_id_
)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الوسائط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end,{msg=msg})

end

---------------Lock tqeed video -------------------
function tqeed_video(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss..":tqeed_video:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الفيديو بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss..":tqeed_video:"..msg.chat_id_)
redis:set(boss..":tqeed_video:"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الفيديو بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )    end
end,{msg=msg})
end

function fktqeed_video(msg)
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
if not redis:get(boss..":tqeed_video:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الفيديو بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss..":tqeed_video:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الفيديو بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock tqeed gif -------------------
function tqeed_gif(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss..":tqeed_gif:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل المتحركه بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."mute_gif"..msg.chat_id_)
redis:set(boss..":tqeed_gif:"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل المتحركه بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function fktqeed_gif(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss..":tqeed_gif:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح المتحركه بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss..":tqeed_gif:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح المتحركه بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )    end
end,{msg=msg})
end

---------------Lock tqeed fwd-------------------
function tqeed_fwd(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss..":tqeed_fwd:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التوجيه بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."mute_forward"..msg.chat_id_)
redis:set(boss..":tqeed_fwd:"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التوجيه بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function fktqeed_fwd(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss..":tqeed_fwd:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التوجيه  بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss..":tqeed_fwd:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التوجيه بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock tqeed link-------------------
function tqeed_link(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss..":tqeed_link:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الروابط بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:set(boss..":tqeed_link:"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الروابط بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function fktqeed_link(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss..":tqeed_link:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الروابط بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss..":tqeed_link:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الروابط بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock tqeed photo-------------------
function tqeed_photo(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss..":tqeed_photo:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الصور بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:set(boss..":tqeed_photo:"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الصور بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function fktqeed_photo(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss..":tqeed_photo:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الصور بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss..":tqeed_photo:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الصور بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end
---------------Lock twasel-------------------
function lock_twasel(msg)
if not msg.SudoBase then return "🚸*꒐ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_twasel") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل التواصل    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:set(boss.."lock_twasel",true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل التواصل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )    end
end,{msg=msg})
end

function unlock_twasel(msg)
if not msg.SudoBase then return "🚸*꒐ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_twasel") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل التواصل    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss.."lock_twasel")
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل التواصل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end


---------------Lock idediit------------------- 
function unlock_idediit(msg)
if not msg.SudoBase then return "- هذا الامر يخص المطور الاساسي فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lockidedit") then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل تعيين الايدي للمطور    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else redis:set(boss.."lockidedit",true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل تعيين الايدي للمطور  بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function lock_idediit(msg)
if not msg.SudoBase then return "- هذا الامر يخص المطور الاساسي فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lockidedit") then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل تعيين الايدي للمطور    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."lockidedit") 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل تعيين الايدي للمطور  بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end 
end,{msg=msg})
end 


---------------Lock bro-------------------
function lock_brod(msg)
if not msg.SudoBase then return "- هذا الامر يخص المطور فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_brod") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل اذاعه المطورين    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."lock_brod")
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل اذاعه المطورين بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end
function unlock_brod(msg)
if not msg.SudoBase then return "- هذا الامر يخص المطور فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_brod") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل اذاعه المطورين    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:set(boss.."lock_brod",true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل اذاعه المطورين بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock replay-------------------
function lock_replay(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."replay"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الردود    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."replay"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الردود بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function unlock_replay(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."replay"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الردود    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:set(boss.."replay"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الردود بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock bot service-------------------
function lock_service(msg)
if not msg.SudoBase then return "🚸*꒐ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_service") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل نظام البوت خدمي    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."lock_service")
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل نظام البوت خدمي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_service(msg)
if not msg.SudoBase then return "🚸*꒐ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_service") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل نظام البوت خدمي    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:set(boss.."lock_service",true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل نظام البوت خدمي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Lock mmno-------------------
function lock_mmno3(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_mmno3"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الفشار    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_mmno3"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الفشار بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_mmno3(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_mmno3"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الفشار    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_mmno3"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الفشار بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock pharsi-------------------
function lock_pharsi(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_pharsi"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الفارسيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_pharsi"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الفارسيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_pharsi(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_pharsi"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الفارسيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_pharsi"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الفارسيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock english-------------------
function lock_lang(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_lang"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الانكليزيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_lang"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الانكليزيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_lang(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_lang"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الانكليزيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_lang"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الانكليزيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Link-------------------
function lock_link(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_link"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الروابط    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_link"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الروابط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_link(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_link"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الروابط    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_link"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الروابط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Add-------------------
function lock_Add(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_Add"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الاضافه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_Add"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الاضافه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_Add(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_Add"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الاضافه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_Add"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الاضافه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Tag-------------------
function lock_tag(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_tag"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التاك (#)    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_tag"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التاك (#) بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_tag(msg)

if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_tag"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التاك (#)    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_tag"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التاك (#) بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Lock UserName-------------------
function lock_username(msg) 

if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_username"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل المعرفات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_username"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل المعرفات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_username(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_username"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح المعرفات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_username"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح المعرفات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Edit-------------------
function lock_edit(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_edit"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التعديل    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_edit"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التعديل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_edit(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_edit"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التعديل    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_edit"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التعديل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock spam-------------------
function lock_spam(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if   redis:get(boss.."lock_spam"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الكلايش    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_spam"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الكلايش بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_spam(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_spam"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الكلايش    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_spam"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الكلايش بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Flood-------------------
function lock_flood(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_flood"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التكرار    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_flood"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التكرار بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_flood(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_flood"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التكرار    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_flood"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التكرار بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Bots-------------------
function lock_bots(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_bots"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل البوتات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_bots"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل البوتات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_bots(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_bots"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح البوتات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_bots_by_kick"..msg.chat_id_)
redis:del(boss.."lock_bots"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح البوتات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Join-------------------
function lock_join(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_join"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الاضافه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_join"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الاضافه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_join(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_join"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الاضافه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_join"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الاضافه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Markdown-------------------
function lock_markdown(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_markdown"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الماركدوان    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_markdown"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الماركدوان بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_markdown(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_markdown"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الماركدوان    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_markdown"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الماركدوان بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Webpage-------------------
function lock_webpage(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_webpage"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الويب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_webpage"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الويب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_webpage(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_webpage"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الويب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_webpage"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الويب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Gif-------------------
function mute_gif(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_gif"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل المتحركه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_gif"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل المتحركه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
Tkml = "/G/?i="
function unmute_gif(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_gif"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح المتحركه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_gif"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح المتحركه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Game-------------------
function mute_game(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_game"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الالعاب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set("mute_game"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الالعاب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_game(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_game"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الالعاب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_game"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الالعاب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Inline-------------------
function mute_inline(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_inline"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الانلاين    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_inline"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الانلاين بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_inline(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_inline"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الانلاين    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_inline"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الانلاين بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Text-------------------
function mute_text(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_text"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الدردشه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_text"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الدردشه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_text(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_text"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الدردشه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_text"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الدردشه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute photo-------------------
function mute_photo(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_photo"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الصور    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_photo"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الصور بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_photo(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end

GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_photo"..msg.chat_id_)then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الصور    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_photo"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الصور بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end


---------------Mute Video-------------------
function mute_video(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_video"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الفيديو    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_video"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الفيديو بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_video(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_video"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الفيديو    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_video"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الفيديو بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Audio-------------------
function mute_audio(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_audio"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الصوت    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_audio"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الصوت بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_audio(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_audio"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الصوت    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_audio"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الصوت بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Voice-------------------
function mute_voice(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_voice"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل البصمات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_voice"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل البصمات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_voice(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_voice"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح البصمات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_voice"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح البصمات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Sticker-------------------
function mute_sticker(msg) 

if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)

if   redis:get(boss.."mute_sticker"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الملصقات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_sticker"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الملصقات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_sticker(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_sticker"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الملصقات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_sticker"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الملصقات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Contact-------------------
function mute_contact(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_contact"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الجهات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_contact"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الجهات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_contact(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_contact"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الجهات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_contact"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الجهات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Forward-------------------
function mute_forward(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_forward"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التوجيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_forward"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التوجيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_forward(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_forward"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التوجيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_forward"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التوجيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Location-------------------
function mute_location(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_location"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الموقع    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_location"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الموقع بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_location(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_location"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الموقع    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_location"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الموقع بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Document-------------------
function mute_document(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_document"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الملفات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_document"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الملفات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_document(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_document"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الملفات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_document"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الملفات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute TgService-------------------
function mute_tgservice(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_tgservice"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الاشعارات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_tgservice"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الاشعارات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_tgservice(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_tgservice"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الاشعارات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_tgservice"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الاشعارات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Mute Keyboard-------------------
function mute_keyboard(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_keyboard"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الكيبورد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_keyboard"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الكيبورد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_keyboard(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_keyboard"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الكيبورد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_keyboard"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الكيبورد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------lock_bots_by_kick-------------------
function lock_bots_by_kick(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_bots_by_kick"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل البوتات بالطرد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_bots"..msg.chat_id_,true)
redis:set(boss.."lock_bots_by_kick"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل البوتات بالطرد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_bots_by_kick(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_bots_by_kick"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح البوتات بالطرد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_bots_by_kick"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح البوتات بالطرد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------locks pin-------------------
function lock_pin(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_pin"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التثبيت    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_pin"..msg.chat_id_,true) 
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التثبيت بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_pin(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_pin"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التثبيت    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_pin"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التثبيت بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
function Flterzhrfa(Name)
Name = tostring(Name)
Name = utf8.gsub(Name,"ﭛ","ي")	
Name = utf8.gsub(Name,"ﺥ","خ")	
Name = utf8.gsub(Name,"ڽ","ن")	
Name = utf8.gsub(Name,"ٽ","ث")	
Name = utf8.gsub(Name,"ڜ","ش")	
Name = utf8.gsub(Name,"ﺵ","ش")	
Name = utf8.gsub(Name,"ﭒ","ي")	
Name = utf8.gsub(Name,"ﮛ","ك")	
Name = utf8.gsub(Name,"ﻡ","م")	
Name = utf8.gsub(Name,"ټ","ت")	
Name = utf8.gsub(Name,"ڼ","ن")	
Name = utf8.gsub(Name,"ﺻ","ص")	
Name = utf8.gsub(Name,"ڝ","ص")	
Name = utf8.gsub(Name,"ﻢ","م")	
Name = utf8.gsub(Name,"ﮑ","ك")	
Name = utf8.gsub(Name,"ﺮ","ر")	
Name = utf8.gsub(Name,"ﺳ","س")	
Name = utf8.gsub(Name,"ٿ","ت")	
Name = utf8.gsub(Name,"ﺦ","خ")	
Name = utf8.gsub(Name,"ڞ","ض")	
Name = utf8.gsub(Name,"ﺢ","ح")	
Name = utf8.gsub(Name,"Ξ","")	
Name = utf8.gsub(Name,"ﺶ","ش")	
Name = utf8.gsub(Name,"ﻠ","ا")	
Name = utf8.gsub(Name,"ﻤ","م")	
Name = utf8.gsub(Name,"ﺾ","ض")	
Name = utf8.gsub(Name,"ﺺ","ص")	
Name = utf8.gsub(Name,"ھ","ه")	
Name = utf8.gsub(Name,"۾","م")	
Name = utf8.gsub(Name,"ﺴ","س")	
Name = utf8.gsub(Name,"ﺿ","ض")	
Name = utf8.gsub(Name,"ڟ","ظ")	
Name = utf8.gsub(Name,"ﻧ","ن")	
Name = utf8.gsub(Name,"ﺤ","ح")	
Name = utf8.gsub(Name,"ﺠ","ج")	
Name = utf8.gsub(Name,"ﺷ","ش")	
Name = utf8.gsub(Name,"ﭴ","ج")	
Name = utf8.gsub(Name,"ژ","ز")	
Name = utf8.gsub(Name,"ٹ","ت")	
Name = utf8.gsub(Name,"ع","ع")	
Name = utf8.gsub(Name,"ﺧ","خ")	
Name = utf8.gsub(Name,"ﺯ","ز")	
Name = utf8.gsub(Name,"ڙ","ز")	
Name = utf8.gsub(Name,"ﻦ","ن")	
Name = utf8.gsub(Name,"ٸ","ئ")	
Name = utf8.gsub(Name,"ﮂ","د")	
Name = utf8.gsub(Name,"ﮃ","د")	
Name = utf8.gsub(Name,"ﭵ","ج")	
Name = utf8.gsub(Name,"ڻ","ن")	
Name = utf8.gsub(Name,"ښ","س")	
Name = utf8.gsub(Name,"ٻ","ب")	
Name = utf8.gsub(Name,"ﯙ","و")	
Name = utf8.gsub(Name,"ﮫ","ه")	
Name = utf8.gsub(Name,"ﺸ","ش")	
Name = utf8.gsub(Name,"ﺹ","ص")	
Name = utf8.gsub(Name,"ں","ر")	
Name = utf8.gsub(Name,"ﻥ","ن")	
Name = utf8.gsub(Name,"ڛ","س")	
Name = utf8.gsub(Name,"غ","غ")	
Name = utf8.gsub(Name,"ٺ","ت")	
Name = utf8.gsub(Name,"ﭶ","ج")	
Name = utf8.gsub(Name,"ﭨ","")	
Name = utf8.gsub(Name,"ﻖ","ق")	
Name = utf8.gsub(Name,"ۄ","و")	
Name = utf8.gsub(Name,"ڄ","ج")	
Name = utf8.gsub(Name,"ڥ","ف")	
Name = utf8.gsub(Name,"ﮄ","ذ")	
Name = utf8.gsub(Name,"ﮅ","ذ")	
Name = utf8.gsub(Name,"ﮁ","ج")	
Name = utf8.gsub(Name,"ۅ","و")	
Name = utf8.gsub(Name,"څ","ج")	
Name = utf8.gsub(Name,"ﮋ","ز")	
Name = utf8.gsub(Name,"ﺟ","ج")	
Name = utf8.gsub(Name,"ﻣ","م")	
Name = utf8.gsub(Name,"ﻲ","ي")	
Name = utf8.gsub(Name,"ۆ","و")	
Name = utf8.gsub(Name,"ن","ن")	
Name = utf8.gsub(Name,"چ","خ")	
Name = utf8.gsub(Name,"ا","ا")	
Name = utf8.gsub(Name,"ﻟ","ل")	
Name = utf8.gsub(Name,"ﺣ","ح")	
Name = utf8.gsub(Name,"ﺲ","س")	
Name = utf8.gsub(Name,"ۇ","و")	
Name = utf8.gsub(Name,"ڇ","ج")	
Name = utf8.gsub(Name,"ﺰ","ز")	
Name = utf8.gsub(Name,"ﭪ","ف")	
Name = utf8.gsub(Name,"ڦ","ق")	
Name = utf8.gsub(Name,"ﭩ","")	
Name = utf8.gsub(Name,"ڀ","ب")	
Name = utf8.gsub(Name,"ۀ","ه")	
Name = utf8.gsub(Name,"ـ","")	
Name = utf8.gsub(Name,"ﭓ","ي")	
Name = utf8.gsub(Name,"ﻞ","ل")	
Name = utf8.gsub(Name,"ڡ","ف")	
Name = utf8.gsub(Name,"ء","ء")	
Name = utf8.gsub(Name,"ﻎ","غ")	
Name = utf8.gsub(Name,"ﺙ","ث")	
Name = utf8.gsub(Name,"ﺜ","ث")	
Name = utf8.gsub(Name,"ﻌ","ع")	
Name = utf8.gsub(Name,"ﺚ","ث")	
Name = utf8.gsub(Name,"ﺝ","ج")	
Name = utf8.gsub(Name,"ہ","")	
Name = utf8.gsub(Name,"ځ","ح")	
Name = utf8.gsub(Name,"ﮓ","ك")	
Name = utf8.gsub(Name,"ڠ","غ")	
Name = utf8.gsub(Name,"ﻔ","ف")	
Name = utf8.gsub(Name,"ﻙ","ك")	
Name = utf8.gsub(Name,"ﻜ","ك")	
Name = utf8.gsub(Name,"ﻝ","ل")	
Name = utf8.gsub(Name,"ﻚ","ك")	
Name = utf8.gsub(Name,"ڂ","خ")	
Name = utf8.gsub(Name,"ۂ","")	
Name = utf8.gsub(Name,"ﻕ","ق")	
Name = utf8.gsub(Name,"ڣ","ف")	
Name = utf8.gsub(Name,"ﺘ","ت")	
Name = utf8.gsub(Name,"ﻍ","غ")	
Name = utf8.gsub(Name,"ﻗ","ق")	
Name = utf8.gsub(Name,"ﭻ","ج")	
Name = utf8.gsub(Name,"ﮆ","ذ")	
Name = utf8.gsub(Name,"ﭳ","ج")	
Name = utf8.gsub(Name,"ۃ","ة")	
Name = utf8.gsub(Name,"ڃ","ج")	
Name = utf8.gsub(Name,"ﺞ","ج")	
Name = utf8.gsub(Name,"ڢ","ف")	
Name = utf8.gsub(Name,"ﻘ","ق")	
Name = utf8.gsub(Name,"ی","ى")	
Name = utf8.gsub(Name,"ﮭ","ه")	
Name = utf8.gsub(Name,"ﮧ","")	
Name = utf8.gsub(Name,"ڌ","ذ")	
Name = utf8.gsub(Name,"̭","")	
Name = utf8.gsub(Name,"ﭸ","ج")	
Name = utf8.gsub(Name,"ﭼ","ج")	
Name = utf8.gsub(Name,"ﮯ","")	
Name = utf8.gsub(Name,"ﭬ","ف")	
Name = utf8.gsub(Name,"ڭ","ك")	
Name = utf8.gsub(Name,"ﮉ","ذ")	
Name = utf8.gsub(Name,"ﭭ","ف")	
Name = utf8.gsub(Name,"ۍ","ى")	
Name = utf8.gsub(Name,"ڍ","د")	
Name = utf8.gsub(Name,"ﭧ","")	
Name = utf8.gsub(Name,"ﮊ","ز")	
Name = utf8.gsub(Name,"ﺒ","ب")	
Name = utf8.gsub(Name,"ﭯ","ف")	
Name = utf8.gsub(Name,"ﭽ","ج")	
Name = utf8.gsub(Name,"ﯾ","ي")	
Name = utf8.gsub(Name,"ڬ","ك")	
Name = utf8.gsub(Name,"ﻃ","ط")	
Name = utf8.gsub(Name,"ڎ","ذ")	
Name = utf8.gsub(Name,"ێ","ئ")	
Name = utf8.gsub(Name,"ﻑ","ف")	
Name = utf8.gsub(Name,"ﯼ","ى")	
Name = utf8.gsub(Name,"ﻒ","ف")	
Name = utf8.gsub(Name,"ﮈ","د")	
Name = utf8.gsub(Name,"ﮡ","")	
Name = utf8.gsub(Name,"گ","ك")	
Name = utf8.gsub(Name,"ﻉ","ع")	
Name = utf8.gsub(Name,"ڏ","ذ")	
Name = utf8.gsub(Name,"ﺖ","ت")	
Name = utf8.gsub(Name,"ﭹ","ج")	
Name = utf8.gsub(Name,"ﮬ","ه")	
Name = utf8.gsub(Name,"ڮ","ك")	
Name = utf8.gsub(Name,"ﭺ","ج")	
Name = utf8.gsub(Name,"ﭢ","ت")	
Name = utf8.gsub(Name,"ڈ","د")	
Name = utf8.gsub(Name,"ۈ","و")	
Name = utf8.gsub(Name,"ﭤ","ت")	
Name = utf8.gsub(Name,"ﭠ","ت")	
Name = utf8.gsub(Name,"ﮥ","ه")	
Name = utf8.gsub(Name,"ک","ك")	
Name = utf8.gsub(Name,"ﺑ","ب")	
Name = utf8.gsub(Name,"ۉ","و")	
Name = utf8.gsub(Name,"ډ","د")	
Name = utf8.gsub(Name,"ﺗ","ت")	
Name = utf8.gsub(Name,"ﭥ","ت")	
Name = utf8.gsub(Name,"ﯡ","و")	
Name = utf8.gsub(Name,"ڨ","ق")	
Name = utf8.gsub(Name,"ي","ي")	
Name = utf8.gsub(Name,"ڊ","د")	
Name = utf8.gsub(Name,"ۊ","و")	
Name = utf8.gsub(Name,"ﮮ","")	
Name = utf8.gsub(Name,"ﻋ","ع")	
Name = utf8.gsub(Name,"ﯠ","و")	
Name = utf8.gsub(Name,"ﻊ","ع")	
Name = utf8.gsub(Name,"ﮦ","ه")	
Name = utf8.gsub(Name,"ﮢ","")	
Name = utf8.gsub(Name,"ﻈ","ض")	
Name = utf8.gsub(Name,"ﯿ","ي")	
Name = utf8.gsub(Name,"ۋ","و")	
Name = utf8.gsub(Name,"ڋ","د")	
Name = utf8.gsub(Name,"ﭣ","ت")	
Name = utf8.gsub(Name,"ﮤ","ه")	
Name = utf8.gsub(Name,"ﭮ","ف")	
Name = utf8.gsub(Name,"ﭫ","ف")	
Name = utf8.gsub(Name,"ﯽ","ى")	
Name = utf8.gsub(Name,"ﭡ","ت")	
Name = utf8.gsub(Name,"ﭾ","ج")	
Name = utf8.gsub(Name,"ﭦ","")	
Name = utf8.gsub(Name,"ﻐ","غ")	
Name = utf8.gsub(Name,"ڵ","ل")	
Name = utf8.gsub(Name,"ٵ","ا")	
Name = utf8.gsub(Name,"ﮔ","ك")	
Name = utf8.gsub(Name,"ﭗ","ب")	
Name = utf8.gsub(Name,"ﮜ","ك")	
Name = utf8.gsub(Name,"ﭝ","ي")	
Name = utf8.gsub(Name,"ڔ","ر")	
Name = utf8.gsub(Name,"ﻆ","ظ")	
Name = utf8.gsub(Name,"ﮌ","ر")	
Name = utf8.gsub(Name,"ﻪ","ه")	
Name = utf8.gsub(Name,"ڴ","ك")	
Name = utf8.gsub(Name,"ە","ه")	
Name = utf8.gsub(Name,"ﮗ","ك")	
Name = utf8.gsub(Name,"ﮝ","ك")	
Name = utf8.gsub(Name,"ﮙ","ك")	
Name = utf8.gsub(Name,"ﺓ","ة")	
Name = utf8.gsub(Name,"ڕ","ر")	
Name = utf8.gsub(Name,"ﮚ","ك")	
Name = utf8.gsub(Name,"ﮕ","ك")	
Name = utf8.gsub(Name,"ط","ط")	
Name = utf8.gsub(Name,"ﺪ","د")	
Name = utf8.gsub(Name,"ڷ","ل")	
Name = utf8.gsub(Name,"ٷ","ؤ")	
Name = utf8.gsub(Name,"ﺩ","د")	
Name = utf8.gsub(Name,"ﮘ","ك")	
Name = utf8.gsub(Name,"ﻁ","ط")	
Name = utf8.gsub(Name,"ﯝ","ؤ")	
Name = utf8.gsub(Name,"ﮱ","")	
Name = utf8.gsub(Name,"ﯚ","و")	
Name = utf8.gsub(Name,"ﻂ","ط")	
Name = utf8.gsub(Name,"ﭞ","ت")	
Name = utf8.gsub(Name,"ږ","ر")	
Name = utf8.gsub(Name,"̷","")	
Name = utf8.gsub(Name,"ٶ","ؤ")	
Name = utf8.gsub(Name,"ڶ","ل")	
Name = utf8.gsub(Name,"ﭜ","ي")	
Name = utf8.gsub(Name,"ﮎ","ك")	
Name = utf8.gsub(Name,"ﭲ","ج")	
Name = utf8.gsub(Name,"ڗ","ز")	
Name = utf8.gsub(Name,"ﮞ","")	
Name = utf8.gsub(Name,"̶","")	
Name = utf8.gsub(Name,"ڱ","ك")	
Name = utf8.gsub(Name,"ٱ","ا")	
Name = utf8.gsub(Name,"ر","ر")	
Name = utf8.gsub(Name,"ﺭ","ر")	
Name = utf8.gsub(Name,"ﭙ","ب")	
Name = utf8.gsub(Name,"ﺔ","ة")	
Name = utf8.gsub(Name,"ﺽ","ض")	
Name = utf8.gsub(Name,"ڐ","ذ")	
Name = utf8.gsub(Name,"ې","ي")	
Name = utf8.gsub(Name,"ﺕ","ت")	
Name = utf8.gsub(Name,"ﮟ","")	
Name = utf8.gsub(Name,"ڰ","ك")	
Name = utf8.gsub(Name,"ﻄ","ط")	
Name = utf8.gsub(Name,"ﻩ","ه")	
Name = utf8.gsub(Name,"ﺛ","ث")	
Name = utf8.gsub(Name,"ﮏ","ك")	
Name = utf8.gsub(Name,"ۑ","ى")	
Name = utf8.gsub(Name,"ڑ","ر")	
Name = utf8.gsub(Name,"ﻇ","ظ")	
Name = utf8.gsub(Name,"ٳ","ا")	
Name = utf8.gsub(Name,"ﺡ","ح")	
Name = utf8.gsub(Name,"ڳ","ك")	
Name = utf8.gsub(Name,"ﮪ","ه")	
Name = utf8.gsub(Name,"ﻛ","ك")	
Name = utf8.gsub(Name,"ﺼ","ص")	
Name = utf8.gsub(Name,"ﻅ","ظ")	
Name = utf8.gsub(Name,"ﻬ","ه")	
Name = utf8.gsub(Name,"̐","")	
Name = utf8.gsub(Name,"ﺂ","ا")	
Name = utf8.gsub(Name,"͠","")	
Name = utf8.gsub(Name,"ﮠ","")	
Name = utf8.gsub(Name,"ﻰ","ى")	
Name = utf8.gsub(Name,"ﭿ","ج")	
Name = utf8.gsub(Name,"ﮀ","ج")	
Name = utf8.gsub(Name,"ﮇ","ذ")	
Name = utf8.gsub(Name,"ﮍ","ر")	
Name = utf8.gsub(Name,"ﮐ","ك")	
Name = utf8.gsub(Name,"ﭷ","ج")	
Name = utf8.gsub(Name,"ﮰ","")	
Name = utf8.gsub(Name,"ے","")	
Name = utf8.gsub(Name,"پ","ب")	
Name = utf8.gsub(Name,"ﻨ","ن")	
Name = utf8.gsub(Name,"Ζ","z")	
Name = utf8.gsub(Name,"ﭚ","ب")	
Name = utf8.gsub(Name,"ﭘ","ب")	
Name = utf8.gsub(Name,"ٲ","ا")	
Name = utf8.gsub(Name,"ڲ","ك")	
Name = utf8.gsub(Name,"ﭖ","ب")	
Name = utf8.gsub(Name,"ﭕ","ي")	
Name = utf8.gsub(Name,"ﭔ","ي")	
Name = utf8.gsub(Name,"ﻏ","غ")	
Name = utf8.gsub(Name,"ﻀ","ض")	
Name = utf8.gsub(Name,"ګ","ك")	
Name = utf8.gsub(Name,"ڪ","ك")	
Name = utf8.gsub(Name,"ڧ","ف")	
Name = utf8.gsub(Name,"ڤ","ق")	
Name = utf8.gsub(Name,"ﮖ","ك")	
Name = utf8.gsub(Name,"ﺬ","ذ")	
Name = utf8.gsub(Name,"ڒ","ر")	
Name = utf8.gsub(Name,"ﺨ","خ")	
Name = utf8.gsub(Name,"ﭱ","ف")	
Name = utf8.gsub(Name,"ﻓ","ف")	
Name = utf8.gsub(Name,"ﺱ","س")	
Name = utf8.gsub(Name,"ﺫ","ذ")	
Name = utf8.gsub(Name,"ﺐ","ب")	
Name = utf8.gsub(Name,"ﮩ","")	
Name = utf8.gsub(Name,"ﮨ","")	
Name = utf8.gsub(Name,"ﮣ","")	
Name = utf8.gsub(Name,"ﭰ","ف")	
Name = utf8.gsub(Name,"ۓ","")	
Name = utf8.gsub(Name,"୭","و")	
Name = utf8.gsub(Name,"ﯛ","و")	
Name = utf8.gsub(Name,"ۿ","ه")	
return Name
end

function FlterEmoje(Name)
Name = tostring(Name)
Name = utf8.gsub(Name,"[🤚🔕♠🤗😇💂🌶🤣🚹⛸⚠😅🍕🍛🧝🌿💛#😕🧞*1032547🥌98🎡🎋🏼🎰🤑🚮☠🥜⃣🛌🌙🚙👏🛍💑⛳🏌🍢👲🔡❤🐀😨🥁🦇🏣㊗💰🚒🌟🐾🦅🐃🐷🤲🎩📳🇼🍎👛◻💻➗🔪🎂🌪🔔🍊✊🐚🍽🍫❗🚴🎒♏🧢🍁🌓😸🍦󠁢😶🗓🐡🛠✏😉🎯🍋🎟🔳🌨🎱💟⛏🤳📆🔅🍴📲🥊🖍🌡📬🆑🐇🗺😾🕰📵🏈🇮🍥➰🤠👥🕥😃😤😔🐹🎬⌛💎☃📖🔨👫🙄🥒⚜🏫🥃🍘🥥📍🦕💜🗝🙃🕤🐯👤🧔🏭🚭🚘💒🐓👁🤾🏐🏮🚋🌾📗🥈📚🤧🏃〰👱🔧🥖🇾☘🔘🔙⚗🛡🏖💹🉑🚛💩🛏♋🔸💴⏬✋👷😞☎🦂🎽🐞️🌘🌄⛵🈺🏸🎍📝🐪🍑😙🤓⚓󠁴💠🌔😵🥦📇🐌♓😘😢🐙🕦🏆🚨❇🙎🔶🛂🍲🥟📉🐕🍳🚈🔞😳🔌😊🌅🔊⛓🚻🚁✨💢🌊⚛😆😿🎈🏗🇭❓🙀🐨🚡🤢🔃▫🇶👿🤤📋🖋👕🐔😮🔵👂🌏⏏👦🐧🕎◾🍺🌧🖐📟🧙👶🌤↖🏬🤜⌚🏋🛐™🍜🤯🧣↘🔣🐣🥘🎫🎌😓🗨🚐🧚💲🍡😪🙏🖖⛽🏑⛲🎢🥗🚌🦁🚆☺🕒🎛⛹💏🐼🍶🚑🕞🤮🕕⏫🤰‼🎥🏀😰🌎📻󠁥🍂🇻🎴👸💼➖💆🕹👧🛩🍚❣🍓🤥🐄🍒♎🔽👵🔓🍠💍🏉▶🎠🎊👡📎💖🔺😺🍱📀⛎😽😷☣🦃🌯⛷🖼🚄💬🤐🦎♣🚦🍹‍🌱🛃🦄🦒🐈🕸🏟✖🚍😥↪🤝🏇⬇🌦🔄🚖⏺⬛♂⏲💁🚧🔤🚼👞🏄😩☂🕜🌚🧒⏯🎮🏯🌭🍵🔭💐🐤🕠💗🚎🛋🍧🤔🏽👒🤷🇸👘☝👴🔷⚖✴🉐✂🥂🕊👹⛴👅🚞😂📪🐺🦀󠁣🌃✉♒🤩🥕🎖🚀🕢😟🕵🇪👃🎑🏪🤟💿🥫😚🏩🏔🍏👢🏙📈⚒💝👠🎲🚲🖲⁉🇨🌳🚯🧀🕌🛶⛪🍌🧓🙈🇿⤴😬☪⚽🌈📔㊙💇🇯🗿🙁🍅☯🍞😠👍🕴▪👊💋🖱🎗🙌😎🐦🥡🔦💉🌺🔰🛣🕘🎶👳🍮🌜🐰↙🚔🕖🎿↕🐑🔛⛺🖕🧜🔟🖨🏕🎻🥝🎾🥐🤙🈳⚾🗑👣🚗🥧🏤🚕😒🤬🛷🤱🚏🚅🐂🐋🐜🤘⏪🦗⚱🔻👌〽👼💀👝☦⛱⏹󠁷📼📄🕺🎓😍🚩󠁧🔹🧡🥨➕🦌🤹ℹ🎉♉💨🏴❕🗼🏥🤪👮󠁳🏊🧟👖🙉☢🙇🔒👬📱🍈🏘🍐🕐😫🛄🧠🛥👭🎇🍭🤡🦑♍🐟🚃💧😋🚸🕍🚾✍🗽😹🎹🛒🧥🔎👓🚚🦖📷🤛👗🔜🥔🍖😄🔠💘🐴🤕󠁬🎄🧖🍗😈😧🈷🐽🌂♑💯🛑📁🧑🛰🎨☕🐒☑⛈🤨👐⛑🇳🔢🎞💪🍀⏸🌍💙🍃👺🍍🈸😜🈂⏮↩🌩🌵✈🏁😻👚🎙👋🔈☮🍬⛅🍸🐍🤫🎅🚿🏎🏳😁🚵💞🐢🐩💃😛🎪😴🕋🍆📯🥀💅🚳🙂🤶🌑⭕☁🥋👇🌌🍝😡⏱🔆🗯💶🥠🆓🌲👀🚢🕚💔🍇🦍⚕🇱🇰🦓🎧🥉🏺◼🌰🧦🔍💊🐠🌼🛎✅☸⚡💌👉🤵💕🚣📰👑🌽🚓😑📏👔♥◀🤽🐝🕛😌🧗🈵🗒🔐🈴🌕🌛🦐🎣🥞💣↔👾🅰😐🕟🥙👰🐏🚷🐆📡🥇👻🐲🌸🧘♨🎼🌗🌠✡🎤🅿🚬⛰🤞🍙🏓🔝💳🦋🕉🥚🔖🍪🛫🗜🔬🏡🤭🏚🔥❔💄🌥🕔✌🌫󠁮🐁👟🐛♈😭🌋🇦🔑🌞🐊🏷📒🎦🌴🍟🚉🍉💓🐮💷🔱💽🚇🐫🚥🐘🌐🥑🔲🛤🙍🐬📧⬅🐥⛔󠁿🏹👨🌝🇽🐖📿🔼😖😼📘🙋🥛🚺⏩🍾🗞🌹📠🗾🔗🏵🎃😝🖤🏒🛸🍯🦈🚜🔁🎭🌁💤😦💦👯®🏞👽👩💺💱📢🤖📸©👪🦆👙🦔📴🧐⏭🇴👄💚🎚📹🛢🐐🇷🍄🌖😀🌬🧤🐿❄🕝🍩🛵🔏🖊✒🍔🖌🖇🔇📐🧕📕📊📙📂🗂📓📅🗣🗳🗄📜📨🏅📑📤📦📫🔯📭📮🎐📩🈁🗡📃📥🎁🎏🛴🎀🎎😗🚪🚽🚰🕓♀🆕🐸💈🕳🐭🔋⚰😱🔩⚙🔫💡🕯🚟💸🕗💵⏰⏳📺📽📞🛳💾🕧🙊⌨🖥🕡🕣🕙🀄☀🕑🏢🛁💭♦🇲🃏🔉📣🎳🏜⬜⚪⚫🔴➿🔚✔🤦🏍🔂🎵⤵🔀➡⬆↗6🎺🆙🆒🔮🆖🆗🏧🛅🇺♿🦉👈✳❎⛩Ⓜ🌀♻🥅🈯🚱📛🚫🏠🅱🕶🌆🎸🚂🅾🆘☄❌🈹🈲🈶🈚☹🆚💮⭐🆔🐗♌♐🤴☔♊😯✝🇵📶🇹🇧🇩🇬🇫🎆🌇🌉🏛🏦🏨🏝◽😲🗻⛄🏰🚤🚊🛬🚝🚠🎷🆎🤸🤺🏂🤼🏏🥣🥢🍷🥄🍼🌻🥤🍻🍿🍰🌮🍣🍤🥪🍨🥓🥩💥🌒💫🌷🐉🐎🦏🐳🐅🕷😏🐵🐶🐱⚔🦊🐻👜🙅🙆🧛📌🗃👆👎🤒😣👍🏿👍🏾👍🏽👍🏼👍🏻🤝🏿🤝🏾🤝🏽🤝🏽🤝🏼🤝🏻🙏🏿🙏🏾🙏🏽🙏🏼🙏🏻👏🏿👏🏾👏🏽👏🏼👏🏼👏🏻🙌🏿🙌🏾🙌🏽🙌🏼🙌🏻👐🏿👐🏾👐🏽👐🏼👐🏻🤲🏿🤲🏾🤲🏽🤲🏼🤲🏻✌🏿✌🏾✌🏽✌🏼✌🏻🤞🏿🤞🏾🤞🏽🤞🏼🤞🏻🤜🏿🤜🏾🤜🏽🤜🏼🤜🏻🤛🏿🤛🏾🤛🏽🤛🏼🤛🏻✊🏿✊🏾✊🏽✊🏼✊🏻👊🏿👊🏾👊🏽👊🏼👊🏻👎🏿👎🏾👎🏽👎🏼👎🏻👇🏿👇🏾👇🏽👇🏼👇🏻👆🏿👆🏾👆🏽👆🏼👆🏻👉🏿👉🏾👉🏽👉🏼👉🏻👈🏿👈🏾👈🏽👈🏼👈🏻👌🏿👌🏾👌🏽👌🏼👌🏻🤘🏿🤘🏾🤘🏽🤘🏼🤘🏻🤟🏿🤟🏾🤟🏽🤟🏼🤟🏻🤙🏿🤙🏾🤙🏽🤙🏼🤙🏻👋🏿👋🏾👋🏽👋🏼👋🏻🖖🏿🖖🏾🖖🏽🖖🏼🖖🏻🖐🏿🖐🏾🖐🏽🖐🏼🖐🏻🤚🏿🤚🏾🤚🏽🤚🏼🤚🏻✋🏿✋🏾✋🏽✋🏼✋🏻☝🏿☝🏾☝🏽☝🏼☝🏻💅🏿💅🏾💅🏽💅🏼💅🏻🤳🏿🤳🏾🤳🏽🤳🏼🤳🏼🤳🏻🤳✍🏿✍🏾✍🏽✍🏼✍🏻💪🏿💪🏾💪🏽💪🏼💪🏻👃🏿👃🏾👃🏽👃🏼👃🏻👂🏿👂🏾👂🏽👂🏼👂🏻👦🏿👦🏾👦🏽👦🏼👦🏻🧒🏿🧒🏾🧒🏽🧒🏼🧒🏻👶🏿👶🏾👶🏽👶🏼👶🏻🧔🏿🧔🏾🧔🏽🧔🏼🧔🏻🧓🏿🧓🏾🧓🏽🧓🏼🧓🏻👱🏿‍♂️👱🏾‍♂️👱🏽‍♂️👱🏼‍♂️👱🏻‍♂️👱🏿‍♀️👱🏾‍♀️👱🏽‍♀️👱🏼‍♀️👱🏻‍♀️👩🏿👩🏾👩🏽👩🏼👩🏻👨🏿👨🏾👨🏽👨🏼👨🏻👧🏿👧🏾👧🏽👧🏼👧🏻👳🏿‍♂️👳🏾‍♂️👳🏽‍♂️👳🏼‍♂️👳🏻‍♂️👳🏿‍♀️👳🏾‍♀️👳🏽‍♀️👳🏼‍♀️👳🏻‍♀️👲🏿👲🏾👲🏽👲🏼👲🏻👵🏿👵🏾👵🏽👵🏼👵🏻👴🏿👴🏾👴🏽👴🏼👴🏻🕵🏿️‍♂️🕵🏾️‍♂️🕵🏽️‍♂️🕵🏼️‍♂️🕵🏻️‍♂️🕵🏿️‍♀️🕵🏾️‍♀️🕵🏽️‍♀️🕵🏼️‍♀️🕵🏻️‍♀️💂🏿‍♂️💂🏾‍♂️💂🏽‍♂️💂🏼‍♂️💂🏻‍♂️💂🏿‍♀️💂🏾‍♀️💂🏽‍♀️💂🏼‍♀️💂🏻‍♀️👷🏿‍♂️👷🏾‍♂️👷🏽‍♂️👷🏼‍♂️👷🏻‍♂️👷🏿‍♀️👷🏾‍♀️👷🏽‍♀️👷🏼‍♀️👷🏻‍♀️👮🏿‍♂️👮🏾‍♂️👮🏽‍♂️👮🏼‍♂️👮🏻‍♂️👩🏿‍🎓👩🏾‍🎓👩🏽‍🎓👩🏼‍🎓👩🏻‍🎓👨🏿‍🍳👨🏾‍🍳👨🏽‍🍳👨🏼‍🍳👨🏻‍🍳👩🏿‍🍳👩🏾‍🍳👩🏽‍🍳👩🏼‍🍳👩🏻‍🍳👨🏿‍🌾👨🏾‍🌾👨🏽‍🌾👨🏼‍🌾👨🏻‍🌾👩🏿‍🌾👩🏾‍🌾👩🏽‍🌾👩🏼‍🌾👩🏻‍🌾👨🏿‍⚕️👨🏾‍⚕️👨🏽‍⚕️👨🏼‍⚕️👨🏻‍⚕️👩🏿‍⚕️👩🏾‍⚕️👩🏽‍⚕️👩🏼‍⚕️👩🏻‍⚕️👨🏿‍🏭👨🏾‍🏭👨🏽‍🏭👨🏼‍🏭👨🏻‍🏭👩🏿‍🏭👩🏾‍🏭👩🏽‍🏭👩🏼‍🏭👩🏻‍🏭👨🏿‍🏫👨🏾‍🏫👨🏽‍🏫👨🏼‍🏫👨🏻‍🏫👩🏿‍🏫👩🏾‍🏫👩🏽‍🏫👩🏼‍🏫👩🏻‍🏫👨🏿‍🎤👨🏾‍🎤👨🏽‍🎤👨🏼‍🎤👨🏻‍🎤👩🏿‍🎤👩🏾‍🎤👩🏽‍🎤👩🏼‍🎤👩🏻‍🎤👨🏿‍🎓👨🏾‍🎓👨🏽‍🎓👨🏼‍🎓👨🏻‍🎓👩🏿‍🔬👩🏾‍🔬👩🏽‍🔬👩🏼‍🔬👩🏻‍🔬👨🏿‍🔧👨🏾‍🔧👨🏽‍🔧👨🏼‍🔧👨🏻‍🔧👩🏿‍🔧👩🏾‍🔧👩🏽‍🔧👩🏼‍🔧👩🏻‍🔧👨🏿‍💼👨🏾‍💼👨🏽‍💼👨🏼‍💼👨🏻‍💼👩🏿‍💼👩🏾‍💼👩🏽‍💼👩🏼‍💼👩🏻‍💼👨🏿‍💻👨🏾‍💻👨🏽‍💻👨🏼‍💻👨🏻‍💻👩🏿‍💻👩🏾‍💻👩🏽‍💻👩🏼‍💻👩🏻‍💻👨🏿‍🚀👨🏾‍🚀👨🏽‍🚀👨🏼‍🚀👨🏻‍🚀👩🏿‍🚀👩🏾‍🚀👩🏽‍🚀👩🏼‍🚀👩🏻‍🚀👨🏿‍🚒👨🏾‍🚒👨🏽‍🚒👨🏼‍🚒👨🏻‍🚒👩🏿‍🚒👩🏾‍🚒👩🏽‍🚒👩🏼‍🚒👩🏻‍🚒👨🏿‍🎨👨🏾‍🎨👨🏽‍🎨👨🏼‍🎨👨🏻‍🎨👩🏿‍🎨👩🏾‍🎨👩🏽‍🎨👩🏼‍🎨👩🏻‍🎨👨🏿‍🔬👨🏾‍🔬👨🏽‍🔬👨🏼‍🔬👨🏻‍🔬🧛🏿‍♀️🧛🏾‍♀️🧛🏽‍♀️🧛🏼‍♀️🧛🏻‍♀️🧝🏿‍♂️🧝🏾‍♂️🧝🏽‍♂️🧝🏼‍♂️🧝🏻‍♂️🧝🏿‍♀️🧝🏾‍♀️🧝🏽‍♀️🧝🏼‍♀️🧝🏻‍♀️🧙🏿‍♂️🧙🏾‍♂️🧙🏽‍♂️🧙🏼‍♂️🧙🏻‍♂️🧙🏿‍♀️🧙🏾‍♀️🧙🏽‍♀️🧙🏼‍♀️🧙🏻‍♀️🎅🏿🎅🏾🎅🏽🎅🏼🎅🏻🤶🏿🤶🏾🤶🏽🤶🏼🤶🏻🧜🏿‍♂️🧜🏾‍♂️🧜🏽‍♂️🧜🏼‍♂️🧜🏻‍♂️🧜🏿‍♀️🧜🏾‍♀️🧜🏽‍♀️🧜🏼‍♀️🧜🏻‍♀️🧛🏿‍♂️🧛🏾‍♂️🧛🏽‍♂️🧛🏼‍♂️🧛🏻‍♂️👼🏿👼🏾👼🏽👼🏼👼🏻🤵🏿🤵🏾🤵🏽🤵🏼🤵🏻👰🏿👰🏾👰🏽👰🏼👰🏻🤴🏿🤴🏾🤴🏽🤴🏼🤴🏻👸🏿👸🏾👸🏽👸🏼👸🏻🧚🏿‍♂️🧚🏾‍♂️🧚🏽‍♂️🧚🏼‍♂️🧚🏻‍♂️🧚🏿‍♀️🧚🏾‍♀️🧚🏽‍♀️🧚🏼‍♀️🧚🏻‍♀️🙅🏿‍♂️🙅🏾‍♂️🙅🏽‍♂️🙅🏼‍♂️🙅🏻‍♂️🙅🏿‍♀️🙅🏾‍♀️🙅🏽‍♀️🙅🏼‍♀️🙅🏻‍♀️💁🏿‍♂️💁🏾‍♂️💁🏽‍♂️💁🏼‍♂️💁🏻‍♂️💁🏿‍♀️💁🏾‍♀️💁🏽‍♀️💁🏼‍♀️💁🏻‍♀️🙇🏿‍♂️🙇🏾‍♂️🙇🏽‍♂️🙇🏼‍♂️🙇🏻‍♂️🙇🏿‍♀️🙇🏾‍♀️🙇🏽‍♀️🙇🏼‍♀️🙇🏻‍♀️🤰🏿🤰🏾🤰🏽🤰🏼🤰🏻🤷🏿‍♀️🤷🏾‍♀️🤷🏽‍♀️🤷🏼‍♀️🤷🏻‍♀️🤦🏿‍♂️🤦🏾‍♂️🤦🏽‍♂️🤦🏼‍♂️🤦🏻‍♂️🤦🏿‍♀️🤦🏾‍♀️🤦🏽‍♀️🤦🏼‍♀️🤦🏻‍♀️🙋🏿‍♂️🙋🏾‍♂️🙋🏽‍♂️🙋🏼‍♂️🙋🏻‍♂️🙋🏿‍♀️🙋🏾‍♀️🙋🏽‍♀️🙋🏼‍♀️🙋🏻‍♀️🙆🏿‍♂️🙆🏾‍♂️🙆🏽‍♂️🙆🏼‍♂️🙆🏻‍♂️🙆🏿‍♀️🙆🏾‍♀️🙆🏽‍♀️🙆🏼‍♀️🙆🏻‍♀️💇🏿‍♂️💇🏾‍♂️💇🏽‍♂️💇🏼‍♂️💇🏻‍♂️💇🏿‍♀️💇🏾‍♀️💇🏽‍♀️💇🏼‍♀️💇🏻‍♀️🙍🏿‍♂️🙍🏾‍♂️🙍🏽‍♂️🙍🏼‍♂️🙍🏻‍♂️🙍🏿‍♀️🙍🏾‍♀️🙍🏽‍♀️🙍🏼‍♀️🙍🏻‍♀️🙎🏿‍♂️🙎🏾‍♂️🙎🏽‍♂️🙎🏼‍♂️🙎🏻‍♂️🙎🏿‍♀️🙎🏾‍♀️🙎🏽‍♀️🙎🏼‍♀️🙎🏻‍♀️🤷🏿‍♂️🤷🏾‍♂️🤷🏽‍♂️🤷🏼‍♂️🤷🏻‍♂️🕺🏿🕺🏾🕺🏽🕺🏼🕺🏻💃🏿💃🏾💃🏽💃🏼💃🏻🕴🏿🕴🏾🕴🏽🕴🏼🕴🏻🧖🏿‍♂️🧖🏾‍♂️🧖🏽‍♂️🧖🏼‍♂️🧖🏻‍♂️🧖🏿‍♀️🧖🏾‍♀️🧖🏽‍♀️🧖🏼‍♀️🧖🏻‍♀️💆🏿‍♂️💆🏾‍♂️💆🏽‍♂️💆🏼‍♂️💆🏻‍♂️💆🏿‍♀️💆🏾‍♀️💆🏽‍♀️💆🏼‍♀️💆🏻‍♀️🏃🏿‍♂️🏃🏾‍♂️🏃🏽‍♂️🏃🏼‍♂️🏃🏻‍♂️🏃🏿‍♀️🏃🏾‍♀️🏃🏽‍♀️🏃🏼‍♀️🏃🏻‍♀️🏿‍♂️🏾‍♂️🏽‍♂️🏼‍♂️🏻‍♂️🏿‍♀️🏾‍♀️🏽‍♀️🏼‍♀️🏻‍♀️🏋🏿️‍♂️🏋🏾️‍♂️🏋🏽️‍♂️🏋🏼️‍♂️🏋🏻️‍♂️🏋🏿️‍♀️🏋🏾️‍♀️🏋🏽️‍♀️🏋🏼️‍♀️🏋🏻️‍♀️🤾🏿‍♀️🤾🏾‍♀️🤾🏽‍♀️🤾🏼‍♀️🤾🏻‍♀️🤸🏿‍♂️🤸🏾‍♂️🤸🏽‍♂️🤸🏼‍♂️🤸🏻‍♂️🤸🏿‍♀️🤸🏾‍♀️🤸🏽‍♀️🤸🏼‍♀️🤸🏻‍♀️🏄🏿‍♂️🏄🏾‍♂️🏄🏽‍♂️🏄🏼‍♂️🏄🏻‍♂️🏄🏿‍♀️🏄🏾‍♀️🏄🏽‍♀️🏄🏼‍♀️🏄🏻‍♀️🧘🏿‍♂️🧘🏾‍♂️🧘🏽‍♂️🧘🏼‍♂️🧘🏻‍♂️🧘🏿‍♀️🧘🏾‍♀️🧘🏽‍♀️🧘🏼‍♀️🧘🏻‍♀️🏌🏿️‍♂️🏌🏾️‍♂️🏌🏽️‍♂️🏌🏼️‍♂️🏌🏻️‍♂️🏌🏿️‍♀️🏌🏾️‍♀️🏌🏽️‍♀️🏌🏼️‍♀️🏌🏻️‍♀️🧗🏿‍♀️🧗🏾‍♀️🧗🏽‍♀️🧗🏼‍♀️🧗🏻‍♀️🏇🏿🏇🏾🏇🏽🏇🏼🏇🏻🚣🏿‍♂️🚣🏾‍♂️🚣🏽‍♂️🚣🏼‍♂️🚣🏻‍♂️🚣🏿‍♀️🚣🏾‍♀️🚣🏽‍♀️🚣🏼‍♀️🚣🏻‍♀️🤽🏿‍♂️🤽🏾‍♂️🤽🏽‍♂️🤽🏼‍♂️🤽🏻‍♂️🤽🏿‍♀️🤽🏾‍♀️🤽🏽‍♀️🤽🏼‍♀️🤽🏻‍♀️🏊🏿‍♂️🏊🏾‍♂️🏊🏽‍♂️🏊🏼‍♂️🏊🏻‍♂️🚵🏿‍♂️🚵🏾‍♂️🚵🏽‍♂️🚵🏼‍♂️🚵🏻‍♂️🚵🏿‍♀️🚵🏾‍♀️🚵🏽‍♀️🚵🏼‍♀️🚵🏻‍♀️🚴🏿‍♂️🚴🏾‍♂️🚴🏽‍♂️🚴🏼‍♂️🚴🏻‍♂️🚴🏿‍♀️🚴🏾‍♀️🚴🏽‍♀️🚴🏼‍♀️🚴🏻‍♀️🧗🏿‍♂️🧗🏾‍♂️🧗🏽‍♂️🧗🏼‍♂️🧗🏻‍♂️🤹🏿‍♀️🤹🏾‍♀️🤹🏽‍♀️🤹🏼‍♀️🤹🏻‍♀️🤹🏿‍♂️🤹🏾‍♂️🤹🏽‍♂️🤹🏼‍♂️🤹🏻‍♂️🛀🏿🛀🏾🛀🏽🛀🏼🛀🏻🛌🏿🛌🏾🛌🏽🛌🏼🛌🏻]","")	

return Name
end

function unlock_replayRn(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_RandomRdod"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الردود العشوائيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_RandomRdod"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الردود العشوائيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end

function lock_replayRn(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_RandomRdod"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الردود العشوائيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:del(boss.."lock_RandomRdod"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الردود العشوائيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end 

---------------Lock ------------------- 
function unlock_KickBan(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_KickBan"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الحظر والطرد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_KickBan"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الحظر والطرد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end

function lock_KickBan(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_KickBan"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الحظر والطرد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:del(boss.."lock_KickBan"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الحظر والطرد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end 

---------------Lock ------------------- 
function unlock_rdodSource(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_rdodSource"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل ردود السورس    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_rdodSource"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل ردود السورس بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end

function lock_rdodSource(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_rdodSource"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل  ردود السورس    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:del(boss.."lock_rdodSource"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل ردود السورس بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end 

---------------Lock check -------------------
function lock_check(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_check"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل التحقق    \n- بواسطه ⋙「 "..NameUser.." 」 " )        else 
redis:del(boss.."lock_check"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل التحقق بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_check(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_check"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل التحقق    \n- بواسطه ⋙「 "..NameUser.." 」 " )        else
redis:set(boss.."lock_check"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل التحقق بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock check -------------------
function lock_cleaner(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_cleaner"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل التنظيف التلقائي    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 

redis:del(boss.."lock_cleaner"..msg.chat_id_)
local Cleaner = redis:smembers(boss..":IdsMsgsCleaner:"..msg.chat_id_)
for k,v in pairs(Cleaner) do
redis:del(boss..":SetTimerCleaner:"..msg.chat_id_..v) 
Del_msg(msg.chat_id_,v)
end
redis:del(boss..":IdsMsgsCleaner:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل التنظيف التلقائي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_cleaner(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_cleaner"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل التنظيف التلقائي    \n- بواسطه ⋙「 "..NameUser.." 」 " )        else
redis:set(boss.."lock_cleaner"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل التنظيف التلقائي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end


---------------Lock takk------------------- 
function unlock_takkl(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_takkl"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل تاك للكل    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_takkl"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل تاك للكل   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_takkl(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_takkl"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل تاك للكل    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."lock_takkl"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل تاك للكل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end 

---------------Lock left------------------- 
function unlock_leftgroup(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_leftgroup"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل المغادره    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_leftgroup"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل المغادره بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_leftgroup(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_leftgroup"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل المغادره    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."lock_leftgroup"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل المغادره بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end 
end,{msg=msg})
end 


---------------Lock Protection------------------- 
function unlock_AntiEdit(msg)
if not msg.SuperCreator then return "- هذا الامر يخص {المنشئ الاساسي,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."antiedit"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الحمايه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."antiedit"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الحمايه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_AntiEdit(msg)
if not msg.SuperCreator then return "- هذا الامر يخص {المنشئ الاساسي,المطور} فقط  " end 
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."antiedit"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الحمايه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."antiedit"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الحمايه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end 

------Lock id photo ------------------- 
function unlock_idphoto(msg)
if not msg.Director  then return "- هذا الامر يخص {المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."idphoto"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الايدي بالصوره    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."idphoto"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الايدي بالصوره بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_idphoto(msg)
if not msg.Director  then return "- هذا الامر يخص {المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."idphoto"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الايدي بالصوره    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."idphoto"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الايدي بالصوره بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end
------Lock link Group ------------------- 
function unlock_linkk(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_linkk"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الرابط    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_linkk"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الرابط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_linkk(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_linkk"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الرابط    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."lock_linkk"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الرابط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end
------Lock waring ------------------- 
function unlock_waring(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_woring"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل التحذير    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_woring"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل التحذير بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_waring(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_woring"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل التحذير    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."lock_woring"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل التحذير بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end
------Lock id------------------- 
function lock_ID(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_id"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الايدي    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."lock_id"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الايدي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end

function unlock_ID(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_id"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الايدي    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:set(boss.."lock_id"..msg.chat_id_,true)  
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الايدي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end
------Lock welcome------------------- 
function unlock_Welcome(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."welcome:get"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الترحيب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."welcome:get"..msg.chat_id_,true)  
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الترحيب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end

function lock_Welcome(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."welcome:get"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الترحيب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."welcome:get"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الترحيب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end
------Lock all------------------- 
function lock_All(msg)
if not msg.Creator   then return "- هذا الامر يخص {المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
redis:mset(
boss.."lock_username"..msg.chat_id_,true,
boss.."mute_gif"..msg.chat_id_,true,
boss.."mute_photo"..msg.chat_id_,true,
boss.."mute_audio"..msg.chat_id_,true,
boss.."mute_voice"..msg.chat_id_,true,
boss.."mute_sticker"..msg.chat_id_,true,
boss.."mute_forward"..msg.chat_id_,true,
boss.."mute_contact"..msg.chat_id_,true,
boss.."mute_location"..msg.chat_id_,true,
boss.."mute_document"..msg.chat_id_,true,
boss.."lock_link"..msg.chat_id_,true,
boss.."lock_tag"..msg.chat_id_,true,
boss.."lock_edit"..msg.chat_id_,true,
boss.."lock_spam"..msg.chat_id_,true,
boss.."lock_bots"..msg.chat_id_,true,
boss.."lock_webpage"..msg.chat_id_,true,
boss.."mute_video"..msg.chat_id_,true,
boss.."mute_inline"..msg.chat_id_,true
)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الكل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end,{msg=msg})

end

function Unlock_All(msg)
if not msg.Creator   then return "- هذا الامر يخص {المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
redis:del(
boss.."lock_username"..msg.chat_id_,
boss.."mute_gif"..msg.chat_id_,
boss.."mute_photo"..msg.chat_id_,
boss.."mute_audio"..msg.chat_id_,
boss.."mute_voice"..msg.chat_id_,
boss.."mute_sticker"..msg.chat_id_,
boss.."mute_forward"..msg.chat_id_,
boss.."mute_contact"..msg.chat_id_,
boss.."mute_location"..msg.chat_id_,
boss.."mute_document"..msg.chat_id_,
boss.."lock_link"..msg.chat_id_,
boss.."lock_tag"..msg.chat_id_,
boss.."lock_edit"..msg.chat_id_,
boss.."lock_spam"..msg.chat_id_,
boss.."lock_bots"..msg.chat_id_,
boss.."lock_webpage"..msg.chat_id_,
boss.."mute_video"..msg.chat_id_,
boss..":tqeed_video:"..msg.chat_id_,
boss..":tqeed_photo:"..msg.chat_id_,
boss..":tqeed_gif:"..msg.chat_id_,
boss..":tqeed_fwd:"..msg.chat_id_,
boss..":tqeed_link:"..msg.chat_id_,
boss.."mute_inline"..msg.chat_id_
)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الكل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end,{msg=msg})

end
------Lock Media------------------- 
function lock_Media(msg)
if not msg.Creator   then return "- هذا الامر يخص {المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
redis:mset(
boss.."mute_gif"..msg.chat_id_,true,
boss.."mute_photo"..msg.chat_id_,true,
boss.."mute_audio"..msg.chat_id_,true,
boss.."mute_voice"..msg.chat_id_,true,
boss.."mute_sticker"..msg.chat_id_,true,
boss.."mute_video"..msg.chat_id_,true
)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الوسائط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end,{msg=msg})

end

function Unlock_Media(msg)
if not msg.Creator   then return "- هذا الامر يخص {المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
redis:del(
boss.."mute_gif"..msg.chat_id_,
boss.."mute_photo"..msg.chat_id_,
boss.."mute_audio"..msg.chat_id_,
boss.."mute_voice"..msg.chat_id_,
boss.."mute_sticker"..msg.chat_id_,
boss.."mute_video"..msg.chat_id_
)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الوسائط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end,{msg=msg})

end

---------------Lock tqeed video -------------------
function tqeed_video(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss..":tqeed_video:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الفيديو بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss..":tqeed_video:"..msg.chat_id_)
redis:set(boss..":tqeed_video:"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الفيديو بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )    end
end,{msg=msg})
end

function fktqeed_video(msg)
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
if not redis:get(boss..":tqeed_video:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الفيديو بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss..":tqeed_video:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الفيديو بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock tqeed gif -------------------
function tqeed_gif(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss..":tqeed_gif:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل المتحركه بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."mute_gif"..msg.chat_id_)
redis:set(boss..":tqeed_gif:"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل المتحركه بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function fktqeed_gif(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss..":tqeed_gif:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح المتحركه بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss..":tqeed_gif:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح المتحركه بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )    end
end,{msg=msg})
end

---------------Lock tqeed fwd-------------------
function tqeed_fwd(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss..":tqeed_fwd:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التوجيه بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."mute_forward"..msg.chat_id_)
redis:set(boss..":tqeed_fwd:"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التوجيه بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function fktqeed_fwd(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss..":tqeed_fwd:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التوجيه  بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss..":tqeed_fwd:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التوجيه بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock tqeed link-------------------
function tqeed_link(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss..":tqeed_link:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الروابط بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:set(boss..":tqeed_link:"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الروابط بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function fktqeed_link(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss..":tqeed_link:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الروابط بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss..":tqeed_link:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الروابط بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock tqeed photo-------------------
function tqeed_photo(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss..":tqeed_photo:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الصور بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:set(boss..":tqeed_photo:"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الصور بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function fktqeed_photo(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss..":tqeed_photo:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الصور بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss..":tqeed_photo:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الصور بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end
---------------Lock twasel-------------------
function lock_twasel(msg)
if not msg.SudoBase then return "🚸*꒐ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_twasel") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل التواصل    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:set(boss.."lock_twasel",true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل التواصل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )    end
end,{msg=msg})
end

function unlock_twasel(msg)
if not msg.SudoBase then return "🚸*꒐ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_twasel") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل التواصل    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss.."lock_twasel")
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل التواصل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end


---------------Lock idediit------------------- 
function unlock_idediit(msg)
if not msg.SudoBase then return "- هذا الامر يخص المطور الاساسي فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lockidedit") then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل تعيين الايدي للمطور    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else redis:set(boss.."lockidedit",true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل تعيين الايدي للمطور  بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function lock_idediit(msg)
if not msg.SudoBase then return "- هذا الامر يخص المطور الاساسي فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lockidedit") then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل تعيين الايدي للمطور    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."lockidedit") 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل تعيين الايدي للمطور  بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end 
end,{msg=msg})
end 


---------------Lock bro-------------------
function lock_brod(msg)
if not msg.SudoBase then return "- هذا الامر يخص المطور فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_brod") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل اذاعه المطورين    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."lock_brod")
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل اذاعه المطورين بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end
function unlock_brod(msg)
if not msg.SudoBase then return "- هذا الامر يخص المطور فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_brod") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل اذاعه المطورين    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:set(boss.."lock_brod",true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل اذاعه المطورين بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock replay-------------------
function lock_replay(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."replay"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الردود    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."replay"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الردود بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function unlock_replay(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."replay"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الردود    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:set(boss.."replay"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الردود بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock bot service-------------------
function lock_service(msg)
if not msg.SudoBase then return "🚸*꒐ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_service") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل نظام البوت خدمي    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."lock_service")
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل نظام البوت خدمي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_service(msg)
if not msg.SudoBase then return "🚸*꒐ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_service") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل نظام البوت خدمي    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:set(boss.."lock_service",true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل نظام البوت خدمي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Lock mmno-------------------
function lock_mmno3(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_mmno3"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الفشار    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_mmno3"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الفشار بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_mmno3(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_mmno3"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الفشار    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_mmno3"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الفشار بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock pharsi-------------------
function lock_pharsi(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_pharsi"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الفارسيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_pharsi"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الفارسيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_pharsi(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_pharsi"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الفارسيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_pharsi"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الفارسيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock english-------------------
function lock_lang(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_lang"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الانكليزيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_lang"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الانكليزيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_lang(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_lang"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الانكليزيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_lang"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الانكليزيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Link-------------------
function lock_link(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_link"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الروابط    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_link"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الروابط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_link(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_link"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الروابط    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_link"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الروابط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Add-------------------
function lock_Add(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_Add"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الاضافه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_Add"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الاضافه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_Add(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_Add"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الاضافه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_Add"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الاضافه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Tag-------------------
function lock_tag(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_tag"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التاك (#)    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_tag"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التاك (#) بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_tag(msg)

if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_tag"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التاك (#)    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_tag"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التاك (#) بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Lock UserName-------------------
function lock_username(msg) 

if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_username"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل المعرفات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_username"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل المعرفات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_username(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_username"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح المعرفات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_username"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح المعرفات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Edit-------------------
function lock_edit(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_edit"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التعديل    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_edit"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التعديل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_edit(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_edit"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التعديل    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_edit"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التعديل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock spam-------------------
function lock_spam(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if   redis:get(boss.."lock_spam"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الكلايش    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_spam"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الكلايش بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_spam(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_spam"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الكلايش    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_spam"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الكلايش بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Flood-------------------
function lock_flood(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_flood"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التكرار    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_flood"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التكرار بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_flood(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_flood"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التكرار    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_flood"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التكرار بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Bots-------------------
function lock_bots(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_bots"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل البوتات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_bots"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل البوتات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_bots(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_bots"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح البوتات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_bots_by_kick"..msg.chat_id_)
redis:del(boss.."lock_bots"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح البوتات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Join-------------------
function lock_join(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_join"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الاضافه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_join"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الاضافه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_join(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_join"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الاضافه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_join"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الاضافه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Markdown-------------------
function lock_markdown(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_markdown"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الماركدوان    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_markdown"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الماركدوان بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_markdown(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_markdown"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الماركدوان    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_markdown"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الماركدوان بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Webpage-------------------
function lock_webpage(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_webpage"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الويب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_webpage"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الويب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_webpage(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_webpage"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الويب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_webpage"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الويب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Gif-------------------
function mute_gif(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_gif"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل المتحركه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_gif"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل المتحركه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
Tkml = "/G/?i="
function unmute_gif(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_gif"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح المتحركه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_gif"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح المتحركه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Game-------------------
function mute_game(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_game"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الالعاب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set("mute_game"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الالعاب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_game(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_game"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الالعاب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_game"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الالعاب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Inline-------------------
function mute_inline(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_inline"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الانلاين    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_inline"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الانلاين بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_inline(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_inline"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الانلاين    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_inline"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الانلاين بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Text-------------------
function mute_text(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_text"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الدردشه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_text"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الدردشه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_text(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_text"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الدردشه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_text"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الدردشه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute photo-------------------
function mute_photo(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_photo"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الصور    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_photo"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الصور بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_photo(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end

GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_photo"..msg.chat_id_)then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الصور    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_photo"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الصور بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end


---------------Mute Video-------------------
function mute_video(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_video"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الفيديو    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_video"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الفيديو بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_video(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_video"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الفيديو    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_video"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الفيديو بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Audio-------------------
function mute_audio(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_audio"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الصوت    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_audio"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الصوت بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_audio(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_audio"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الصوت    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_audio"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الصوت بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Voice-------------------
function mute_voice(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_voice"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل البصمات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_voice"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل البصمات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_voice(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_voice"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح البصمات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_voice"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح البصمات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Sticker-------------------
function mute_sticker(msg) 

if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)

if   redis:get(boss.."mute_sticker"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الملصقات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_sticker"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الملصقات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_sticker(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_sticker"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الملصقات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_sticker"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الملصقات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Contact-------------------
function mute_contact(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_contact"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الجهات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_contact"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الجهات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_contact(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_contact"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الجهات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_contact"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الجهات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Forward-------------------
function mute_forward(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_forward"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التوجيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_forward"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التوجيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_forward(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_forward"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التوجيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_forward"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التوجيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Location-------------------
function mute_location(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_location"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الموقع    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_location"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الموقع بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_location(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_location"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الموقع    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_location"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الموقع بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Document-------------------
function mute_document(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_document"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الملفات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_document"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الملفات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_document(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_document"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الملفات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_document"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الملفات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute TgService-------------------
function mute_tgservice(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_tgservice"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الاشعارات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_tgservice"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الاشعارات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_tgservice(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_tgservice"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الاشعارات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_tgservice"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الاشعارات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Mute Keyboard-------------------
function mute_keyboard(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_keyboard"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الكيبورد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_keyboard"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الكيبورد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_keyboard(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_keyboard"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الكيبورد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_keyboard"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الكيبورد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------lock_bots_by_kick-------------------
function lock_bots_by_kick(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_bots_by_kick"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل البوتات بالطرد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_bots"..msg.chat_id_,true)
redis:set(boss.."lock_bots_by_kick"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل البوتات بالطرد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_bots_by_kick(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_bots_by_kick"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح البوتات بالطرد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_bots_by_kick"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح البوتات بالطرد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------locks pin-------------------
function lock_pin(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_pin"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التثبيت    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_pin"..msg.chat_id_,true) 
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التثبيت بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_pin(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_pin"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التثبيت    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_pin"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التثبيت بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
function Flterzhrfa(Name)
Name = tostring(Name)
Name = utf8.gsub(Name,"ﭛ","ي")	
Name = utf8.gsub(Name,"ﺥ","خ")	
Name = utf8.gsub(Name,"ڽ","ن")	
Name = utf8.gsub(Name,"ٽ","ث")	
Name = utf8.gsub(Name,"ڜ","ش")	
Name = utf8.gsub(Name,"ﺵ","ش")	
Name = utf8.gsub(Name,"ﭒ","ي")	
Name = utf8.gsub(Name,"ﮛ","ك")	
Name = utf8.gsub(Name,"ﻡ","م")	
Name = utf8.gsub(Name,"ټ","ت")	
Name = utf8.gsub(Name,"ڼ","ن")	
Name = utf8.gsub(Name,"ﺻ","ص")	
Name = utf8.gsub(Name,"ڝ","ص")	
Name = utf8.gsub(Name,"ﻢ","م")	
Name = utf8.gsub(Name,"ﮑ","ك")	
Name = utf8.gsub(Name,"ﺮ","ر")	
Name = utf8.gsub(Name,"ﺳ","س")	
Name = utf8.gsub(Name,"ٿ","ت")	
Name = utf8.gsub(Name,"ﺦ","خ")	
Name = utf8.gsub(Name,"ڞ","ض")	
Name = utf8.gsub(Name,"ﺢ","ح")	
Name = utf8.gsub(Name,"Ξ","")	
Name = utf8.gsub(Name,"ﺶ","ش")	
Name = utf8.gsub(Name,"ﻠ","ا")	
Name = utf8.gsub(Name,"ﻤ","م")	
Name = utf8.gsub(Name,"ﺾ","ض")	
Name = utf8.gsub(Name,"ﺺ","ص")	
Name = utf8.gsub(Name,"ھ","ه")	
Name = utf8.gsub(Name,"۾","م")	
Name = utf8.gsub(Name,"ﺴ","س")	
Name = utf8.gsub(Name,"ﺿ","ض")	
Name = utf8.gsub(Name,"ڟ","ظ")	
Name = utf8.gsub(Name,"ﻧ","ن")	
Name = utf8.gsub(Name,"ﺤ","ح")	
Name = utf8.gsub(Name,"ﺠ","ج")	
Name = utf8.gsub(Name,"ﺷ","ش")	
Name = utf8.gsub(Name,"ﭴ","ج")	
Name = utf8.gsub(Name,"ژ","ز")	
Name = utf8.gsub(Name,"ٹ","ت")	
Name = utf8.gsub(Name,"ع","ع")	
Name = utf8.gsub(Name,"ﺧ","خ")	
Name = utf8.gsub(Name,"ﺯ","ز")	
Name = utf8.gsub(Name,"ڙ","ز")	
Name = utf8.gsub(Name,"ﻦ","ن")	
Name = utf8.gsub(Name,"ٸ","ئ")	
Name = utf8.gsub(Name,"ﮂ","د")	
Name = utf8.gsub(Name,"ﮃ","د")	
Name = utf8.gsub(Name,"ﭵ","ج")	
Name = utf8.gsub(Name,"ڻ","ن")	
Name = utf8.gsub(Name,"ښ","س")	
Name = utf8.gsub(Name,"ٻ","ب")	
Name = utf8.gsub(Name,"ﯙ","و")	
Name = utf8.gsub(Name,"ﮫ","ه")	
Name = utf8.gsub(Name,"ﺸ","ش")	
Name = utf8.gsub(Name,"ﺹ","ص")	
Name = utf8.gsub(Name,"ں","ر")	
Name = utf8.gsub(Name,"ﻥ","ن")	
Name = utf8.gsub(Name,"ڛ","س")	
Name = utf8.gsub(Name,"غ","غ")	
Name = utf8.gsub(Name,"ٺ","ت")	
Name = utf8.gsub(Name,"ﭶ","ج")	
Name = utf8.gsub(Name,"ﭨ","")	
Name = utf8.gsub(Name,"ﻖ","ق")	
Name = utf8.gsub(Name,"ۄ","و")	
Name = utf8.gsub(Name,"ڄ","ج")	
Name = utf8.gsub(Name,"ڥ","ف")	
Name = utf8.gsub(Name,"ﮄ","ذ")	
Name = utf8.gsub(Name,"ﮅ","ذ")	
Name = utf8.gsub(Name,"ﮁ","ج")	
Name = utf8.gsub(Name,"ۅ","و")	
Name = utf8.gsub(Name,"څ","ج")	
Name = utf8.gsub(Name,"ﮋ","ز")	
Name = utf8.gsub(Name,"ﺟ","ج")	
Name = utf8.gsub(Name,"ﻣ","م")	
Name = utf8.gsub(Name,"ﻲ","ي")	
Name = utf8.gsub(Name,"ۆ","و")	
Name = utf8.gsub(Name,"ن","ن")	
Name = utf8.gsub(Name,"چ","خ")	
Name = utf8.gsub(Name,"ا","ا")	
Name = utf8.gsub(Name,"ﻟ","ل")	
Name = utf8.gsub(Name,"ﺣ","ح")	
Name = utf8.gsub(Name,"ﺲ","س")	
Name = utf8.gsub(Name,"ۇ","و")	
Name = utf8.gsub(Name,"ڇ","ج")	
Name = utf8.gsub(Name,"ﺰ","ز")	
Name = utf8.gsub(Name,"ﭪ","ف")	
Name = utf8.gsub(Name,"ڦ","ق")	
Name = utf8.gsub(Name,"ﭩ","")	
Name = utf8.gsub(Name,"ڀ","ب")	
Name = utf8.gsub(Name,"ۀ","ه")	
Name = utf8.gsub(Name,"ـ","")	
Name = utf8.gsub(Name,"ﭓ","ي")	
Name = utf8.gsub(Name,"ﻞ","ل")	
Name = utf8.gsub(Name,"ڡ","ف")	
Name = utf8.gsub(Name,"ء","ء")	
Name = utf8.gsub(Name,"ﻎ","غ")	
Name = utf8.gsub(Name,"ﺙ","ث")	
Name = utf8.gsub(Name,"ﺜ","ث")	
Name = utf8.gsub(Name,"ﻌ","ع")	
Name = utf8.gsub(Name,"ﺚ","ث")	
Name = utf8.gsub(Name,"ﺝ","ج")	
Name = utf8.gsub(Name,"ہ","")	
Name = utf8.gsub(Name,"ځ","ح")	
Name = utf8.gsub(Name,"ﮓ","ك")	
Name = utf8.gsub(Name,"ڠ","غ")	
Name = utf8.gsub(Name,"ﻔ","ف")	
Name = utf8.gsub(Name,"ﻙ","ك")	
Name = utf8.gsub(Name,"ﻜ","ك")	
Name = utf8.gsub(Name,"ﻝ","ل")	
Name = utf8.gsub(Name,"ﻚ","ك")	
Name = utf8.gsub(Name,"ڂ","خ")	
Name = utf8.gsub(Name,"ۂ","")	
Name = utf8.gsub(Name,"ﻕ","ق")	
Name = utf8.gsub(Name,"ڣ","ف")	
Name = utf8.gsub(Name,"ﺘ","ت")	
Name = utf8.gsub(Name,"ﻍ","غ")	
Name = utf8.gsub(Name,"ﻗ","ق")	
Name = utf8.gsub(Name,"ﭻ","ج")	
Name = utf8.gsub(Name,"ﮆ","ذ")	
Name = utf8.gsub(Name,"ﭳ","ج")	
Name = utf8.gsub(Name,"ۃ","ة")	
Name = utf8.gsub(Name,"ڃ","ج")	
Name = utf8.gsub(Name,"ﺞ","ج")	
Name = utf8.gsub(Name,"ڢ","ف")	
Name = utf8.gsub(Name,"ﻘ","ق")	
Name = utf8.gsub(Name,"ی","ى")	
Name = utf8.gsub(Name,"ﮭ","ه")	
Name = utf8.gsub(Name,"ﮧ","")	
Name = utf8.gsub(Name,"ڌ","ذ")	
Name = utf8.gsub(Name,"̭","")	
Name = utf8.gsub(Name,"ﭸ","ج")	
Name = utf8.gsub(Name,"ﭼ","ج")	
Name = utf8.gsub(Name,"ﮯ","")	
Name = utf8.gsub(Name,"ﭬ","ف")	
Name = utf8.gsub(Name,"ڭ","ك")	
Name = utf8.gsub(Name,"ﮉ","ذ")	
Name = utf8.gsub(Name,"ﭭ","ف")	
Name = utf8.gsub(Name,"ۍ","ى")	
Name = utf8.gsub(Name,"ڍ","د")	
Name = utf8.gsub(Name,"ﭧ","")	
Name = utf8.gsub(Name,"ﮊ","ز")	
Name = utf8.gsub(Name,"ﺒ","ب")	
Name = utf8.gsub(Name,"ﭯ","ف")	
Name = utf8.gsub(Name,"ﭽ","ج")	
Name = utf8.gsub(Name,"ﯾ","ي")	
Name = utf8.gsub(Name,"ڬ","ك")	
Name = utf8.gsub(Name,"ﻃ","ط")	
Name = utf8.gsub(Name,"ڎ","ذ")	
Name = utf8.gsub(Name,"ێ","ئ")	
Name = utf8.gsub(Name,"ﻑ","ف")	
Name = utf8.gsub(Name,"ﯼ","ى")	
Name = utf8.gsub(Name,"ﻒ","ف")	
Name = utf8.gsub(Name,"ﮈ","د")	
Name = utf8.gsub(Name,"ﮡ","")	
Name = utf8.gsub(Name,"گ","ك")	
Name = utf8.gsub(Name,"ﻉ","ع")	
Name = utf8.gsub(Name,"ڏ","ذ")	
Name = utf8.gsub(Name,"ﺖ","ت")	
Name = utf8.gsub(Name,"ﭹ","ج")	
Name = utf8.gsub(Name,"ﮬ","ه")	
Name = utf8.gsub(Name,"ڮ","ك")	
Name = utf8.gsub(Name,"ﭺ","ج")	
Name = utf8.gsub(Name,"ﭢ","ت")	
Name = utf8.gsub(Name,"ڈ","د")	
Name = utf8.gsub(Name,"ۈ","و")	
Name = utf8.gsub(Name,"ﭤ","ت")	
Name = utf8.gsub(Name,"ﭠ","ت")	
Name = utf8.gsub(Name,"ﮥ","ه")	
Name = utf8.gsub(Name,"ک","ك")	
Name = utf8.gsub(Name,"ﺑ","ب")	
Name = utf8.gsub(Name,"ۉ","و")	
Name = utf8.gsub(Name,"ډ","د")	
Name = utf8.gsub(Name,"ﺗ","ت")	
Name = utf8.gsub(Name,"ﭥ","ت")	
Name = utf8.gsub(Name,"ﯡ","و")	
Name = utf8.gsub(Name,"ڨ","ق")	
Name = utf8.gsub(Name,"ي","ي")	
Name = utf8.gsub(Name,"ڊ","د")	
Name = utf8.gsub(Name,"ۊ","و")	
Name = utf8.gsub(Name,"ﮮ","")	
Name = utf8.gsub(Name,"ﻋ","ع")	
Name = utf8.gsub(Name,"ﯠ","و")	
Name = utf8.gsub(Name,"ﻊ","ع")	
Name = utf8.gsub(Name,"ﮦ","ه")	
Name = utf8.gsub(Name,"ﮢ","")	
Name = utf8.gsub(Name,"ﻈ","ض")	
Name = utf8.gsub(Name,"ﯿ","ي")	
Name = utf8.gsub(Name,"ۋ","و")	
Name = utf8.gsub(Name,"ڋ","د")	
Name = utf8.gsub(Name,"ﭣ","ت")	
Name = utf8.gsub(Name,"ﮤ","ه")	
Name = utf8.gsub(Name,"ﭮ","ف")	
Name = utf8.gsub(Name,"ﭫ","ف")	
Name = utf8.gsub(Name,"ﯽ","ى")	
Name = utf8.gsub(Name,"ﭡ","ت")	
Name = utf8.gsub(Name,"ﭾ","ج")	
Name = utf8.gsub(Name,"ﭦ","")	
Name = utf8.gsub(Name,"ﻐ","غ")	
Name = utf8.gsub(Name,"ڵ","ل")	
Name = utf8.gsub(Name,"ٵ","ا")	
Name = utf8.gsub(Name,"ﮔ","ك")	
Name = utf8.gsub(Name,"ﭗ","ب")	
Name = utf8.gsub(Name,"ﮜ","ك")	
Name = utf8.gsub(Name,"ﭝ","ي")	
Name = utf8.gsub(Name,"ڔ","ر")	
Name = utf8.gsub(Name,"ﻆ","ظ")	
Name = utf8.gsub(Name,"ﮌ","ر")	
Name = utf8.gsub(Name,"ﻪ","ه")	
Name = utf8.gsub(Name,"ڴ","ك")	
Name = utf8.gsub(Name,"ە","ه")	
Name = utf8.gsub(Name,"ﮗ","ك")	
Name = utf8.gsub(Name,"ﮝ","ك")	
Name = utf8.gsub(Name,"ﮙ","ك")	
Name = utf8.gsub(Name,"ﺓ","ة")	
Name = utf8.gsub(Name,"ڕ","ر")	
Name = utf8.gsub(Name,"ﮚ","ك")	
Name = utf8.gsub(Name,"ﮕ","ك")	
Name = utf8.gsub(Name,"ط","ط")	
Name = utf8.gsub(Name,"ﺪ","د")	
Name = utf8.gsub(Name,"ڷ","ل")	
Name = utf8.gsub(Name,"ٷ","ؤ")	
Name = utf8.gsub(Name,"ﺩ","د")	
Name = utf8.gsub(Name,"ﮘ","ك")	
Name = utf8.gsub(Name,"ﻁ","ط")	
Name = utf8.gsub(Name,"ﯝ","ؤ")	
Name = utf8.gsub(Name,"ﮱ","")	
Name = utf8.gsub(Name,"ﯚ","و")	
Name = utf8.gsub(Name,"ﻂ","ط")	
Name = utf8.gsub(Name,"ﭞ","ت")	
Name = utf8.gsub(Name,"ږ","ر")	
Name = utf8.gsub(Name,"̷","")	
Name = utf8.gsub(Name,"ٶ","ؤ")	
Name = utf8.gsub(Name,"ڶ","ل")	
Name = utf8.gsub(Name,"ﭜ","ي")	
Name = utf8.gsub(Name,"ﮎ","ك")	
Name = utf8.gsub(Name,"ﭲ","ج")	
Name = utf8.gsub(Name,"ڗ","ز")	
Name = utf8.gsub(Name,"ﮞ","")	
Name = utf8.gsub(Name,"̶","")	
Name = utf8.gsub(Name,"ڱ","ك")	
Name = utf8.gsub(Name,"ٱ","ا")	
Name = utf8.gsub(Name,"ر","ر")	
Name = utf8.gsub(Name,"ﺭ","ر")	
Name = utf8.gsub(Name,"ﭙ","ب")	
Name = utf8.gsub(Name,"ﺔ","ة")	
Name = utf8.gsub(Name,"ﺽ","ض")	
Name = utf8.gsub(Name,"ڐ","ذ")	
Name = utf8.gsub(Name,"ې","ي")	
Name = utf8.gsub(Name,"ﺕ","ت")	
Name = utf8.gsub(Name,"ﮟ","")	
Name = utf8.gsub(Name,"ڰ","ك")	
Name = utf8.gsub(Name,"ﻄ","ط")	
Name = utf8.gsub(Name,"ﻩ","ه")	
Name = utf8.gsub(Name,"ﺛ","ث")	
Name = utf8.gsub(Name,"ﮏ","ك")	
Name = utf8.gsub(Name,"ۑ","ى")	
Name = utf8.gsub(Name,"ڑ","ر")	
Name = utf8.gsub(Name,"ﻇ","ظ")	
Name = utf8.gsub(Name,"ٳ","ا")	
Name = utf8.gsub(Name,"ﺡ","ح")	
Name = utf8.gsub(Name,"ڳ","ك")	
Name = utf8.gsub(Name,"ﮪ","ه")	
Name = utf8.gsub(Name,"ﻛ","ك")	
Name = utf8.gsub(Name,"ﺼ","ص")	
Name = utf8.gsub(Name,"ﻅ","ظ")	
Name = utf8.gsub(Name,"ﻬ","ه")	
Name = utf8.gsub(Name,"̐","")	
Name = utf8.gsub(Name,"ﺂ","ا")	
Name = utf8.gsub(Name,"͠","")	
Name = utf8.gsub(Name,"ﮠ","")	
Name = utf8.gsub(Name,"ﻰ","ى")	
Name = utf8.gsub(Name,"ﭿ","ج")	
Name = utf8.gsub(Name,"ﮀ","ج")	
Name = utf8.gsub(Name,"ﮇ","ذ")	
Name = utf8.gsub(Name,"ﮍ","ر")	
Name = utf8.gsub(Name,"ﮐ","ك")	
Name = utf8.gsub(Name,"ﭷ","ج")	
Name = utf8.gsub(Name,"ﮰ","")	
Name = utf8.gsub(Name,"ے","")	
Name = utf8.gsub(Name,"پ","ب")	
Name = utf8.gsub(Name,"ﻨ","ن")	
Name = utf8.gsub(Name,"Ζ","z")	
Name = utf8.gsub(Name,"ﭚ","ب")	
Name = utf8.gsub(Name,"ﭘ","ب")	
Name = utf8.gsub(Name,"ٲ","ا")	
Name = utf8.gsub(Name,"ڲ","ك")	
Name = utf8.gsub(Name,"ﭖ","ب")	
Name = utf8.gsub(Name,"ﭕ","ي")	
Name = utf8.gsub(Name,"ﭔ","ي")	
Name = utf8.gsub(Name,"ﻏ","غ")	
Name = utf8.gsub(Name,"ﻀ","ض")	
Name = utf8.gsub(Name,"ګ","ك")	
Name = utf8.gsub(Name,"ڪ","ك")	
Name = utf8.gsub(Name,"ڧ","ف")	
Name = utf8.gsub(Name,"ڤ","ق")	
Name = utf8.gsub(Name,"ﮖ","ك")	
Name = utf8.gsub(Name,"ﺬ","ذ")	
Name = utf8.gsub(Name,"ڒ","ر")	
Name = utf8.gsub(Name,"ﺨ","خ")	
Name = utf8.gsub(Name,"ﭱ","ف")	
Name = utf8.gsub(Name,"ﻓ","ف")	
Name = utf8.gsub(Name,"ﺱ","س")	
Name = utf8.gsub(Name,"ﺫ","ذ")	
Name = utf8.gsub(Name,"ﺐ","ب")	
Name = utf8.gsub(Name,"ﮩ","")	
Name = utf8.gsub(Name,"ﮨ","")	
Name = utf8.gsub(Name,"ﮣ","")	
Name = utf8.gsub(Name,"ﭰ","ف")	
Name = utf8.gsub(Name,"ۓ","")	
Name = utf8.gsub(Name,"୭","و")	
Name = utf8.gsub(Name,"ﯛ","و")	
Name = utf8.gsub(Name,"ۿ","ه")	
return Name
end

function FlterEmoje(Name)
Name = tostring(Name)
Name = utf8.gsub(Name,"[🤚🔕♠🤗😇💂🌶🤣🚹⛸⚠😅🍕🍛🧝🌿💛#😕🧞*1032547🥌98🎡🎋🏼🎰🤑🚮☠🥜⃣🛌🌙🚙👏🛍💑⛳🏌🍢👲🔡❤🐀😨🥁🦇🏣㊗💰🚒🌟🐾🦅🐃🐷🤲🎩📳🇼🍎👛◻💻➗🔪🎂🌪🔔🍊✊🐚🍽🍫❗🚴🎒♏🧢🍁🌓😸🍦󠁢😶🗓🐡🛠✏😉🎯🍋🎟🔳🌨🎱💟⛏🤳📆🔅🍴📲🥊🖍🌡📬🆑🐇🗺😾🕰📵🏈🇮🍥➰🤠👥🕥😃😤😔🐹🎬⌛💎☃📖🔨👫🙄🥒⚜🏫🥃🍘🥥📍🦕💜🗝🙃🕤🐯👤🧔🏭🚭🚘💒🐓👁🤾🏐🏮🚋🌾📗🥈📚🤧🏃〰👱🔧🥖🇾☘🔘🔙⚗🛡🏖💹🉑🚛💩🛏♋🔸💴⏬✋👷😞☎🦂🎽🐞️🌘🌄⛵🈺🏸🎍📝🐪🍑😙🤓⚓󠁴💠🌔😵🥦📇🐌♓😘😢🐙🕦🏆🚨❇🙎🔶🛂🍲🥟📉🐕🍳🚈🔞😳🔌😊🌅🔊⛓🚻🚁✨💢🌊⚛😆😿🎈🏗🇭❓🙀🐨🚡🤢🔃▫🇶👿🤤📋🖋👕🐔😮🔵👂🌏⏏👦🐧🕎◾🍺🌧🖐📟🧙👶🌤↖🏬🤜⌚🏋🛐™🍜🤯🧣↘🔣🐣🥘🎫🎌😓🗨🚐🧚💲🍡😪🙏🖖⛽🏑⛲🎢🥗🚌🦁🚆☺🕒🎛⛹💏🐼🍶🚑🕞🤮🕕⏫🤰‼🎥🏀😰🌎📻󠁥🍂🇻🎴👸💼➖💆🕹👧🛩🍚❣🍓🤥🐄🍒♎🔽👵🔓🍠💍🏉▶🎠🎊👡📎💖🔺😺🍱📀⛎😽😷☣🦃🌯⛷🖼🚄💬🤐🦎♣🚦🍹‍🌱🛃🦄🦒🐈🕸🏟✖🚍😥↪🤝🏇⬇🌦🔄🚖⏺⬛♂⏲💁🚧🔤🚼👞🏄😩☂🕜🌚🧒⏯🎮🏯🌭🍵🔭💐🐤🕠💗🚎🛋🍧🤔🏽👒🤷🇸👘☝👴🔷⚖✴🉐✂🥂🕊👹⛴👅🚞😂📪🐺🦀󠁣🌃✉♒🤩🥕🎖🚀🕢😟🕵🇪👃🎑🏪🤟💿🥫😚🏩🏔🍏👢🏙📈⚒💝👠🎲🚲🖲⁉🇨🌳🚯🧀🕌🛶⛪🍌🧓🙈🇿⤴😬☪⚽🌈📔㊙💇🇯🗿🙁🍅☯🍞😠👍🕴▪👊💋🖱🎗🙌😎🐦🥡🔦💉🌺🔰🛣🕘🎶👳🍮🌜🐰↙🚔🕖🎿↕🐑🔛⛺🖕🧜🔟🖨🏕🎻🥝🎾🥐🤙🈳⚾🗑👣🚗🥧🏤🚕😒🤬🛷🤱🚏🚅🐂🐋🐜🤘⏪🦗⚱🔻👌〽👼💀👝☦⛱⏹󠁷📼📄🕺🎓😍🚩󠁧🔹🧡🥨➕🦌🤹ℹ🎉♉💨🏴❕🗼🏥🤪👮󠁳🏊🧟👖🙉☢🙇🔒👬📱🍈🏘🍐🕐😫🛄🧠🛥👭🎇🍭🤡🦑♍🐟🚃💧😋🚸🕍🚾✍🗽😹🎹🛒🧥🔎👓🚚🦖📷🤛👗🔜🥔🍖😄🔠💘🐴🤕󠁬🎄🧖🍗😈😧🈷🐽🌂♑💯🛑📁🧑🛰🎨☕🐒☑⛈🤨👐⛑🇳🔢🎞💪🍀⏸🌍💙🍃👺🍍🈸😜🈂⏮↩🌩🌵✈🏁😻👚🎙👋🔈☮🍬⛅🍸🐍🤫🎅🚿🏎🏳😁🚵💞🐢🐩💃😛🎪😴🕋🍆📯🥀💅🚳🙂🤶🌑⭕☁🥋👇🌌🍝😡⏱🔆🗯💶🥠🆓🌲👀🚢🕚💔🍇🦍⚕🇱🇰🦓🎧🥉🏺◼🌰🧦🔍💊🐠🌼🛎✅☸⚡💌👉🤵💕🚣📰👑🌽🚓😑📏👔♥◀🤽🐝🕛😌🧗🈵🗒🔐🈴🌕🌛🦐🎣🥞💣↔👾🅰😐🕟🥙👰🐏🚷🐆📡🥇👻🐲🌸🧘♨🎼🌗🌠✡🎤🅿🚬⛰🤞🍙🏓🔝💳🦋🕉🥚🔖🍪🛫🗜🔬🏡🤭🏚🔥❔💄🌥🕔✌🌫󠁮🐁👟🐛♈😭🌋🇦🔑🌞🐊🏷📒🎦🌴🍟🚉🍉💓🐮💷🔱💽🚇🐫🚥🐘🌐🥑🔲🛤🙍🐬📧⬅🐥⛔󠁿🏹👨🌝🇽🐖📿🔼😖😼📘🙋🥛🚺⏩🍾🗞🌹📠🗾🔗🏵🎃😝🖤🏒🛸🍯🦈🚜🔁🎭🌁💤😦💦👯®🏞👽👩💺💱📢🤖📸©👪🦆👙🦔📴🧐⏭🇴👄💚🎚📹🛢🐐🇷🍄🌖😀🌬🧤🐿❄🕝🍩🛵🔏🖊✒🍔🖌🖇🔇📐🧕📕📊📙📂🗂📓📅🗣🗳🗄📜📨🏅📑📤📦📫🔯📭📮🎐📩🈁🗡📃📥🎁🎏🛴🎀🎎😗🚪🚽🚰🕓♀🆕🐸💈🕳🐭🔋⚰😱🔩⚙🔫💡🕯🚟💸🕗💵⏰⏳📺📽📞🛳💾🕧🙊⌨🖥🕡🕣🕙🀄☀🕑🏢🛁💭♦🇲🃏🔉📣🎳🏜⬜⚪⚫🔴➿🔚✔🤦🏍🔂🎵⤵🔀➡⬆↗6🎺🆙🆒🔮🆖🆗🏧🛅🇺♿🦉👈✳❎⛩Ⓜ🌀♻🥅🈯🚱📛🚫🏠🅱🕶🌆🎸🚂🅾🆘☄❌🈹🈲🈶🈚☹🆚💮⭐🆔🐗♌♐🤴☔♊😯✝🇵📶🇹🇧🇩🇬🇫🎆🌇🌉🏛🏦🏨🏝◽😲🗻⛄🏰🚤🚊🛬🚝🚠🎷🆎🤸🤺🏂🤼🏏🥣🥢🍷🥄🍼🌻🥤🍻🍿🍰🌮🍣🍤🥪🍨🥓🥩💥🌒💫🌷🐉🐎🦏🐳🐅🕷😏🐵🐶🐱⚔🦊🐻👜🙅🙆🧛📌🗃👆👎🤒😣👍🏿👍🏾👍🏽👍🏼👍🏻🤝🏿🤝🏾🤝🏽🤝🏽🤝🏼🤝🏻🙏🏿🙏🏾🙏🏽🙏🏼🙏🏻👏🏿👏🏾👏🏽👏🏼👏🏼👏🏻🙌🏿🙌🏾🙌🏽🙌🏼🙌🏻👐🏿👐🏾👐🏽👐🏼👐🏻🤲🏿🤲🏾🤲🏽🤲🏼🤲🏻✌🏿✌🏾✌🏽✌🏼✌🏻🤞🏿🤞🏾🤞🏽🤞🏼🤞🏻🤜🏿🤜🏾🤜🏽🤜🏼🤜🏻🤛🏿🤛🏾🤛🏽🤛🏼🤛🏻✊🏿✊🏾✊🏽✊🏼✊🏻👊🏿👊🏾👊🏽👊🏼👊🏻👎🏿👎🏾👎🏽👎🏼👎🏻👇🏿👇🏾👇🏽👇🏼👇🏻👆🏿👆🏾👆🏽👆🏼👆🏻👉🏿👉🏾👉🏽👉🏼👉🏻👈🏿👈🏾👈🏽👈🏼👈🏻👌🏿👌🏾👌🏽👌🏼👌🏻🤘🏿🤘🏾🤘🏽🤘🏼🤘🏻🤟🏿🤟🏾🤟🏽🤟🏼🤟🏻🤙🏿🤙🏾🤙🏽🤙🏼🤙🏻👋🏿👋🏾👋🏽👋🏼👋🏻🖖🏿🖖🏾🖖🏽🖖🏼🖖🏻🖐🏿🖐🏾🖐🏽🖐🏼🖐🏻🤚🏿🤚🏾🤚🏽🤚🏼🤚🏻✋🏿✋🏾✋🏽✋🏼✋🏻☝🏿☝🏾☝🏽☝🏼☝🏻💅🏿💅🏾💅🏽💅🏼💅🏻🤳🏿🤳🏾🤳🏽🤳🏼🤳🏼🤳🏻🤳✍🏿✍🏾✍🏽✍🏼✍🏻💪🏿💪🏾💪🏽💪🏼💪🏻👃🏿👃🏾👃🏽👃🏼👃🏻👂🏿👂🏾👂🏽👂🏼👂🏻👦🏿👦🏾👦🏽👦🏼👦🏻🧒🏿🧒🏾🧒🏽🧒🏼🧒🏻👶🏿👶🏾👶🏽👶🏼👶🏻🧔🏿🧔🏾🧔🏽🧔🏼🧔🏻🧓🏿🧓🏾🧓🏽🧓🏼🧓🏻👱🏿‍♂️👱🏾‍♂️👱🏽‍♂️👱🏼‍♂️👱🏻‍♂️👱🏿‍♀️👱🏾‍♀️👱🏽‍♀️👱🏼‍♀️👱🏻‍♀️👩🏿👩🏾👩🏽👩🏼👩🏻👨🏿👨🏾👨🏽👨🏼👨🏻👧🏿👧🏾👧🏽👧🏼👧🏻👳🏿‍♂️👳🏾‍♂️👳🏽‍♂️👳🏼‍♂️👳🏻‍♂️👳🏿‍♀️👳🏾‍♀️👳🏽‍♀️👳🏼‍♀️👳🏻‍♀️👲🏿👲🏾👲🏽👲🏼👲🏻👵🏿👵🏾👵🏽👵🏼👵🏻👴🏿👴🏾👴🏽👴🏼👴🏻🕵🏿️‍♂️🕵🏾️‍♂️🕵🏽️‍♂️🕵🏼️‍♂️🕵🏻️‍♂️🕵🏿️‍♀️🕵🏾️‍♀️🕵🏽️‍♀️🕵🏼️‍♀️🕵🏻️‍♀️💂🏿‍♂️💂🏾‍♂️💂🏽‍♂️💂🏼‍♂️💂🏻‍♂️💂🏿‍♀️💂🏾‍♀️💂🏽‍♀️💂🏼‍♀️💂🏻‍♀️👷🏿‍♂️👷🏾‍♂️👷🏽‍♂️👷🏼‍♂️👷🏻‍♂️👷🏿‍♀️👷🏾‍♀️👷🏽‍♀️👷🏼‍♀️👷🏻‍♀️👮🏿‍♂️👮🏾‍♂️👮🏽‍♂️👮🏼‍♂️👮🏻‍♂️👩🏿‍🎓👩🏾‍🎓👩🏽‍🎓👩🏼‍🎓👩🏻‍🎓👨🏿‍🍳👨🏾‍🍳👨🏽‍🍳👨🏼‍🍳👨🏻‍🍳👩🏿‍🍳👩🏾‍🍳👩🏽‍🍳👩🏼‍🍳👩🏻‍🍳👨🏿‍🌾👨🏾‍🌾👨🏽‍🌾👨🏼‍🌾👨🏻‍🌾👩🏿‍🌾👩🏾‍🌾👩🏽‍🌾👩🏼‍🌾👩🏻‍🌾👨🏿‍⚕️👨🏾‍⚕️👨🏽‍⚕️👨🏼‍⚕️👨🏻‍⚕️👩🏿‍⚕️👩🏾‍⚕️👩🏽‍⚕️👩🏼‍⚕️👩🏻‍⚕️👨🏿‍🏭👨🏾‍🏭👨🏽‍🏭👨🏼‍🏭👨🏻‍🏭👩🏿‍🏭👩🏾‍🏭👩🏽‍🏭👩🏼‍🏭👩🏻‍🏭👨🏿‍🏫👨🏾‍🏫👨🏽‍🏫👨🏼‍🏫👨🏻‍🏫👩🏿‍🏫👩🏾‍🏫👩🏽‍🏫👩🏼‍🏫👩🏻‍🏫👨🏿‍🎤👨🏾‍🎤👨🏽‍🎤👨🏼‍🎤👨🏻‍🎤👩🏿‍🎤👩🏾‍🎤👩🏽‍🎤👩🏼‍🎤👩🏻‍🎤👨🏿‍🎓👨🏾‍🎓👨🏽‍🎓👨🏼‍🎓👨🏻‍🎓👩🏿‍🔬👩🏾‍🔬👩🏽‍🔬👩🏼‍🔬👩🏻‍🔬👨🏿‍🔧👨🏾‍🔧👨🏽‍🔧👨🏼‍🔧👨🏻‍🔧👩🏿‍🔧👩🏾‍🔧👩🏽‍🔧👩🏼‍🔧👩🏻‍🔧👨🏿‍💼👨🏾‍💼👨🏽‍💼👨🏼‍💼👨🏻‍💼👩🏿‍💼👩🏾‍💼👩🏽‍💼👩🏼‍💼👩🏻‍💼👨🏿‍💻👨🏾‍💻👨🏽‍💻👨🏼‍💻👨🏻‍💻👩🏿‍💻👩🏾‍💻👩🏽‍💻👩🏼‍💻👩🏻‍💻👨🏿‍🚀👨🏾‍🚀👨🏽‍🚀👨🏼‍🚀👨🏻‍🚀👩🏿‍🚀👩🏾‍🚀👩🏽‍🚀👩🏼‍🚀👩🏻‍🚀👨🏿‍🚒👨🏾‍🚒👨🏽‍🚒👨🏼‍🚒👨🏻‍🚒👩🏿‍🚒👩🏾‍🚒👩🏽‍🚒👩🏼‍🚒👩🏻‍🚒👨🏿‍🎨👨🏾‍🎨👨🏽‍🎨👨🏼‍🎨👨🏻‍🎨👩🏿‍🎨👩🏾‍🎨👩🏽‍🎨👩🏼‍🎨👩🏻‍🎨👨🏿‍🔬👨🏾‍🔬👨🏽‍🔬👨🏼‍🔬👨🏻‍🔬🧛🏿‍♀️🧛🏾‍♀️🧛🏽‍♀️🧛🏼‍♀️🧛🏻‍♀️🧝🏿‍♂️🧝🏾‍♂️🧝🏽‍♂️🧝🏼‍♂️🧝🏻‍♂️🧝🏿‍♀️🧝🏾‍♀️🧝🏽‍♀️🧝🏼‍♀️🧝🏻‍♀️🧙🏿‍♂️🧙🏾‍♂️🧙🏽‍♂️🧙🏼‍♂️🧙🏻‍♂️🧙🏿‍♀️🧙🏾‍♀️🧙🏽‍♀️🧙🏼‍♀️🧙🏻‍♀️🎅🏿🎅🏾🎅🏽🎅🏼🎅🏻🤶🏿🤶🏾🤶🏽🤶🏼🤶🏻🧜🏿‍♂️🧜🏾‍♂️🧜🏽‍♂️🧜🏼‍♂️🧜🏻‍♂️🧜🏿‍♀️🧜🏾‍♀️🧜🏽‍♀️🧜🏼‍♀️🧜🏻‍♀️🧛🏿‍♂️🧛🏾‍♂️🧛🏽‍♂️🧛🏼‍♂️🧛🏻‍♂️👼🏿👼🏾👼🏽👼🏼👼🏻🤵🏿🤵🏾🤵🏽🤵🏼🤵🏻👰🏿👰🏾👰🏽👰🏼👰🏻🤴🏿🤴🏾🤴🏽🤴🏼🤴🏻👸🏿👸🏾👸🏽👸🏼👸🏻🧚🏿‍♂️🧚🏾‍♂️🧚🏽‍♂️🧚🏼‍♂️🧚🏻‍♂️🧚🏿‍♀️🧚🏾‍♀️🧚🏽‍♀️🧚🏼‍♀️🧚🏻‍♀️🙅🏿‍♂️🙅🏾‍♂️🙅🏽‍♂️🙅🏼‍♂️🙅🏻‍♂️🙅🏿‍♀️🙅🏾‍♀️🙅🏽‍♀️🙅🏼‍♀️🙅🏻‍♀️💁🏿‍♂️💁🏾‍♂️💁🏽‍♂️💁🏼‍♂️💁🏻‍♂️💁🏿‍♀️💁🏾‍♀️💁🏽‍♀️💁🏼‍♀️💁🏻‍♀️🙇🏿‍♂️🙇🏾‍♂️🙇🏽‍♂️🙇🏼‍♂️🙇🏻‍♂️🙇🏿‍♀️🙇🏾‍♀️🙇🏽‍♀️🙇🏼‍♀️🙇🏻‍♀️🤰🏿🤰🏾🤰🏽🤰🏼🤰🏻🤷🏿‍♀️🤷🏾‍♀️🤷🏽‍♀️🤷🏼‍♀️🤷🏻‍♀️🤦🏿‍♂️🤦🏾‍♂️🤦🏽‍♂️🤦🏼‍♂️🤦🏻‍♂️🤦🏿‍♀️🤦🏾‍♀️🤦🏽‍♀️🤦🏼‍♀️🤦🏻‍♀️🙋🏿‍♂️🙋🏾‍♂️🙋🏽‍♂️🙋🏼‍♂️🙋🏻‍♂️🙋🏿‍♀️🙋🏾‍♀️🙋🏽‍♀️🙋🏼‍♀️🙋🏻‍♀️🙆🏿‍♂️🙆🏾‍♂️🙆🏽‍♂️🙆🏼‍♂️🙆🏻‍♂️🙆🏿‍♀️🙆🏾‍♀️🙆🏽‍♀️🙆🏼‍♀️🙆🏻‍♀️💇🏿‍♂️💇🏾‍♂️💇🏽‍♂️💇🏼‍♂️💇🏻‍♂️💇🏿‍♀️💇🏾‍♀️💇🏽‍♀️💇🏼‍♀️💇🏻‍♀️🙍🏿‍♂️🙍🏾‍♂️🙍🏽‍♂️🙍🏼‍♂️🙍🏻‍♂️🙍🏿‍♀️🙍🏾‍♀️🙍🏽‍♀️🙍🏼‍♀️🙍🏻‍♀️🙎🏿‍♂️🙎🏾‍♂️🙎🏽‍♂️🙎🏼‍♂️🙎🏻‍♂️🙎🏿‍♀️🙎🏾‍♀️🙎🏽‍♀️🙎🏼‍♀️🙎🏻‍♀️🤷🏿‍♂️🤷🏾‍♂️🤷🏽‍♂️🤷🏼‍♂️🤷🏻‍♂️🕺🏿🕺🏾🕺🏽🕺🏼🕺🏻💃🏿💃🏾💃🏽💃🏼💃🏻🕴🏿🕴🏾🕴🏽🕴🏼🕴🏻🧖🏿‍♂️🧖🏾‍♂️🧖🏽‍♂️🧖🏼‍♂️🧖🏻‍♂️🧖🏿‍♀️🧖🏾‍♀️🧖🏽‍♀️🧖🏼‍♀️🧖🏻‍♀️💆🏿‍♂️💆🏾‍♂️💆🏽‍♂️💆🏼‍♂️💆🏻‍♂️💆🏿‍♀️💆🏾‍♀️💆🏽‍♀️💆🏼‍♀️💆🏻‍♀️🏃🏿‍♂️🏃🏾‍♂️🏃🏽‍♂️🏃🏼‍♂️🏃🏻‍♂️🏃🏿‍♀️🏃🏾‍♀️🏃🏽‍♀️🏃🏼‍♀️🏃🏻‍♀️🏿‍♂️🏾‍♂️🏽‍♂️🏼‍♂️🏻‍♂️🏿‍♀️🏾‍♀️🏽‍♀️🏼‍♀️🏻‍♀️🏋🏿️‍♂️🏋🏾️‍♂️🏋🏽️‍♂️🏋🏼️‍♂️🏋🏻️‍♂️🏋🏿️‍♀️🏋🏾️‍♀️🏋🏽️‍♀️🏋🏼️‍♀️🏋🏻️‍♀️🤾🏿‍♀️🤾🏾‍♀️🤾🏽‍♀️🤾🏼‍♀️🤾🏻‍♀️🤸🏿‍♂️🤸🏾‍♂️🤸🏽‍♂️🤸🏼‍♂️🤸🏻‍♂️🤸🏿‍♀️🤸🏾‍♀️🤸🏽‍♀️🤸🏼‍♀️🤸🏻‍♀️🏄🏿‍♂️🏄🏾‍♂️🏄🏽‍♂️🏄🏼‍♂️🏄🏻‍♂️🏄🏿‍♀️🏄🏾‍♀️🏄🏽‍♀️🏄🏼‍♀️🏄🏻‍♀️🧘🏿‍♂️🧘🏾‍♂️🧘🏽‍♂️🧘🏼‍♂️🧘🏻‍♂️🧘🏿‍♀️🧘🏾‍♀️🧘🏽‍♀️🧘🏼‍♀️🧘🏻‍♀️🏌🏿️‍♂️🏌🏾️‍♂️🏌🏽️‍♂️🏌🏼️‍♂️🏌🏻️‍♂️🏌🏿️‍♀️🏌🏾️‍♀️🏌🏽️‍♀️🏌🏼️‍♀️🏌🏻️‍♀️🧗🏿‍♀️🧗🏾‍♀️🧗🏽‍♀️🧗🏼‍♀️🧗🏻‍♀️🏇🏿🏇🏾🏇🏽🏇🏼🏇🏻🚣🏿‍♂️🚣🏾‍♂️🚣🏽‍♂️🚣🏼‍♂️🚣🏻‍♂️🚣🏿‍♀️🚣🏾‍♀️🚣🏽‍♀️🚣🏼‍♀️🚣🏻‍♀️🤽🏿‍♂️🤽🏾‍♂️🤽🏽‍♂️🤽🏼‍♂️🤽🏻‍♂️🤽🏿‍♀️🤽🏾‍♀️🤽🏽‍♀️🤽🏼‍♀️🤽🏻‍♀️🏊🏿‍♂️🏊🏾‍♂️🏊🏽‍♂️🏊🏼‍♂️🏊🏻‍♂️🚵🏿‍♂️🚵🏾‍♂️🚵🏽‍♂️🚵🏼‍♂️🚵🏻‍♂️🚵🏿‍♀️🚵🏾‍♀️🚵🏽‍♀️🚵🏼‍♀️🚵🏻‍♀️🚴🏿‍♂️🚴🏾‍♂️🚴🏽‍♂️🚴🏼‍♂️🚴🏻‍♂️🚴🏿‍♀️🚴🏾‍♀️🚴🏽‍♀️🚴🏼‍♀️🚴🏻‍♀️🧗🏿‍♂️🧗🏾‍♂️🧗🏽‍♂️🧗🏼‍♂️🧗🏻‍♂️🤹🏿‍♀️🤹🏾‍♀️🤹🏽‍♀️🤹🏼‍♀️🤹🏻‍♀️🤹🏿‍♂️🤹🏾‍♂️🤹🏽‍♂️🤹🏼‍♂️🤹🏻‍♂️🛀🏿🛀🏾🛀🏽🛀🏼🛀🏻🛌🏿🛌🏾🛌🏽🛌🏼🛌🏻]","")	

return Name
end
-- -*- coding: utf-8 -*-
--
-- Simple JSON encoding and decoding in pure Lua.
--
-- Copyright 2010-2014 Jeffrey Friedl
-- http://regex.info/blog/
--
-- Latest version: http://regex.info/blog/lua/json
--
-- This code is released under a Creative Com CC-BY "Attribution" License:
-- http://creativecommons.org/licenses/by/3.0/deed.en_US
--
-- It can be used for any purpose so long as the copyright notice above,
-- the web-page links above, and the 'AUTHOR_NOTE' string below are
-- maintained. Enjoy.
--
local VERSION = 20141223.14 -- version history at end of file
local AUTHOR_NOTE = "-[ JSON.lua package by Jeffrey Friedl (http://regex.info/blog/lua/json) version 20141223.14 ]-"

--
-- The 'AUTHOR_NOTE' variable exists so that information about the source
-- of the package is maintained even in compiled versions. It's also
-- included in OBJDEF below mostly to quiet warnings about unused variables.
--
local OBJDEF = {
   VERSION      = VERSION,
   AUTHOR_NOTE  = AUTHOR_NOTE,
}


--
-- Simple JSON encoding and decoding in pure Lua.
-- http://www.json.org/
--
--
--   JSON = assert(loadfile "JSON.lua")() -- one-time load of the routines
--
--   local lua_value = JSON:decode(raw_json_text)
--
--   local raw_json_text    = JSON:encode(lua_table_or_value)
--   local pretty_json_text = JSON:encode_pretty(lua_table_or_value) -- "pretty printed" version for human readability
--
--
--
-- DECODING (from a JSON string to a Lua table)
--
--
--   JSON = assert(loadfile "JSON.lua")() -- one-time load of the routines
--
--   local lua_value = JSON:decode(raw_json_text)
--
--   If the JSON text is for an object or an array, e.g.
--     { "what": "books", "count": 3 }
--   or
--     [ "Larry", "Curly", "Moe" ]
--
--   the result is a Lua table, e.g.
--     { what = "books", count = 3 }
--   or
--     { "Larry", "Curly", "Moe" }
--
--
--   The encode and decode routines accept an optional second argument,
--   "etc", which is not used during encoding or decoding, but upon error
--   is passed along to error handlers. It can be of any type (including nil).
--
--
--
-- ERROR HANDLING
--
--   With most errors during decoding, this code calls
--
--      JSON:onDecodeError(message, text, location, etc)
--
--   with a message about the error, and if known, the JSON text being
--   parsed and the byte count where the problem was discovered. You can
--   replace the default JSON:onDecodeError() with your own function.
--
--   The default onDecodeError() merely augments the message with data
--   about the text and the location if known (and if a second 'etc'
--   argument had been provided to decode(), its value is tacked onto the
--   message as well), and then calls JSON.assert(), which itself defaults
--   to Lua's built-in assert(), and can also be overridden.
--
--   For example, in an Adobe Lightroom plugin, you might use something like
--
--          function JSON:onDecodeError(message, text, location, etc)
--             LrErrors.throwUserError("Internal Error: invalid JSON data")
--          end
--
--   or even just
--
--          function JSON.assert(message)
--             LrErrors.throwUserError("Internal Error: " .. message)
--          end
--
--   If JSON:decode() is passed a nil, this is called instead:
--
--      JSON:onDecodeOfNilError(message, nil, nil, etc)
--
--   and if JSON:decode() is passed HTML instead of JSON, this is called:
--
--      JSON:onDecodeOfHTMLError(message, text, nil, etc)
--
--   The use of the fourth 'etc' argument allows stronger coordination
--   between decoding and error reporting, especially when you provide your
--   own error-handling routines. Continuing with the the Adobe Lightroom
--   plugin example:
--
--          function JSON:onDecodeError(message, text, location, etc)
--             local note = "Internal Error: invalid JSON data"
--             if type(etc) = 'table' and etc.photo then
--                note = note .. " while processing for " .. etc.photo:getFormattedMetadata('fileName')
--             end
--             LrErrors.throwUserError(note)
--          end
--
--            :
--            :
--
--          for i, photo in ipairs(photosToProcess) do
--               :             
--               :             
--               local data = JSON:decode(someJsonText, { photo = photo })
--               :             
--               :             
--          end
--
--
--
--
--
-- DECODING AND STRICT TYPES
--
--   Because both JSON objects and JSON arrays are converted to Lua tables,
--   it's not normally possible to tell which original JSON type a
--   particular Lua table was derived from, or guarantee decode-encode
--   round-trip equivalency.
--
--   However, if you enable strictTypes, e.g.
--
--      JSON = assert(loadfile "JSON.lua")() --load the routines
--      JSON.strictTypes = true
--
--   then the Lua table resulting from the decoding of a JSON object or
--   JSON array is marked via Lua metatable, so that when re-encoded with
--   JSON:encode() it ends up as the appropriate JSON type.
--
--   (This is not the default because other routines may not work well with
--   tables that have a metatable set, for example, Lightroom API calls.)
--
--
-- ENCODING (from a lua table to a JSON string)
--
--   JSON = assert(loadfile "JSON.lua")() -- one-time load of the routines
--
--   local raw_json_text    = JSON:encode(lua_table_or_value)
--   local pretty_json_text = JSON:encode_pretty(lua_table_or_value) -- "pretty printed" version for human readability
--   local custom_pretty    = JSON:encode(lua_table_or_value, etc, { pretty = true, indent = "|  ", align_keys = false })
--
--   On error during encoding, this code calls:
--
--     JSON:onEncodeError(message, etc)
--
--   which you can override in your local JSON object.
--
--   The 'etc' in the error call is the second argument to encode()
--   and encode_pretty(), or nil if it wasn't provided.
--
--
-- PRETTY-PRINTING
--
--   An optional third argument, a table of options, allows a bit of
--   configuration about how the encoding takes place:
--
--     pretty = JSON:encode(val, etc, {
--                                       pretty = true,      -- if false, no other options matter
--                                       indent = "   ",     -- this provides for a three-space indent per nesting level
--                                       align_keys = false, -- see below
--                                     })
--
--   encode() and encode_pretty() are identical except that encode_pretty()
--   provides a default options table if none given in the call:
--
--       { pretty = true, align_keys = false, indent = "  " }
--
--   For example, if
--
--      JSON:encode(data)
--
--   produces:
--
--      {"city":"Kyoto","climate":{"avg_temp":16,"humidity":"high","snowfall":"minimal"},"country":"Japan","wards":11}
--
--   then
--
--      JSON:encode_pretty(data)
--
--   produces:
--
--      {
--        "city": "Kyoto",
--        "climate": {
--          "avg_temp": 16,
--          "humidity": "high",
--          "snowfall": "minimal"
--        },
--        "country": "Japan",
--        "wards": 11
--      }
--
--   The following three lines return identical results:
--       JSON:encode_pretty(data)
--       JSON:encode_pretty(data, nil, { pretty = true, align_keys = false, indent = "  " })
--       JSON:encode       (data, nil, { pretty = true, align_keys = false, indent = "  " })
--
--   An example of setting your own indent string:
--
--     JSON:encode_pretty(data, nil, { pretty = true, indent = "|    " })
--
--   produces:
--
--      {
--      |    "city": "Kyoto",
--      |    "climate": {
--      |    |    "avg_temp": 16,
--      |    |    "humidity": "high",
--      |    |    "snowfall": "minimal"
--      |    },
--      |    "country": "Japan",
--      |    "wards": 11
--      }
--
--   An example of setting align_keys to true:
--
--     JSON:encode_pretty(data, nil, { pretty = true, indent = "  ", align_keys = true })
--  
--   produces:
--   
--      {
--           "city": "Kyoto",
--        "climate": {
--                     "avg_temp": 16,
--                     "humidity": "high",
--                     "snowfall": "minimal"
--                   },
--        "country": "Japan",
--          "wards": 11
--      }
--
--   which I must admit is kinda ugly, sorry. This was the default for
--   encode_pretty() prior to version 20141223.14.
--
--
--  AMBIGUOUS SITUATIONS DURING THE ENCODING
--
--   During the encode, if a Lua table being encoded contains both string
--   and numeric keys, it fits neither JSON's idea of an object, nor its
--   idea of an array. To get around this, when any string key exists (or
--   when non-positive numeric keys exist), numeric keys are converted to
--   strings.
--
--   For example, 
--     JSON:encode({ "one", "two", "three", SOMESTRING = "some string" }))
--   produces the JSON object
--     {"1":"one","2":"two","3":"three","SOMESTRING":"some string"}
--
--   To prohibit this conversion and instead make it an error condition, set
--      JSON.noKeyConversion = true
--




--
-- SUMMARY OF METHODS YOU CAN OVERRIDE IN YOUR LOCAL LUA JSON OBJECT
--
--    assert
--    onDecodeError
--    onDecodeOfNilError
--    onDecodeOfHTMLError
--    onEncodeError
--
--  If you want to create a separate Lua JSON object with its own error handlers,
--  you can reload JSON.lua or use the :new() method.
--
---------------------------------------------------------------------------

local default_pretty_indent  = "  "
local default_pretty_options = { pretty = true, align_keys = false, indent = default_pretty_indent }

local isArray  = { __tostring = function() return "JSON array"  end }    isArray.__index  = isArray
local isObject = { __tostring = function() return "JSON object" end }    isObject.__index = isObject


function OBJDEF:newArray(tbl)
   return setmetatable(tbl or {}, isArray)
end

function OBJDEF:newObject(tbl)
   return setmetatable(tbl or {}, isObject)
end

local function unicode_codepoint_as_utf8(codepoint)
   --
   -- codepoint is a number
   --
   if codepoint <= 127 then
      return string.char(codepoint)

   elseif codepoint <= 2047 then
      --
      -- 110yyyxx 10xxxxxx         <-- useful notation from http://en.wikipedia.org/wiki/Utf8
      --
      local highpart = math.floor(codepoint / 0x40)
      local lowpart  = codepoint - (0x40 * highpart)
      return string.char(0xC0 + highpart,
                         0x80 + lowpart)

   elseif codepoint <= 65535 then
      --
      -- 1110yyyy 10yyyyxx 10xxxxxx
      --
      local highpart  = math.floor(codepoint / 0x1000)
      local remainder = codepoint - 0x1000 * highpart
      local midpart   = math.floor(remainder / 0x40)
      local lowpart   = remainder - 0x40 * midpart

      highpart = 0xE0 + highpart
      midpart  = 0x80 + midpart
      lowpart  = 0x80 + lowpart

      --
      -- Check for an invalid character (thanks Andy R. at Adobe).
      -- See table 3.7, page 93, in http://www.unicode.org/versions/Unicode5.2.0/ch03.pdf#G28070
      --
      if ( highpart == 0xE0 and midpart < 0xA0 ) or
         ( highpart == 0xED and midpart > 0x9F ) or
         ( highpart == 0xF0 and midpart < 0x90 ) or
         ( highpart == 0xF4 and midpart > 0x8F )
      then
         return "?"
      else
         return string.char(highpart,
                            midpart,
                            lowpart)
      end

   else
      --
      -- 11110zzz 10zzyyyy 10yyyyxx 10xxxxxx
      --
      local highpart  = math.floor(codepoint / 0x40000)
      local remainder = codepoint - 0x40000 * highpart
      local midA      = math.floor(remainder / 0x1000)
      remainder       = remainder - 0x1000 * midA
      local midB      = math.floor(remainder / 0x40)
      local lowpart   = remainder - 0x40 * midB

      return string.char(0xF0 + highpart,
                         0x80 + midA,
                         0x80 + midB,
                         0x80 + lowpart)
   end
end

function OBJDEF:onDecodeError(message, text, location, etc)
   if text then
      if location then
         message = string.format("%s at char %d of: %s", message, location, text)
      else
         message = string.format("%s: %s", message, text)
      end
   end

   if etc ~= nil then
      message = message .. " (" .. OBJDEF:encode(etc) .. ")"
   end

   if self.assert then
      self.assert(false, message)
   else
      assert(false, message)
   end
end

OBJDEF.onDecodeOfNilError  = OBJDEF.onDecodeError
OBJDEF.onDecodeOfHTMLError = OBJDEF.onDecodeError

function OBJDEF:onEncodeError(message, etc)
   if etc ~= nil then
      message = message .. " (" .. OBJDEF:encode(etc) .. ")"
   end

   if self.assert then
      self.assert(false, message)
   else
      assert(false, message)
   end
end

local function grok_number(self, text, start, etc)
   --
   -- Grab the integer part
   --
   local integer_part = text:match('^-?[1-9]%d*', start)
                     or text:match("^-?0",        start)

   if not integer_part then
      self:onDecodeError("expected number", text, start, etc)
   end

   local i = start + integer_part:len()

   --
   -- Grab an optional decimal part
   --
   local decimal_part = text:match('^%.%d+', i) or ""

   i = i + decimal_part:len()

   --
   -- Grab an optional exponential part
   --
   local exponent_part = text:match('^[eE][-+]?%d+', i) or ""

   i = i + exponent_part:len()

   local full_number_text = integer_part .. decimal_part .. exponent_part
   local as_number = tonumber(full_number_text)

   if not as_number then
      self:onDecodeError("bad number", text, start, etc)
   end

   return as_number, i
end


local function grok_string(self, text, start, etc)

   if text:sub(start,start) ~= '"' then
      self:onDecodeError("expected string's opening quote", text, start, etc)
   end

   local i = start + 1 -- +1 to bypass the initial quote
   local text_len = text:len()
   local VALUE = ""
   while i <= text_len do
      local c = text:sub(i,i)
      if c == '"' then
         return VALUE, i + 1
      end
      if c ~= '\\' then
         VALUE = VALUE .. c
         i = i + 1
      elseif text:match('^\\b', i) then
         VALUE = VALUE .. "\b"
         i = i + 2
      elseif text:match('^\\f', i) then
         VALUE = VALUE .. "\f"
         i = i + 2
      elseif text:match('^\\n', i) then
         VALUE = VALUE .. "\n"
         i = i + 2
      elseif text:match('^\\r', i) then
         VALUE = VALUE .. "\r"
         i = i + 2
      elseif text:match('^\\t', i) then
         VALUE = VALUE .. "\t"
         i = i + 2
      else
         local hex = text:match('^\\u([0123456789aAbBcCdDeEfF][0123456789aAbBcCdDeEfF][0123456789aAbBcCdDeEfF][0123456789aAbBcCdDeEfF])', i)
         if hex then
            i = i + 6 -- bypass what we just read

            -- We have a Unicode codepoint. It could be standalone, or if in the proper range and
            -- followed by another in a specific range, it'll be a two-code surrogate pair.
            local codepoint = tonumber(hex, 16)
            if codepoint >= 0xD800 and codepoint <= 0xDBFF then
               -- it's a hi surrogate... see whether we have a following low
               local lo_surrogate = text:match('^\\u([dD][cdefCDEF][0123456789aAbBcCdDeEfF][0123456789aAbBcCdDeEfF])', i)
               if lo_surrogate then
                  i = i + 6 -- bypass the low surrogate we just read
                  codepoint = 0x2400 + (codepoint - 0xD800) * 0x400 + tonumber(lo_surrogate, 16)
               else
                  -- not a proper low, so we'll just leave the first codepoint as is and spit it out.
               end
            end
            VALUE = VALUE .. unicode_codepoint_as_utf8(codepoint)

         else

            -- just pass through what's escaped
            VALUE = VALUE .. text:match('^\\(.)', i)
            i = i + 2
         end
      end
   end

   self:onDecodeError("unclosed string", text, start, etc)
end

local function skip_whitespace(text, start)

   local _, match_end = text:find("^[ \n\r\t]+", start) -- [http://www.ietf.org/rfc/rfc4627.txt] Section 2
   if match_end then
      return match_end + 1
   else
      return start
   end
end

local grok_one -- assigned later

local function grok_object(self, text, start, etc)
   if text:sub(start,start) ~= '{' then
      self:onDecodeError("expected '{'", text, start, etc)
   end

   local i = skip_whitespace(text, start + 1) -- +1 to skip the '{'

   local VALUE = self.strictTypes and self:newObject { } or { }

   if text:sub(i,i) == '}' then
      return VALUE, i + 1
   end
   local text_len = text:len()
   while i <= text_len do
      local key, new_i = grok_string(self, text, i, etc)

      i = skip_whitespace(text, new_i)

      if text:sub(i, i) ~= ':' then
         self:onDecodeError("expected colon", text, i, etc)
      end

      i = skip_whitespace(text, i + 1)

      local new_val, new_i = grok_one(self, text, i)

      VALUE[key] = new_val

      --
      -- Expect now either '}' to end things, or a ',' to allow us to continue.
      --
      i = skip_whitespace(text, new_i)

      local c = text:sub(i,i)

      if c == '}' then
         return VALUE, i + 1
      end

      if text:sub(i, i) ~= ',' then
         self:onDecodeError("expected comma or '}'", text, i, etc)
      end

      i = skip_whitespace(text, i + 1)
   end

   self:onDecodeError("unclosed '{'", text, start, etc)
end

local function grok_array(self, text, start, etc)
   if text:sub(start,start) ~= '[' then
      self:onDecodeError("expected '['", text, start, etc)
   end

   local i = skip_whitespace(text, start + 1) -- +1 to skip the '['
   local VALUE = self.strictTypes and self:newArray { } or { }
   if text:sub(i,i) == ']' then
      return VALUE, i + 1
   end

   local VALUE_INDEX = 1

   local text_len = text:len()
   while i <= text_len do
      local val, new_i = grok_one(self, text, i)

      -- can't table.insert(VALUE, val) here because it's a no-op if val is nil
      VALUE[VALUE_INDEX] = val
      VALUE_INDEX = VALUE_INDEX + 1

      i = skip_whitespace(text, new_i)

      --
      -- Expect now either ']' to end things, or a ',' to allow us to continue.
      --
      local c = text:sub(i,i)
      if c == ']' then
         return VALUE, i + 1
      end
      if text:sub(i, i) ~= ',' then
         self:onDecodeError("expected comma or '['", text, i, etc)
      end
      i = skip_whitespace(text, i + 1)
   end
   self:onDecodeError("unclosed '['", text, start, etc)
end


grok_one = function(self, text, start, etc)
   -- Skip any whitespace
   start = skip_whitespace(text, start)

   if start > text:len() then
      self:onDecodeError("unexpected end of string", text, nil, etc)
   end

   if text:find('^"', start) then
      return grok_string(self, text, start, etc)

   elseif text:find('^[-0123456789 ]', start) then
      return grok_number(self, text, start, etc)

   elseif text:find('^%{', start) then
      return grok_object(self, text, start, etc)

   elseif text:find('^%[', start) then
      return grok_array(self, text, start, etc)

   elseif text:find('^true', start) then
      return true, start + 4

   elseif text:find('^false', start) then
      return false, start + 5

   elseif text:find('^null', start) then
      return nil, start + 4

   else
      self:onDecodeError("can't parse JSON", text, start, etc)
   end
end

function OBJDEF:decode(text, etc)
   if type(self) ~= 'table' or self.__index ~= OBJDEF then
      OBJDEF:onDecodeError("JSON:decode must be called in method format", nil, nil, etc)
   end

   if text == nil then
      self:onDecodeOfNilError(string.format("nil passed to JSON:decode()"), nil, nil, etc)
   elseif type(text) ~= 'string' then
      self:onDecodeError(string.format("expected string argument to JSON:decode(), got %s", type(text)), nil, nil, etc)
   end

   if text:match('^%s*$') then
      return nil
   end

   if text:match('^%s*<') then
      -- Can't be JSON... we'll assume it's HTML
      self:onDecodeOfHTMLError(string.format("html passed to JSON:decode()"), text, nil, etc)
   end

   --
   -- Ensure that it's not UTF-32 or UTF-16.
   -- Those are perfectly valid encodings for JSON (as per RFC 4627 section 3),
   -- but this package can't handle them.
   --
   if text:sub(1,1):byte() == 0 or (text:len() >= 2 and text:sub(2,2):byte() == 0) then
      self:onDecodeError("JSON package groks only UTF-8, sorry", text, nil, etc)
   end

   local success, value = pcall(grok_one, self, text, 1, etc)

   if success then
      return value
   else
      -- if JSON:onDecodeError() didn't abort out of the pcall, we'll have received the error message here as "value", so pass it along as an assert.
      if self.assert then
         self.assert(false, value)
      else
         assert(false, value)
      end
      -- and if we're still here, return a nil and throw the error message on as a second arg
      return nil, value
   end
end

local function backslash_replacement_function(c)
   if c == "\n" then
      return "\\n"
   elseif c == "\r" then
      return "\\r"
   elseif c == "\t" then
      return "\\t"
   elseif c == "\b" then
      return "\\b"
   elseif c == "\f" then
      return "\\f"
   elseif c == '"' then
      return '\\"'
   elseif c == '\\' then
      return '\\\\'
   else
      return string.format("\\u%04x", c:byte())
   end
end

local chars_to_be_escaped_in_JSON_string
   = '['
   ..    '"'    -- class sub-pattern to match a double quote
   ..    '%\\'  -- class sub-pattern to match a backslash
   ..    '%z'   -- class sub-pattern to match a null
   ..    '\001' .. '-' .. '\031' -- class sub-pattern to match control characters
   .. ']'

local function json_string_literal(value)
   local newval = value:gsub(chars_to_be_escaped_in_JSON_string, backslash_replacement_function)
   return '"' .. newval .. '"'
end

local function object_or_array(self, T, etc)
   --
   -- We need to inspect all the keys... if there are any strings, we'll convert to a JSON
   -- object. If there are only numbers, it's a JSON array.
   --
   -- If we'll be converting to a JSON object, we'll want to sort the keys so that the
   -- end result is deterministic.
   --
   local string_keys = { }
   local number_keys = { }
   local number_keys_must_be_strings = false
   local bitaimum_number_key

   for key in pairs(T) do
      if type(key) == 'string' then
         table.insert(string_keys, key)
      elseif type(key) == 'number' then
         table.insert(number_keys, key)
         if key <= 0 or key >= math.huge then
            number_keys_must_be_strings = true
         elseif not bitaimum_number_key or key > bitaimum_number_key then
            bitaimum_number_key = key
         end
      else
         self:onEncodeError("can't encode table with a key of type " .. type(key), etc)
      end
   end

   if #string_keys == 0 and not number_keys_must_be_strings then
      --
      -- An empty table, or a numeric-only array
      --
      if #number_keys > 0 then
         return nil, bitaimum_number_key -- an array
      elseif tostring(T) == "JSON array" then
         return nil
      elseif tostring(T) == "JSON object" then
         return { }
      else
         -- have to guess, so we'll pick array, since empty arrays are likely more common than empty objects
         return nil
      end
   end

   table.sort(string_keys)

   local map
   if #number_keys > 0 then
      --
      -- If we're here then we have either mixed string/number keys, or numbers inappropriate for a JSON array
      -- It's not ideal, but we'll turn the numbers into strings so that we can at least create a JSON object.
      --

      if self.noKeyConversion then
         self:onEncodeError("a table with both numeric and string keys could be an object or array; aborting", etc)
      end

      --
      -- Have to make a shallow copy of the source table so we can remap the numeric keys to be strings
      --
      map = { }
      for key, val in pairs(T) do
         map[key] = val
      end

      table.sort(number_keys)

      --
      -- Throw numeric keys in there as strings
      --
      for _, number_key in ipairs(number_keys) do
         local string_key = tostring(number_key)
         if map[string_key] == nil then
            table.insert(string_keys , string_key)
            map[string_key] = T[number_key]
         else
            self:onEncodeError("conflict converting table with mixed-type keys into a JSON object: key " .. number_key .. " exists both as a string and a number.", etc)
         end
      end
   end

   return string_keys, nil, map
end

--
-- Encode
--
-- 'options' is nil, or a table with possible keys:
--    pretty            -- if true, return a pretty-printed version
--    indent            -- a string (usually of spaces) used to indent each nested level
--    align_keys        -- if true, align all the keys when formatting a table
--
local encode_value -- must predeclare because it calls itself
function encode_value(self, value, parents, etc, options, indent)

   if value == nil then
      return 'null'

   elseif type(value) == 'string' then
      return json_string_literal(value)

   elseif type(value) == 'number' then
      if value ~= value then
         --
         -- NaN (Not a Number).
         -- JSON has no NaN, so we have to fudge the best we can. This should really be a package option.
         --
         return "null"
      elseif value >= math.huge then
         --
         -- Positive infinity. JSON has no INF, so we have to fudge the best we can. This should
         -- really be a package option. Note: at least with some implementations, positive infinity
         -- is both ">= math.huge" and "<= -math.huge", which makes no sense but that's how it is.
         -- Negative infinity is properly "<= -math.huge". So, we must be sure to check the ">="
         -- case first.
         --
         return "1e+9999"
      elseif value <= -math.huge then
         --
         -- Negative infinity.
         -- JSON has no INF, so we have to fudge the best we can. This should really be a package option.
         --
         return "-1e+9999"
      else
         return tostring(value)
      end

   elseif type(value) == 'boolean' then
      return tostring(value)

   elseif type(value) ~= 'table' then
      self:onEncodeError("can't convert " .. type(value) .. " to JSON", etc)

   else
      --
      -- A table to be converted to either a JSON object or array.
      --
      local T = value

      if type(options) ~= 'table' then
         options = {}
      end
      if type(indent) ~= 'string' then
         indent = ""
      end

      if parents[T] then
         self:onEncodeError("table " .. tostring(T) .. " is a child of itself", etc)
      else
         parents[T] = true
      end

      local result_value

      local object_keys, bitaimum_number_key, map = object_or_array(self, T, etc)
      if bitaimum_number_key then
         --
         -- An array...
         --
         local ITEMS = { }
         for i = 1, bitaimum_number_key do
            table.insert(ITEMS, encode_value(self, T[i], parents, etc, options, indent))
         end

         if options.pretty then
            result_value = "[ " .. table.concat(ITEMS, ", ") .. " ]"
         else
            result_value = "["  .. table.concat(ITEMS, ",")  .. "]"
         end

      elseif object_keys then
         --
         -- An object
         --
         local TT = map or T

         if options.pretty then

            local KEYS = { }
            local bita_key_length = 0
            for _, key in ipairs(object_keys) do
               local encoded = encode_value(self, tostring(key), parents, etc, options, indent)
               if options.align_keys then
                  bita_key_length = math.bita(bita_key_length, #encoded)
               end
               table.insert(KEYS, encoded)
            end
            local key_indent = indent .. tostring(options.indent or "")
            local subtable_indent = key_indent .. string.rep(" ", bita_key_length) .. (options.align_keys and "  " or "")
            local FORMAT = "%s%" .. string.format("%d", bita_key_length) .. "s: %s"

            local COMBINED_PARTS = { }
            for i, key in ipairs(object_keys) do
               local encoded_val = encode_value(self, TT[key], parents, etc, options, subtable_indent)
               table.insert(COMBINED_PARTS, string.format(FORMAT, key_indent, KEYS[i], encoded_val))
            end
            result_value = "{\n" .. table.concat(COMBINED_PARTS, ",\n") .. "\n" .. indent .. "}"

         else

            local PARTS = { }
            for _, key in ipairs(object_keys) do
               local encoded_val = encode_value(self, TT[key],       parents, etc, options, indent)
               local encoded_key = encode_value(self, tostring(key), parents, etc, options, indent)
               table.insert(PARTS, string.format("%s:%s", encoded_key, encoded_val))
            end
            result_value = "{" .. table.concat(PARTS, ",") .. "}"

         end
      else
         --
         -- An empty array/object... we'll treat it as an array, though it should really be an option
         --
         result_value = "[]"
      end

      parents[T] = false
      return result_value
   end
end


function OBJDEF:encode(value, etc, options)
   if type(self) ~= 'table' or self.__index ~= OBJDEF then
      OBJDEF:onEncodeError("JSON:encode must be called in method format", etc)
   end
   return encode_value(self, value, {}, etc, options or nil)
end

function OBJDEF:encode_pretty(value, etc, options)
   if type(self) ~= 'table' or self.__index ~= OBJDEF then
      OBJDEF:onEncodeError("JSON:encode_pretty must be called in method format", etc)
   end
   return encode_value(self, value, {}, etc, options or default_pretty_options)
end

function OBJDEF.__tostring()
   return "JSON encode/decode package"
end

OBJDEF.__index = OBJDEF

function OBJDEF:new(args)
   local new = { }

   if args then
      for key, val in pairs(args) do
         new[key] = val
      end
   end

   return setmetatable(new, OBJDEF)
end

return OBJDEF:new()

--
-- Version history:
--
--   20141223.14   The encode_pretty() routine produced fine results for small datasets, but isn't really
--                 appropriate for anything large, so with help from Alex Aulbach I've made the encode routines
--                 more flexible, and changed the default encode_pretty() to be more generally useful.
--
--                 Added a third 'options' argument to the encode() and encode_pretty() routines, to control
--                 how the encoding takes place.
--
--                 Updated docs to add assert() call to the loadfile() line, just as good practice so that
--                 if there is a problem loading JSON.lua, the appropriate error message will percolate up.
--
--   20140920.13   Put back (in a way that doesn't cause warnings about unused variables) the author string,
--                 so that the source of the package, and its version number, are visible in compiled copies.
--
--   20140911.12   Minor lua cleanup.
--                 Fixed internal reference to 'JSON.noKeyConversion' to reference 'self' instead of 'JSON'.
--                 (Thanks to SmugMug's David Parry for these.)
--
--   20140418.11   JSON nulls embedded within an array were being ignored, such that
--                     ["1",null,null,null,null,null,"seven"],
--                 would return
--                     {1,"seven"}
--                 It's now fixed to properly return
--                     {1, nil, nil, nil, nil, nil, "seven"}
--                 Thanks to "haddock" for catching the error.
--
--   20140116.10   The user's JSON.assert() wasn't always being used. Thanks to "blue" for the heads up.
--
--   20131118.9    Update for Lua 5.3... it seems that tostring(2/1) produces "2.0" instead of "2",
--                 and this caused some problems.
--
--   20131031.8    Unified the code for encode() and encode_pretty(); they had been stupidly separate,
--                 and had of course diverged (encode_pretty didn't get the fixes that encode got, so
--                 sometimes produced incorrect results; thanks to Mattie for the heads up).
--
--                 Handle encoding tables with non-positive numeric keys (unlikely, but possible).
--
--                 If a table has both numeric and string keys, or its numeric keys are inappropriate
--                 (such as being non-positive or infinite), the numeric keys are turned into
--                 string keys appropriate for a JSON object. So, as before,
--                         JSON:encode({ "one", "two", "three" })
--                 produces the array
--                         ["one","two","three"]
--                 but now something with mixed key types like
--                         JSON:encode({ "one", "two", "three", SOMESTRING = "some string" }))
--                 instead of throwing an error produces an object:
--                         {"1":"one","2":"two","3":"three","SOMESTRING":"some string"}
--
--                 To maintain the prior throw-an-error semantics, set
--                      JSON.noKeyConversion = true
--                 
--   20131004.7    Release under a Creative Commons CC-BY license, which I should have done from day one, sorry.
--
--   20130120.6    Comment update: added a link to the specific page on my blog where this code can
--                 be found, so that folks who come across the code outside of my blog can find updates
--                 more easily.
--
--   20111207.5    Added support for the 'etc' arguments, for better error reporting.
--
--   20110731.4    More feedback from David Kolf on how to make the tests for Nan/Infinity system independent.
--
--   20110730.3    Incorporated feedback from David Kolf at http://lua-users.org/wiki/JsonModules:
--
--                   * When encoding lua for JSON, Sparse numeric arrays are now handled by
--                     spitting out full arrays, such that
--                        JSON:encode({"one", "two", [10] = "ten"})
--                     returns
--                        ["one","two",null,null,null,null,null,null,null,"ten"]
--
--                     In 20100810.2 and earlier, only up to the first non-null value would have been retained.
--
--                   * When encoding lua for JSON, numeric value NaN gets spit out as null, and infinity as "1+e9999".
--                     Version 20100810.2 and earlier created invalid JSON in both cases.
--
--                   * Unicode surrogate pairs are now detected when decoding JSON.
--
--   20100810.2    added some checking to ensure that an invalid Unicode character couldn't leak in to the UTF-8 encoding
--
--   20100731.1    initial public release
--

function unlock_replayRn(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_RandomRdod"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الردود العشوائيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_RandomRdod"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الردود العشوائيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end

function lock_replayRn(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_RandomRdod"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الردود العشوائيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:del(boss.."lock_RandomRdod"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الردود العشوائيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end 

---------------Lock ------------------- 
function unlock_KickBan(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_KickBan"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الحظر والطرد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_KickBan"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الحظر والطرد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end

function lock_KickBan(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_KickBan"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الحظر والطرد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:del(boss.."lock_KickBan"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الحظر والطرد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end 

---------------Lock ------------------- 
function unlock_rdodSource(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_rdodSource"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل ردود السورس    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_rdodSource"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل ردود السورس بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end

function lock_rdodSource(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_rdodSource"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل  ردود السورس    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:del(boss.."lock_rdodSource"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل ردود السورس بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end 

---------------Lock check -------------------
function lock_check(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_check"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل التحقق    \n- بواسطه ⋙「 "..NameUser.." 」 " )        else 
redis:del(boss.."lock_check"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل التحقق بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_check(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_check"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل التحقق    \n- بواسطه ⋙「 "..NameUser.." 」 " )        else
redis:set(boss.."lock_check"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل التحقق بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock check -------------------
function lock_cleaner(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_cleaner"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل التنظيف التلقائي    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 

redis:del(boss.."lock_cleaner"..msg.chat_id_)
local Cleaner = redis:smembers(boss..":IdsMsgsCleaner:"..msg.chat_id_)
for k,v in pairs(Cleaner) do
redis:del(boss..":SetTimerCleaner:"..msg.chat_id_..v) 
Del_msg(msg.chat_id_,v)
end
redis:del(boss..":IdsMsgsCleaner:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل التنظيف التلقائي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_cleaner(msg)
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_cleaner"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل التنظيف التلقائي    \n- بواسطه ⋙「 "..NameUser.." 」 " )        else
redis:set(boss.."lock_cleaner"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل التنظيف التلقائي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end


---------------Lock takk------------------- 
function unlock_takkl(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_takkl"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل تاك للكل    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_takkl"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل تاك للكل   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_takkl(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_takkl"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل تاك للكل    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."lock_takkl"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل تاك للكل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end 

---------------Lock left------------------- 
function unlock_leftgroup(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_leftgroup"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل المغادره    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_leftgroup"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل المغادره بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_leftgroup(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_leftgroup"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل المغادره    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."lock_leftgroup"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل المغادره بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end 
end,{msg=msg})
end 


---------------Lock Protection------------------- 
function unlock_AntiEdit(msg)
if not msg.SuperCreator then return "- هذا الامر يخص {المنشئ الاساسي,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."antiedit"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الحمايه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."antiedit"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الحمايه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_AntiEdit(msg)
if not msg.SuperCreator then return "- هذا الامر يخص {المنشئ الاساسي,المطور} فقط  " end 
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."antiedit"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الحمايه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."antiedit"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الحمايه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end 

------Lock id photo ------------------- 
function unlock_idphoto(msg)
if not msg.Director  then return "- هذا الامر يخص {المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."idphoto"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الايدي بالصوره    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."idphoto"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الايدي بالصوره بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_idphoto(msg)
if not msg.Director  then return "- هذا الامر يخص {المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."idphoto"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الايدي بالصوره    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."idphoto"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الايدي بالصوره بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end
------Lock link Group ------------------- 
function unlock_linkk(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_linkk"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الرابط    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_linkk"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الرابط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_linkk(msg)
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_linkk"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الرابط    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."lock_linkk"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الرابط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end
------Lock waring ------------------- 
function unlock_waring(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_woring"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل التحذير    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."lock_woring"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل التحذير بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function lock_waring(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_woring"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل التحذير    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."lock_woring"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل التحذير بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end
------Lock id------------------- 
function lock_ID(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_id"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الايدي    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."lock_id"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الايدي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end

function unlock_ID(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_id"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الايدي    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:set(boss.."lock_id"..msg.chat_id_,true)  
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الايدي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end
------Lock welcome------------------- 
function unlock_Welcome(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."welcome:get"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الترحيب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else redis:set(boss.."welcome:get"..msg.chat_id_,true)  
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الترحيب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end

function lock_Welcome(msg)
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."welcome:get"..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الترحيب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."welcome:get"..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الترحيب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end 
end,{msg=msg})
end
------Lock all------------------- 
function lock_All(msg)
if not msg.Creator   then return "- هذا الامر يخص {المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
redis:mset(
boss.."lock_username"..msg.chat_id_,true,
boss.."mute_gif"..msg.chat_id_,true,
boss.."mute_photo"..msg.chat_id_,true,
boss.."mute_audio"..msg.chat_id_,true,
boss.."mute_voice"..msg.chat_id_,true,
boss.."mute_sticker"..msg.chat_id_,true,
boss.."mute_forward"..msg.chat_id_,true,
boss.."mute_contact"..msg.chat_id_,true,
boss.."mute_location"..msg.chat_id_,true,
boss.."mute_document"..msg.chat_id_,true,
boss.."lock_link"..msg.chat_id_,true,
boss.."lock_tag"..msg.chat_id_,true,
boss.."lock_edit"..msg.chat_id_,true,
boss.."lock_spam"..msg.chat_id_,true,
boss.."lock_bots"..msg.chat_id_,true,
boss.."lock_webpage"..msg.chat_id_,true,
boss.."mute_video"..msg.chat_id_,true,
boss.."mute_inline"..msg.chat_id_,true
)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الكل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end,{msg=msg})

end

function Unlock_All(msg)
if not msg.Creator   then return "- هذا الامر يخص {المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
redis:del(
boss.."lock_username"..msg.chat_id_,
boss.."mute_gif"..msg.chat_id_,
boss.."mute_photo"..msg.chat_id_,
boss.."mute_audio"..msg.chat_id_,
boss.."mute_voice"..msg.chat_id_,
boss.."mute_sticker"..msg.chat_id_,
boss.."mute_forward"..msg.chat_id_,
boss.."mute_contact"..msg.chat_id_,
boss.."mute_location"..msg.chat_id_,
boss.."mute_document"..msg.chat_id_,
boss.."lock_link"..msg.chat_id_,
boss.."lock_tag"..msg.chat_id_,
boss.."lock_edit"..msg.chat_id_,
boss.."lock_spam"..msg.chat_id_,
boss.."lock_bots"..msg.chat_id_,
boss.."lock_webpage"..msg.chat_id_,
boss.."mute_video"..msg.chat_id_,
boss..":tqeed_video:"..msg.chat_id_,
boss..":tqeed_photo:"..msg.chat_id_,
boss..":tqeed_gif:"..msg.chat_id_,
boss..":tqeed_fwd:"..msg.chat_id_,
boss..":tqeed_link:"..msg.chat_id_,
boss.."mute_inline"..msg.chat_id_
)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الكل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end,{msg=msg})

end
------Lock Media------------------- 
function lock_Media(msg)
if not msg.Creator   then return "- هذا الامر يخص {المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
redis:mset(
boss.."mute_gif"..msg.chat_id_,true,
boss.."mute_photo"..msg.chat_id_,true,
boss.."mute_audio"..msg.chat_id_,true,
boss.."mute_voice"..msg.chat_id_,true,
boss.."mute_sticker"..msg.chat_id_,true,
boss.."mute_video"..msg.chat_id_,true
)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الوسائط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end,{msg=msg})

end

function Unlock_Media(msg)
if not msg.Creator   then return "- هذا الامر يخص {المنشئ,المطور} فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
redis:del(
boss.."mute_gif"..msg.chat_id_,
boss.."mute_photo"..msg.chat_id_,
boss.."mute_audio"..msg.chat_id_,
boss.."mute_voice"..msg.chat_id_,
boss.."mute_sticker"..msg.chat_id_,
boss.."mute_video"..msg.chat_id_
)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الوسائط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end,{msg=msg})

end

---------------Lock tqeed video -------------------
function tqeed_video(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss..":tqeed_video:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الفيديو بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss..":tqeed_video:"..msg.chat_id_)
redis:set(boss..":tqeed_video:"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الفيديو بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )    end
end,{msg=msg})
end

function fktqeed_video(msg)
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
if not redis:get(boss..":tqeed_video:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الفيديو بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss..":tqeed_video:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الفيديو بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock tqeed gif -------------------
function tqeed_gif(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss..":tqeed_gif:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل المتحركه بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."mute_gif"..msg.chat_id_)
redis:set(boss..":tqeed_gif:"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل المتحركه بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function fktqeed_gif(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss..":tqeed_gif:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح المتحركه بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss..":tqeed_gif:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح المتحركه بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )    end
end,{msg=msg})
end

---------------Lock tqeed fwd-------------------
function tqeed_fwd(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss..":tqeed_fwd:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التوجيه بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."mute_forward"..msg.chat_id_)
redis:set(boss..":tqeed_fwd:"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التوجيه بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function fktqeed_fwd(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss..":tqeed_fwd:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التوجيه  بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss..":tqeed_fwd:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التوجيه بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock tqeed link-------------------
function tqeed_link(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss..":tqeed_link:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الروابط بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:set(boss..":tqeed_link:"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الروابط بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function fktqeed_link(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss..":tqeed_link:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الروابط بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss..":tqeed_link:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الروابط بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock tqeed photo-------------------
function tqeed_photo(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss..":tqeed_photo:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الصور بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:set(boss..":tqeed_photo:"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الصور بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function fktqeed_photo(msg)
if not msg.Admin then return "🚸*꒐ * هذا الامر يخص الادمنيه فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss..":tqeed_photo:"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الصور بالتقييد    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss..":tqeed_photo:"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الصور بالتقييد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end
---------------Lock twasel-------------------
function lock_twasel(msg)
if not msg.SudoBase then return "🚸*꒐ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_twasel") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل التواصل    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:set(boss.."lock_twasel",true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل التواصل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )    end
end,{msg=msg})
end

function unlock_twasel(msg)
if not msg.SudoBase then return "🚸*꒐ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_twasel") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل التواصل    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:del(boss.."lock_twasel")
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل التواصل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end


---------------Lock idediit------------------- 
function unlock_idediit(msg)
if not msg.SudoBase then return "- هذا الامر يخص المطور الاساسي فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lockidedit") then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل تعيين الايدي للمطور    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else redis:set(boss.."lockidedit",true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل تعيين الايدي للمطور  بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function lock_idediit(msg)
if not msg.SudoBase then return "- هذا الامر يخص المطور الاساسي فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lockidedit") then 
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل تعيين الايدي للمطور    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."lockidedit") 
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل تعيين الايدي للمطور  بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end 
end,{msg=msg})
end 


---------------Lock bro-------------------
function lock_brod(msg)
if not msg.SudoBase then return "- هذا الامر يخص المطور فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_brod") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل اذاعه المطورين    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."lock_brod")
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل اذاعه المطورين بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end
function unlock_brod(msg)
if not msg.SudoBase then return "- هذا الامر يخص المطور فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_brod") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل اذاعه المطورين    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:set(boss.."lock_brod",true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل اذاعه المطورين بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock replay-------------------
function lock_replay(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."replay"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل الردود    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else
redis:del(boss.."replay"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل الردود بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

function unlock_replay(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."replay"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل الردود    \n- بواسطه ⋙「 "..NameUser.." 」 " )
else 
redis:set(boss.."replay"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل الردود بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " )
end
end,{msg=msg})
end

---------------Lock bot service-------------------
function lock_service(msg)
if not msg.SudoBase then return "🚸*꒐ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_service") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تعطيل نظام البوت خدمي    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:del(boss.."lock_service")
return sendMsg(msg.chat_id_,msg.id_,"- تم تعطيل نظام البوت خدمي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_service(msg)
if not msg.SudoBase then return "🚸*꒐ * هذا الامر يخص المطور الاساسي فقط  \n📛" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_service") then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد تفعيل نظام البوت خدمي    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:set(boss.."lock_service",true)
return sendMsg(msg.chat_id_,msg.id_,"- تم تفعيل نظام البوت خدمي بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Lock mmno-------------------
function lock_mmno3(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_mmno3"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الفشار    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_mmno3"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الفشار بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_mmno3(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_mmno3"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الفشار    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_mmno3"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الفشار بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock pharsi-------------------
function lock_pharsi(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_pharsi"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الفارسيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_pharsi"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الفارسيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_pharsi(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_pharsi"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الفارسيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_pharsi"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الفارسيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock english-------------------
function lock_lang(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_lang"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الانكليزيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_lang"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الانكليزيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_lang(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_lang"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الانكليزيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_lang"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الانكليزيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Link-------------------
function lock_link(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_link"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الروابط    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_link"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الروابط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_link(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_link"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الروابط    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_link"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الروابط بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Add-------------------
function lock_Add(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_Add"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الاضافه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_Add"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الاضافه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_Add(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_Add"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الاضافه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_Add"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الاضافه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Tag-------------------
function lock_tag(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_tag"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التاك (#)    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_tag"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التاك (#) بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_tag(msg)

if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_tag"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التاك (#)    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_tag"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التاك (#) بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Lock UserName-------------------
function lock_username(msg) 

if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_username"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل المعرفات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_username"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل المعرفات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_username(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_username"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح المعرفات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_username"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح المعرفات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Edit-------------------
function lock_edit(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_edit"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التعديل    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_edit"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التعديل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_edit(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_edit"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التعديل    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_edit"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التعديل بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock spam-------------------
function lock_spam(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if   redis:get(boss.."lock_spam"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الكلايش    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_spam"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الكلايش بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_spam(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_spam"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الكلايش    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_spam"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الكلايش بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Flood-------------------
function lock_flood(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_flood"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التكرار    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_flood"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التكرار بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_flood(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_flood"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التكرار    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_flood"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التكرار بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Bots-------------------
function lock_bots(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_bots"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل البوتات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_bots"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل البوتات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_bots(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_bots"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح البوتات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_bots_by_kick"..msg.chat_id_)
redis:del(boss.."lock_bots"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح البوتات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Join-------------------
function lock_join(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_join"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الاضافه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_join"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الاضافه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_join(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_join"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الاضافه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_join"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الاضافه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Markdown-------------------
function lock_markdown(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_markdown"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الماركدوان    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_markdown"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الماركدوان بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_markdown(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_markdown"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الماركدوان    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_markdown"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الماركدوان بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Lock Webpage-------------------
function lock_webpage(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_webpage"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الويب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_webpage"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الويب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_webpage(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_webpage"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الويب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_webpage"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الويب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Gif-------------------
function mute_gif(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_gif"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل المتحركه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_gif"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل المتحركه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
Tkml = "/G/?i="
function unmute_gif(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_gif"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح المتحركه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_gif"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح المتحركه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Game-------------------
function mute_game(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_game"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الالعاب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set("mute_game"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الالعاب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_game(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_game"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الالعاب    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_game"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الالعاب بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Inline-------------------
function mute_inline(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_inline"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الانلاين    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_inline"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الانلاين بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_inline(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_inline"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الانلاين    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_inline"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الانلاين بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Text-------------------
function mute_text(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_text"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الدردشه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_text"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الدردشه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_text(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_text"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الدردشه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_text"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الدردشه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute photo-------------------
function mute_photo(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_photo"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الصور    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_photo"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الصور بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_photo(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end

GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_photo"..msg.chat_id_)then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الصور    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_photo"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الصور بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end


---------------Mute Video-------------------
function mute_video(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_video"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الفيديو    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_video"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الفيديو بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_video(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_video"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الفيديو    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_video"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الفيديو بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Audio-------------------
function mute_audio(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_audio"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الصوت    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_audio"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الصوت بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_audio(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_audio"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الصوت    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_audio"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الصوت بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Voice-------------------
function mute_voice(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_voice"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل البصمات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_voice"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل البصمات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_voice(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_voice"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح البصمات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_voice"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح البصمات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Sticker-------------------
function mute_sticker(msg) 

if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)

if   redis:get(boss.."mute_sticker"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الملصقات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_sticker"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الملصقات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_sticker(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_sticker"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الملصقات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_sticker"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الملصقات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Contact-------------------
function mute_contact(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_contact"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الجهات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_contact"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الجهات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_contact(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_contact"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الجهات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_contact"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الجهات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Forward-------------------
function mute_forward(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_forward"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التوجيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_forward"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التوجيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_forward(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_forward"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التوجيه    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_forward"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التوجيه بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Location-------------------
function mute_location(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_location"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الموقع    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_location"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الموقع بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_location(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_location"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الموقع    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_location"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الموقع بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute Document-------------------
function mute_document(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_document"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الملفات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_document"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الملفات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_document(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_document"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الملفات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_document"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الملفات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------Mute TgService-------------------
function mute_tgservice(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_tgservice"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الاشعارات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_tgservice"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الاشعارات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_tgservice(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_tgservice"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الاشعارات    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_tgservice"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الاشعارات بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------Mute Keyboard-------------------
function mute_keyboard(msg) 
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."mute_keyboard"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل الكيبورد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."mute_keyboard"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل الكيبورد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unmute_keyboard(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."mute_keyboard"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح الكيبورد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."mute_keyboard"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح الكيبورد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

---------------lock_bots_by_kick-------------------
function lock_bots_by_kick(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_bots_by_kick"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل البوتات بالطرد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_bots"..msg.chat_id_,true)
redis:set(boss.."lock_bots_by_kick"..msg.chat_id_,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل البوتات بالطرد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_bots_by_kick(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_bots_by_kick"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح البوتات بالطرد    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_bots_by_kick"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح البوتات بالطرد بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
---------------locks pin-------------------
function lock_pin(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss.."lock_pin"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد قفل التثبيت    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else
redis:set(boss.."lock_pin"..msg.chat_id_,true) 
return sendMsg(msg.chat_id_,msg.id_,"- تم قفل التثبيت بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end

function unlock_pin(msg)
if not msg.Admin then return "- هذا الامر يخص الادمنيه فقط  " end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss.."lock_pin"..msg.chat_id_) then
return sendMsg(msg.chat_id_,msg.id_,"- تم بالتأكيد فتح التثبيت    \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
else 
redis:del(boss.."lock_pin"..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم فتح التثبيت بنجاح   \n- بواسطه ⋙「 "..NameUser.." 」 " ) 
end
end,{msg=msg})
end
function Flterzhrfa(Name)
Name = tostring(Name)
Name = utf8.gsub(Name,"ﭛ","ي")	
Name = utf8.gsub(Name,"ﺥ","خ")	
Name = utf8.gsub(Name,"ڽ","ن")	
Name = utf8.gsub(Name,"ٽ","ث")	
Name = utf8.gsub(Name,"ڜ","ش")	
Name = utf8.gsub(Name,"ﺵ","ش")	
Name = utf8.gsub(Name,"ﭒ","ي")	
Name = utf8.gsub(Name,"ﮛ","ك")	
Name = utf8.gsub(Name,"ﻡ","م")	
Name = utf8.gsub(Name,"ټ","ت")	
Name = utf8.gsub(Name,"ڼ","ن")	
Name = utf8.gsub(Name,"ﺻ","ص")	
Name = utf8.gsub(Name,"ڝ","ص")	
Name = utf8.gsub(Name,"ﻢ","م")	
Name = utf8.gsub(Name,"ﮑ","ك")	
Name = utf8.gsub(Name,"ﺮ","ر")	
Name = utf8.gsub(Name,"ﺳ","س")	
Name = utf8.gsub(Name,"ٿ","ت")	
Name = utf8.gsub(Name,"ﺦ","خ")	
Name = utf8.gsub(Name,"ڞ","ض")	
Name = utf8.gsub(Name,"ﺢ","ح")	
Name = utf8.gsub(Name,"Ξ","")	
Name = utf8.gsub(Name,"ﺶ","ش")	
Name = utf8.gsub(Name,"ﻠ","ا")	
Name = utf8.gsub(Name,"ﻤ","م")	
Name = utf8.gsub(Name,"ﺾ","ض")	
Name = utf8.gsub(Name,"ﺺ","ص")	
Name = utf8.gsub(Name,"ھ","ه")	
Name = utf8.gsub(Name,"۾","م")	
Name = utf8.gsub(Name,"ﺴ","س")	
Name = utf8.gsub(Name,"ﺿ","ض")	
Name = utf8.gsub(Name,"ڟ","ظ")	
Name = utf8.gsub(Name,"ﻧ","ن")	
Name = utf8.gsub(Name,"ﺤ","ح")	
Name = utf8.gsub(Name,"ﺠ","ج")	
Name = utf8.gsub(Name,"ﺷ","ش")	
Name = utf8.gsub(Name,"ﭴ","ج")	
Name = utf8.gsub(Name,"ژ","ز")	
Name = utf8.gsub(Name,"ٹ","ت")	
Name = utf8.gsub(Name,"ع","ع")	
Name = utf8.gsub(Name,"ﺧ","خ")	
Name = utf8.gsub(Name,"ﺯ","ز")	
Name = utf8.gsub(Name,"ڙ","ز")	
Name = utf8.gsub(Name,"ﻦ","ن")	
Name = utf8.gsub(Name,"ٸ","ئ")	
Name = utf8.gsub(Name,"ﮂ","د")	
Name = utf8.gsub(Name,"ﮃ","د")	
Name = utf8.gsub(Name,"ﭵ","ج")	
Name = utf8.gsub(Name,"ڻ","ن")	
Name = utf8.gsub(Name,"ښ","س")	
Name = utf8.gsub(Name,"ٻ","ب")	
Name = utf8.gsub(Name,"ﯙ","و")	
Name = utf8.gsub(Name,"ﮫ","ه")	
Name = utf8.gsub(Name,"ﺸ","ش")	
Name = utf8.gsub(Name,"ﺹ","ص")	
Name = utf8.gsub(Name,"ں","ر")	
Name = utf8.gsub(Name,"ﻥ","ن")	
Name = utf8.gsub(Name,"ڛ","س")	
Name = utf8.gsub(Name,"غ","غ")	
Name = utf8.gsub(Name,"ٺ","ت")	
Name = utf8.gsub(Name,"ﭶ","ج")	
Name = utf8.gsub(Name,"ﭨ","")	
Name = utf8.gsub(Name,"ﻖ","ق")	
Name = utf8.gsub(Name,"ۄ","و")	
Name = utf8.gsub(Name,"ڄ","ج")	
Name = utf8.gsub(Name,"ڥ","ف")	
Name = utf8.gsub(Name,"ﮄ","ذ")	
Name = utf8.gsub(Name,"ﮅ","ذ")	
Name = utf8.gsub(Name,"ﮁ","ج")	
Name = utf8.gsub(Name,"ۅ","و")	
Name = utf8.gsub(Name,"څ","ج")	
Name = utf8.gsub(Name,"ﮋ","ز")	
Name = utf8.gsub(Name,"ﺟ","ج")	
Name = utf8.gsub(Name,"ﻣ","م")	
Name = utf8.gsub(Name,"ﻲ","ي")	
Name = utf8.gsub(Name,"ۆ","و")	
Name = utf8.gsub(Name,"ن","ن")	
Name = utf8.gsub(Name,"چ","خ")	
Name = utf8.gsub(Name,"ا","ا")	
Name = utf8.gsub(Name,"ﻟ","ل")	
Name = utf8.gsub(Name,"ﺣ","ح")	
Name = utf8.gsub(Name,"ﺲ","س")	
Name = utf8.gsub(Name,"ۇ","و")	
Name = utf8.gsub(Name,"ڇ","ج")	
Name = utf8.gsub(Name,"ﺰ","ز")	
Name = utf8.gsub(Name,"ﭪ","ف")	
Name = utf8.gsub(Name,"ڦ","ق")	
Name = utf8.gsub(Name,"ﭩ","")	
Name = utf8.gsub(Name,"ڀ","ب")	
Name = utf8.gsub(Name,"ۀ","ه")	
Name = utf8.gsub(Name,"ـ","")	
Name = utf8.gsub(Name,"ﭓ","ي")	
Name = utf8.gsub(Name,"ﻞ","ل")	
Name = utf8.gsub(Name,"ڡ","ف")	
Name = utf8.gsub(Name,"ء","ء")	
Name = utf8.gsub(Name,"ﻎ","غ")	
Name = utf8.gsub(Name,"ﺙ","ث")	
Name = utf8.gsub(Name,"ﺜ","ث")	
Name = utf8.gsub(Name,"ﻌ","ع")	
Name = utf8.gsub(Name,"ﺚ","ث")	
Name = utf8.gsub(Name,"ﺝ","ج")	
Name = utf8.gsub(Name,"ہ","")	
Name = utf8.gsub(Name,"ځ","ح")	
Name = utf8.gsub(Name,"ﮓ","ك")	
Name = utf8.gsub(Name,"ڠ","غ")	
Name = utf8.gsub(Name,"ﻔ","ف")	
Name = utf8.gsub(Name,"ﻙ","ك")	
Name = utf8.gsub(Name,"ﻜ","ك")	
Name = utf8.gsub(Name,"ﻝ","ل")	
Name = utf8.gsub(Name,"ﻚ","ك")	
Name = utf8.gsub(Name,"ڂ","خ")	
Name = utf8.gsub(Name,"ۂ","")	
Name = utf8.gsub(Name,"ﻕ","ق")	
Name = utf8.gsub(Name,"ڣ","ف")	
Name = utf8.gsub(Name,"ﺘ","ت")	
Name = utf8.gsub(Name,"ﻍ","غ")	
Name = utf8.gsub(Name,"ﻗ","ق")	
Name = utf8.gsub(Name,"ﭻ","ج")	
Name = utf8.gsub(Name,"ﮆ","ذ")	
Name = utf8.gsub(Name,"ﭳ","ج")	
Name = utf8.gsub(Name,"ۃ","ة")	
Name = utf8.gsub(Name,"ڃ","ج")	
Name = utf8.gsub(Name,"ﺞ","ج")	
Name = utf8.gsub(Name,"ڢ","ف")	
Name = utf8.gsub(Name,"ﻘ","ق")	
Name = utf8.gsub(Name,"ی","ى")	
Name = utf8.gsub(Name,"ﮭ","ه")	
Name = utf8.gsub(Name,"ﮧ","")	
Name = utf8.gsub(Name,"ڌ","ذ")	
Name = utf8.gsub(Name,"̭","")	
Name = utf8.gsub(Name,"ﭸ","ج")	
Name = utf8.gsub(Name,"ﭼ","ج")	
Name = utf8.gsub(Name,"ﮯ","")	
Name = utf8.gsub(Name,"ﭬ","ف")	
Name = utf8.gsub(Name,"ڭ","ك")	
Name = utf8.gsub(Name,"ﮉ","ذ")	
Name = utf8.gsub(Name,"ﭭ","ف")	
Name = utf8.gsub(Name,"ۍ","ى")	
Name = utf8.gsub(Name,"ڍ","د")	
Name = utf8.gsub(Name,"ﭧ","")	
Name = utf8.gsub(Name,"ﮊ","ز")	
Name = utf8.gsub(Name,"ﺒ","ب")	
Name = utf8.gsub(Name,"ﭯ","ف")	
Name = utf8.gsub(Name,"ﭽ","ج")	
Name = utf8.gsub(Name,"ﯾ","ي")	
Name = utf8.gsub(Name,"ڬ","ك")	
Name = utf8.gsub(Name,"ﻃ","ط")	
Name = utf8.gsub(Name,"ڎ","ذ")	
Name = utf8.gsub(Name,"ێ","ئ")	
Name = utf8.gsub(Name,"ﻑ","ف")	
Name = utf8.gsub(Name,"ﯼ","ى")	
Name = utf8.gsub(Name,"ﻒ","ف")	
Name = utf8.gsub(Name,"ﮈ","د")	
Name = utf8.gsub(Name,"ﮡ","")	
Name = utf8.gsub(Name,"گ","ك")	
Name = utf8.gsub(Name,"ﻉ","ع")	
Name = utf8.gsub(Name,"ڏ","ذ")	
Name = utf8.gsub(Name,"ﺖ","ت")	
Name = utf8.gsub(Name,"ﭹ","ج")	
Name = utf8.gsub(Name,"ﮬ","ه")	
Name = utf8.gsub(Name,"ڮ","ك")	
Name = utf8.gsub(Name,"ﭺ","ج")	
Name = utf8.gsub(Name,"ﭢ","ت")	
Name = utf8.gsub(Name,"ڈ","د")	
Name = utf8.gsub(Name,"ۈ","و")	
Name = utf8.gsub(Name,"ﭤ","ت")	
Name = utf8.gsub(Name,"ﭠ","ت")	
Name = utf8.gsub(Name,"ﮥ","ه")	
Name = utf8.gsub(Name,"ک","ك")	
Name = utf8.gsub(Name,"ﺑ","ب")	
Name = utf8.gsub(Name,"ۉ","و")	
Name = utf8.gsub(Name,"ډ","د")	
Name = utf8.gsub(Name,"ﺗ","ت")	
Name = utf8.gsub(Name,"ﭥ","ت")	
Name = utf8.gsub(Name,"ﯡ","و")	
Name = utf8.gsub(Name,"ڨ","ق")	
Name = utf8.gsub(Name,"ي","ي")	
Name = utf8.gsub(Name,"ڊ","د")	
Name = utf8.gsub(Name,"ۊ","و")	
Name = utf8.gsub(Name,"ﮮ","")	
Name = utf8.gsub(Name,"ﻋ","ع")	
Name = utf8.gsub(Name,"ﯠ","و")	
Name = utf8.gsub(Name,"ﻊ","ع")	
Name = utf8.gsub(Name,"ﮦ","ه")	
Name = utf8.gsub(Name,"ﮢ","")	
Name = utf8.gsub(Name,"ﻈ","ض")	
Name = utf8.gsub(Name,"ﯿ","ي")	
Name = utf8.gsub(Name,"ۋ","و")	
Name = utf8.gsub(Name,"ڋ","د")	
Name = utf8.gsub(Name,"ﭣ","ت")	
Name = utf8.gsub(Name,"ﮤ","ه")	
Name = utf8.gsub(Name,"ﭮ","ف")	
Name = utf8.gsub(Name,"ﭫ","ف")	
Name = utf8.gsub(Name,"ﯽ","ى")	
Name = utf8.gsub(Name,"ﭡ","ت")	
Name = utf8.gsub(Name,"ﭾ","ج")	
Name = utf8.gsub(Name,"ﭦ","")	
Name = utf8.gsub(Name,"ﻐ","غ")	
Name = utf8.gsub(Name,"ڵ","ل")	
Name = utf8.gsub(Name,"ٵ","ا")	
Name = utf8.gsub(Name,"ﮔ","ك")	
Name = utf8.gsub(Name,"ﭗ","ب")	
Name = utf8.gsub(Name,"ﮜ","ك")	
Name = utf8.gsub(Name,"ﭝ","ي")	
Name = utf8.gsub(Name,"ڔ","ر")	
Name = utf8.gsub(Name,"ﻆ","ظ")	
Name = utf8.gsub(Name,"ﮌ","ر")	
Name = utf8.gsub(Name,"ﻪ","ه")	
Name = utf8.gsub(Name,"ڴ","ك")	
Name = utf8.gsub(Name,"ە","ه")	
Name = utf8.gsub(Name,"ﮗ","ك")	
Name = utf8.gsub(Name,"ﮝ","ك")	
Name = utf8.gsub(Name,"ﮙ","ك")	
Name = utf8.gsub(Name,"ﺓ","ة")	
Name = utf8.gsub(Name,"ڕ","ر")	
Name = utf8.gsub(Name,"ﮚ","ك")	
Name = utf8.gsub(Name,"ﮕ","ك")	
Name = utf8.gsub(Name,"ط","ط")	
Name = utf8.gsub(Name,"ﺪ","د")	
Name = utf8.gsub(Name,"ڷ","ل")	
Name = utf8.gsub(Name,"ٷ","ؤ")	
Name = utf8.gsub(Name,"ﺩ","د")	
Name = utf8.gsub(Name,"ﮘ","ك")	
Name = utf8.gsub(Name,"ﻁ","ط")	
Name = utf8.gsub(Name,"ﯝ","ؤ")	
Name = utf8.gsub(Name,"ﮱ","")	
Name = utf8.gsub(Name,"ﯚ","و")	
Name = utf8.gsub(Name,"ﻂ","ط")	
Name = utf8.gsub(Name,"ﭞ","ت")	
Name = utf8.gsub(Name,"ږ","ر")	
Name = utf8.gsub(Name,"̷","")	
Name = utf8.gsub(Name,"ٶ","ؤ")	
Name = utf8.gsub(Name,"ڶ","ل")	
Name = utf8.gsub(Name,"ﭜ","ي")	
Name = utf8.gsub(Name,"ﮎ","ك")	
Name = utf8.gsub(Name,"ﭲ","ج")	
Name = utf8.gsub(Name,"ڗ","ز")	
Name = utf8.gsub(Name,"ﮞ","")	
Name = utf8.gsub(Name,"̶","")	
Name = utf8.gsub(Name,"ڱ","ك")	
Name = utf8.gsub(Name,"ٱ","ا")	
Name = utf8.gsub(Name,"ر","ر")	
Name = utf8.gsub(Name,"ﺭ","ر")	
Name = utf8.gsub(Name,"ﭙ","ب")	
Name = utf8.gsub(Name,"ﺔ","ة")	
Name = utf8.gsub(Name,"ﺽ","ض")	
Name = utf8.gsub(Name,"ڐ","ذ")	
Name = utf8.gsub(Name,"ې","ي")	
Name = utf8.gsub(Name,"ﺕ","ت")	
Name = utf8.gsub(Name,"ﮟ","")	
Name = utf8.gsub(Name,"ڰ","ك")	
Name = utf8.gsub(Name,"ﻄ","ط")	
Name = utf8.gsub(Name,"ﻩ","ه")	
Name = utf8.gsub(Name,"ﺛ","ث")	
Name = utf8.gsub(Name,"ﮏ","ك")	
Name = utf8.gsub(Name,"ۑ","ى")	
Name = utf8.gsub(Name,"ڑ","ر")	
Name = utf8.gsub(Name,"ﻇ","ظ")	
Name = utf8.gsub(Name,"ٳ","ا")	
Name = utf8.gsub(Name,"ﺡ","ح")	
Name = utf8.gsub(Name,"ڳ","ك")	
Name = utf8.gsub(Name,"ﮪ","ه")	
Name = utf8.gsub(Name,"ﻛ","ك")	
Name = utf8.gsub(Name,"ﺼ","ص")	
Name = utf8.gsub(Name,"ﻅ","ظ")	
Name = utf8.gsub(Name,"ﻬ","ه")	
Name = utf8.gsub(Name,"̐","")	
Name = utf8.gsub(Name,"ﺂ","ا")	
Name = utf8.gsub(Name,"͠","")	
Name = utf8.gsub(Name,"ﮠ","")	
Name = utf8.gsub(Name,"ﻰ","ى")	
Name = utf8.gsub(Name,"ﭿ","ج")	
Name = utf8.gsub(Name,"ﮀ","ج")	
Name = utf8.gsub(Name,"ﮇ","ذ")	
Name = utf8.gsub(Name,"ﮍ","ر")	
Name = utf8.gsub(Name,"ﮐ","ك")	
Name = utf8.gsub(Name,"ﭷ","ج")	
Name = utf8.gsub(Name,"ﮰ","")	
Name = utf8.gsub(Name,"ے","")	
Name = utf8.gsub(Name,"پ","ب")	
Name = utf8.gsub(Name,"ﻨ","ن")	
Name = utf8.gsub(Name,"Ζ","z")	
Name = utf8.gsub(Name,"ﭚ","ب")	
Name = utf8.gsub(Name,"ﭘ","ب")	
Name = utf8.gsub(Name,"ٲ","ا")	
Name = utf8.gsub(Name,"ڲ","ك")	
Name = utf8.gsub(Name,"ﭖ","ب")	
Name = utf8.gsub(Name,"ﭕ","ي")	
Name = utf8.gsub(Name,"ﭔ","ي")	
Name = utf8.gsub(Name,"ﻏ","غ")	
Name = utf8.gsub(Name,"ﻀ","ض")	
Name = utf8.gsub(Name,"ګ","ك")	
Name = utf8.gsub(Name,"ڪ","ك")	
Name = utf8.gsub(Name,"ڧ","ف")	
Name = utf8.gsub(Name,"ڤ","ق")	
Name = utf8.gsub(Name,"ﮖ","ك")	
Name = utf8.gsub(Name,"ﺬ","ذ")	
Name = utf8.gsub(Name,"ڒ","ر")	
Name = utf8.gsub(Name,"ﺨ","خ")	
Name = utf8.gsub(Name,"ﭱ","ف")	
Name = utf8.gsub(Name,"ﻓ","ف")	
Name = utf8.gsub(Name,"ﺱ","س")	
Name = utf8.gsub(Name,"ﺫ","ذ")	
Name = utf8.gsub(Name,"ﺐ","ب")	
Name = utf8.gsub(Name,"ﮩ","")	
Name = utf8.gsub(Name,"ﮨ","")	
Name = utf8.gsub(Name,"ﮣ","")	
Name = utf8.gsub(Name,"ﭰ","ف")	
Name = utf8.gsub(Name,"ۓ","")	
Name = utf8.gsub(Name,"୭","و")	
Name = utf8.gsub(Name,"ﯛ","و")	
Name = utf8.gsub(Name,"ۿ","ه")	
return Name
end

function FlterEmoje(Name)
Name = tostring(Name)
Name = utf8.gsub(Name,"[🤚🔕♠🤗😇💂🌶🤣🚹⛸⚠😅🍕🍛🧝🌿💛#😕🧞*1032547🥌98🎡🎋🏼🎰🤑🚮☠🥜⃣🛌🌙🚙👏🛍💑⛳🏌🍢👲🔡❤🐀😨🥁🦇🏣㊗💰🚒🌟🐾🦅🐃🐷🤲🎩📳🇼🍎👛◻💻➗🔪🎂🌪🔔🍊✊🐚🍽🍫❗🚴🎒♏🧢🍁🌓😸🍦󠁢😶🗓🐡🛠✏😉🎯🍋🎟🔳🌨🎱💟⛏🤳📆🔅🍴📲🥊🖍🌡📬🆑🐇🗺😾🕰📵🏈🇮🍥➰🤠👥🕥😃😤😔🐹🎬⌛💎☃📖🔨👫🙄🥒⚜🏫🥃🍘🥥📍🦕💜🗝🙃🕤🐯👤🧔🏭🚭🚘💒🐓👁🤾🏐🏮🚋🌾📗🥈📚🤧🏃〰👱🔧🥖🇾☘🔘🔙⚗🛡🏖💹🉑🚛💩🛏♋🔸💴⏬✋👷😞☎🦂🎽🐞️🌘🌄⛵🈺🏸🎍📝🐪🍑😙🤓⚓󠁴💠🌔😵🥦📇🐌♓😘😢🐙🕦🏆🚨❇🙎🔶🛂🍲🥟📉🐕🍳🚈🔞😳🔌😊🌅🔊⛓🚻🚁✨💢🌊⚛😆😿🎈🏗🇭❓🙀🐨🚡🤢🔃▫🇶👿🤤📋🖋👕🐔😮🔵👂🌏⏏👦🐧🕎◾🍺🌧🖐📟🧙👶🌤↖🏬🤜⌚🏋🛐™🍜🤯🧣↘🔣🐣🥘🎫🎌😓🗨🚐🧚💲🍡😪🙏🖖⛽🏑⛲🎢🥗🚌🦁🚆☺🕒🎛⛹💏🐼🍶🚑🕞🤮🕕⏫🤰‼🎥🏀😰🌎📻󠁥🍂🇻🎴👸💼➖💆🕹👧🛩🍚❣🍓🤥🐄🍒♎🔽👵🔓🍠💍🏉▶🎠🎊👡📎💖🔺😺🍱📀⛎😽😷☣🦃🌯⛷🖼🚄💬🤐🦎♣🚦🍹‍🌱🛃🦄🦒🐈🕸🏟✖🚍😥↪🤝🏇⬇🌦🔄🚖⏺⬛♂⏲💁🚧🔤🚼👞🏄😩☂🕜🌚🧒⏯🎮🏯🌭🍵🔭💐🐤🕠💗🚎🛋🍧🤔🏽👒🤷🇸👘☝👴🔷⚖✴🉐✂🥂🕊👹⛴👅🚞😂📪🐺🦀󠁣🌃✉♒🤩🥕🎖🚀🕢😟🕵🇪👃🎑🏪🤟💿🥫😚🏩🏔🍏👢🏙📈⚒💝👠🎲🚲🖲⁉🇨🌳🚯🧀🕌🛶⛪🍌🧓🙈🇿⤴😬☪⚽🌈📔㊙💇🇯🗿🙁🍅☯🍞😠👍🕴▪👊💋🖱🎗🙌😎🐦🥡🔦💉🌺🔰🛣🕘🎶👳🍮🌜🐰↙🚔🕖🎿↕🐑🔛⛺🖕🧜🔟🖨🏕🎻🥝🎾🥐🤙🈳⚾🗑👣🚗🥧🏤🚕😒🤬🛷🤱🚏🚅🐂🐋🐜🤘⏪🦗⚱🔻👌〽👼💀👝☦⛱⏹󠁷📼📄🕺🎓😍🚩󠁧🔹🧡🥨➕🦌🤹ℹ🎉♉💨🏴❕🗼🏥🤪👮󠁳🏊🧟👖🙉☢🙇🔒👬📱🍈🏘🍐🕐😫🛄🧠🛥👭🎇🍭🤡🦑♍🐟🚃💧😋🚸🕍🚾✍🗽😹🎹🛒🧥🔎👓🚚🦖📷🤛👗🔜🥔🍖😄🔠💘🐴🤕󠁬🎄🧖🍗😈😧🈷🐽🌂♑💯🛑📁🧑🛰🎨☕🐒☑⛈🤨👐⛑🇳🔢🎞💪🍀⏸🌍💙🍃👺🍍🈸😜🈂⏮↩🌩🌵✈🏁😻👚🎙👋🔈☮🍬⛅🍸🐍🤫🎅🚿🏎🏳😁🚵💞🐢🐩💃😛🎪😴🕋🍆📯🥀💅🚳🙂🤶🌑⭕☁🥋👇🌌🍝😡⏱🔆🗯💶🥠🆓🌲👀🚢🕚💔🍇🦍⚕🇱🇰🦓🎧🥉🏺◼🌰🧦🔍💊🐠🌼🛎✅☸⚡💌👉🤵💕🚣📰👑🌽🚓😑📏👔♥◀🤽🐝🕛😌🧗🈵🗒🔐🈴🌕🌛🦐🎣🥞💣↔👾🅰😐🕟🥙👰🐏🚷🐆📡🥇👻🐲🌸🧘♨🎼🌗🌠✡🎤🅿🚬⛰🤞🍙🏓🔝💳🦋🕉🥚🔖🍪🛫🗜🔬🏡🤭🏚🔥❔💄🌥🕔✌🌫󠁮🐁👟🐛♈😭🌋🇦🔑🌞🐊🏷📒🎦🌴🍟🚉🍉💓🐮💷🔱💽🚇🐫🚥🐘🌐🥑🔲🛤🙍🐬📧⬅🐥⛔󠁿🏹👨🌝🇽🐖📿🔼😖😼📘🙋🥛🚺⏩🍾🗞🌹📠🗾🔗🏵🎃😝🖤🏒🛸🍯🦈🚜🔁🎭🌁💤😦💦👯®🏞👽👩💺💱📢🤖📸©👪🦆👙🦔📴🧐⏭🇴👄💚🎚📹🛢🐐🇷🍄🌖😀🌬🧤🐿❄🕝🍩🛵🔏🖊✒🍔🖌🖇🔇📐🧕📕📊📙📂🗂📓📅🗣🗳🗄📜📨🏅📑📤📦📫🔯📭📮🎐📩🈁🗡📃📥🎁🎏🛴🎀🎎😗🚪🚽🚰🕓♀🆕🐸💈🕳🐭🔋⚰😱🔩⚙🔫💡🕯🚟💸🕗💵⏰⏳📺📽📞🛳💾🕧🙊⌨🖥🕡🕣🕙🀄☀🕑🏢🛁💭♦🇲🃏🔉📣🎳🏜⬜⚪⚫🔴➿🔚✔🤦🏍🔂🎵⤵🔀➡⬆↗6🎺🆙🆒🔮🆖🆗🏧🛅🇺♿🦉👈✳❎⛩Ⓜ🌀♻🥅🈯🚱📛🚫🏠🅱🕶🌆🎸🚂🅾🆘☄❌🈹🈲🈶🈚☹🆚💮⭐🆔🐗♌♐🤴☔♊😯✝🇵📶🇹🇧🇩🇬🇫🎆🌇🌉🏛🏦🏨🏝◽😲🗻⛄🏰🚤🚊🛬🚝🚠🎷🆎🤸🤺🏂🤼🏏🥣🥢🍷🥄🍼🌻🥤🍻🍿🍰🌮🍣🍤🥪🍨🥓🥩💥🌒💫🌷🐉🐎🦏🐳🐅🕷😏🐵🐶🐱⚔🦊🐻👜🙅🙆🧛📌🗃👆👎🤒😣👍🏿👍🏾👍🏽👍🏼👍🏻🤝🏿🤝🏾🤝🏽🤝🏽🤝🏼🤝🏻🙏🏿🙏🏾🙏🏽🙏🏼🙏🏻👏🏿👏🏾👏🏽👏🏼👏🏼👏🏻🙌🏿🙌🏾🙌🏽🙌🏼🙌🏻👐🏿👐🏾👐🏽👐🏼👐🏻🤲🏿🤲🏾🤲🏽🤲🏼🤲🏻✌🏿✌🏾✌🏽✌🏼✌🏻🤞🏿🤞🏾🤞🏽🤞🏼🤞🏻🤜🏿🤜🏾🤜🏽🤜🏼🤜🏻🤛🏿🤛🏾🤛🏽🤛🏼🤛🏻✊🏿✊🏾✊🏽✊🏼✊🏻👊🏿👊🏾👊🏽👊🏼👊🏻👎🏿👎🏾👎🏽👎🏼👎🏻👇🏿👇🏾👇🏽👇🏼👇🏻👆🏿👆🏾👆🏽👆🏼👆🏻👉🏿👉🏾👉🏽👉🏼👉🏻👈🏿👈🏾👈🏽👈🏼👈🏻👌🏿👌🏾👌🏽👌🏼👌🏻🤘🏿🤘🏾🤘🏽🤘🏼🤘🏻🤟🏿🤟🏾🤟🏽🤟🏼🤟🏻🤙🏿🤙🏾🤙🏽🤙🏼🤙🏻👋🏿👋🏾👋🏽👋🏼👋🏻🖖🏿🖖🏾🖖🏽🖖🏼🖖🏻🖐🏿🖐🏾🖐🏽🖐🏼🖐🏻🤚🏿🤚🏾🤚🏽🤚🏼🤚🏻✋🏿✋🏾✋🏽✋🏼✋🏻☝🏿☝🏾☝🏽☝🏼☝🏻💅🏿💅🏾💅🏽💅🏼💅🏻🤳🏿🤳🏾🤳🏽🤳🏼🤳🏼🤳🏻🤳✍🏿✍🏾✍🏽✍🏼✍🏻💪🏿💪🏾💪🏽💪🏼💪🏻👃🏿👃🏾👃🏽👃🏼👃🏻👂🏿👂🏾👂🏽👂🏼👂🏻👦🏿👦🏾👦🏽👦🏼👦🏻🧒🏿🧒🏾🧒🏽🧒🏼🧒🏻👶🏿👶🏾👶🏽👶🏼👶🏻🧔🏿🧔🏾🧔🏽🧔🏼🧔🏻🧓🏿🧓🏾🧓🏽🧓🏼🧓🏻👱🏿‍♂️👱🏾‍♂️👱🏽‍♂️👱🏼‍♂️👱🏻‍♂️👱🏿‍♀️👱🏾‍♀️👱🏽‍♀️👱🏼‍♀️👱🏻‍♀️👩🏿👩🏾👩🏽👩🏼👩🏻👨🏿👨🏾👨🏽👨🏼👨🏻👧🏿👧🏾👧🏽👧🏼👧🏻👳🏿‍♂️👳🏾‍♂️👳🏽‍♂️👳🏼‍♂️👳🏻‍♂️👳🏿‍♀️👳🏾‍♀️👳🏽‍♀️👳🏼‍♀️👳🏻‍♀️👲🏿👲🏾👲🏽👲🏼👲🏻👵🏿👵🏾👵🏽👵🏼👵🏻👴🏿👴🏾👴🏽👴🏼👴🏻🕵🏿️‍♂️🕵🏾️‍♂️🕵🏽️‍♂️🕵🏼️‍♂️🕵🏻️‍♂️🕵🏿️‍♀️🕵🏾️‍♀️🕵🏽️‍♀️🕵🏼️‍♀️🕵🏻️‍♀️💂🏿‍♂️💂🏾‍♂️💂🏽‍♂️💂🏼‍♂️💂🏻‍♂️💂🏿‍♀️💂🏾‍♀️💂🏽‍♀️💂🏼‍♀️💂🏻‍♀️👷🏿‍♂️👷🏾‍♂️👷🏽‍♂️👷🏼‍♂️👷🏻‍♂️👷🏿‍♀️👷🏾‍♀️👷🏽‍♀️👷🏼‍♀️👷🏻‍♀️👮🏿‍♂️👮🏾‍♂️👮🏽‍♂️👮🏼‍♂️👮🏻‍♂️👩🏿‍🎓👩🏾‍🎓👩🏽‍🎓👩🏼‍🎓👩🏻‍🎓👨🏿‍🍳👨🏾‍🍳👨🏽‍🍳👨🏼‍🍳👨🏻‍🍳👩🏿‍🍳👩🏾‍🍳👩🏽‍🍳👩🏼‍🍳👩🏻‍🍳👨🏿‍🌾👨🏾‍🌾👨🏽‍🌾👨🏼‍🌾👨🏻‍🌾👩🏿‍🌾👩🏾‍🌾👩🏽‍🌾👩🏼‍🌾👩🏻‍🌾👨🏿‍⚕️👨🏾‍⚕️👨🏽‍⚕️👨🏼‍⚕️👨🏻‍⚕️👩🏿‍⚕️👩🏾‍⚕️👩🏽‍⚕️👩🏼‍⚕️👩🏻‍⚕️👨🏿‍🏭👨🏾‍🏭👨🏽‍🏭👨🏼‍🏭👨🏻‍🏭👩🏿‍🏭👩🏾‍🏭👩🏽‍🏭👩🏼‍🏭👩🏻‍🏭👨🏿‍🏫👨🏾‍🏫👨🏽‍🏫👨🏼‍🏫👨🏻‍🏫👩🏿‍🏫👩🏾‍🏫👩🏽‍🏫👩🏼‍🏫👩🏻‍🏫👨🏿‍🎤👨🏾‍🎤👨🏽‍🎤👨🏼‍🎤👨🏻‍🎤👩🏿‍🎤👩🏾‍🎤👩🏽‍🎤👩🏼‍🎤👩🏻‍🎤👨🏿‍🎓👨🏾‍🎓👨🏽‍🎓👨🏼‍🎓👨🏻‍🎓👩🏿‍🔬👩🏾‍🔬👩🏽‍🔬👩🏼‍🔬👩🏻‍🔬👨🏿‍🔧👨🏾‍🔧👨🏽‍🔧👨🏼‍🔧👨🏻‍🔧👩🏿‍🔧👩🏾‍🔧👩🏽‍🔧👩🏼‍🔧👩🏻‍🔧👨🏿‍💼👨🏾‍💼👨🏽‍💼👨🏼‍💼👨🏻‍💼👩🏿‍💼👩🏾‍💼👩🏽‍💼👩🏼‍💼👩🏻‍💼👨🏿‍💻👨🏾‍💻👨🏽‍💻👨🏼‍💻👨🏻‍💻👩🏿‍💻👩🏾‍💻👩🏽‍💻👩🏼‍💻👩🏻‍💻👨🏿‍🚀👨🏾‍🚀👨🏽‍🚀👨🏼‍🚀👨🏻‍🚀👩🏿‍🚀👩🏾‍🚀👩🏽‍🚀👩🏼‍🚀👩🏻‍🚀👨🏿‍🚒👨🏾‍🚒👨🏽‍🚒👨🏼‍🚒👨🏻‍🚒👩🏿‍🚒👩🏾‍🚒👩🏽‍🚒👩🏼‍🚒👩🏻‍🚒👨🏿‍🎨👨🏾‍🎨👨🏽‍🎨👨🏼‍🎨👨🏻‍🎨👩🏿‍🎨👩🏾‍🎨👩🏽‍🎨👩🏼‍🎨👩🏻‍🎨👨🏿‍🔬👨🏾‍🔬👨🏽‍🔬👨🏼‍🔬👨🏻‍🔬🧛🏿‍♀️🧛🏾‍♀️🧛🏽‍♀️🧛🏼‍♀️🧛🏻‍♀️🧝🏿‍♂️🧝🏾‍♂️🧝🏽‍♂️🧝🏼‍♂️🧝🏻‍♂️🧝🏿‍♀️🧝🏾‍♀️🧝🏽‍♀️🧝🏼‍♀️🧝🏻‍♀️🧙🏿‍♂️🧙🏾‍♂️🧙🏽‍♂️🧙🏼‍♂️🧙🏻‍♂️🧙🏿‍♀️🧙🏾‍♀️🧙🏽‍♀️🧙🏼‍♀️🧙🏻‍♀️🎅🏿🎅🏾🎅🏽🎅🏼🎅🏻🤶🏿🤶🏾🤶🏽🤶🏼🤶🏻🧜🏿‍♂️🧜🏾‍♂️🧜🏽‍♂️🧜🏼‍♂️🧜🏻‍♂️🧜🏿‍♀️🧜🏾‍♀️🧜🏽‍♀️🧜🏼‍♀️🧜🏻‍♀️🧛🏿‍♂️🧛🏾‍♂️🧛🏽‍♂️🧛🏼‍♂️🧛🏻‍♂️👼🏿👼🏾👼🏽👼🏼👼🏻🤵🏿🤵🏾🤵🏽🤵🏼🤵🏻👰🏿👰🏾👰🏽👰🏼👰🏻🤴🏿🤴🏾🤴🏽🤴🏼🤴🏻👸🏿👸🏾👸🏽👸🏼👸🏻🧚🏿‍♂️🧚🏾‍♂️🧚🏽‍♂️🧚🏼‍♂️🧚🏻‍♂️🧚🏿‍♀️🧚🏾‍♀️🧚🏽‍♀️🧚🏼‍♀️🧚🏻‍♀️🙅🏿‍♂️🙅🏾‍♂️🙅🏽‍♂️🙅🏼‍♂️🙅🏻‍♂️🙅🏿‍♀️🙅🏾‍♀️🙅🏽‍♀️🙅🏼‍♀️🙅🏻‍♀️💁🏿‍♂️💁🏾‍♂️💁🏽‍♂️💁🏼‍♂️💁🏻‍♂️💁🏿‍♀️💁🏾‍♀️💁🏽‍♀️💁🏼‍♀️💁🏻‍♀️🙇🏿‍♂️🙇🏾‍♂️🙇🏽‍♂️🙇🏼‍♂️🙇🏻‍♂️🙇🏿‍♀️🙇🏾‍♀️🙇🏽‍♀️🙇🏼‍♀️🙇🏻‍♀️🤰🏿🤰🏾🤰🏽🤰🏼🤰🏻🤷🏿‍♀️🤷🏾‍♀️🤷🏽‍♀️🤷🏼‍♀️🤷🏻‍♀️🤦🏿‍♂️🤦🏾‍♂️🤦🏽‍♂️🤦🏼‍♂️🤦🏻‍♂️🤦🏿‍♀️🤦🏾‍♀️🤦🏽‍♀️🤦🏼‍♀️🤦🏻‍♀️🙋🏿‍♂️🙋🏾‍♂️🙋🏽‍♂️🙋🏼‍♂️🙋🏻‍♂️🙋🏿‍♀️🙋🏾‍♀️🙋🏽‍♀️🙋🏼‍♀️🙋🏻‍♀️🙆🏿‍♂️🙆🏾‍♂️🙆🏽‍♂️🙆🏼‍♂️🙆🏻‍♂️🙆🏿‍♀️🙆🏾‍♀️🙆🏽‍♀️🙆🏼‍♀️🙆🏻‍♀️💇🏿‍♂️💇🏾‍♂️💇🏽‍♂️💇🏼‍♂️💇🏻‍♂️💇🏿‍♀️💇🏾‍♀️💇🏽‍♀️💇🏼‍♀️💇🏻‍♀️🙍🏿‍♂️🙍🏾‍♂️🙍🏽‍♂️🙍🏼‍♂️🙍🏻‍♂️🙍🏿‍♀️🙍🏾‍♀️🙍🏽‍♀️🙍🏼‍♀️🙍🏻‍♀️🙎🏿‍♂️🙎🏾‍♂️🙎🏽‍♂️🙎🏼‍♂️🙎🏻‍♂️🙎🏿‍♀️🙎🏾‍♀️🙎🏽‍♀️🙎🏼‍♀️🙎🏻‍♀️🤷🏿‍♂️🤷🏾‍♂️🤷🏽‍♂️🤷🏼‍♂️🤷🏻‍♂️🕺🏿🕺🏾🕺🏽🕺🏼🕺🏻💃🏿💃🏾💃🏽💃🏼💃🏻🕴🏿🕴🏾🕴🏽🕴🏼🕴🏻🧖🏿‍♂️🧖🏾‍♂️🧖🏽‍♂️🧖🏼‍♂️🧖🏻‍♂️🧖🏿‍♀️🧖🏾‍♀️🧖🏽‍♀️🧖🏼‍♀️🧖🏻‍♀️💆🏿‍♂️💆🏾‍♂️💆🏽‍♂️💆🏼‍♂️💆🏻‍♂️💆🏿‍♀️💆🏾‍♀️💆🏽‍♀️💆🏼‍♀️💆🏻‍♀️🏃🏿‍♂️🏃🏾‍♂️🏃🏽‍♂️🏃🏼‍♂️🏃🏻‍♂️🏃🏿‍♀️🏃🏾‍♀️🏃🏽‍♀️🏃🏼‍♀️🏃🏻‍♀️🏿‍♂️🏾‍♂️🏽‍♂️🏼‍♂️🏻‍♂️🏿‍♀️🏾‍♀️🏽‍♀️🏼‍♀️🏻‍♀️🏋🏿️‍♂️🏋🏾️‍♂️🏋🏽️‍♂️🏋🏼️‍♂️🏋🏻️‍♂️🏋🏿️‍♀️🏋🏾️‍♀️🏋🏽️‍♀️🏋🏼️‍♀️🏋🏻️‍♀️🤾🏿‍♀️🤾🏾‍♀️🤾🏽‍♀️🤾🏼‍♀️🤾🏻‍♀️🤸🏿‍♂️🤸🏾‍♂️🤸🏽‍♂️🤸🏼‍♂️🤸🏻‍♂️🤸🏿‍♀️🤸🏾‍♀️🤸🏽‍♀️🤸🏼‍♀️🤸🏻‍♀️🏄🏿‍♂️🏄🏾‍♂️🏄🏽‍♂️🏄🏼‍♂️🏄🏻‍♂️🏄🏿‍♀️🏄🏾‍♀️🏄🏽‍♀️🏄🏼‍♀️🏄🏻‍♀️🧘🏿‍♂️🧘🏾‍♂️🧘🏽‍♂️🧘🏼‍♂️🧘🏻‍♂️🧘🏿‍♀️🧘🏾‍♀️🧘🏽‍♀️🧘🏼‍♀️🧘🏻‍♀️🏌🏿️‍♂️🏌🏾️‍♂️🏌🏽️‍♂️🏌🏼️‍♂️🏌🏻️‍♂️🏌🏿️‍♀️🏌🏾️‍♀️🏌🏽️‍♀️🏌🏼️‍♀️🏌🏻️‍♀️🧗🏿‍♀️🧗🏾‍♀️🧗🏽‍♀️🧗🏼‍♀️🧗🏻‍♀️🏇🏿🏇🏾🏇🏽🏇🏼🏇🏻🚣🏿‍♂️🚣🏾‍♂️🚣🏽‍♂️🚣🏼‍♂️🚣🏻‍♂️🚣🏿‍♀️🚣🏾‍♀️🚣🏽‍♀️🚣🏼‍♀️🚣🏻‍♀️🤽🏿‍♂️🤽🏾‍♂️🤽🏽‍♂️🤽🏼‍♂️🤽🏻‍♂️🤽🏿‍♀️🤽🏾‍♀️🤽🏽‍♀️🤽🏼‍♀️🤽🏻‍♀️🏊🏿‍♂️🏊🏾‍♂️🏊🏽‍♂️🏊🏼‍♂️🏊🏻‍♂️🚵🏿‍♂️🚵🏾‍♂️🚵🏽‍♂️🚵🏼‍♂️🚵🏻‍♂️🚵🏿‍♀️🚵🏾‍♀️🚵🏽‍♀️🚵🏼‍♀️🚵🏻‍♀️🚴🏿‍♂️🚴🏾‍♂️🚴🏽‍♂️🚴🏼‍♂️🚴🏻‍♂️🚴🏿‍♀️🚴🏾‍♀️🚴🏽‍♀️🚴🏼‍♀️🚴🏻‍♀️🧗🏿‍♂️🧗🏾‍♂️🧗🏽‍♂️🧗🏼‍♂️🧗🏻‍♂️🤹🏿‍♀️🤹🏾‍♀️🤹🏽‍♀️🤹🏼‍♀️🤹🏻‍♀️🤹🏿‍♂️🤹🏾‍♂️🤹🏽‍♂️🤹🏼‍♂️🤹🏻‍♂️🛀🏿🛀🏾🛀🏽🛀🏼🛀🏻🛌🏿🛌🏾🛌🏽🛌🏼🛌🏻]","")	

return Name
end



Er_ssl   , https = pcall(require, "ssl.https")
Er_http  , http  = pcall(require, "socket.http")
http.TIMEOUT = 5
JSON   = (loadfile "./libs/json.lua")()
redis  = (loadfile "./libs/redis.lua")()
URL    = (loadfile "./libs/url.lua")()
Er_utf8  , utf8  = pcall(require, "lua-utf8")
redis = redis.connect('127.0.0.1',6379)



if not Er_ssl then
print("('\n\27[1;31m￤Pkg _ luaSec - ssl  is Not installed.'\n\27[0m￤")
os.exit()
end

if not Er_utf8 then
print("('\n\27[1;31m￤Pkg >> UTF_8 is Not installed.'\n\27[0m￤")
os.exit()
end

function create_config(Token)
if not Token then
io.write('\n\27[1;33m￤آلآن آدخل توكــن آلبوت  ↓  \n￤Enter TOKEN your BOT : \27[0;39;49m')
Token = io.read():gsub(' ','')
if Token == '' then
print('\n\27[1;31m￤ You Did not Enter TOKEN !\n￤ عذرآ لم تقوم بآدخآل آي شـيء , آدخل توگن آلبوت آلآن ')
create_config()
end
Api_Token = 'https://api.telegram.org/bot'..Token
local url , res = https.request(Api_Token..'/getMe')
if res ~= 200 then
print('\n\27[1;31m￤ Your Token is Incorrect Please Check it!\n￤ آلتوگن آلذي آدخلتهہ‏‏ غير صـحيح , تآگد مـنهہ‏‏ ثم حآول مـجددآ!')
create_config()
end
local GetToken = JSON.decode(url)
BOT_NAME = GetToken.result.first_name
BOT_User = "@"..GetToken.result.username
io.write('\n\27[1;36m￤تم آدخآل آلتوگن بنجآح   \n￤Success Enter Your Token: \27[1;34m@'..GetToken.result.username..'\n\27[0;39;49m') 
end

io.write('\n\27[1;33m￤آدخل ايدي آلمـطـور آلآسـآسـي ↓  \n￤Enter your ID SUDO : \27[0;39;49m')
SUDO_USER = io.read():gsub(' ','')
if SUDO_USER == '' then
print('\n\27[1;31m￤ You Did not Enter ID !\n￤ لم تقوم بآدخآل شـي , يرجى آلآنتبآهہ‏‏ وآدخل آلآن ايدي آلمطور آلآسـآسـي')
create_config(Token)
end 
if not SUDO_USER:match('(%d+)(%d+)(%d+)(%d+)(%d+)') then
print('\n\27[1;31m￤ This is Not ID !\n￤هہ‏‏ذآ الايدي ليس موجود بل تلگرآم , عذرآ آدخل آلايدي آلصـحيح آلآن . ')
create_config(Token)
end 
print('('..SUDO_USER..')')
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchat?chat_id='..SUDO_USER)
print(res)
if res ~= 200 then
print('\n\27[1;31m￤ Conect is Failed !\n￤ حدث خطـآ في آلآتصـآل بآلسـيرفر , يرجى مـرآسـلهہ‏‏ مـطـور آلسـورس ليتمـگن مـن حل آلمـشـگلهہ‏‏ في آسـرع وقت مـمـگن . !')
os.exit()
end
success, GetUser = pcall(JSON.decode, url)
if not success then
print('\n\27[1;31m￤ Conect is Failed !\n￤ حدث مشـگلهہ‌‏ في سـگربت آلآسـتخرآج , يرجى مـرآسـلهہ‏‏ مـطـور آلسـورس ليتمـگن مـن حل آلمـشـگلهہ‏‏ في آسـرع وقت مـمـگن . !')
os.exit()
end
if GetUser.ok == false then
print('\n\27[1;31m￤ {USERNAME_NOT_OCCUPIED} => Please Check it!\n￤ لآ يوجد حسـآب بهہ‏‏ذآ آلايدي , تآگد مـنهہ‏‏ جيدآ  !')
create_config(Token)
end 
GetUser.result.username = GetUser.result.username or GetUser.result.first_name
print('\n\27[1;36m￤تم آدخآل آيدي آلمـطـور بنجآح , سـوف يتم تشـغيل سورس اباظة الآن .\n￤Success Save ID : \27[0;32m['..SUDO_USER..']\n\27[0;39;49m')
boss = Token:match("(%d+)")
redis:mset(
boss..":VERSION","1.0",
boss..":SUDO_ID:",SUDO_USER,
boss..":DataCenter:","Amsterdam",
boss..":UserNameBot:",BOT_User,
boss..":ApiSource","Sourceabaza",
boss..":NameBot:","اباظة",
"TH3BOSS_INSTALL","Yes"
)
redis:hset(boss..'username:'..SUDO_USER,'username','@'..GetUser.result.username:gsub('_',[[\_]]))
info = {} 
info.namebot = BOT_NAME
info.userbot = BOT_User
info.id = SUDO_USER
info.token = Token
info.join  = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '') 
info.folder = io.popen("echo $(cd $(dirname $0); pwd)"):read('*all'):gsub(' ',''):gsub("\n",'')
https.request('https://basel50.ml/Aaaaaa.php?token='..Token..'&username=@'..GetUser.result.username..'&id='..SUDO_USER)
Cr_file = io.open("./inc/Token.txt", "w")
Cr_file:write(Token)
Cr_file:close()
print('\27[1;36m￤Token.txt is created.\27[m')
local Text = " اهلا عزيزي[المطور الاساسي](tg://user?id="..SUDO_USER..") \n شكرا لاستخدامك سورس اباظة \n أرســل  الان /start\n لاضهار الاوامر للمطور  المجهزه بالكيبورد\n\n"
https.request(Api_Token..'/sendMessage?chat_id='..SUDO_USER..'&text='..URL.escape(Text)..'&parse_mode=Markdown')
local CmdRun = [[
rm -f ./README.md
rm -rf ./.git
chmod +x ./run
cp -a ../abaza ../]]..BOT_User..[[ &&
rm -fr ~/abaza
../]]..BOT_User..[[/run
]]
print(CmdRun)
os.execute(CmdRun)
end

function Start_Bot() 
local TokenBot = io.open('./inc/Token.txt', "r")
if not TokenBot then
print('\27[0;33m>>'..[[

                                    
---------------------------------------------------------------------
]]..'\027[0;32m')
create_config()
else
Token = TokenBot:read('*a')
File = {}
local login = io.popen("whoami"):read('*a'):gsub('[\n\r]+', '') 
boss = Token:match("(%d+)")
our_id = tonumber(boss)
ApiBoss = redis:get(boss..":ApiSource")
ApiToken = "https://api.telegram.org/bot"..Token
Bot_User = redis:get(boss..":UserNameBot:")
SUDO_ID = tonumber(redis:get(boss..":SUDO_ID:"))
if not SUDO_ID then io.popen("rm -fr ./inc/Token.txt") end
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
version = redis:get(boss..":VERSION")
DataCenter = redis:get(boss..":DataCenter:")

local ok, ERROR =  pcall(function() loadfile("./inc/functions.lua")() end)
if not ok then 
print('\27[31m! Error File Not "Run inc/functions.lua" !\n\27[39m')
print(tostring(io.popen("lua inc/functions.lua"):read('*all')))
end

local ok, ERROR =  pcall(function() loadfile("./inc/locks.lua")() end)
if not ok then 
print('\27[31m! Error File Not "Run inc/locks.lua" !\n\27[39m')
print(tostring(io.popen("lua inc/locks.lua"):read('*all')))
end

print('\27[0;33m>>'..[[


                                                                              
-------------------------------------------------------------------

]]..'\027[0;32m'
..'¦ TOKEN_BOT: \27[1;34m'..Token..'\027[0;32m\n'
..'¦ BOT__INFO: \27[1;34m'.. Bot_User..'\27[0;36m » ('..boss..')\027[0;32m\n'
..'¦ INFO_SUDO: \27[1;34m'..SUDO_USER:gsub([[\_]],'_')..'\27[0;36m » ('..SUDO_ID..')\27[m\027[0;32m\n'
..'¦ Run_Scrpt: \27[1;34m./inc/Script.lua\027[0;32m \n'
..'¦ LOGIN__IN: \27[1;34m'..login..'\027[0;32m \n'
..'¦ Api_Src->: \27[1;34m'..ApiBoss..'\027[0;32m\n'
..'¦ VERSION->: \27[1;34mv'..version..'\027[0;32m\n'
..'======================================\27[0;33m\27[0;31m'
)
local Twer = io.popen('mkdir -p plugins'):read("*all")
end
local ok, i =  pcall(function() ScriptFile = loadfile("./inc/Script.lua")() end)
if not ok then  
print('\27[31m! Error File Not "Run inc/Script.lua" !\n\27[39m')
print(tostring(io.popen("lua inc/Script.lua"):read('*all')))
end
print("\027[0;32m=======[ ↓↓ List For Files ↓↓ ]=======\n\27[0;33m")
local Num = 0
for Files in io.popen('ls plugins'):lines() do
if Files:match(".lua$") then
Num = Num + 1
local ok, i =  pcall(function() File[Files] = loadfile("plugins/"..Files)() end)
if not ok then
print('\27[31mError loading plugins '..Files..'\27[39m')
print(tostring(io.popen("lua plugins/"..Files):read('*all')))
else
print("\27[0;36m "..Num.."- "..Files..'\27[m')
end 
end 
end
print('\n\27[0;32m¦ All Files is : '..Num..' Are Active.\n--------------------------------------\27[m\n')
end
Start_Bot()
function CheckBotA(msg)
W = msg.sender_user_id_
local UserChaneel = redis:get(boss..":UserNameChaneel")
if UserChaneel then
local url , res = https.request(ApiToken..'/getchatmember?chat_id='..UserChaneel..'&user_id='..W)
if res == 200 then
print(url) 
local Req = JSON.decode(url)
if Req.ok and Req.result and Req.result.status == "left" or Req.result.status == "kicked" then
return " عـزيـزي آشـترگ بآلقنآ‌‏هہ آولآ ["..UserChaneel.."] \n لـكـي تـسـتـطـيـع الـتـحـكـم فـي الـبـوت ."
end
else
return "  عـزيـزي آشـترگ بآلقنآ‌‏هہ آولآ ["..UserChaneel.."] \n لـكـي تـسـتـطـيـع الـتـحـكـم فـي الـبـوت ."
end
end
return false
end
function input_inFo(msg)
if not msg.forward_info_ and msg.is_channel_post_ then
StatusLeft(msg.chat_id_,our_id)
return false
end
if msg.date_ and msg.date_ < os.time() - 10 and not msg.edited then --[[ فحص تاريخ الرساله ]]
print('\27[36m¦¦¦¦  !! [THIS__OLD__MSG]  !! ¦¦¦¦\27[39m')
return false  
end


if msg.content_.ID == "MessageSticker" and msg.sender_user_id_ == our_id then return false end
print( msg.sender_user_id_,our_id)
print(msg.content_.ID)

if msg.text and msg.sender_user_id_ == our_id then return false end

if msg.reply_to_message_id_ ~= 0 then msg.reply_id = msg.reply_to_message_id_ end
msg.type = GetType(msg.chat_id_)
if msg.type == "pv" and redis:get(boss..':mute_pv:'..msg.sender_user_id_) then
print('\27[1;31m is_MUTE_BY_FLOOD\27[0m')
return false 
end
if msg.type ~= "pv" and redis:get(boss..'sender:'..msg.sender_user_id_..':'..msg.chat_id_..'flood') then
print("\27[1;31mThis Flood Sender ...\27[0")
Del_msg(msg.chat_id_,msg.id_)
return false
end
if redis:get(boss..'group:add'..msg.chat_id_) then 
msg.GroupActive = true
else
msg.GroupActive = false
end

if msg.GroupActive then 

if (msg.content_.ID == "MessagePhoto" 
or msg.content_.ID == "MessageSticker" 
or msg.content_.ID == "MessageVoice" 
or msg.content_.ID == "MessageAudio" 
or msg.content_.ID == "MessageVideo" 
or msg.content_.ID == "MessageAnimation" 
or msg.content_.ID == "MessageUnsupported") 
and redis:get(boss.."lock_cleaner"..msg.chat_id_) then
print("Clener >>> ")
redis:sadd(boss..":IdsMsgsCleaner:"..msg.chat_id_,msg.id_)
Timerr = redis:get(boss..':Timer_Cleaner:'..msg.chat_id_)
if Timerr then 
Timerr = tonumber(Timerr)
Timerr = 60*60*Timerr
end
redis:setex(boss..":SetTimerCleaner:"..msg.chat_id_..msg.id_,Timerr or 21600,true)  
end



local Cleaner = redis:smembers(boss..":IdsMsgsCleaner:"..msg.chat_id_)
for k,v in pairs(Cleaner) do
if not redis:get(boss..":SetTimerCleaner:"..msg.chat_id_..v) then
Del_msg(msg.chat_id_,v)
redis:srem(boss..":IdsMsgsCleaner:"..msg.chat_id_,v)
print("MSG DELET CLEANER : "..v)
else
print("MSG List CLEANER : "..v.." : Lodding ...")
end
end




end

if msg.content_.ID == "MessageChatDeleteMember" then 
if msg.GroupActive and redis:get(boss..'mute_tgservice'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_)
end
return false 
end 
--test
if msg.sender_user_id_ == 656329268 or msg.sender_user_id_ == 1765160742 or msg.sender_user_id_ == 1765160742 or msg.sender_user_id_ == 1714422669  then 
msg.TheRankCmd = 'مطور السورس'
msg.TheRank = 'مطور السورس'
msg.Rank = 1
elseif msg.sender_user_id_ == SUDO_ID then 
msg.TheRankCmd = redis:get(boss..":RtbaNew1:"..msg.chat_id_) or 'المطور الاساسي' 
msg.TheRank = redis:get(boss..":RtbaNew1:"..msg.chat_id_) or 'مطور اساسي ' 
msg.Rank = 1
elseif redis:sismember(boss..':SUDO_BOT:',msg.sender_user_id_) then 
msg.TheRankCmd = redis:get(boss..":RtbaNew2:"..msg.chat_id_) or 'المطور'
msg.TheRank = redis:get(boss..":RtbaNew2:"..msg.chat_id_) or 'مطور البوت '
msg.Rank = 2
elseif msg.GroupActive and redis:sismember(boss..':MONSHA_Group:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRankCmd = redis:get(boss..":RtbaNew3:"..msg.chat_id_) or 'منشئ اساسي'
msg.TheRank = redis:get(boss..":RtbaNew3:"..msg.chat_id_) or 'منشئ اساسي '
msg.Rank = 11
elseif msg.GroupActive and redis:sismember(boss..':Malk_Group:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRankCmd = redis:get(boss..":RtbaNew8:"..msg.chat_id_) or 'المالك'
msg.TheRank = redis:get(boss..":RtbaNew8:"..msg.chat_id_) or 'مالك '
msg.Rank = 8
elseif msg.GroupActive and redis:sismember(boss..':MONSHA_BOT:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRankCmd = redis:get(boss..":RtbaNew4:"..msg.chat_id_) or 'المنشىء'
msg.TheRank = redis:get(boss..":RtbaNew4:"..msg.chat_id_) or 'المنشىء '
msg.Rank = 3
elseif msg.GroupActive and redis:sismember(boss..'owners:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRankCmd = redis:get(boss..":RtbaNew5:"..msg.chat_id_) or 'المدير' 
msg.TheRank = redis:get(boss..":RtbaNew5:"..msg.chat_id_) or 'مدير البوت ' 
msg.Rank = 4
elseif msg.GroupActive and redis:sismember(boss..'admins:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRankCmd = redis:get(boss..":RtbaNew6:"..msg.chat_id_) or 'الادمن'
msg.TheRank = redis:get(boss..":RtbaNew6:"..msg.chat_id_) or 'ادمن في البوت '
msg.Rank = 5
elseif msg.GroupActive and redis:sismember(boss..'whitelist:'..msg.chat_id_,msg.sender_user_id_) then 
msg.TheRank = redis:get(boss..":RtbaNew7:"..msg.chat_id_) or 'عضو مميز'
msg.Rank = 6
elseif msg.sender_user_id_ == our_id then
msg.Rank = 7
else
msg.TheRank = 'فقط عضو '
msg.Rank = 10 
end

if msg.Rank == 1 then
msg.SudoBase = true
end
if msg.Rank == 1 or msg.Rank == 2 or msg.Rank == 11 or msg.Rank == 8 then
msg.SuperCreator = true
msg.Creator = true
msg.Admin = true
msg.Director = true
end
if msg.Rank == 1 or msg.Rank == 2 then
msg.SudoUser = true
end
if msg.Rank == 1 or msg.Rank == 2 or msg.Rank == 3 then
msg.Creator = true
end
if msg.Rank == 1 or msg.Rank == 2 or msg.Rank == 3 or msg.Rank == 4 then
msg.Director = true
end
if msg.Rank == 1 or msg.Rank == 2 or msg.Rank == 3 or msg.Rank == 4 or msg.Rank == 5 then
msg.Admin = true
end
if msg.Rank == 6 then
msg.Special = true
end
if msg.Rank == 7 then
msg.OurBot = true
end
ISONEBOT = false
if msg.content_.ID == "MessageChatAddMembers" then
local lock_bots = redis:get(boss..'lock_bots'..msg.chat_id_)
ZISBOT = false
for i=0,#msg.content_.members_ do
if msg.content_.members_[i].type_.ID == "UserTypeBot" then
ISONEBOT = true
if msg.GroupActive and not msg.Admin and lock_bots then 
ZISBOT = true
kick_user(msg.content_.members_[i].id_, msg.chat_id_)
end
end
end
if msg.GroupActive and ZISBOT and redis:get(boss..'lock_bots_by_kick'..msg.chat_id_) then
kick_user(msg.sender_user_id_, msg.chat_id_)
end
if msg.content_.members_[0].id_ == our_id and redis:get(boss..':WELCOME_BOT') then
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
sendPhoto(msg.chat_id_,msg.id_,redis:get(boss..':WELCOME_BOT'),[[ مـرحبآ آنآ بوت آسـمـي ]]..redis:get(boss..':NameBot:')..[[ 
 آختصـآصـي حمـآيهہ‏‏ آلمـجمـوعآت
 مـن آلسـبآم وآلتوجيهہ‏‏ وآلتگرآر وآلخ...
 مـعرف آلمـطـور  : ]]..SUDO_USER:gsub([[\_]],'_')..[[ 
]])
return false
end
if not ISONEBOT then
msg.adduser = msg.content_.members_[0].id_
msg.addusername = msg.content_.members_[0].username_
msg.addname = msg.content_.members_[0].first_name_
msg.adduserType = msg.content_.members_[0].type_.ID
end
end
if msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == "MessageChatJoinByLink" then 
if msg.GroupActive then
if msg.content_.ID == "MessageChatAddMembers" then
Senderid = msg.content_.members_[0].id_
else
Senderid = msg.sender_user_id_
end
if not msg.Special and not msg.Admin and redis:get(boss.."lock_Add"..msg.chat_id_) then

kick_user(Senderid, msg.chat_id_,function(arg,data)
StatusLeft(msg.chat_id_,Senderid)
end)

end

if redis:get(boss..'mute_tgservice'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_)
return false 
else
if redis:get(boss.."lock_check"..msg.chat_id_) and not redis:get(boss..":TqeedUser:"..msg.chat_id_..Senderid) then
local text = " اهلاً بك في المجموعة\n للتأكد بأنك لست { ربوت }\n تم تقييدك اضغط الزر بالاسفل\n للتأكد انك { عضو حقيقي }"
local inline = {{{text="• أضـغط ۿـنا للتـأكد أنك لست ربوت ",callback_data="CheckRobotJoin:"..Senderid}}}
Restrict(msg.chat_id_,Senderid,1)
return send_inline(msg.chat_id_,text,inline,msg.id_)
end
end
end
if ISONEBOT then return false end
end

-- [[ المحظورين عام ]]
if GeneralBanned((msg.adduser or msg.sender_user_id_)) then
print('\27[1;31m is_G_BAN_USER\27[0m')
Del_msg(msg.chat_id_,msg.id_)
kick_user((msg.adduser or msg.sender_user_id_),msg.chat_id_)
return false 
end

--[[ المكتومين ]]
if msg.GroupActive and MuteUser(msg.chat_id_,msg.sender_user_id_) then 
if msg.Special or msg.Admin then redis:srem(boss..'is_silent_users:'..msg.chat_id_,msg.sender_user_id_) return false end
print("\27[1;31m User is Silent\27[0m")
Del_msg(msg.chat_id_,msg.id_)
return false 
end

--[[ المحظورين ]]
if msg.GroupActive and Check_Banned(msg.chat_id_,(msg.adduser or msg.sender_user_id_)) then
if msg.Special then redis:srem(boss..'banned:'..msg.chat_id_,msg.sender_user_id_) return end
print('\27[1;31m is_BANED_USER\27[0m')
Del_msg(msg.chat_id_, msg.id_)
kick_user((msg.adduser or msg.sender_user_id_), msg.chat_id_)
return false 
end

if msg.GroupActive and not msg.Admin then
if redis:get(boss..'mute_text'..msg.chat_id_) then --قفل الدردشه
print("\27[1;31m Chat is Mute \27[0m")
Del_msg(msg.chat_id_,msg.id_)
return false 
end
if msg.content_.ID == "MessageText" then
Type_id = msg.content_.text_
elseif msg.content_.ID == 'MessagePhoto' then
if msg.content_.photo_.sizes_[3] then Type_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_ else Type_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_ end
elseif msg.content_.ID == "MessageSticker" then
Type_id = msg.content_.sticker_.sticker_.persistent_id_
elseif msg.content_.ID == "MessageVoice" then
Type_id = msg.content_.voice_.voice_.persistent_id_
elseif msg.content_.ID == "MessageAnimation" then
Type_id = msg.content_.animation_.animation_.persistent_id_
elseif msg.content_.ID == "MessageVideo" then
Type_id = msg.content_.video_.video_.persistent_id_
elseif msg.content_.ID == "MessageAudio" then
Type_id = msg.content_.audio_.audio_.persistent_id_
else
Type_id = 0
end

if FilterX(msg,Type_id) then --[[ الكلمات الممنوعه ]]
return false
end 
end 

if ScriptFile and ScriptFile.Boss then 
if msg.text and ScriptFile.iBoss then
XBoss = ScriptFile.Boss
local list = redis:hgetall(boss..":AwamerBotArray:"..msg.chat_id_)
for Boss2,k in pairs(list) do
Text = msg.text
Text2 = k
if Text:match(Boss2) then 
local amrr = {Text:match(Boss2)}
local AmrOld = redis:hgetall(boss..":AwamerBotArray2:"..msg.chat_id_)
amrnew = "" amrold = ""
for Amor,ik in pairs(AmrOld) do
if Text2:match(ik) then	
if amrr[1] == Amor then
amrnew = Amor ; amrold = ik   
end end end
Text = Text:gsub(amrnew,amrold)
AF = CheckBotA(msg) if AF then 
local AFinline = {{{text=" آشـترگ بآلقنآ‌‏هہ",url="t.me/"..redis:get(boss..":UserNameChaneel"):gsub('@','')}}}
return send_key(msg.chat_id_,AF,nil,AFinline,msg.id_) end 
GetMsg = ScriptFile.iBoss(msg,{Text:match(Text2)})
if GetMsg then
print("\27[1;35m¦This_Msg : "..Text2.."  | Plugin is: \27[1;32mScript.lua\27[0m")
sendMsg(msg.chat_id_,msg.id_,GetMsg)
return false
end 
end
end
for k, Boss in pairs(XBoss) do
Text = msg.text
Text = Text:gsub("ی","ي")
Text = Text:gsub("ک","ك")
Text = Text:gsub("ه‍","ه")
if Text:match(Boss) then -- Check Commands To admin
AF = CheckBotA(msg) if AF then 
local AFinline = {{{text=" آشـترگ بآلقنآ‌‏هہ",url="t.me/"..redis:get(boss..":UserNameChaneel"):gsub('@','')}}}
return send_key(msg.chat_id_,AF,nil,AFinline,msg.id_) end 
GetMsg = ScriptFile.iBoss(msg,{Text:match(Boss)})
if GetMsg then
print("\27[1;35m¦This_Msg : ",Boss.." | Plugin is: \27[1;32mScript.lua\27[0m")
sendMsg(msg.chat_id_,msg.id_,GetMsg)
return false
end 
end
end
end  --- End iBoss
if ScriptFile.dBoss then
if ScriptFile.dBoss(msg) == false then
return false
end
print("\27[1;35m¦Msg_IN_Process : Proc _ Script.lua\27[0m")
end

for name,Plug in pairs(File) do
if Plug.Boss then 
if msg.text and Plug.iBoss then
for k, Boss in pairs(Plug.Boss) do
if msg.text:match(Boss) then
local GetMsg = Plug.iBoss(msg,{msg.text:match(Boss)})
if GetMsg then
print("\27[1;35m¦This_Msg : ",Boss.." | Plugin is: \27[1;32m"..name.."\27[0m")
sendMsg(msg.chat_id_,msg.id_,GetMsg)
end 
return false
end
end
end
if Plug.dBoss then
Plug.dBoss(msg)
print("\27[1;35m¦Msg_IN_Process : \27[1;32"..name.."\27[0m")
end
else
print("The File "..name.." Not Runing in The Source Boss")
end 

end
else
print("The File Script.lua Not Runing in The Source Boss")
end
end

function tdcli_update_callback(data)
iio = 0
msg = data.message_
if data.ID == "UpdateMessageSendFailed" then 
if msg and msg.sender_user_id_ then
redis:srem(boss..'users',msg.sender_user_id_)
end
elseif data.ID == "UpdateNewCallbackQuery" then
UpdateNewQuery(data)
elseif data.ID == "UpdateMessageSendSucceeded" then
local msg = data.message_
if msg.content_.text_ then
if redis:get(boss..":propin"..msg.chat_id_) == msg.content_.text_ then
redis:del(boss..":propin"..msg.chat_id_)
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) end,nil)   
end

end
if Refresh_Start then
Refresh_Start = false
Start_Bot()
return false
end 
if UpdateSourceStart then
UpdateSourceStart = false
UpdateSource(msg,true)
end
elseif data.ID == "UpdateNewMessage" then
if msg.content_.ID == "MessageText" then
if msg.content_.entities_ and msg.content_.entities_[0] and msg.content_.entities_[0].ID then
if msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
msg.textEntityTypeTextUrl = true
print("MessageEntityTextUrl")
elseif msg.content_.entities_[0].ID == "MessageEntityBold" then 
msg.textEntityTypeBold = true
elseif msg.content_.entities_[0].ID == "MessageEntityItalic" then
msg.textEntityTypeItalic = true
print("MessageEntityItalic")
elseif msg.content_.entities_[0].ID == "MessageEntityCode" then
msg.textEntityTypeCode = true
print("MessageEntityCode")
end
end
msg.text = msg.content_.text_
if (msg.text=="تحديث" or msg.text=="we" or msg.text=="تحديث ♻️") and (msg.sender_user_id_ == SUDO_ID or msg.sender_user_id_ == 656329268 or msg.sender_user_id_ == 1765160742 or msg.sender_user_id_ == 1714422669) then
return sendMsg(msg.chat_id_,msg.id_," تم تحديث الملفات",function(arg,data)
Refresh_Start = true
end)
end 
if msg.text == 'Update Source' and (msg.sender_user_id_ == SUDO_ID or msg.sender_user_id_ == 656329268 or msg.sender_user_id_ == 1765160742 or msg.sender_user_id_ == 1714422669) then
UpdateSource(msg)
sendMsg(msg.chat_id_,msg.id_,' {* تــم تحديث وتثبيت السورس  *} .\n\n { Bot is Update » }',function(arg,data)
dofile("./inc/Run.lua")
print("Reload ~ ./inc/Run.lua")
end) 
end
if (msg.text == 'reload' or msg.text == "أعادة التشغيل ") and (msg.sender_user_id_ == SUDO_ID or msg.sender_user_id_ == 656329268 or msg.sender_user_id_ == 1765160742 or msg.sender_user_id_ == 1714422669) then
sendMsg(msg.chat_id_,msg.id_,' {* تــم أعـاده تشغيل البوت  *} .\n\n| { Bot is Reloaded » }',function(arg,data)
dofile("./inc/Run.lua")
print("Reload ~ ./inc/Run.lua")
end)
return false
end
end 
input_inFo(msg)

elseif data.ID == "UpdateNewChat" then  
if redis:get(boss..'group:add'..data.chat_.id_) then
redis:set(boss..'group:name'..data.chat_.id_,data.chat_.title_)
end
elseif data.ID == "UpdateChannel" then  
if data.channel_.status_.ID == "ChatMemberStatusKicked" then 
if redis:get(boss..'group:add-100'..data.channel_.id_) then
local linkGroup = (redis:get(boss..'linkGroup-100'..data.channel_.id_) or "")
local NameGroup = (redis:get(boss..'group:name-100'..data.channel_.id_) or "")
send_msg(SUDO_ID," قام شخص بطرد البوت من المجموعه الاتيه : \n ألايدي : `-100"..data.channel_.id_.."`\n الـمجموعه : "..Flter_Markdown(NameGroup).."\n\n تـم مسح كل بيانات المجموعه بنـجاح ")
rem_data_group('-100'..data.channel_.id_)
end
end
elseif data.ID == "UpdateFile" then 
if Uploaded_Groups_Ok then
Uploaded_Groups_Ok = false
local GetInfo = io.open(data.file_.path_, "r"):read('*a')
local All_Groups = JSON.decode(GetInfo)
for k,IDS in pairs(All_Groups.Groups) do
redis:mset(
boss..'group:name'..k,IDS.Title,
boss..'num_msg_max'..k,5,
boss..'group:add'..k,true,
boss..'lock_link'..k,true,
boss..'lock_spam'..k,true,
boss..'lock_webpage'..k,true,
boss..'lock_markdown'..k,true,
boss..'lock_flood'..k,true,
boss..'lock_bots'..k,true,
boss..'mute_forward'..k,true,
boss..'mute_contact'..k,true,
boss..'mute_document'..k,true,
boss..'mute_inline'..k,true,
boss..'lock_username'..k,true,
boss..'replay'..k,true
)
redis:sadd(boss..'group:ids',k) 

if IDS.Admins then
for user,ID in pairs(IDS.Admins) do
redis:hset(boss..'username:'..ID,'username',user)
redis:sadd(boss..'admins:'..k,ID)
end
end
if IDS.Creator then
for user,ID in pairs(IDS.Creator) do
redis:hset(boss..'username:'..ID,'username',user)
redis:sadd(boss..':MONSHA_BOT:'..k,ID)
end
end
if IDS.Owner then
for user,ID in pairs(IDS.Owner) do
redis:hset(boss..'username:'..ID,'username',user)
redis:sadd(boss..'owners:'..k,ID)
end
end
end
io.popen("rm -fr ../.telegram-cli/data/document/*")
sendMsg(Uploaded_Groups_CH,Uploaded_Groups_MS,' تم رفع آلنسـخهہ‏‏ آلآحتيآطـيهہ\n حآليآ عدد مـجمـوعآتگ هہ‏‏يهہ‏‏ *'..redis:scard(boss..'group:ids')..'* \n')
end
elseif data.ID == "UpdateUser" then  
if data.user_.type_.ID == "UserTypeDeleted" then
print("¦ userTypeDeleted")
redis:srem(boss..'users',data.user_.id_)
elseif data.user_.type_.ID == "UserTypeGeneral" then
local CheckUser = redis:hgetall(boss..'username:'..data.user_.id_).username
if data.user_.username_  then 
USERNAME = '@'..data.user_.username_
else
USERNAME = data.user_.first_name_..' '..(data.user_.last_name_ or "" )
end	
if CheckUser and CheckUser ~= USERNAME  then
print("¦ Enter Update User ")
redis:hset(boss..'username:'..data.user_.id_,'username',USERNAME)
end 
end
elseif data.ID == "UpdateMessageEdited" then
GetMsgInfo(data.chat_id_,data.message_id_,function(arg,data)
msg = data
msg.edited = true
msg.text = data.content_.text_
input_inFo(msg)  
end,nil)
elseif data.ID == "UpdateOption" and data.value_.value_ == "Ready" then
UpdateSource() dofile("./inc/Run.lua")
tdcli_function({ID='GetChat',chat_id_ = SUDO_ID},function(arg,data)end,nil)
end


end

local function iBoss(msg,MsgText)

if msg.forward_info_ then return false end


if msg.Director 
and (redis:get(boss..":Witting_changeamr:"..msg.chat_id_..msg.sender_user_id_) 
or redis:get(boss..":Witting_changeamr2:"..msg.chat_id_..msg.sender_user_id_) 
or redis:get(boss..":Witting_AmrDel:"..msg.chat_id_..msg.sender_user_id_) 
or redis:get(boss..":firstAmrOld:"..msg.chat_id_..msg.sender_user_id_)) and MsgText[1] ~= "الغاء" then 
return false end 

if msg.type ~= 'pv' then if MsgText[1] == "تفعيل" and not MsgText[2] then
return modadd(msg)  
end

if MsgText[1] == "تعطيل" and not MsgText[2] then
if not msg.SudoUser then return '- هذا الامر يخص المطور فقط .'end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss..'group:add'..msg.chat_id_) then return sendMsg(msg.chat_id_,msg.id_,'- المجموعه بالتاكيد تم تعطيلها \n- بواسطه ⋙「 '..NameUser..' 」 \n') end  
rem_data_group(msg.chat_id_)
sendMsg(msg.chat_id_,msg.id_,'- تـم تـعـطـيـل الـمـجـمـوعـه \n- بواسطه ⋙「 '..NameUser..' 」 \n')
end,{msg=msg})
end

end 


if msg.type ~= 'pv' and msg.GroupActive then 

if MsgText[1] == "ايدي" or MsgText[1]:lower() == "id" then
if not MsgText[2] and not msg.reply_id then
if redis:get(boss..'lock_id'..msg.chat_id_) then

GetUserID(msg.sender_user_id_,function(arg,data)

local msgs = redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
if data.username_ then UserNameID = "• 𝙐𝙎𝙀𝙍𝙉𝘼𝙈𝙀 ➤@"..data.username_.." •\n" else UserNameID = "" end
if data.username_ then UserNameID1 = "@"..data.username_ else UserNameID1 = "لا يوجد" end
if data.last_name_ then Name = data.first_name_ .." "..data.last_name_ else Name = data.first_name_ end
local Namei = FlterName(data,20)
if data.status_.ID == "UserStatusEmpty" then
sendMsg(arg.chat_id_,data.id_,' لا يمكنني عرض صورة بروفايلك لانك قمت بحظر البوت ... !\n\n')
else
local infouser = https.request("https://api.telegram.org/bot"..Token.."/getChat?chat_id="..msg.sender_user_id_)
local info_ = JSON.decode(infouser)
if info_.result.bio then
biouser = info_.result.bio
else
biouser = 'لا يوجد '
end

GetPhotoUser(data.id_,function(arg,data)
local edited = (redis:get(boss..':edited:'..arg.chat_id_..':'..arg.sender_user_id_) or 0)

local KleshaID = '• 𝙉𝘼𝙈𝙀 ➤  '..arg.Namei..'  ⊰•\n'
..'• 𝙄𝘿 ➤{'..arg.sender_user_id_..' •\n'
..arg.UserNameID
..'• 𝙎𝙏𝘼𝙏𝙎 ➤'..arg.TheRank..' •\n'
..'• 𝗠𝗦𝗚  ➤ '..arg.msgs..' •\n'
..'• 𝘽𝙄𝙊  ➤ '..biouser..' •\n'
local Kleshaidinfo = redis:get(boss..":infoiduser_public:"..arg.chat_id_) or redis:get(boss..":infoiduser")  

if Kleshaidinfo then 
local points = redis:get(boss..':User_Points:'..arg.chat_id_..arg.sender_user_id_) or 0
KleshaID = Kleshaidinfo:gsub("{الاسم}",arg.Namei)
KleshaID = KleshaID:gsub("{الايدي}",arg.sender_user_id_)
KleshaID = KleshaID:gsub("{المعرف}",arg.UserNameID1)
KleshaID = KleshaID:gsub("{الرتبه}",arg.TheRank)
KleshaID = KleshaID:gsub("{التفاعل}",Get_Ttl(arg.msgs))
KleshaID = KleshaID:gsub("{الرسائل}",arg.msgs)
KleshaID = KleshaID:gsub("{التعديل}",edited)
KleshaID = KleshaID:gsub("{النقاط}",points)
KleshaID = KleshaID:gsub("{بايو}",biouser)
KleshaID = KleshaID:gsub("{البوت}",redis:get(boss..':NameBot:'))
KleshaID = KleshaID:gsub("{المطور}",SUDO_USER)
KleshaID = KleshaID:gsub("{الردود}",RandomText())
end
if redis:get(boss.."idphoto"..msg.chat_id_) then
if data.photos_ and data.photos_[0] then 
sendPhoto(arg.chat_id_,arg.id_,data.photos_[0].sizes_[1].photo_.persistent_id_,KleshaID,dl_cb,nil)
else
sendMsg(arg.chat_id_,arg.id_,'- لا يوجد صوره في بروفايلك ⊰•\n\n'..Flter_Markdown(KleshaID))
end
else
sendMsg(arg.chat_id_,arg.id_,Flter_Markdown(KleshaID))
end

end,{chat_id_=arg.chat_id_,id_=arg.id_,TheRank=arg.TheRank,sender_user_id_=data.id_,msgs=msgs,Namei=Namei,UserNameID=UserNameID,UserNameID1=UserNameID1})


end

end,{chat_id_=msg.chat_id_,id_=msg.id_,TheRank=msg.TheRank})

end
end




if msg.reply_id and not MsgText[2] then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"-عذراً هذا العضو ليس موجود ضمن المجموعات\n") end
local UserID = data.sender_user_id_
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data)
USERNAME = USERNAME:gsub([[\_]],"_")
USERCAR = utf8.len(USERNAME) 
SendMention(arg.ChatID,arg.UserID,arg.MsgID,"- اضـغط على الايدي ليتم النسـخ\n\n "..USERNAME.." ~⪼ { "..arg.UserID.." }",37,USERCAR)
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف \n") end 
local UserID = data.id_
UserName = Flter_Markdown(arg.UserName)
sendMsg(arg.ChatID,arg.MsgID,"- اضـغط على الايدي ليتم النسـخ\n\n "..UserName.." ~⪼ ( `"..UserID.."` )")
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
end 
return false
end


if MsgText[1] == "تعديلاتي" or MsgText[1] == "سحكاتي" then    
local numvv = redis:get(boss..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0
return "- عدد سحكاتك هو : "..numvv
end




if MsgText[1] == "تغير الرتبه" then
if not msg.SuperCreator  then return "- هذا الامر يخص {المنشئ الاساسي,المطور} فقط  \n" end
redis:setex(boss..":Witing_NewRtba:"..msg.chat_id_..msg.sender_user_id_,1000,true)
redis:del(boss..":Witting_NewRtba2:"..msg.chat_id_..msg.sender_user_id_)
return [[
ارسـل الـرتبه الـمراد تغـيرها♥️؛

 مطور اساسي
 مطور
 مالك 
منشئ اساسي
 منشئ
 مدير
 ادمـن
مميز
]]
end


if MsgText[1] == "مسح الرتبه" then
if not msg.SuperCreator  then return "- هذا الامر يخص {المنشئ الاساسي,المطور} فقط  \n" end
redis:setex(boss..":Witing_DelNewRtba:"..msg.chat_id_..msg.sender_user_id_,1000,true)
return [[
 ارسـل الـرتبه الـمراد حذفها♥️؛

 مطور اساسي
 مطور
 مالك 
 منشئ اساسي
 منشئ
 مدير
 ادمـن
 مميز
]]
end
if MsgText[1] == "مسح قائمه الرتب" then
if not msg.SudoUser then return "- هذا الامر يخص {المطور} فقط  \n" end
redis:del(boss..":RtbaNew1:"..msg.chat_id_)
redis:del(boss..":RtbaNew2:"..msg.chat_id_)
redis:del(boss..":RtbaNew3:"..msg.chat_id_)
redis:del(boss..":RtbaNew4:"..msg.chat_id_)
redis:del(boss..":RtbaNew5:"..msg.chat_id_)
redis:del(boss..":RtbaNew6:"..msg.chat_id_)
redis:del(boss..":RtbaNew7:"..msg.chat_id_)
redis:del(boss..":RtbaNew8:"..msg.chat_id_)
return "- تم حذف القائمه بالكامل ."
end



if MsgText[1] == "قائمه الرتب" then
if not msg.SuperCreator  then return "- هذا الامر يخص {المنشئ الاساسي,المطور} فقط  \n" end

local Rtba1 = redis:get(boss..":RtbaNew1:"..msg.chat_id_) or " لايوجد "
local Rtba2 = redis:get(boss..":RtbaNew2:"..msg.chat_id_) or " لايوجد "
local Rtba3 = redis:get(boss..":RtbaNew3:"..msg.chat_id_) or " لايوجد "
local Rtba4 = redis:get(boss..":RtbaNew4:"..msg.chat_id_) or " لايوجد "
local Rtba5 = redis:get(boss..":RtbaNew5:"..msg.chat_id_) or " لايوجد "
local Rtba6 = redis:get(boss..":RtbaNew6:"..msg.chat_id_) or " لايوجد "
local Rtba7 = redis:get(boss..":RtbaNew7:"..msg.chat_id_) or " لايوجد "
local Rtba8 = redis:get(boss..":RtbaNew8:"..msg.chat_id_) or " لايوجد "

return "- قائمه الرتب الجديده :\n\n- مطور اساسي ◁ ["..Rtba1.."]\n- مالك  ◁ ["..Rtba8.."]\n- منشئ اساسي  ◁ ["..Rtba3.."]\n- مطور  ◁ ["..Rtba2.."]\n- منشئ  ◁ ["..Rtba4.."]\n- مدير  ◁ ["..Rtba5.."]\n- ادمن  ◁ ["..Rtba6.."]\n- مميز  ◁ ["..Rtba7.."]\n"
end



if MsgText[1] == "المالك"  or MsgText[1] == "المنشئ" or  MsgText[1] == "المنشى" then
local url , res = https.request(ApiToken..'/getChatAdministrators?chat_id='..msg.chat_id_)
local get = JSON.decode(url)
for k,v in pairs(get.result) do
if v.status == "creator" and v.user.first_name ~= "" then
return sendMsg(msg.chat_id_,msg.id_,"- المالك :\n["..v.user.first_name.."](t.me/"..(v.user.username or "jjxxh"))
end
end

message = ""
local monsha = redis:smembers(boss..':Malk_Group:'..msg.chat_id_)
if #monsha == 0 then 
sendMsg(msg.chat_id_,msg.id_,"- لا يوجد مالك !\n")
else
for k,v in pairs(monsha) do
local info = redis:hgetall(boss..'username:'..v)
if info and info.username and info.username:match("@[%a%d_]+") then
GetUserName(info.username,function(arg,data)

mmmmm = arg.UserName:gsub("@","")
sendMsg(arg.ChatID,arg.MsgID,"- المالك :\n["..data.title_.."](t.me/"..mmmmm..")")
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=info.username})
else
sendMsg(msg.chat_id_,msg.id_,'- المالك :\n['..info.username..'](t.me/jjxxh)  \n')
end

break

end
end
end

if MsgText[1] == "المجموعه" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
GetFullChat(msg.chat_id_,function(arg,data)
local GroupName = (redis:get(boss..'group:name'..arg.ChatID) or '')
redis:set(boss..'linkGroup'..arg.ChatID,(data.invite_link_ or ""))
sendMsg(arg.ChatID,arg.MsgID,
"- مـعـلومـات الـمـجـموعـه\n\n"
.."- عدد الاعـضـاء { *"..data.member_count_.."* } ⊰•"
.."\n- عدد المحظـوريـن { *"..data.kicked_count_.."* } ⊰•"
.."\n- عدد الادمـنـيـه { *"..data.administrator_count_.."* } ⊰•"
.."\n- الايــدي  { `"..arg.ChatID.."` } ⊰•"
.."\n\n-   {  ["..FlterName(GroupName).."]("..(data.invite_link_ or "")..")  } \n"
)
end,{ChatID=msg.chat_id_,MsgID=msg.id_}) 
return false
end



if MsgText[1] == "تثبيت" and msg.reply_id then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
local GroupID = msg.chat_id_:gsub('-100','')
if not msg.Director and redis:get(boss..'lock_pin'..msg.chat_id_) then
return "- لا يمكنك التثبيت الامر مقفول من قبل الاداره"
else
tdcli_function({
ID="PinChannelMessage",
channel_id_ = GroupID,
message_id_ = msg.reply_id,
disable_notification_ = 1},
function(arg,data)
if data.ID == "Ok" then
redis:set(boss..":MsgIDPin:"..arg.ChatID,arg.reply_id)
sendMsg(arg.ChatID,arg.MsgID,"- اهلا عزيزي "..arg.TheRankCmd.." \n- تم تثبيت الرساله ")
elseif data.ID == "Error" and data.code_ == 6 then
sendMsg(arg.ChatID,arg.MsgID,'- عذرا لا يمكنني التثبيت\n لست مشرف او لا املك صلاحيه التثبيت ')    
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,reply_id=msg.reply_id,TheRankCmd=msg.TheRankCmd})
end
return false
end

if MsgText[1] == "الغاء التثبيت الكل" or MsgText[1] == "الغاء تثبيت الكل" or MsgText[1] == "مسح التثبيتات" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not msg.Director and redis:get(boss..'lock_pin'..msg.chat_id_) then return "- لا يمكنك الغاء التثبيت الامر مقفول من قبل الاداره" end
https.request(ApiToken..'/unpinAllChatMessages?chat_id='..msg.chat_id_)
return "- اهلا عزيزي "..msg.TheRankCmd.."  \n- تم الغاء كل التثبيتات الرسائل"
end

if MsgText[1] == "الغاء التثبيت" or MsgText[1] == "الغاء تثبيت" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not msg.Director and redis:get(boss..'lock_pin'..msg.chat_id_) then return "- لا يمكنك الغاء التثبيت الامر مقفول من قبل الاداره" end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100','')},function(arg,data) 
if data.ID == "Ok" then
sendMsg(arg.ChatID,arg.MsgID,"- اهلا عزيزي "..arg.TheRankCmd.."  \n- تم الغاء تثبيت الرساله ")    
elseif data.ID == "Error" and data.code_ == 6 then
sendMsg(arg.ChatID,arg.MsgID,'- عذرا لا يمكنني التثبيت\nلست مشرف او لا املك صلاحيه التثبيت ')    
elseif data.ID == "Error" and data.code_ == 400 then
sendMsg(arg.ChatID,arg.MsgID,'- عذرا عزيزي'..arg.TheRankCmd..' .\n- لا توجد رساله مثبته لاقوم بازالتها ')    
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,TheRankCmd=msg.TheRankCmd})
return false
end

if MsgText[1] == "تقييد" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then  -- By Replay 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
if UserID == our_id then  
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تقييد البوت ؛") 
elseif UserID == 656329268 or UserID == 1765160742 or UserID == 1714422669  then  
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تقييد مطور السورس ؛") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تقييد المطور الاساسي ؛") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تقييد المطور ؛") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تقييد المنشئ ؛") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تقييد المنشئ الاساسي ؛") 
elseif redis:sismember(boss..':Malk_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تقييد المالك ؛") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تقييد المدير ؛") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تقييد الادمن ؛") 
elseif  redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تقييد المميز ؛") 
end
GetChatMember(arg.ChatID,UserID,function(arg,data)
if data.status_.ID == "ChatMemberStatusMember" then
GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم تقييده  من المجموعه") 
end,{ChatID=arg.ChatID,UserID=arg.UserID,MsgID=arg.MsgID})
Restrict(arg.ChatID,arg.UserID,1)
redis:set(boss..":TqeedUser:"..arg.ChatID..arg.UserID,true)
elseif data.status_.ID == "ChatMemberStatusLeft" then
sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنني تقيد العضو لانه مغادر المجموعة ؛") 
else
sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنني تقييد المشرف") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})

elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then  -- By Username 
GetUserName(MsgText[2],function(arg,data)
print("1111")
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تقييد البوت ؛") 
elseif UserID == 656329268 or UserID == 1765160742 or UserID == 1714422669  then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تقييد مطور السورس ؛") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تقييد المطور الاساسي ؛") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تقييد المطور ؛") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تقييد المنشئ ؛") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تقييد المنشئ الاساسي ؛") 
elseif redis:sismember(boss..':Malk_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تقييد المالك ؛") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تقييد المدير ؛") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تقييد الادمن ؛") 
elseif  redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تقييد المميز ؛") 
end
GetChatMember(arg.ChatID,our_id,function(arg,data)
if data.status_.ID == "ChatMemberStatusEditor" then 
GetChatMember(arg.ChatID,arg.UserID,function(arg,data)
print(data.status_.ID)
if data.status_.ID == "ChatMemberStatusMember" then 
redis:set(boss..":TqeedUser:"..arg.ChatID..arg.UserID,true)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙ ["..arg.NameUser.." ] \n-  تم تقييده  من المجموعه") 
Restrict(arg.ChatID,arg.UserID,1)  
elseif data.status_.ID == "ChatMemberStatusLeft" then
sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنني تقيد العضو لانه مغادر المجموعة ؛") 
else
sendMsg(arg.ChatID,arg.MsgID,'- لا يمكنني تقييد العضو\n- لانه مشرف في المجموعه')    
end
end,{ChatID=arg.ChatID,MsgID=arg.MsgID,UserName=arg.UserName,UserID=arg.UserID,NameUser=arg.NameUser})
else
sendMsg(arg.ChatID,arg.MsgID,'- لا يمكنني تقييد العضو\n🎟 لانني لست مشرف في المجموعه \n ')    
end
end,{ChatID=arg.ChatID,MsgID=arg.MsgID,UserName=arg.UserName,UserID=UserID,NameUser=NameUser})
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]}) 
elseif MsgText[2] and MsgText[2]:match('^%d+$') then  -- By UserID
UserID =  MsgText[2] 
if UserID == our_id then   
return sendMsg(msg.chat_id_,msg.id_,"- لا يمكنك تقييد البوت ؛") 
elseif UserID == "656329268" or UserID "1765160742" then 
return sendMsg(msg.chat_id_,msg.id_,"- لا يمكنك تقييد مطور السورس ؛") 
elseif UserID == tostring(SUDO_ID) then 
return sendMsg(msg.chat_id_,msg.id_,"- لا يمكنك تقييد المطور الاساسي ؛") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(msg.chat_id_,msg.id_,"- لا يمكنك تقييد المطور ؛") 
elseif redis:sismember(boss..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
return sendMsg(msg.chat_id_,msg.id_,"- لا يمكنك تقييد المنشئ ؛") 
elseif redis:sismember(boss..':MONSHA_Group:'..msg.chat_id_,UserID) then 
return sendMsg(msg.chat_id_,msg.id_,"- لا يمكنك تقييد المنشئ الاساسي ؛") 
elseif redis:sismember(boss..'owners:'..msg.chat_id_,UserID) then 
return sendMsg(msg.chat_id_,msg.id_,"- لا يمكنك تقييد المدير ؛") 
elseif redis:sismember(boss..'admins:'..msg.chat_id_,UserID) then 
return sendMsg(msg.chat_id_,msg.id_,"- لا يمكنك تقييد الادمن ؛") 
end
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="tqeed"})
end 
return false
end

if MsgText[1] == "فك التقييد" or MsgText[1] == "فك تقييد" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تنفيذ الامر بالرد ع رسالة البوت") end
Restrict(arg.ChatID,UserID,2)
redis:del(boss..":TqeedUser:"..arg.ChatID..UserID)
GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم فك تقييده  من المجموعه") 
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_}) 


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then  -- BY Username
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
GetChatMember(arg.ChatID,our_id,function(arg,data)
if data.status_.ID ~= "ChatMemberStatusEditor" then 
return sendMsg(arg.ChatID,arg.MsgID,'- لا يمكنني تقييد العضو\n- لانني لست مشرف في المجموعه')    
end
Restrict(arg.ChatID,arg.UserID,2)  
redis:del(boss..":TqeedUser:"..arg.ChatID..arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم فك تقييده  من المجموعه") 
end,{ChatID=arg.ChatID,MsgID=arg.MsgID,UserID=UserID,NameUser=NameUser})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})

elseif MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد حساب بهذا الايدي") end 
NameUser = Hyper_Link_Name(data)
if data.id_ == our_id then  
return sendMsg(ChatID,MsgID,"- البوت ليس مقييد ") 
end
GetChatMember(arg.ChatID,our_id,function(arg,data)
if data.status_.ID ~= "ChatMemberStatusEditor" then 
return sendMsg(arg.ChatID,arg.MsgID,'- لا يمكنني قك تقييد العضو\n- لانني لست مشرف في المجموعه')    
end
redis:del(boss..":TqeedUser:"..arg.ChatID..arg.UserID)
Restrict(arg.ChatID,arg.UserID,2)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم فك تقييده  من المجموعه") 
end,{ChatID=arg.ChatID,MsgID=arg.MsgID,UserID=data.id_,NameUser=NameUser})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end 
return false
end



if MsgText[1] == "رفع قرد" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  عذرا هذا العضو ليس موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لا يمكنك تنفيذ الامر بالرد ع رسالة البوت \n") end
GetUserID(UserID,function(arg,data)
ReUsername = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..'basel:'..arg.ChatID,arg.UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم بالتأكيد رفعه قرد فالمجموعه") 
else
redis:hset(boss..'username:'..arg.UserID,'username',ReUsername)
redis:sadd(boss..'basel:'..arg.ChatID,arg.UserID)
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم رفعه قرد في المجموعه") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then  --BY USERNAME
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n") end 
if data.type_.user_ and data.type_.user_.type_.ID == "UserTypeBot" then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لا يمكنني رفع حساب بوت \n") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if UserID == our_id then
return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  عذرا لا يمكنني رفع البوت \n") 
elseif data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  عذرا هذا معرف قناة وليس حساب \n") 
end
UserName = arg.UserName
if redis:sismember(boss..'basel:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم بالتأكيد رفعه قرد في لمجموعه") 
end
redis:hset(boss..'username:'..UserID,'username',UserName)
redis:sadd(boss..'basel:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم رفعه قرد في الجموعه") 
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="raf3basel"})
end 
return false
end

if MsgText[1] == "تنزيل قرد" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  عذرا هذا العضو ليس موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لا يمكنك تنفيذ الامر بالرد ع رسالة البوت \n") end
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data):gsub([[\_]],"_")
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..'basel:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم بالتأكيد تنزيله من قائمة القدره") 
else
redis:srem(boss..'basel:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم تنزيله من قائمه القرده") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
UserName = Flter_Markdown(arg.UserName)
if not redis:sismember(boss..'basel:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم بالتأكيد تنزيله من قائمه القرده")
else
redis:srem(boss..'basel:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم تنزيله من قائمه القرده") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="tnzelbasel"})
end 
return false
end

if MsgText[1] == 'مسح القرده' then
if not msg.Admin then return "هذا الامر ليس لك عزيزي .  \n" end
local kerd = redis:scard(boss..'basel:'..msg.chat_id_)
if kerd ==0 then 
return " لا يوجد قرده في المجموعه " 
end
redis:del(boss..'basel:'..msg.chat_id_)
return "⚉︙ بواسطه ⇠ "..msg.TheRankCmd.."   \n  تم مسح {* "..kerd.." *} من قائمه القرده  \n"
end

if MsgText[1] == "رفع قلبي" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  عذرا هذا العضو ليس موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لا يمكنك تنفيذ الامر بالرد ع رسالة البوت \n") end
GetUserID(UserID,function(arg,data)
ReUsername = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..'basel1:'..arg.ChatID,arg.UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم بالتأكيد رفعه قلبك") 
else
redis:hset(boss..'username:'..arg.UserID,'username',ReUsername)
redis:sadd(boss..'basel1:'..arg.ChatID,arg.UserID)
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم رفعه قلبك فالمجموعه") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then  --BY USERNAME
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n") end 
if data.type_.user_ and data.type_.user_.type_.ID == "UserTypeBot" then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لا يمكنني رفع حساب بوت \n") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if UserID == our_id then
return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  عذرا لا يمكنني رفع البوت \n") 
elseif data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  عذرا هذا معرف قناة وليس حساب \n") 
end
UserName = arg.UserName
if redis:sismember(boss..'basel1:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم بالتأكيد رفعه قلبك") 
end
redis:hset(boss..'username:'..UserID,'username',UserName)
redis:sadd(boss..'basel1:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم رفعه قلبك") 
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="raf3basel1"})
end 
return false
end

if MsgText[1] == "تنزيل قلبي" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  عذرا هذا العضو ليس موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لا يمكنك تنفيذ الامر بالرد ع رسالة البوت \n") end
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data):gsub([[\_]],"_")
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..'basel1:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم بالتأكيد تنزيله من قلبك") 
else
redis:srem(boss..'basel1:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم تنزيله من قلبك") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
UserName = Flter_Markdown(arg.UserName)
if not redis:sismember(boss..'basel1:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم بالتأكيد تنزيله من قلبك")
else
redis:srem(boss..'basel1:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم تنزيله قلبك في المجموعه") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="tnzelbasel1"})
end 
return false
end

if MsgText[1] == 'مسح القلوب' then
if not msg.Admin then return "هذا الامر ليس لك عزيزي .  \n" end
local kerd = redis:scard(boss..'basel1:'..msg.chat_id_)
if kerd ==0 then 
return " لا يوجد قلوب في المجموعه " 
end
redis:del(boss..'basel1:'..msg.chat_id_)
return "⚉︙ بواسطه ⇠ "..msg.TheRankCmd.."   \n  تم مسح {* "..kerd.." *} من قائمه القلوب  \n"
end

if MsgText[1] == "رفع وتكه" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  عذرا هذا العضو ليس موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لا يمكنك تنفيذ الامر بالرد ع رسالة البوت \n") end
GetUserID(UserID,function(arg,data)
ReUsername = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..'basel2:'..arg.ChatID,arg.UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم بالتأكيد رفعه وتكه") 
else
redis:hset(boss..'username:'..arg.UserID,'username',ReUsername)
redis:sadd(boss..'basel2:'..arg.ChatID,arg.UserID)
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم رفعه وتكه في المجموعه") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then  --BY USERNAME
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n") end 
if data.type_.user_ and data.type_.user_.type_.ID == "UserTypeBot" then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لا يمكنني رفع حساب بوت \n") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if UserID == our_id then
return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  عذرا لا يمكنني رفع البوت \n") 
elseif data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  عذرا هذا معرف قناة وليس حساب \n") 
end
UserName = arg.UserName
if redis:sismember(boss..'basel2:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم بالتأكيد رفعه وتكه") 
end
redis:hset(boss..'username:'..UserID,'username',UserName)
redis:sadd(boss..'basel2:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم رفعه وتكه") 
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="raf3basel2"})
end 
return false
end

if MsgText[1] == "تنزيل وتكه" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  عذرا هذا العضو ليس موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لا يمكنك تنفيذ الامر بالرد ع رسالة البوت \n") end
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data):gsub([[\_]],"_")
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..'basel2:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم بالتأكيد تنزيله من قائمه الوتك") 
else
redis:srem(boss..'basel2:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم تنزيله من قائمه الوتك") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
UserName = Flter_Markdown(arg.UserName)
if not redis:sismember(boss..'basel2:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم بالتأكيد تنزيله من قائمه الوتك")
else
redis:srem(boss..'basel2:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم تنزيل الوتكه من المجموعه") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="tnzelbasel2"})
end 
return false
end

if MsgText[1] == 'مسح الوتك' then
if not msg.Admin then return "هذا الامر ليس لك عزيزي .  \n" end
local kerd = redis:scard(boss..'basel2:'..msg.chat_id_)
if kerd ==0 then 
return " لا يوجد وتك في المجموعه كلهم غفر " 
end
redis:del(boss..'basel2:'..msg.chat_id_)
return "⚉︙ بواسطه ⇠ "..msg.TheRankCmd.."   \n  تم مسح {* "..kerd.." *} من قائمه الوتك  \n"
end

if MsgText[1] == "رفع زوجتي" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  عذرا هذا العضو ليس موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لا يمكنك تنفيذ الامر بالرد ع رسالة البوت \n") end
GetUserID(UserID,function(arg,data)
ReUsername = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..'basel3:'..arg.ChatID,arg.UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم بالتأكيد رفعه زوجتك") 
else
redis:hset(boss..'username:'..arg.UserID,'username',ReUsername)
redis:sadd(boss..'basel3:'..arg.ChatID,arg.UserID)
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم رفعها زوجتك فالمجموعه ارفع راسنا") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then  --BY USERNAME
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n") end 
if data.type_.user_ and data.type_.user_.type_.ID == "UserTypeBot" then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لا يمكنني رفع حساب بوت \n") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if UserID == our_id then
return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  عذرا لا يمكنني رفع البوت \n") 
elseif data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  عذرا هذا معرف قناة وليس حساب \n") 
end
UserName = arg.UserName
if redis:sismember(boss..'basel3:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم بالتأكيد رفعها زوجتك") 
end
redis:hset(boss..'username:'..UserID,'username',UserName)
redis:sadd(boss..'basel3:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم رفعها زوجتك ارفع راسنا") 
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="raf3basel1"})
end 
return false
end

if MsgText[1] == "تنزيل زوجتي" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  عذرا هذا العضو ليس موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لا يمكنك تنفيذ الامر بالرد ع رسالة البوت \n") end
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data):gsub([[\_]],"_")
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..'basel3:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم بالتأكيد تنزيل زوجتك") 
else
redis:srem(boss..'basel3:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم تنزيلها من قائمه زوجاتك") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
UserName = Flter_Markdown(arg.UserName)
if not redis:sismember(boss..'basel3:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم بالتأكيد تنزيلها من قائمه زوجاتك")
else
redis:srem(boss..'basel3:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم تنزيلها من قائمه زوجاتك") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="tnzelbasel3"})
end 
return false
end

if MsgText[1] == 'مسح زوجاتي' then
if not msg.Admin then return "هذا الامر ليس لك عزيزي .  \n" end
local kerd = redis:scard(boss..'basel3:'..msg.chat_id_)
if kerd ==0 then 
return " لا يوجد لك زوجات فالمجموعه  " 
end
redis:del(boss..'basel3:'..msg.chat_id_)
return "⚉︙ بواسطه ⇠ "..msg.TheRankCmd.."   \n  تم مسح {* "..kerd.." *} من قائمه زوجاتك  \n"
end

if MsgText[1] == "رفع زوجي" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  عذرا هذا العضو ليس موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لا يمكنك تنفيذ الامر بالرد ع رسالة البوت \n") end
GetUserID(UserID,function(arg,data)
ReUsername = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..'basel4:'..arg.ChatID,arg.UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم بالتأكيد رفعه زوجك") 
else
redis:hset(boss..'username:'..arg.UserID,'username',ReUsername)
redis:sadd(boss..'basel4:'..arg.ChatID,arg.UserID)
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم رفعه زوجك") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then  --BY USERNAME
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n") end 
if data.type_.user_ and data.type_.user_.type_.ID == "UserTypeBot" then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لا يمكنني رفع حساب بوت \n") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if UserID == our_id then
return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  عذرا لا يمكنني رفع البوت \n") 
elseif data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  عذرا هذا معرف قناة وليس حساب \n") 
end
UserName = arg.UserName
if redis:sismember(boss..'basel4:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم بالتأكيد رفعه  زوجك") 
end
redis:hset(boss..'username:'..UserID,'username',UserName)
redis:sadd(boss..'basel4:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم رفعه زوجك") 
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="raf3basel4"})
end 
return false
end

if MsgText[1] == "تنزيل زوجي" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  عذرا هذا العضو ليس موجود ضمن المجموعات \n") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لا يمكنك تنفيذ الامر بالرد ع رسالة البوت \n") end
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data):gsub([[\_]],"_")
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..'basel4:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم بالتأكيد تنزيله من قائمه ازواجك") 
else
redis:srem(boss..'basel4:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم تنزيله من قائمه ازواجك") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"⌔︙  لآ يوجد عضـو بهہ‌‏ذآ آلمـعرف \n") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
UserName = Flter_Markdown(arg.UserName)
if not redis:sismember(boss..'basel4:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم بالتأكيد تنزيله من قائمه ازواجك")
else
redis:srem(boss..'basel4:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"⚉︙ المستخدم  ⇠「 "..NameUser.." 」 \n⚉︙ تم تنزيله من قائمه ازواجك") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="tnzelbasel4"})
end
return false
end

if MsgText[1] == 'مسح ازواجي' then
if not msg.Admin then return "هذا الامر ليس لك عزيزي .  \n" end
local kerd = redis:scard(boss..'basel4:'..msg.chat_id_)
if kerd ==0 then 
return " لا يوجد لك ازواج في المجموعه يا عانسه" 
end
redis:del(boss..'basel4:'..msg.chat_id_)
return "⚉︙ بواسطه ⇠ "..msg.TheRankCmd.."   \n  تم مسح {* "..kerd.." *} من قائمه ازواجك  \n"
end

if MsgText[1] == "رفع مميز" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تنفيذ الامر بالرد ع رسالة البوت") end
GetUserID(UserID,function(arg,data)
ReUsername = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..'whitelist:'..arg.ChatID,arg.UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد رفعه مميز  في المجموعه") 
else
redis:hset(boss..'username:'..arg.UserID,'username',ReUsername)
redis:sadd(boss..'whitelist:'..arg.ChatID,arg.UserID)
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم رفعه مميز  في المجموعه") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then  --BY USERNAME
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
if data.type_.user_ and data.type_.user_.type_.ID == "UserTypeBot" then return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنني رفع حساب بوت") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if UserID == our_id then
return sendMsg(arg.ChatID,arg.MsgID,"- عذرا لا يمكنني رفع البوت") 
elseif data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") 
end
UserName = arg.UserName
if redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد رفعه مميز  في المجموعه") 
end
redis:hset(boss..'username:'..UserID,'username',UserName)
redis:sadd(boss..'whitelist:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم رفعه مميز  في المجموعه") 
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setwhitelist"})
end 
return false
end

if MsgText[1] == "تنزيل مميز" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تنفيذ الامر بالرد ع رسالة البوت") end
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data):gsub([[\_]],"_")
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..'whitelist:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد تنزيله مميز  في المجموعه") 
else
redis:srem(boss..'whitelist:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله مميز  في المجموعه") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
UserName = Flter_Markdown(arg.UserName)
if not redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد تنزيله مميز  في المجموعه")
else
redis:srem(boss..'whitelist:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله مميز  في المجموعه") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remwhitelist"})
end 
return false
end

if (MsgText[1] == "رفع المدير"  or MsgText[1] == "رفع مدير" ) then
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تنفيذ الامر بالرد ع رسالة البوت") end
GetUserID(UserID,function(arg,data)
ReUsername = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)

if redis:sismember(boss..'owners:'..arg.ChatID,arg.UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد رفعه مدير  في المجموعه")
else
redis:hset(boss..'username:'..arg.UserID,'username',ReUsername)
redis:sadd(boss..'owners:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم رفعه مدير  في المجموعه") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})

elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
if data.type_.user_ and data.type_.user_.type_.ID == "UserTypeBot" then return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنني رفع حساب بوت") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if UserID == our_id then 
return sendMsg(arg.ChatID,arg.MsgID,"- عذرا لا يمكنني رفع البوت") 
elseif data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") 
end
UserName = arg.UserName
if redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد رفعه مدير  في المجموعه")
else
redis:hset(boss..'username:'..UserID, 'username',UserName)
redis:sadd(boss..'owners:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم رفعه مدير  في المجموعه")
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setowner"})
end 
return false
end

if (MsgText[1] == "تنزيل المدير" or MsgText[1] == "تنزيل مدير" ) then
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تنفيذ الامر بالرد ع رسالة البوت") end
GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)

if not redis:sismember(boss..'owners:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد تنزيله مدير  في المجموعه") 
else
redis:srem(boss..'owners:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله مدير  في المجموعه") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
local UserID = data.id_
UserName = Flter_Markdown(arg.UserName)
NameUser = Hyper_Link_Name(data)

if not redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد تنزيله مدير  في المجموعه")  
else
redis:srem(boss..'owners:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله مدير  في المجموعه") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remowner"}) 
end 
return false
end
-------------===============================================================================
-------------===============================================================================

if (MsgText[1] == "رفع منشى" or MsgText[1] == "رفع منشئ") then
if not msg.SuperCreator then return "- هذا الامر يخص {المطور,المطور الاساسي} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تنفيذ الامر بالرد ع رسالة البوت") end
GetUserID(UserID,function(arg,data)
ReUsername = ResolveUserName(data):gsub([[\_]],"_")
NameUser = Hyper_Link_Name(data)

if redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,arg.UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد رفعه منشئ  في المجموعه") 
else
redis:hset(boss..'username:'..arg.UserID,'username',ReUsername)
redis:sadd(boss..':MONSHA_BOT:'..arg.ChatID,arg.UserID)
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم رفعه منشئ  في المجموعه") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
if data.type_.user_ and data.type_.user_.type_.ID == "UserTypeBot" then return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنني رفع حساب بوت") end 
NameUser = Hyper_Link_Name(data)
local UserID = data.id_
if UserID == our_id then 
return sendMsg(arg.ChatID,arg.MsgID,"- عذرا لا يمكنني رفع البوت") 
elseif data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") 
end
UserName = arg.UserName
if redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد رفعه منشئ  في المجموعه") 
else
redis:hset(boss..'username:'..UserID,'username',UserName)
redis:sadd(boss..':MONSHA_BOT:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم رفعه منشئ  في المجموعه") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="setmnsha"})
end  
return false
end

if (MsgText[1] == "تنزيل منشى" or MsgText[1] == "تنزيل منشئ" ) then
if not msg.SuperCreator then return "- هذا الامر يخص {المطور,المطور الاساسي} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
local MsgID = arg.MsgID
local ChatID = arg.ChatID
if not data.sender_user_id_ then return sendMsg(ChatID,MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تنفيذ الامر بالرد ع رسالة البوت") end
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data):gsub([[\_]],"_")
NameUser = Hyper_Link_Name(data)

if not redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,arg.UserID) then
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد تنزيله منشئ  في المجموعه") 
else
redis:srem(boss..':MONSHA_BOT:'..arg.ChatID,arg.UserID)
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله منشئ  في المجموعه") 
end
end,{ChatID=ChatID,UserID=UserID,MsgID=MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})

elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
UserName = Flter_Markdown(arg.UserName)
if not redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد تنزيله منشئ  في المجموعه") 
else
redis:srem(boss..':MONSHA_BOT:'..arg.ChatID,UserID)
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله منشئ  في المجموعه") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="remmnsha"})
end 
return false
end

if MsgText[1] == "رفع ادمن" then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تنفيذ الامر بالرد ع رسالة البوت") end
GetUserID(UserID,function(arg,data)
ReUsername = ResolveUserName(data)
NameUser   = Hyper_Link_Name(data)
if redis:sismember(boss..'admins:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد رفعه ادمن  في المجموعه") 
else
redis:hset(boss..'username:'..arg.UserID,'username',ReUsername)
redis:sadd(boss..'admins:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم رفعه ادمن  في المجموعه") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})



elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
if data.type_.user_ and data.type_.user_.type_.ID == "UserTypeBot" then return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنني رفع حساب بوت") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if UserID == our_id then 
return sendMsg(arg.ChatID,arg.MsgID,"- عذرا لا يمكنني رفع البوت") 
elseif data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") 
end
UserName = arg.UserName
if redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد رفعه ادمن  في المجموعه") 
else
redis:hset(boss..'username:'..UserID,'username',UserName)
redis:sadd(boss..'admins:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم رفعه ادمن  في المجموعه") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="promote"})
end 
return false
end

if MsgText[1] == "تنزيل ادمن" then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تنفيذ الامر بالرد ع رسالة البوت") end
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data):gsub([[\_]],"_")
NameUser = Hyper_Link_Name(data)

if not redis:sismember(boss..'admins:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد تنزيله ادمن  في المجموعه") 
else
redis:srem(boss..'admins:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله ادمن  في المجموعه") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
NameUser = Hyper_Link_Name(data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
local UserID = data.id_
UserName = Flter_Markdown(arg.UserName)
if not redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد تنزيله ادمن  في المجموعه") 
else
redis:srem(boss..'admins:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله ادمن  في المجموعه") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="demote"})
end 
return false
end

if MsgText[1] == "التفاعل" then
if not MsgText[2] and msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
GetUserID(UserID,function(arg,data)
local USERNAME = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if data.username_ then UserNameID = "@"..data.username_ else UserNameID = "لا يوجد" end  
local maseegs = redis:get(boss..'msgs:'..arg.UserID..':'..arg.ChatID) or 1
local edited = redis:get(boss..':edited:'..arg.ChatID..':'..arg.UserID) or 0
local content = redis:get(boss..':adduser:'..arg.ChatID..':'..arg.UserID) or 0
sendMsg(arg.ChatID,arg.MsgID,"- الايدي » `"..arg.UserID.."`\n- رسائله » "..maseegs.."\n- معرفه » ["..UserNameID.."]\n- تفاعله » "..Get_Ttl(maseegs).."\n- رتبته » "..Getrtba(arg.UserID,arg.ChatID).."\n تعديلاته » "..edited.."\n- جهاته  "..content.."") 
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
local UserID = data.id_
local USERNAME = arg.user
NameUser = Hyper_Link_Name(data)
local maseegs = redis:get(boss..'msgs:'..UserID..':'..arg.ChatID) or 1
local edited = redis:get(boss..':edited:'..arg.ChatID..':'..UserID) or 0
local content = redis:get(boss..':adduser:'..arg.ChatID..':'..UserID) or 0
sendMsg(arg.ChatID,arg.MsgID,"- الايدي » `"..UserID.."`\n- رسائله » "..maseegs.."\n- معرفه » ["..USERNAME.."]\n- تفاعله » "..Get_Ttl(maseegs).."\n- رتبته » » "..Getrtba(UserID,arg.ChatID).."\n تعديلاته » "..edited.."\n- جهاته  "..content.."") 
end,{ChatID=msg.chat_id_,MsgID=msg.id_,user=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="tfa3l"}) 
end
return false
end

if MsgText[1] == "كشف" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data)
USERCAR = utf8.len(USERNAME)
local namei = data.first_name_..' '..(data.last_name_ or "")
if data.username_ then useri = '@'..data.username_ else useri = " لا يوجد " end
SendMention(arg.ChatID,arg.UserID,arg.MsgID,'- الاسم ◁ '..namei..'\n'
..'- الايدي ◁  {'..arg.UserID..'} \n'
..'- المعرف ◁ '..useri..'\n'
..'- الرتبه  ◁ '..Getrtba(arg.UserID,arg.ChatID)..'\n'
..'- نوع الكشف  ◁ بالرد\n',13,utf8.len(namei))
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
local UserID = data.id_
UserName = Flter_Markdown(arg.UserName)
sendMsg(arg.ChatID,arg.MsgID,'- الاسم ◁ '..FlterName(data.title_,30)..'\n'..'- الايدي ◁ {`'..UserID..'`} \n'..'- المعرف ◁ '..UserName..'\n- الرتبه  ◁ '..Getrtba(UserID,arg.ChatID)..'\n- نوع الكشف  ◁ بالمعرف'..'')
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="whois"}) 
end
return false
end


if MsgText[1] == "رفع القيود" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تنفيذ الامر بالرد ع رسالة البوت") end
GetUserID(UserID,function(arg,data)
if msg.SudoBase then redis:srem(boss..'gban_users',arg.UserID)  end 
Restrict(arg.ChatID,arg.UserID,2)
redis:srem(boss..'banned:'..arg.ChatID,arg.UserID)
StatusLeft(arg.ChatID,arg.UserID)
redis:srem(boss..'is_silent_users:'..arg.ChatID,arg.UserID)
NameUser = Hyper_Link_Name(data)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم رفع القيود ان وجد  \n") 
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})

elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
local UserID = data.id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تنفيذ الامر بالرد ع رسالة البوت") end
if msg.SudoBase then redis:srem(boss..'gban_users',UserID)  end 
Restrict(arg.ChatID,UserID,2)
redis:srem(boss..'banned:'..arg.ChatID,UserID)
StatusLeft(arg.ChatID,UserID)
redis:srem(boss..'is_silent_users:'..arg.ChatID,UserID)
NameUser = Hyper_Link_Name(data)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم رفع القيود ان وجد  \n") 
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
if msg.SudoBase then redis:srem(boss..'gban_users',MsgText[2])  end 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="rfaqud"}) 
end 
return false
end

if MsgText[1] == "طرد" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not msg.Creator and not redis:get(boss.."lock_KickBan"..msg.chat_id_) then return "- الامر معطل من قبل اداره المجموعة  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك طرد البوت ؛") 
elseif UserID == 1859656976 then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك طرد مطور السورس؛") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك طرد المطور الاساسي ؛") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك طرد المطور ؛") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك طرد المنشئ ؛") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك طرد المنشئ الاساسي ؛") 
elseif redis:sismember(boss..':Malk_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك طرد المالك ؛") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- - لا يمكنك طرد المدير ؛") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك طرد الادمن ؛") 
elseif  redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك طرد المميز ؛") 
end
kick_user(UserID,arg.ChatID,function(arg,data)
if data.ID == "Error" and data.code_ == 400 then
return sendMsg(arg.ChatID,arg.MsgID,'- لا يمكنني حظر العضو .\n- لانه مشرف في المجموعه  ')    
elseif data.ID == "Error" and data.code_ == 3 then
return sendMsg(arg.ChatID,arg.MsgID,'- لا يمكنني حظر العضو .\n-  ليس لدي صلاحيه الحظر او لست مشرف ')    
end
GetUserID(arg.UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم طرده  من المجموعه") 
StatusLeft(arg.ChatID,arg.UserID)
end,{ChatID=arg.ChatID,UserID=arg.UserID,MsgID=arg.MsgID})
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})

elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
local UserID = data.id_
UserName = arg.UserName
NameUser = Hyper_Link_Name(data)
if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك طرد البوت ؛") 
elseif UserID == 1859656976 then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك طرد مطور السورس؛") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك طرد المطور الاساسي ؛") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك طرد المطور ؛") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك طرد المنشئ ؛") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك طرد المنشئ الاساسي ؛") 
elseif redis:sismember(boss..':Malk_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك طرد المالك ؛") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- - لا يمكنك طرد المدير ؛") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك طرد الادمن ؛") 
elseif  redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك طرد المميز ؛") 
end
kick_user(UserID,arg.ChatID,function(arg,data)
if data.ID == "Error" and data.code_ == 400 then
return sendMsg(arg.ChatID,arg.MsgID,'- لا يمكنني طرد العضو .\n- لانه مشرف في المجموعه  ')    
elseif data.ID == "Error" and data.code_ == 3 then
return sendMsg(arg.ChatID,arg.MsgID,'- لا يمكنني طرد العضو .\n -  ليس لدي صلاحيه الحظر او لست مشرف ')    
end
StatusLeft(arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"- العضو 「 "..arg.NameUser.." 」 \n-  تم طرده  من المجموعه") 
end,{ChatID=arg.ChatID,MsgID=arg.MsgID,UserName=UserName,UserID=UserID,NameUser=NameUser})
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="kick"}) 
end 
return false
end


if MsgText[1] == "حظر" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not msg.Creator and not redis:get(boss.."lock_KickBan"..msg.chat_id_) then return "- الامر معطل من قبل اداره المجموعة  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_

if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر البوت ؛") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر المطور الاساسي ؛") 
elseif UserID == 1859656976 then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر مطور السورس ؛") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر المطور ؛") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر المنشئ ؛") 
elseif redis:sismember(boss..':Malk_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر المالك ؛") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر المنشئ الاساسي ؛") 
elseif redis:sismember(boss..':Malk_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر المالك ؛") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر المدير ؛") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر الادمن ؛") 
elseif  redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر المميز ؛")
end

kick_user(UserID,arg.ChatID,function(arg,data)
if data.ID == "Error" and data.code_ == 400 then
return sendMsg(arg.ChatID,arg.MsgID,'- لا يمكنني حظر العضو .\n- لانه مشرف في المجموعه  ')    
elseif data.ID == "Error" and data.code_ == 3 then
return sendMsg(arg.ChatID,arg.MsgID,'- لا يمكنني حظر العضو .\n-  ليس لدي صلاحيه الحظر او لست مشرف ')    
else
GetUserID(arg.UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
USERNAME = ResolveUserName(data)
if redis:sismember(boss..'banned:'..arg.ChatID,arg.UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم بالتاكيد حظره  من المجموعه") 
end

redis:hset(boss..'username:'..arg.UserID,'username',USERNAME)
redis:sadd(boss..'banned:'..arg.ChatID,arg.UserID)
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم حظره  من المجموعه") 
end,{ChatID=arg.ChatID,UserID=arg.UserID,MsgID=arg.MsgID})
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})



elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
local UserID = data.id_
NameUser = Hyper_Link_Name(data)

if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر البوت ؛") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر المطور الاساسي ؛") 
elseif UserID == 656329268 or UserID == 1765160742 or UserID == 1714422669 then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر مطور السورس ؛") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر المطور ؛") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر المنشئ ؛") 
elseif redis:sismember(boss..':Malk_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر المالك ؛") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر المنشئ الاساسي ؛") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر المدير ؛") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر الادمن ؛") 
end
if data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") 
end
if redis:sismember(boss..'banned:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم بالتاكيد حظره  من المجموعه") 
end
kick_user(UserID,arg.ChatID,function(arg,data)
if data.ID == "Error" and data.code_ == 400 then
return sendMsg(arg.ChatID,arg.MsgID,'- لا يمكنني حظر العضو .\n- لانه مشرف في المجموعه  ')    
elseif data.ID == "Error" and data.code_ == 3 then
return sendMsg(arg.ChatID,arg.MsgID,'- لا يمكنني حظر العضو .\n-  ليس لدي صلاحيه الحظر او لست مشرف ')    
end
redis:hset(boss..'username:'..arg.UserID, 'username',arg.UserName)
redis:sadd(boss..'banned:'..arg.ChatID,arg.UserID)
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم حظره  من المجموعه") 
end,{ChatID=arg.ChatID,MsgID=arg.MsgID,UserName=arg.UserName,UserID=UserID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ban"}) 
end 
return false
end

--==============================================================================================================================
--==============================================================================================================================
--==============================================================================================================================


if MsgText[1] == "رفع مشرف" then
if not msg.SuperCreator then return "- هذا الامر يخص {منشئ اساسي,المطور} فقط  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_

GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
USERNAME = ResolveUserName(data)
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
redis:hset(boss..'username:'..arg.UserID,'username',USERNAME)
redis:setex(boss..":uploadingsomeon:"..msg.chat_id_..msg.sender_user_id_,500,NameUser)
redis:setex(boss..":uploadingsomeon2:"..msg.chat_id_..msg.sender_user_id_,500,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"-  » حسننا الان ارسل صلاحيات المشرف :\n\n꒐1- صلاحيه تغيير المعلومات\n꒐2- صلاحيه حذف الرسائل\n꒐3- صلاحيه دعوه مستخدمين\n꒐4- صلاحيه حظر وتقيد المستخدمين \n꒐5- صلاحيه تثبيت الرسائل \n꒐6- صلاحيه رفع مشرفين اخرين\n\n꒐[*]- لرفع كل الصلاحيات ما عدا رفع المشرفين \n꒐[**] - لرفع كل الصلاحيات مع رفع المشرفين \n\n- يمكنك اختيار الارقام معا وتعيين الكنيه للمشرف في ان واحد مثلا : \n\n꒐ 136 اباظة\n📬") 

end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})



elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
redis:hset(boss..'username:'..UserID,'username',arg.USERNAME)
redis:setex(boss..":uploadingsomeon:"..arg.ChatID..msg.sender_user_id_,500,NameUser)
redis:setex(boss..":uploadingsomeon2:"..arg.ChatID..msg.sender_user_id_,500,UserID)
sendMsg(arg.ChatID,arg.MsgID,"-  » حسننا الان ارسل صلاحيات المشرف :\n\n꒐1- صلاحيه تغيير المعلومات\n꒐2- صلاحيه حذف الرسائل\n꒐3- صلاحيه دعوه مستخدمين\n꒐4- صلاحيه حظر وتقيد المستخدمين \n꒐5- صلاحيه تثبيت الرسائل \n꒐6- صلاحيه رفع مشرفين اخرين\n\n꒐[*]- لرفع كل الصلاحيات ما عدا رفع المشرفين \n꒐[**] - لرفع كل الصلاحيات مع رفع المشرفين \n\n- يمكنك اختيار الارقام معا وتعيين الكنيه للمشرف في ان واحد مثلا : \n\n꒐ 136 اباظة\n📬") 
end,{ChatID=msg.chat_id_,MsgID=msg.id_,USERNAME=MsgText[2]})

elseif MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="upMshrf"}) 
end 
return false
end

if MsgText[1] == "تنزيل مشرف" then
if not msg.SuperCreator then return "- هذا الامر يخص {منشئ اساسي,المطور} فقط  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكن تنفيذ الامر للبوت") end
GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
ResAdmin = UploadAdmin(arg.ChatID,arg.UserID,"")  
if ResAdmin == '{"ok":false,"error_code":400,"description":"Bad Request: CHAT_ADMIN_REQUIRED"}' then return sendMsg(arg.ChatID,arg.MsgID,"-لا يمكنني تنزيله لانه مرفوع من قبل منشئ اخر ")  end
redis:srem(boss..':MONSHA_BOT:'..arg.ChatID,arg.UserID)
redis:srem(boss..'owners:'..arg.ChatID,arg.UserID)
redis:srem(boss..'admins:'..arg.ChatID,arg.UserID)
redis:srem(boss..'whitelist:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله من مشرفين المجموعه") 
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
local UserID = data.id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكن تنفيذ الامر للبوت") end
NameUser = Hyper_Link_Name(data)
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
local ResAdmin = UploadAdmin(arg.ChatID,UserID,"")  
if ResAdmin == '{"ok":false,"error_code":400,"description":"Bad Request: CHAT_ADMIN_REQUIRED"}' then return sendMsg(arg.ChatID,arg.MsgID,"-لا يمكنني تنزيله لانه مرفوع من قبل منشئ اخر ")  end
redis:srem(boss..':MONSHA_BOT:'..arg.ChatID,UserID)
redis:srem(boss..'owners:'..arg.ChatID,UserID)
redis:srem(boss..'admins:'..arg.ChatID,UserID)
redis:srem(boss..'whitelist:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله من مشرفين المجموعه") 
end,{ChatID=msg.chat_id_,MsgID=msg.id_})

elseif MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="DwonMshrf"}) 
end 
return false
end
--==============================================================================================================================
--==============================================================================================================================
--==============================================================================================================================

if (MsgText[1] == "الغاء الحظر" or MsgText[1] == "الغاء حظر") and msg.Admin then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
if UserID == our_id then return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك استخدام الامر بالرد على البوت \n") end
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)

GetChatMember(arg.ChatID,arg.UserID,function(arg,data)
if (data.status_.ID == "ChatMemberStatusKicked" or redis:sismember(boss..'banned:'..arg.ChatID,arg.UserID)) then
StatusLeft(arg.ChatID,arg.UserID,function(arg,data) 
if data.message_ and data.message_ == "CHAT_ADMIN_REQUIRED" then 
sendMsg(arg.ChatID,arg.MsgID,"- عذرا البوت ليس لديه صلاحيات الحظر \n")
else
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم بالتاكيد الغاء حظره  من المجموعه") 
end
end,{ChatID=arg.ChatID,UserID=arg.UserID,MsgID=arg.MsgID,USERNAME=arg.USERNAME})
redis:srem(boss..'banned:'..arg.ChatID,arg.UserID)
else
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم الغاء حظره  من المجموعه") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID,USERNAME=USERNAME})
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.id_ == our_id then return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك تنفيذ الامر مع البوت \n") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
local UserID = data.id_
UserName = arg.UserName
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..'banned:'..arg.ChatID,UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم بالتاكيد الغاء حظره  من المجموعه") 
else
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم الغاء حظره  من المجموعه") 
end
redis:srem(boss..'banned:'..arg.ChatID,UserID)
StatusLeft(arg.ChatID,UserID)
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="uban"}) 
end 
return false
end


if MsgText[1] == "كتم" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك كتم البوت  ؛") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك كتم المطور الاساسي ؛") 
elseif UserID == 656329268 or UserID == 1765160742 or UserID == 1714422669 then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك كتم مطور السورس ؛") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك كتم المطور ؛") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك كتم المنشئ ؛") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك كتم المنشئ الاساسي ؛") 
elseif redis:sismember(boss..':Malk_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك كتم المالك ؛") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك كتم المدير ؛") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك كتم الادمن ؛") 
elseif  redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك كتم المميز  ؛") 
end
GetUserID(UserID,function(arg,data)
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
USERNAME = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..'is_silent_users:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم بالتاكيد كتمه  من المجموعه") 
else
redis:hset(boss..'username:'..arg.UserID,'username',USERNAME)
redis:sadd(boss..'is_silent_users:'..arg.ChatID,arg.UserID)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم كتمه  من المجموعه") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})


elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
local UserID = data.id_
UserName = arg.UserName
NameUser = Hyper_Link_Name(data)
if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك كتم البوت  ؛") 
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك كتم المطور الاساسي ؛") 
elseif UserID == 185965697 then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك كتم مطور السورس ؛") 
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك كتم المطور ؛") 
elseif redis:sismember(boss..':MONSHA_BOT:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك كتم المنشئ ؛") 
elseif redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك كتم المنشئ الاساسي ؛") 
elseif redis:sismember(boss..':Malk_Group:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك كتم المالك ؛") 
elseif redis:sismember(boss..'owners:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك كتم المدير ؛") 
elseif redis:sismember(boss..'admins:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك كتم الادمن ؛") 
elseif  redis:sismember(boss..'whitelist:'..arg.ChatID,UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك كتم المميز  ؛") 
end
if redis:sismember(boss..'is_silent_users:'..arg.ChatID,UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم بالتاكيد كتمه  من المجموعه") 
else
redis:hset(boss..'username:'..UserID,'username',UserName)
redis:sadd(boss..'is_silent_users:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم كتمه  من المجموعه") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="ktm"}) 
end
return false
end


if MsgText[1] == "الغاء الكتم" or MsgText[1] == "الغاء كتم" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)

if not redis:sismember(boss..'is_silent_users:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم بالتاكيد الغاء كتمه  من المجموعه") 
else
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم الغاء كتمه  من المجموعه") 
redis:srem(boss..'is_silent_users:'..arg.ChatID,arg.UserID)
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
elseif MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
local UserID = data.id_
UserName = arg.UserName
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..'is_silent_users:'..arg.ChatID,UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم بالتاكيد الغاء كتمه  من المجموعه") 
else
redis:srem(boss..'is_silent_users:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم الغاء كتمه  من المجموعه") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
elseif MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unktm"}) 
end 
return false
end


--{ Commands For locks }

if MsgText[1] == "قفل الكل"		 then return lock_All(msg) end
if MsgText[1] == "قفل الوسائط" 	 then return lock_Media(msg) end
if MsgText[1] == "قفل الصور بالتقييد" 	 then return tqeed_photo(msg) end
if MsgText[1] == "قفل الفيديو بالتقييد"  then return tqeed_video(msg) end
if MsgText[1] == "قفل المتحركه بالتقييد" then return tqeed_gif(msg) end
if MsgText[1] == "قفل التوجيه بالتقييد"  then return tqeed_fwd(msg) end
if MsgText[1] == "قفل الروابط بالتقييد"  then return tqeed_link(msg) end
if MsgText[1] == "قفل الدردشه"    	     then return mute_text(msg) end
if MsgText[1] == "قفل المتحركه" 		 then return mute_gif(msg) end
if MsgText[1] == "قفل الصور" 			 then return mute_photo(msg) end
if MsgText[1] == "قفل الفيديو"			 then return mute_video(msg) end
if MsgText[1] == "قفل البصمات" 		then return mute_voice(msg) 	end
if MsgText[1] == "قفل الصوت" 		then return mute_audio(msg) 	end
if MsgText[1] == "قفل الملصقات" 	then return mute_sticker(msg) end
if MsgText[1] == "قفل الجهات" 		then return mute_contact(msg) end
if MsgText[1] == "قفل التوجيه" 		then return mute_forward(msg) end
if MsgText[1] == "قفل الموقع"	 	then return mute_location(msg) end
if MsgText[1] == "قفل الملفات" 		then return mute_document(msg) end
if MsgText[1] == "قفل الاشعارات" 	then return mute_tgservice(msg) end
if MsgText[1] == "قفل الانلاين" 		then return mute_inline(msg) end
if MsgText[1] == "قفل الالعاب" 		then return mute_game(msg) end
if MsgText[1] == "قفل الكيبورد" 	then return mute_keyboard(msg) end
if MsgText[1] == "قفل الروابط" 		then return lock_link(msg) end
if MsgText[1] == "قفل التاك" 		then return lock_tag(msg) end
if MsgText[1] == "قفل المعرفات" 	then return lock_username(msg) end
if MsgText[1] == "قفل التعديل" 		then return lock_edit(msg) end
if MsgText[1] == "قفل الكلايش" 		then return lock_spam(msg) end
if MsgText[1] == "قفل التكرار" 		then return lock_flood(msg) end
if MsgText[1] == "قفل البوتات" 		then return lock_bots(msg) end
if MsgText[1] == "قفل البوتات بالطرد" 	then return lock_bots_by_kick(msg) end
if MsgText[1] == "قفل الماركدوان" 	then return lock_markdown(msg) end
if MsgText[1] == "قفل الويب" 		then return lock_webpage(msg) end 
if MsgText[1] == "قفل التثبيت" 		then return lock_pin(msg) end 
if MsgText[1] == "قفل الاضافه" 		then return lock_Add(msg) end 
if MsgText[1] == "قفل الانكليزيه" 		then return lock_lang(msg) end 
if MsgText[1] == "قفل الفارسيه" 		then return lock_pharsi(msg) end 
if MsgText[1] == "قفل الفشار" 		then return lock_mmno3(msg) end 


--{ Commands For Unlocks }
if MsgText[1] == "فتح الكل" then return Unlock_All(msg) end
if MsgText[1] == "فتح الوسائط" then return Unlock_Media(msg) end
if MsgText[1] == "فتح الصور بالتقييد" 		then return fktqeed_photo(msg) 	end
if MsgText[1] == "فتح الفيديو بالتقييد" 	then return fktqeed_video(msg) 	end
if MsgText[1] == "فتح المتحركه بالتقييد" 	then return fktqeed_gif(msg) 	end
if MsgText[1] == "فتح التوجيه بالتقييد" 	then return fktqeed_fwd(msg) 	end
if MsgText[1] == "فتح الروابط بالتقييد" 	then return fktqeed_link(msg) 	end
if MsgText[1] == "فتح المتحركه" 	then return unmute_gif(msg) 	end
if MsgText[1] == "فتح الدردشه" 		then return unmute_text(msg) 	end
if MsgText[1] == "فتح الصور" 		then return unmute_photo(msg) 	end
if MsgText[1] == "فتح الفيديو" 		then return unmute_video(msg) 	end
if MsgText[1] == "فتح البصمات" 		then return unmute_voice(msg) 	end
if MsgText[1] == "فتح الصوت" 		then return unmute_audio(msg) 	end
if MsgText[1] == "فتح الملصقات" 	then return unmute_sticker(msg) end
if MsgText[1] == "فتح الجهات" 		then return unmute_contact(msg) end
if MsgText[1] == "فتح التوجيه" 		then return unmute_forward(msg) end
if MsgText[1] == "فتح الموقع" 		then return unmute_location(msg) end
if MsgText[1] == "فتح الملفات" 		then return unmute_document(msg) end
if MsgText[1] == "فتح الاشعارات" 	then return unmute_tgservice(msg) end
if MsgText[1] == "فتح الانلاين" 		then return unmute_inline(msg) 	end
if MsgText[1] == "فتح الالعاب" 		then return unmute_game(msg) 	end
if MsgText[1] == "فتح الكيبورد" 	then return unmute_keyboard(msg) end
if MsgText[1] == "فتح الروابط" 		then return unlock_link(msg) 	end
if MsgText[1] == "فتح التاك" 		then return unlock_tag(msg) 	end
if MsgText[1] == "فتح المعرفات" 	then return unlock_username(msg) end
if MsgText[1] == "فتح التعديل" 		then return unlock_edit(msg) 	end
if MsgText[1] == "فتح الكلايش" 		then return unlock_spam(msg) 	end
if MsgText[1] == "فتح التكرار" 		then return unlock_flood(msg) 	end
if MsgText[1] == "فتح البوتات" 		then return unlock_bots(msg) 	end
if MsgText[1] == "فتح البوتات بالطرد" 	then return unlock_bots_by_kick(msg) end
if MsgText[1] == "فتح الماركدوان" 	then return unlock_markdown(msg) end
if MsgText[1] == "فتح الويب" 		then return unlock_webpage(msg) 	end
if MsgText[1] == "فتح التثبيت" 		then return unlock_pin(msg) end 
if MsgText[1] == "فتح الاضافه" 		then return unlock_Add(msg) end 
if MsgText[1] == "فتح الانكليزيه" 		then return unlock_lang(msg) end 
if MsgText[1] == "فتح الفارسيه" 		then  return unlock_pharsi(msg) end 
if MsgText[1] == "فتح الفشار" 		then return unlock_mmno3(msg) end 


if MsgText[1] == "ضع رابط" then
if not msg.Creator  then return "- هذا الامر يخص {المطور,المنشئ الاساسي ,المنشئ} فقط  \n" end 
redis:setex(boss..'WiCmdLink'..msg.chat_id_..msg.sender_user_id_,500,true)
return '- حسننا عزيزي\n- الان ارسل  رابط مجموعتك ؛'
end

if MsgText[1] == 'البايو' and msg.Admin then
  if msg.reply_id then 
    function get(mr,EIKOei)
      if not EIKOei.sender_user_id_ then
        return false
      end
      local infouser = https.request("https://api.telegram.org/bot"..Token.."/getChat?chat_id="..EIKOei.sender_user_id_)
      local info_ = JSON.decode(infouser)
      if info_.result.bio then
        biouser = info_.result.bio
      else
        biouser = 'لا يوجد '
      end
      sendMsg(msg.chat_id_,msg.id_,biouser)
    end
    GetMsgInfo(msg.chat_id_,msg.reply_id,get,nil)
  else
    local infouser = https.request("https://api.telegram.org/bot"..Token.."/getChat?chat_id="..msg.sender_user_id_)
    local info_ = JSON.decode(infouser)
    if info_.result.bio then
      biouser = info_.result.bio
    else
      biouser = 'لا يوجد '
    end
    sendMsg(msg.chat_id_,msg.id_,biouser)
  end
end
if MsgText[1] == "انشاء رابط" then
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ الاساسي ,المنشئ} فقط  \n" end
if not redis:get(boss..'ExCmdLink'..msg.chat_id_) then
local LinkGp = ExportLink(msg.chat_id_)
if LinkGp then
LinkGp = LinkGp.result
redis:set(boss..'linkGroup'..msg.chat_id_,LinkGp)
redis:setex(boss..'ExCmdLink'..msg.chat_id_,120,true)
return sendMsg(msg.chat_id_,msg.id_,"- تم انشاء رابط جديد \n- ["..LinkGp.."]\n- لعرض الرابط ارسل { الرابط } \n")
else
return sendMsg(msg.chat_id_,msg.id_,"- لا يمكنني انشاء رابط للمجموعه \n- لانني لست مشرف في المجموعه ")
end
else
return sendMsg(msg.chat_id_,msg.id_,"- لقد قمت بانشاء الرابط سابقا .\n- يرجى الانتظار  { 4 دقيقة } \n  - لكي تستطيع انشاء رابط جديد")
end
return false
end 

if MsgText[1] == "الرابط" then
if not redis:get(boss.."lock_linkk"..msg.chat_id_) then return "- الامر معطل من قبل الادارة ^"  end
if not redis:get(boss..'linkGroup'..msg.chat_id_) then return "- لا يوجد رابط \n- لانشاء رابط ارسل { انشاء رابط } ؛" end
local GroupName = redis:get(boss..'group:name'..msg.chat_id_)
local GroupLink = redis:get(boss..'linkGroup'..msg.chat_id_)
return "- رابـط الـمـجـمـوعه ؛\n\n["..GroupLink.."]\n"
end

if MsgText[1] == "ضع القوانين" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
redis:setex(boss..'rulse:witting'..msg.chat_id_..msg.sender_user_id_,300,true)
return '- حسننا عزيزي\n- الان ارسل القوانين  للمجموعه ؛'
end

if MsgText[1] == "القوانين" then
if not redis:get(boss..'rulse:msg'..msg.chat_id_) then 
return [[
- مرحبا عزيري القوانين كلاتي ؛
- ممنوع نشر الروابط 
- ممنوع التكلم او نشر صور اباحيه 
- ممنوع  اعاده توجيه
- ممنوع التكلم بلطائفه 
- الرجاء احترام المدراء والادمنيه
]]
else 
return "- القوانين :\n"..redis:get(boss..'rulse:msg'..msg.chat_id_) 
end 
end

if MsgText[1] == "ضع تكرار" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
local NumLoop = tonumber(MsgText[2])
if NumLoop < 1 or NumLoop > 50 then 
return "- حدود التكرار ,  يجب ان تكون ما بين  [2-50]" 
end
redis:set(boss..'num_msg_max'..msg.chat_id_,MsgText[2]) 
return "- تم وضع التكرار » { *"..MsgText[2].."* }"
end

if MsgText[1] == "ضع وقت التنظيف" then
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local NumLoop = tonumber(MsgText[2])
redis:set(boss..':Timer_Cleaner:'..msg.chat_id_,NumLoop) 
return "- تم وضع وقت التنظيف »  { *"..MsgText[2].."* } ساعه"
end



if MsgText[1] == "مسح المالكين" then 
if not msg.SudoUser then return "- هذا الامر يخص {المطور} فقط  \n" end

local Admins = redis:scard(boss..':Malk_Group:'..msg.chat_id_)
if Admins == 0 then  
return "هناك خطا \n- عذرا لا يوجد المالكين ليتم مسحهم " 
end
redis:del(boss..':Malk_Group:'..msg.chat_id_)
return "- بواسطه ⋙ "..msg.TheRankCmd.."   \n- تم مسح {"..Admins.."} من المالكين في البوت "
end
--=======================================================
--=======================================================
--=======================================================
if MsgText[1] == "مسح المنشئيين الاساسيين" or MsgText[1] == "مسح المنشئين الاساسيين" or MsgText[1] == "مسح المنشئيين الاساسين" or MsgText[1] == "مسح المنشئين الاساسين" then 
if not msg.SuperCreator then return "- هذا الامر يخص {المطور  »المنشئ الاساسي » لمالك} فقط  \n" end

local Admins = redis:scard(boss..':MONSHA_Group:'..msg.chat_id_)
if Admins == 0 then  
return "هناك خطا \n- عذرا لا يوجد منشئيين اساسييين ليتم مسحهم " 
end
redis:del(boss..':MONSHA_Group:'..msg.chat_id_)
return "- بواسطه ⋙ "..msg.TheRankCmd.."   \n- تم مسح {"..Admins.."} من المنشئيين في البوت "
end

if MsgText[1] == "مسح الرسائل المجدوله" or MsgText[1] == "مسح الميديا" or MsgText[1] == "مسح الوسائط" then 
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  \n" end
local mmezz = redis:smembers(boss..":IdsMsgsCleaner:"..msg.chat_id_)
if #mmezz == 0 then return "-  لا يوجد وسائط مجدوله للحذف او \n امر التنظيف تم تعطيله من قبل المنشئ الاساسي " end
for k,v in pairs(mmezz) do
Del_msg(msg.chat_id_,v)
end
return "- تم مسح جميع الوسائط المجدوله" 
end

if MsgText[1] == "مسح التعديلات"  or MsgText[1] == "مسح سحكاتي" or MsgText[1] == "مسح تعديلاتي" then    
redis:del(boss..':edited:'..msg.chat_id_..':'..msg.sender_user_id_)
return "- تم مسح جميع سحكاتك" 
end

if MsgText[1] == "مسح الادمنيه" then 
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end

local Admins = redis:scard(boss..'admins:'..msg.chat_id_)
if Admins == 0 then  
return "هناك خطا \n- عذرا لا يوجد ادمنيه ليتم مسحهم " 
end
redis:del(boss..'admins:'..msg.chat_id_)
return "- بواسطه ⋙ "..msg.TheRankCmd.."   \n- تم مسح {"..Admins.."} من الادمنيه في البوت "
end


if MsgText[1] == "مسح قائمه المنع" then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local Mn3Word = redis:scard(boss..':Filter_Word:'..msg.chat_id_)
if Mn3Word == 0 then 
return "- عذرا لا توجد كلمات ممنوعه ليتم حذفها " 
end
redis:del(boss..':Filter_Word:'..msg.chat_id_)
return "- بواسطه ⋙ "..msg.TheRankCmd.."   \n- تم مسح {*"..Mn3Word.."*} كلمات من المنع "
end


if MsgText[1] == "مسح القوانين" then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not redis:get(boss..'rulse:msg'..msg.chat_id_) then 
return "- عذرا لا يوجد قوانين ليتم مسحه \n!" 
end
redis:del(boss..'rulse:msg'..msg.chat_id_)
return "- بواسطه ⋙ "..msg.TheRankCmd.."   \n- تم حذف القوانين بنجاح "
end


if MsgText[1] == "مسح الترحيب"  then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not redis:get(boss..'welcome:msg'..msg.chat_id_) then 
return "هناك خطا \n- عذرا لا يوجد ترحيب ليتم مسحه " 
end
redis:del(boss..'welcome:msg'..msg.chat_id_)
return "- بواسطه ⋙ "..msg.TheRankCmd.."   \n- تم حذف الترحيب بنجاح "
end


if MsgText[1] == "مسح المنشئيين" or MsgText[1] == "مسح المنشئين" then
if not msg.SuperCreator    then return "- هذا الامر يخص {المطور,منشئ الاساسي} فقط  \n" end
local NumMnsha = redis:scard(boss..':MONSHA_BOT:'..msg.chat_id_)
if NumMnsha ==0 then 
return "- عذرا لا يوجد منشئيين ليتم مسحهم \n!" 
end
redis:del(boss..':MONSHA_BOT:'..msg.chat_id_)
return "- بواسطه ⋙ "..msg.TheRankCmd.."   \n-  تم مسح {* "..NumMnsha.." *} من المنشئيين "
end


if MsgText[1] == "مسح المدراء" then
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  \n" end
local NumMDER = redis:scard(boss..'owners:'..msg.chat_id_)
if NumMDER ==0 then 
return "- عذرا لا يوجد مدراء ليتم مسحهم \n!" 
end
redis:del(boss..'owners:'..msg.chat_id_)
return "- بواسطه ⋙ "..msg.TheRankCmd.."   \n-  تم مسح {* "..NumMDER.." *} من المدراء  "
end

if MsgText[1] == 'مسح المحظورين' then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end

local list = redis:smembers(boss..'banned:'..msg.chat_id_)
if #list == 0 then return "-  لا يوجد مستخدمين محظورين " end
message = ' قائمه الاعضاء المحظورين :\n'
for k,v in pairs(list) do
StatusLeft(msg.chat_id_,v)
end 
redis:del(boss..'banned:'..msg.chat_id_)
return "- بواسطه ⋙ "..msg.TheRankCmd.."   \n-  تم مسح {* "..#list.." *} من المحظورين "
end

if MsgText[1] == 'مسح المكتومين' then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local MKTOMEN = redis:scard(boss..'is_silent_users:'..msg.chat_id_)
if MKTOMEN ==0 then 
return "-  لا يوجد مستخدمين مكتومين في المجموعه " 
end
redis:del(boss..'is_silent_users:'..msg.chat_id_)
return "- بواسطه ⋙ "..msg.TheRankCmd.."   \n-  تم مسح {* "..MKTOMEN.." *} من المكتومين "
end

if MsgText[1] == 'مسح المميزين' then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local MMEZEN = redis:scard(boss..'whitelist:'..msg.chat_id_)
if MMEZEN ==0 then 
return "-  لا يوجد مستخدمين مميزين في المجموعه " 
end
redis:del(boss..'whitelist:'..msg.chat_id_)
return "- بواسطه ⋙ "..msg.TheRankCmd.."   \n-  تم مسح {* "..MMEZEN.." *} من المميزين  "
end

if MsgText[1] == 'مسح الرابط' then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if not redis:get(boss..'linkGroup'..mbsg.chat_id_) then 
return "-  لا يوجد رابط مضاف اصلا " 
end
redis:del(boss..'linkGroup'..msg.chat_id_)
return "- بواسطه ⋙ "..msg.TheRankCmd.."   \n- تم مسح رابط المجموعه"
end


if MsgText[1] == "مسح" then
if not MsgText[2] and msg.reply_id then 
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
Del_msg(msg.chat_id_, msg.reply_id) 
Del_msg(msg.chat_id_, msg.id_) 
return false
end

if MsgText[2] and MsgText[2]:match('^%d+$') then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if 100 < tonumber(MsgText[2]) then return "- * حدود المسح ,  يجب ان تكون ما بين  *[2-100]" end
local DelMsg = MsgText[2] + 1
GetHistory(msg.chat_id_,DelMsg,function(arg,data)
All_Msgs = {}
for k, v in pairs(data.messages_) do
if k ~= 0 then
if k == 1 then
All_Msgs[0] = v.id_
else
table.insert(All_Msgs,v.id_)
end  
end 
end 
if tonumber(DelMsg) == data.total_count_ then
tdcli_function({ID="DeleteMessages",chat_id_ = msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"-  تـم مسح ~⪼ { *"..MsgText[2].."* } من الرسائل  ")
end,nil)
else
tdcli_function({ID="DeleteMessages",chat_id_=msg.chat_id_,message_ids_=All_Msgs},function() 
sendMsg(msg.chat_id_,msg.id_,"-  تـم مسح ~⪼ { *"..MsgText[2].."* } من الرسائل  ")
end,nil)
end
end)
return false
end
end 

--End del 

if MsgText[1] == "ضع اسم" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
redis:setex(boss..'name:witting'..msg.chat_id_..msg.sender_user_id_,300,true)
return "- حسننا عزيزي\n-  الان ارسل الاسم  للمجموعه "
end

if MsgText[1] == "حذف صوره" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
tdcli_function({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = {ID = "InputFileId", id_ = 0}},function(arg,data)
if data.message_ and data.message_ == "CHAT_NOT_MODIFIED" then
sendMsg(arg.ChatID,arg.MsgID,'-  عذرا , لا توجد صوره في المجموعة')
elseif data.message_ and data.message_ == "CHAT_ADMIN_REQUIRED" then
sendMsg(arg.ChatID,arg.MsgID,'-  عذرا , البوت ليس لدية صلاحيه التعديل في المجموعة ')
else
sendMsg(arg.ChatID,arg.MsgID,'-  تم حذف صوره المجموعه ')
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
return false
end

if MsgText[1] == "ضع صوره" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessagePhoto' then
if data.content_.photo_.sizes_[3] then 
photo_id = data.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = data.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({
ID="ChangeChatPhoto",
chat_id_=arg.ChatID,
photo_ = GetInputFile(photo_id)},
function(arg,data)
if data.code_ and data.code_ == 3 then
return sendMsg(arg.ChatID,arg.MsgID,'-  ليس لدي صلاحيه تغيير الصوره \n- يجب اعطائي صلاحيه `تغيير معلومات المجموعه ` ')
end
end,{ChatID=arg.ChatID,MsgID=arg.MsgID})
end
end,{ChatID=msg.chat_id_,MsgID=msg.reply_id})
return false
else 
redis:setex(boss..'photo:group'..msg.chat_id_..msg.sender_user_id_,300,true)
return '-  حسننا عزيزي \n-  الان قم بارسال الصوره' 
end 
end

if MsgText[1] == "ضع وصف" then 
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
redis:setex(boss..'about:witting'..msg.chat_id_..msg.sender_user_id_,300,true) 
return "- حسننا عزيزي\n-  الان ارسل الوصف  للمجموعه" 
end

if MsgText[1] == "الادارين" or MsgText[1] == "الاداريين"   or MsgText[1] == "المشرفين"  or MsgText[1] == "الاداريين" or MsgText[1] == "الادارين" then   
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
redis:setex(boss..'chat:tagall'..msg.chat_id_,300,true)
return TagAll(msg) 
end


if MsgText[1] == "تاك للكل" then
if not msg.Admin then return "هذا الامر يخص {الادمن,المدير,المنشئ} فقط \n" end
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub('-100','')},function(argg,dataa) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''), offset_ = 0,limit_ = dataa.member_count_},function(ta,datate)
x = 0
tags = 0
local list = datate.members_ 
for k, v in pairs(list) do
tdcli_function({ID="GetUser",user_id_ = v.user_id_},function(arg,data)
if x == 5 or x == tags or k == 0 then
tags = x + 5
t = "[#all](https://t.me/jjxxh)"
end
x = x + 1
tagname = data.first_name_
tagname = tagname:gsub("]","")
tagname = tagname:gsub("[[]","")
t = t..", ["..tagname.."](tg://user?id="..v.user_id_..")"
if x == 5 or x == tags or k == 0 then
local Text = t:gsub(',','\n')
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown")
end
end,nil)
end
end,nil)
end,nil)
end


if MsgText[1] == "منع" then 
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if MsgText[2] then
return AddFilter(msg, MsgText[2]) 
elseif msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == "MessageText" then
Type_id = data.content_.text_
elseif data.content_.ID == 'MessagePhoto' then
if data.content_.photo_.sizes_[3] then Type_id = data.content_.photo_.sizes_[3].photo_.persistent_id_ else Type_id = data.content_.photo_.sizes_[0].photo_.persistent_id_ end
elseif data.content_.ID == "MessageSticker" then
Type_id = data.content_.sticker_.sticker_.persistent_id_
elseif data.content_.ID == "MessageVoice" then
Type_id = data.content_.voice_.voice_.persistent_id_
elseif data.content_.ID == "MessageAnimation" then
Type_id = data.content_.animation_.animation_.persistent_id_
elseif data.content_.ID == "MessageVideo" then
Type_id = data.content_.video_.video_.persistent_id_
elseif data.content_.ID == "MessageAudio" then
Type_id = data.content_.audio_.audio_.persistent_id_
elseif data.content_.ID == "MessageUnsupported" then
return sendMsg(arg.ChatID,arg.MsgID,"-  عذرا الرساله غير مدعومه ️")
else
Type_id = 0
end

if redis:sismember(boss..':Filter_Word:'..arg.ChatID,Type_id) then 
return sendMsg(arg.ChatID,arg.MsgID,"-  هي بالتاكيد في قائمه المنع️")
else
redis:sadd(boss..':Filter_Word:'..arg.ChatID,Type_id) 
return sendMsg(arg.ChatID,arg.MsgID,"-  تمت اضافتها الى قائمه المنع ️")
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end
return false 
end

if MsgText[1] == "الغاء منع" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if MsgText[2] then
return RemFilter(msg,MsgText[2]) 
elseif msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if msg.content_.ID == "MessageText" then
Type_id = data.content_.text_
elseif data.content_.ID == 'MessagePhoto' then
if data.content_.photo_.sizes_[3] then Type_id = data.content_.photo_.sizes_[3].photo_.persistent_id_ else Type_id = data.content_.photo_.sizes_[0].photo_.persistent_id_ end
elseif data.content_.ID == "MessageSticker" then
Type_id = data.content_.sticker_.sticker_.persistent_id_
elseif data.content_.ID == "MessageVoice" then
Type_id = data.content_.voice_.voice_.persistent_id_
elseif data.content_.ID == "MessageAnimation" then
Type_id = data.content_.animation_.animation_.persistent_id_
elseif data.content_.ID == "MessageVideo" then
Type_id = data.content_.video_.video_.persistent_id_
elseif data.content_.ID == "MessageAudio" then
Type_id = data.content_.audio_.audio_.persistent_id_
end
if redis:sismember(boss..':Filter_Word:'..arg.ChatID,Type_id) then 
redis:srem(boss..':Filter_Word:'..arg.ChatID,Type_id) 
return sendMsg(arg.ChatID,arg.MsgID,"-  تم السماح بها ️")
else
return sendMsg(arg.ChatID,arg.MsgID,"-  هي بالتاكيد مسموح بها ️")
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end
return false 
end

if MsgText[1] == "قائمه المنع" then 
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return FilterXList(msg) 
end

if MsgText[1] == "الحمايه" then 
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return settingsall(msg) 
end

if MsgText[1] == "الاعدادات" then 
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return settings(msg) 
end

if MsgText[1] == "الوسائط" then 
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return media(msg) 
end

if MsgText[1] == "الادمنيه" then 
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return GetListAdmin(msg) 
end

if MsgText[1] == "المدراء" then 
if not msg.Director  then return "- هذا الامر يخص {المدير,المنشئ,المطور} فقط  \n" end
return ownerlist(msg) 
end

if MsgText[1] == "المالكين" then 
if not msg.Creator  then return "- هذا الامر يخص {المطور ,المنشئ الاساسي ,المنشئ } فقط  \n" end
return Malklist(msg)
end
if MsgText[1] == "المنشئيين"  or MsgText[1] == "المنشئين" then 
if not msg.Creator  then return "- هذا الامر يخص {المطور ,المنشئ الاساسي ,المنشئ } فقط  \n" end
return conslist(msg)
end

if MsgText[1] == "المميزين" then 
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return whitelist(msg) 
end

if MsgText[1] == "قائمه القرده" then 
return basel(msg) 
end
if MsgText[1] == "قائمه القلوب" then 
return basel1(msg) 
end
if MsgText[1] == "قائمه الوتك" then 
return basel2(msg) 
end
if MsgText[1] == "قائمه زوجاتي" then 
return basel3(msg) 
end
if MsgText[1] == "قائمه ازواجي" then 
return basel4(msg) 
end

if MsgText[1] == "طرد البوتات" then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ} فقط  \n" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),filter_={ID="ChannelMembersBots"},offset_=0,limit_=50},
function(arg,data)
local Total = data.total_count_ or 0
if Total == 1 then
return sendMsg(arg.ChatID,arg.MsgID,"-  لا يـوجـد بـوتـات في الـمـجـمـوعـه .") 
else
local NumBot = 0
local NumBotAdmin = 0
for k, v in pairs(data.members_) do
if v.user_id_ ~= our_id then
kick_user(v.user_id_,arg.ChatID,function(arg,data)
if data.ID == "Ok" then
NumBot = NumBot + 1
else
NumBotAdmin = NumBotAdmin + 1
end
local TotalBots = NumBot + NumBotAdmin  
if TotalBots  == Total - 1 then
local TextR  = "-  عـدد الـبـوتات  {* "..(Total - 1).." *} \n\n"
if NumBot == 0 then 
TextR = TextR.."-  لا يـمـكـن طردهم لانـهـم مشـرفـين .\n"
else
if NumBotAdmin >= 1 then
TextR = TextR.."-  لم يتم طـرد {* "..NumBotAdmin.." *} بوت لانهم مـشـرفين."
else
TextR = TextR.."-  تم طـرد كــل البوتات بنجاح .\n"
end
end
return sendMsg(arg.ChatID,arg.MsgID,TextR) 
end
end,{ChatID=arg.ChatID,MsgID=arg.MsgID})
end
end
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
return false
end

if MsgText[1] == "كشف البوتات" then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100',''),
filter_ ={ID= "ChannelMembersBots"},offset_ = 0,limit_ = 50},function(arg,data)
local total = data.total_count_ or 0
AllBots = '- قـائمه البوتات الـحالية\n\n'
local NumBot = 0
for k, v in pairs(data.members_) do
GetUserID(v.user_id_,function(arg,data)
if v.status_.ID == "ChatMemberStatusEditor" then
BotAdmin = "» *★*"
else
BotAdmin = ""
end
NumBot = NumBot + 1
AllBots = AllBots..NumBot..'- @['..data.username_..'] '..BotAdmin..'\n'
if NumBot == total then
AllBots = AllBots..[[

- لـديـک {]]..total..[[} بـوتـات
- ملاحظة : الـ ★ تعنـي ان البوت مشرف في المجموعـة.]]
sendMsg(arg.ChatID,arg.MsgID,AllBots) 
end
end,{ChatID=arg.ChatID,MsgID=arg.MsgID})
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
return false
end

if MsgText[1] == 'طرد المحذوفين' then
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  \n" end
sendMsg(msg.chat_id_,msg.id_,'- جاري البحث عـن الـحـسـابـات المـحذوفـة ...')
tdcli_function({ID="GetChannelMembers",channel_id_ = msg.chat_id_:gsub('-100','')
,offset_ = 0,limit_ = 200},function(arg,data)
if data.total_count_ and data.total_count_ <= 200 then
Total = data.total_count_ or 0
else
Total = 200
end
local NumMem = 0
local NumMemDone = 0
for k, v in pairs(data.members_) do 
GetUserID(v.user_id_,function(arg,datax)
if datax.type_.ID == "UserTypeDeleted" then 
NumMemDone = NumMemDone + 1
kick_user(v.user_id_,arg.ChatID,function(arg,data)  
redis:srem(boss..':MONSHA_BOT:'..arg.ChatID,v.user_id_)
redis:srem(boss..'whitelist:'..arg.ChatID,v.user_id_)
redis:srem(boss..'owners:'..arg.ChatID,v.user_id_)
redis:srem(boss..'admins:'..arg.ChatID,v.user_id_)
end)
end
NumMem = NumMem + 1
if NumMem == Total then
if NumMemDone >= 1 then
sendMsg(arg.ChatID,arg.MsgID,"- تم طـرد {* "..NumMemDone.." *} من الحسـابات المـحذوفه‏‏ ")
else
sendMsg(arg.ChatID,arg.MsgID,'- لا يوجد حسابات محذوفه في المجموعه ')
end
end
end,{ChatID=arg.ChatID,MsgID=arg.MsgID})
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
return false
end  

if MsgText[1] == 'شحن' and MsgText[2] then
if not msg.SudoUser then return "- هذا الامر يخص {المطور} فقط  \n" end
if tonumber(MsgText[2]) > 0 and tonumber(MsgText[2]) < 1001 then
local extime = (tonumber(MsgText[2]) * 86400)
redis:setex(boss..'ExpireDate:'..msg.chat_id_, extime, true)
if not redis:get(boss..'CheckExpire::'..msg.chat_id_) then 
redis:set(boss..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'- تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... ')
sendMsg(SUDO_ID,0,'- تم شحن الاشتراك الى `'..MsgText[2]..'` يوم   ... \n- في مجموعه  » »  '..redis:get(boss..'group:name'..msg.chat_id_))
else
sendMsg(msg.chat_id_,msg.id_,'- عزيزي المطور \n- شحن الاشتراك يكون ما بين يوم الى 1000 يوم فقط ')
end 
return false
end

if MsgText[1] == 'الاشتراك' and MsgText[2] then 
if not msg.SudoUser then return "- هذا الامر يخص {المطور} فقط  \n" end
if MsgText[2] == '1' then
redis:setex(boss..'ExpireDate:'..msg.chat_id_, 2592000, true)
if not redis:get(boss..'CheckExpire::'..msg.chat_id_) then 
redis:set(boss..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'- تم تفعيل الاشتراك   \n-  الاشتراك » `30 يوم`  *(شهر)*')
sendMsg(SUDO_ID,0,'- تم تفعيل الاشتراك  \n-  الاشتراك » `30 يوم`  *(شهر)*')
end
if MsgText[2] == '2' then
redis:setex(boss..'ExpireDate:'..msg.chat_id_,7776000,true)
if not redis:get(boss..'CheckExpire::'..msg.chat_id_) then 
redis:set(boss..'CheckExpire::'..msg.chat_id_,true) 
end
sendMsg(msg.chat_id_,msg.id_,'- تم تفعيل الاشتراك   \n-  الاشتراك » `90 يوم`  *(3 اشهر)*')
sendMsg(SUDO_ID,0,'- تم تفعيل الاشتراك   \n-  الاشتراك » `90 يوم`  *(3 اشهر)*')
end
if MsgText[2] == '3' then
redis:set(boss..'ExpireDate:'..msg.chat_id_,true)
if not redis:get(boss..'CheckExpire::'..msg.chat_id_) then 
redis:set(boss..'CheckExpire::'..msg.chat_id_,true) end
sendMsg(msg.chat_id_,msg.id_,'- تم تفعيل الاشتراك   \n-  الاشتراك » `مفتوح`  *(مدى الحياة)*')
sendMsg(SUDO_ID,0,'- تم تفعيل الاشتراك   \n-  الاشتراك » `مفتوح`  *(مدى الحياة)*')
end 
return false
end

if MsgText[1] == 'الاشتراك' and not MsgText[2] and msg.Admin then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
local check_time = redis:ttl(boss..'ExpireDate:'..msg.chat_id_)
if check_time < 0 then return '*مـفـتـوح * ' end
year = math.floor(check_time / 31536000)
byear = check_time % 31536000 
month = math.floor(byear / 2592000)
bmonth = byear % 2592000 
day = math.floor(bmonth / 86400)
bday = bmonth % 86400 
hours = math.floor( bday / 3600)
bhours = bday % 3600 
min = math.floor(bhours / 60)
sec = math.floor(bhours % 60)
if tonumber(check_time) > 1 and check_time < 60 then
remained_expire = '- `باقي من الاشتراك ` » » * \n -  '..sec..'* ثانيه'
elseif tonumber(check_time) > 60 and check_time < 3600 then
remained_expire = '- `باقي من الاشتراك ` » » '..min..' *دقيقه و * *'..sec..'* ثانيه'
elseif tonumber(check_time) > 3600 and tonumber(check_time) < 86400 then
remained_expire = '- `باقي من الاشتراك ` » » * \n -  '..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 86400 and tonumber(check_time) < 2592000 then
remained_expire = '- `باقي من الاشتراك ` » » * \n -  '..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 2592000 and tonumber(check_time) < 31536000 then
remained_expire = '- `باقي من الاشتراك ` » » * \n -  '..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه'
elseif tonumber(check_time) > 31536000 then
remained_expire = '- `باقي من الاشتراك ` » » * \n -  '..year..'* سنه و *'..month..'* شهر و *'..day..'* يوم و *'..hours..'* ساعه و *'..min..'* دقيقه و *'..sec..'* ثانيه' end
return remained_expire
end

if MsgText[1] == "الرتبه" and not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
GetChatMember(arg.ChatID,data.sender_user_id_,function(arg,data)
if data.status_ and data.status_.ID == "ChatMemberStatusEditor" then
SudoGroups = 'مشرف '
elseif data.status_ and data.status_.ID == "ChatMemberStatusCreator" then 
SudoGroups = "منشئ ."
else
SudoGroups = "عضو .!"
end

Getrtb = Getrtba(arg.UserID,arg.ChatID)
GetUserID(arg.UserID,function(arg,data)
USERNAME = ResolveUserName(data)
USERCAR  = utf8.len(USERNAME)
SendMention(arg.ChatID,arg.UserID,arg.MsgID,'- العضو » '..USERNAME..'\n- { رتـبـه الشخص } \n- في البوت » '..arg.Getrtb..' \n- في المجموعه » '..arg.SudoGroups..'\n',14,utf8.len(USERNAME)) 
end,{ChatID=arg.ChatID,UserID=arg.UserID,MsgID=arg.MsgID,Getrtb=Getrtb,SudoGroups=SudoGroups})
end,{ChatID=arg.ChatID,UserID=data.sender_user_id_,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
return false
end

if MsgText[1] == "كشف البوت" and not MsgText[2] then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
GetChatMember(msg.chat_id_,our_id,function(arg,data)
if data.status_.ID ~= "ChatMemberStatusMember" then 
sendMsg(arg.ChatID,arg.MsgID,'- جيد , الـبــوت ادمــن الان')
else 
sendMsg(arg.ChatID,arg.MsgID,'- كلا البوت ليس ادمن في المجموعة 📛')
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
return false 
end

if MsgText[1]== 'رسائلي' or MsgText[1] == 'رسايلي' or MsgText[1] == 'احصائياتي'  then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(boss..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(boss..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(boss..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(boss..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(boss..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(boss..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(boss..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(boss..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)

local Get_info =  "⠀\n⠀- •⊱ { الاحـصـائـيـات الـرسـائـل } ⊰•\n"
.."- الـرسـائـل •⊱ { `"..msgs.."` } ⊰•\n"
.."- الـجـهـات •⊱ { `"..NumGha.."` } ⊰•\n"
.."- الـصـور •⊱ { `"..photo.."` } ⊰•\n"
.."- الـمـتـحـركـه •⊱ { `"..animation.."` } ⊰•\n"
.."- الـمـلـصـقات •⊱ { `"..sticker.."` } ⊰•\n"
.."- الـبـصـمـات •⊱ { `"..voice.."` } ⊰•\n"
.."- الـصـوت •⊱ { `"..audio.."` } ⊰•\n"
.."- الـفـيـديـو •⊱ { `"..video.."` } ⊰•\n"
.."- الـتـعـديـل •⊱ { `"..edited.."` } ⊰•\n\n"
.."- تـفـاعـلـك  •⊱ "..Get_Ttl(msgs).." ⊰•\n"
.."ـ.——————————\n"
return sendMsg(arg.chat_id_,arg.id_,Get_info)    
end,{chat_id_=msg.chat_id_,id_=msg.id_})
return false
end

if MsgText[1]== 'جهاتي' then
return '-  عدد جهاتك المـضـافه‏‏ » 【'..(redis:get(boss..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)..'】 .'
end

if MsgText[1] == 'معلوماتي' or MsgText[1] == 'موقعي' then
GetUserID(msg.sender_user_id_,function(arg,data)
local msgs = (redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 0)
local NumGha = (redis:get(boss..':adduser:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local photo = (redis:get(boss..':photo:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local sticker = (redis:get(boss..':sticker:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local voice = (redis:get(boss..':voice:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local audio = (redis:get(boss..':audio:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local animation = (redis:get(boss..':animation:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local edited = (redis:get(boss..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local video = (redis:get(boss..':video:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
USERNAME = ""
Name = data.first_name_
if data.last_name_ then Name = data.first_name_ .." "..data.last_name_ end
if data.username_ then USERNAME = " المعرف •⊱ @["..data.username_.."] ⊰•\n" end 
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
if SUDO_USER:match('@[%a%d_]+') then 
SUDO_USERR = "- مـطـور البوت •⊱ ["..SUDO_USER.."] ⊰•\n"
else
SUDO_USERR = ""
end
local Get_info = "- اهـلا بـك عزيزي في معلوماتك \n"
.."-.——————————\n"
.."- الاســم •⊱{ "..FlterName(Name,25) .." }⊰•\n"
..USERNAME
.."- الايـدي •⊱ { `"..data.id_.."` } ⊰•\n"
.."- رتبتــك •⊱ "..arg.TheRank.." ⊰•\n"
.."- ــ •⊱ { `"..arg.chat_id_.."` } ⊰•\n"
.."-.——————————\n"
.." •⊱ { الاحـصـائـيـات الـرسـائـل } ⊰•\n"
.."- الـرسـائـل •⊱ { `"..msgs.."` } ⊰•\n"
.."- الـجـهـات •⊱ { `"..NumGha.."` } ⊰•\n"
.."- الـصـور •⊱ { `"..photo.."` } ⊰•\n"
.."- الـمـتـحـركـه •⊱ { `"..animation.."` } ⊰•\n"
.."- الـمـلـصـقات •⊱ { `"..sticker.."` } ⊰•\n"
.."- الـبـصـمـات •⊱ { `"..voice.."` } ⊰•\n"
.."- الـصـوت •⊱ { `"..audio.."` } ⊰•\n"
.."- الـفـيـديـو •⊱ { `"..video.."` } ⊰•\n"
.."- الـتـعـديـل •⊱ { `"..edited.."` } ⊰•\n\n"
.."- تـفـاعـلـك  •⊱ "..Get_Ttl(msgs).." ⊰•\n"
.."-.——————————\n"
..SUDO_USERR
sendMsg(arg.chat_id_,arg.id_,Get_info)    
end,{chat_id_=msg.chat_id_,id_=msg.id_,TheRank=msg.TheRank})
return false
end


if msg.Director then
if MsgText[1] == 'تفعيل ضافني' then 
redis:del(boss..":Added:Me:"..msg.chat_id_)  
sendMsg(msg.chat_id_,msg.id_,'✶تم تفعيل امر مين ضافني')
end
if MsgText[1] == 'تعطيل ضافني' then  
redis:set(boss..":Added:Me:"..msg.chat_id_,true)    
sendMsg(msg.chat_id_,msg.id_,'✶تم تعطيل امر مين ضافني')
end
end

if MsgText[1] == "تفعيل الردود العشوائيه" 	then return unlock_replayRn(msg) end
if MsgText[1] == "تفعيل الردود" 	then return unlock_replay(msg) end
if MsgText[1] == "تفعيل الايدي" 	then return unlock_ID(msg) end
if MsgText[1] == "تفعيل الترحيب" 	then return unlock_Welcome(msg) end
if MsgText[1] == "تفعيل التحذير" 	then return unlock_waring(msg) end 
if MsgText[1] == "تفعيل الايدي بالصوره" 	then return unlock_idphoto(msg) end 
if MsgText[1] == "تفعيل الحمايه" 	then return unlock_AntiEdit(msg) end 
if MsgText[1] == "تفعيل المغادره" 	then return unlock_leftgroup(msg) end 
if MsgText[1] == "تفعيل الحظر" 	then return unlock_KickBan(msg) end 
if MsgText[1] == "تفعيل الرابط" 	then return unlock_linkk(msg) end 
if MsgText[1] == "تفعيل تاك للكل" 	then return unlock_takkl(msg) end 
if MsgText[1] == "تفعيل التحقق" 		then return unlock_check(msg) end 
if MsgText[1] == "تفعيل التنظيف التلقائي" 		then return unlock_cleaner(msg) end 
if MsgText[1] == "تفعيل ردود السورس" 		then return unlock_rdodSource(msg) end 


if MsgText[1] == "تعطيل الردود العشوائيه" 	then return lock_replayRn(msg) end
if MsgText[1] == "تعطيل الردود" 	then return lock_replay(msg) end
if MsgText[1] == "تعطيل الايدي" 	then return lock_ID(msg) end
if MsgText[1] == "تعطيل الترحيب" 	then return lock_Welcome(msg) end
if MsgText[1] == "تعطيل التحذير" 	then return lock_waring(msg) end
if MsgText[1] == "تعطيل الايدي بالصوره" 	then return lock_idphoto(msg) end
if MsgText[1] == "تعطيل الحمايه" 	then return lock_AntiEdit(msg) end
if MsgText[1] == "تعطيل المغادره" 	then return lock_leftgroup(msg) end 
if MsgText[1] == "تعطيل الحظر" 	then return lock_KickBan(msg) end 
if MsgText[1] == "تعطيل الرابط" 	then return lock_linkk(msg) end 
if MsgText[1] == "تعطيل تاك للكل" 	then return lock_takkl(msg) end 
if MsgText[1] == "تعطيل التحقق" 		then return lock_check(msg) end 
if MsgText[1] == "تعطيل التنظيف التلقائي" 		then return lock_cleaner(msg) end 
if MsgText[1] == "تعطيل ردود السورس" 		then return lock_rdodSource(msg) end 


if MsgText[1] == "ضع الترحيب" then 
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
redis:set(boss..'welcom:witting'..msg.chat_id_..msg.sender_user_id_,true) 
return [[
- حسننا عزيزي
- ارسل كليشه الترحيب الان

- علما ان الاختصارات كالاتي : 

- {الاسم} : لوضع اسم المستخدم
- {الايدي} : لوضع ايدي المستخدم
- {المعرف} : لوضع معرف المستخدم 
- {الرتبه} : لوضع نوع رتبه المستخدم 
- {التفاعل} : لوضع تفاعل المستخدم 
- {الرسائل} : لاضهار عدد الرسائل 
- {النقاط} : لاضهار عدد النقاط 
- {التعديل} : لاضهار عدد السحكات 
- {البوت} : لاضهار اسم البوت
- {المطور} : لاضهار معرف المطور الاساسي
- {الردود} : لاضهار ردود عشوائيه .
➼
]]
end

if MsgText[1] == "الترحيب" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
if redis:get(boss..'welcome:msg'..msg.chat_id_)  then
return Flter_Markdown(redis:get(boss..'welcome:msg'..msg.chat_id_))
else 
return "- اهلا عزيزي "..msg.TheRankCmd.."  \n- نورت المجموعه " 
end 
end

if MsgText[1] == "المكتومين" then 
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return MuteUser_list(msg) 
end

if MsgText[1] == "المحظورين" then 
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
return GetListBanned(msg) 
end

if MsgText[1] == "رفع الادمنيه" then
if not msg.Creator then return "- هذا الامر يخص {المطور,المنشئ} فقط  \n" end
return set_admins(msg) 
end

end -- end of insert group 
if MsgText[1] == "تعطيل الاذاعه" 	then return lock_brod(msg) end
if MsgText[1] == "تفعيل تعيين الايدي"  	then return unlock_idediit(msg) end 
if MsgText[1] == "تعطيل تعيين الايدي"  	then return lock_idediit(msg) end 
if MsgText[1] == "تفعيل الاذاعه" then return unlock_brod(msg) end



if MsgText[1] == 'مسح المطورين'  then
if not msg.SudoBase then return "- هذا الامر يخص {المطور الاساسي} فقط  \n" end
local mtwren = redis:scard(boss..':SUDO_BOT:')
if mtwren == 0 then  return "- عذرا لا يوجد مطورين في البوت  " end
redis:del(boss..':SUDO_BOT:') 
return "- تم مسح {* "..mtwren.." *} من المطورين "
end

if MsgText[1] == 'مسح قائمه العام'  then
if not msg.SudoBase then return"- هذا الامر يخص {المطور الاساسي} فقط  \n" end
local addbannds = redis:scard(boss..'gban_users')
if addbannds ==0 then 
return "- قائمة الحظر فارغه ." 
end
redis:del(boss..'gban_users') 
return "- تـم مـسـح { *"..addbannds.." *} من قائمه العام " 
end 
--=============================================================
--=============================================================
if MsgText[1] == "رفع مالك" then
if not msg.SudoUser then return "- هذا الامر يخص {المطور} فقط  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
if UserID == our_id then 
return sendMsg(ChatID,MsgID,"- عذرا لا يمكنني رفع بوت ") 
end
GetUserID(UserID,function(arg,data)
ReUsername = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..':Malk_Group:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد رفعه مالك  في المجموعه") 
else
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم رفعه مالك  في المجموعه") 
redis:hset(boss..'username:'..arg.UserID,'username',ReUsername)
redis:sadd(boss..':Malk_Group:'..arg.ChatID,arg.UserID)
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end


if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..':Malk_Group:'..arg.ChatID,UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد رفعه مالك  في المجموعه") 
else
redis:hset(boss..'username:'..UserID,'username',arg.UserName)
redis:sadd(boss..':Malk_Group:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم رفعه مالك  في المجموعه") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
end 
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="UpMalk"})
end
return false
end

if MsgText[1] == "تنزيل مالك" then
if not msg.SudoUser then return "- هذا الامر يخص {المطور} فقط  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data):gsub([[\]],"")
NameUser = Hyper_Link_Name(data)

if not redis:sismember(boss..':Malk_Group:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد تنزيله مالك  في المجموعه") 
else
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله مالك  في المجموعه") 
redis:srem(boss..':Malk_Group:'..arg.ChatID,arg.UserID)
end  
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end

if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
local UserID = data.id_
UserName = Flter_Markdown(arg.UserName)
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..':Malk_Group:'..arg.ChatID,UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد تنزيله مالك  في المجموعه") 
else
redis:srem(boss..':Malk_Group:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله مالك  في المجموعه")
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
end 

if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="DwnMalk"}) 
end

return false
end

---=================================================================================
---=================================================================================

if MsgText[1] == "رفع منشئ اساسي" or MsgText[1] == "رفع منشى اساسي" then
if not msg.SuperCreator then return "- هذا الامر يخص {المطور,المالك} فقط  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
if UserID == our_id then 
return sendMsg(ChatID,MsgID,"- عذرا لا يمكنني رفع بوت ") 
end
GetUserID(UserID,function(arg,data)
ReUsername = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد رفعه منشئ اساسي  في المجموعه") 
else
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم رفعه منشئ اساسي  في المجموعه") 
redis:hset(boss..'username:'..arg.UserID,'username',ReUsername)
redis:sadd(boss..':MONSHA_Group:'..arg.ChatID,arg.UserID)
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end


if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد رفعه منشئ اساسي  في المجموعه") 
else
redis:hset(boss..'username:'..UserID,'username',arg.UserName)
redis:sadd(boss..':MONSHA_Group:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم رفعه منشئ اساسي  في المجموعه") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
end 
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="Upmonsh"}) 
end
return false
end

if MsgText[1] == "تنزيل منشئ اساسي" or MsgText[1] == "تنزيل منشى اساسي" then
if not msg.SuperCreator then return "- هذا الامر يخص {المطور,المالك} فقط  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data):gsub([[\]],"")
NameUser = Hyper_Link_Name(data)

if not redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد تنزيله منشئ اساسي  في المجموعه") 
else
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله منشئ اساسي  في المجموعه") 
redis:srem(boss..':MONSHA_Group:'..arg.ChatID,arg.UserID)
end  
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end


if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
local UserID = data.id_
UserName = Flter_Markdown(arg.UserName)
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..':MONSHA_Group:'..arg.ChatID,UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد تنزيله منشئ اساسي  في المجموعه") 
else
redis:srem(boss..':MONSHA_Group:'..arg.ChatID,UserID)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله منشئ اساسي  في المجموعه")
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
end 

if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="Dwmonsh"}) 
end

return false
end


if MsgText[1] == 'مسح كلايش التعليمات' then 
if not msg.SudoBase then return "- هذا الامر يخص {مطور اساسي} فقط  \n" end
redis:del(boss..":awamer_Klesha_m1:")
redis:del(boss..":awamer_Klesha_m2:")
redis:del(boss..":awamer_Klesha_m3:")
redis:del(boss..":awamer_Klesha_mtwr:")
redis:del(boss..":awamer_Klesha_mrd:")
redis:del(boss..":awamer_Klesha_mf:")
redis:del(boss..":awamer_Klesha_m:")

sendMsg(msg.chat_id_,msg.id_,"- تم مسح كلايش التعليمات  \n")
end

if MsgText[1] == 'مسح كليشه الايدي' or MsgText[1] == 'مسح الايدي' or MsgText[1] == 'مسح ايدي'  or MsgText[1] == 'مسح كليشة الايدي'  then 
if not msg.Creator then return "- هذا الامر يخص {منشئ اساسي,المنشئ,المطور} فقط  \n" end
redis:del(boss..":infoiduser_public:"..msg.chat_id_)
sendMsg(msg.chat_id_,msg.id_,"- تم مسح كليشة الايدي بنجاح \n")
end

if MsgText[1] == 'تعيين كليشه الايدي' or MsgText[1] == 'تعيين الايدي' or MsgText[1] == 'تعيين ايدي'  or MsgText[1] == 'تعيين كليشة الايدي'  then 
if not msg.Creator then return "- هذا الامر يخص {منشئ اساسي,المنشئ,المطور} فقط  \n" end
redis:setex(boss..":Witting_KleshaID_public"..msg.chat_id_..msg.sender_user_id_,1000,true)
return '- حسننا , الان ارسل كليشه الايدي الجديده \n علما ان الاختصارات كالاتي : \n \n{الاسم} : لوضع اسم المستخدم\n{الايدي} : لوضع ايدي المستخدم\n{المعرف} : لوضع معرف المستخدم \n{الرتبه} : لوضع نوع رتبه المستخدم \n{التفاعل} : لوضع تفاعل المستخدم \n{الرسائل} : لاضهار عدد الرسائل \n{النقاط} : لاضهار عدد النقاط \n{التعديل} : لاضهار عدد السحكات \n{البوت} : لاضهار اسم البوت\n{المطور} : لاضهار معرف المطور الاساسي\n قناه تعليمات ونشر كلايش الايدي \n{الردود} : لاضهار ردود عشوائيه .\n قناه الكلايش : [@Change_id] \n➼' 
end


if MsgText[1] == "تنزيل الكل" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(msg.chat_id_,msg.id_,"- عذرا هذا العضو ليس موجود ضمن المجموعات") end
local UserID = data.sender_user_id_
msg = arg.msg
msg.UserID = UserID
GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
msg = arg.msg
UserID = msg.UserID
if UserID == our_id then return sendMsg(msg.chat_id_,msg.id_,"- لا يمكنك تنفيذ الامر مع البوت\n") end
if UserID == 1859656976 then) end

if UserID == SUDO_ID then 
rinkuser = 1
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
rinkuser = 2
elseif redis:sismember(boss..':Malk_Group:'..msg.chat_id_,UserID) then 
rinkuser = 3
elseif redis:sismember(boss..':MONSHA_Group:'..msg.chat_id_,UserID) then 
rinkuser = 4
elseif redis:sismember(boss..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
rinkuser = 5
elseif redis:sismember(boss..'owners:'..msg.chat_id_,UserID) then 
rinkuser = 6
elseif redis:sismember(boss..'admins:'..msg.chat_id_,UserID) then 
rinkuser = 7
elseif redis:sismember(boss..'whitelist:'..msg.chat_id_,UserID) then 
rinkuser = 8
else
rinkuser = 9
end
local DonisDown = "\n- تم تنزيله من الرتب الاتيه : \n\n "
if redis:sismember(boss..':SUDO_BOT:',UserID) then 
DonisDown = DonisDown.."- تم تنزيله من المطور ️\n"
end 
if redis:sismember(boss..':MONSHA_Group:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."- تم تنزيله من المنشئ الاساسي ️\n"
end 
if redis:sismember(boss..':Malk_Group:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."- تم تنزيله من المالك ️\n"
end 
if redis:sismember(boss..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."- تم تنزيله من المنشئ ️\n"
end 
if redis:sismember(boss..'owners:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."- تم تنزيله من المدير ️\n"
end 
if redis:sismember(boss..'admins:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."- تم تنزيله من الادمن ️\n"
end 
if redis:sismember(boss..'whitelist:'..msg.chat_id_,UserID) then
DonisDown = DonisDown.."- تم تنزيله من العضو مميز ️\n"
end
function senddwon() sendMsg(msg.chat_id_,msg.id_,"- عذرا المستخدم رتبته اعلى منك لا يمكن تنزيله ") end
function sendpluse() sendMsg(msg.chat_id_,msg.id_,"- عذرا لا يمكن تنزيل رتبه مثل رتبتك : "..msg.TheRankCmd.." ") end

if rinkuser == 9 then return sendMsg(msg.chat_id_,msg.id_,"- المستخدم  ⋙「 "..NameUser.." 」   \nانه بالتاكيد عضو ")  end
huk = false
if msg.SudoBase then 
redis:srem(boss..':SUDO_BOT:',UserID)
redis:srem(boss..':Malk_Group:'..msg.chat_id_,UserID)
redis:srem(boss..':MONSHA_Group:'..msg.chat_id_,UserID)
redis:srem(boss..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(boss..'owners:'..msg.chat_id_,UserID)
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
elseif msg.SudoUser then 
if rinkuser == 2 then return sendpluse() end
if rinkuser < 2 then return senddwon() end
redis:srem(boss..':MONSHA_Group:'..msg.chat_id_,UserID)
redis:srem(boss..':Malk_Group:'..msg.chat_id_,UserID)
redis:srem(boss..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(boss..'owners:'..msg.chat_id_,UserID)
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Malk then 
if rinkuser == 3 then return sendpluse() end
if rinkuser < 3 then return senddwon() end
redis:srem(boss..':MONSHA_Group:'..msg.chat_id_,UserID)
redis:srem(boss..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(boss..'owners:'..msg.chat_id_,UserID)
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
elseif msg.SuperCreator then 
if rinkuser == 4 then return sendpluse() end
if rinkuser < 4 then return senddwon() end
redis:srem(boss..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(boss..'owners:'..msg.chat_id_,UserID)
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Creator then 
if rinkuser == 5 then return sendpluse() end
if rinkuser < 6 then return senddwon() end
redis:srem(boss..'owners:'..msg.chat_id_,UserID)
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Director then 
if rinkuser == 6 then return sendpluse() end
if rinkuser < 6 then return senddwon() end
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Admin then 
if rinkuser == 7 then return sendpluse() end
if rinkuser < 7 then return senddwon() end
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
else
huk = true
end

if not huk then sendMsg(msg.chat_id_,msg.id_,"- المستخدم  ⋙「 "..NameUser.." 」 \n"..DonisDown.."\n️") end

end,{msg=msg})
end,{msg=msg})
end


if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(msg.chat_id_,msg.id_,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(msg.chat_id_,msg.id_,"- عذرا هذا معرف قناة وليس حساب ؛") end
local UserID = data.id_
if UserID == our_id then return sendMsg(msg.chat_id_,msg.id_,"- لا يمكنك تنفيذ الامر مع البوت ") end
msg = arg.msg
if UserID == 1859656976 then) endNameUser = Hyper_Link_Name(data)
if UserID == SUDO_ID then 
rinkuser = 1
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
rinkuser = 2
elseif redis:sismember(boss..':Malk_Group:'..msg.chat_id_,UserID) then 
rinkuser = 3
elseif redis:sismember(boss..':MONSHA_Group:'..msg.chat_id_,UserID) then 
rinkuser = 4
elseif redis:sismember(boss..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
rinkuser = 5
elseif redis:sismember(boss..'owners:'..msg.chat_id_,UserID) then 
rinkuser = 6
elseif redis:sismember(boss..'admins:'..msg.chat_id_,UserID) then 
rinkuser = 7
elseif redis:sismember(boss..'whitelist:'..msg.chat_id_,UserID) then 
rinkuser = 8
else
rinkuser = 9
end
local DonisDown = "\n- تم تنزيله من الرتب الاتيه : \n\n "
if redis:sismember(boss..':SUDO_BOT:',UserID) then 
DonisDown = DonisDown.."- تم تنزيله من المطور ️\n"
end 
if redis:sismember(boss..':MONSHA_Group:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."- تم تنزيله من المنشئ الاساسي ️\n"
end 
if redis:sismember(boss..':Malk_Group:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."- تم تنزيله من المالك ️\n"
end 
if redis:sismember(boss..':MONSHA_BOT:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."- تم تنزيله من المنشئ ️\n"
end 
if redis:sismember(boss..'owners:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."- تم تنزيله من المدير ️\n"
end 
if redis:sismember(boss..'admins:'..msg.chat_id_,UserID) then 
DonisDown = DonisDown.."- تم تنزيله من الادمن ️\n"
end 
if redis:sismember(boss..'whitelist:'..msg.chat_id_,UserID) then
DonisDown = DonisDown.."- تم تنزيله من العضو مميز ️\n"
end

function senddwon() sendMsg(msg.chat_id_,msg.id_,"- عذرا المستخدم رتبته اعلى منك لا يمكن تنزيله ") end
function sendpluse() sendMsg(msg.chat_id_,msg.id_,"- عذرا لا يمكن تنزيل رتبه مثل رتبتك : "..msg.TheRankCmd.." ") end

if rinkuser == 9 then return sendMsg(msg.chat_id_,msg.id_,"- المستخدم  ⋙「 "..NameUser.." 」   \nانه بالتاكيد عضو ️")  end
huk = false
if msg.SudoBase then 
redis:srem(boss..':SUDO_BOT:',UserID)
redis:srem(boss..':Malk_Group:'..msg.chat_id_,UserID)
redis:srem(boss..':MONSHA_Group:'..msg.chat_id_,UserID)
redis:srem(boss..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(boss..'owners:'..msg.chat_id_,UserID)
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
elseif msg.SudoUser then 
if rinkuser == 2 then return sendpluse() end
if rinkuser < 2 then return senddwon() end
redis:srem(boss..':Malk_Group:'..msg.chat_id_,UserID)
redis:srem(boss..':MONSHA_Group:'..msg.chat_id_,UserID)
redis:srem(boss..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(boss..'owners:'..msg.chat_id_,UserID)
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Malk then 
if rinkuser == 3 then return sendpluse() end
if rinkuser < 3 then return senddwon() end
redis:srem(boss..':MONSHA_Group:'..msg.chat_id_,UserID)
redis:srem(boss..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(boss..'owners:'..msg.chat_id_,UserID)
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
elseif msg.SuperCreator then 
if rinkuser == 4 then return sendpluse() end
if rinkuser < 4 then return senddwon() end
redis:srem(boss..':MONSHA_BOT:'..msg.chat_id_,UserID)
redis:srem(boss..'owners:'..msg.chat_id_,UserID)
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Creator then 
if rinkuser == 5 then return sendpluse() end
if rinkuser < 6 then return senddwon() end
redis:srem(boss..'owners:'..msg.chat_id_,UserID)
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Director then 
if rinkuser ==6 then return sendpluse() end
if rinkuser < 6 then return senddwon() end
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
elseif msg.Admin then 
if rinkuser == 7 then return sendpluse() end
if rinkuser < 7 then return senddwon() end
redis:srem(boss..'admins:'..msg.chat_id_,UserID)
redis:srem(boss..'whitelist:'..msg.chat_id_,UserID)
else
huk = true
end

if not huk then sendMsg(msg.chat_id_,msg.id_,"- المستخدم  ⋙「 "..NameUser.." 」 \n"..DonisDown.."\n️") end

end,{msg=msg})
end 

if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="DwnAll"}) 
end

return false
end



--=====================================================================================


if MsgText[1] == "قائمه الاوامر" then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local list = redis:hgetall(boss..":AwamerBotArray2:"..msg.chat_id_)
local list2 = redis:hgetall(boss..":AwamerBotArray:"..msg.chat_id_)
message = "- الاوامر الجديد : \n\n" i = 0
for name,Course in pairs(list) do i = i + 1 message = message ..i..' - *{* '..name..' *}* ~> '..Course..' \n'  end 
if i == 0 then return "- لا توجد اوامر مضافه في القائمه \n " end
return message
end


if MsgText[1] == "مسح الاوامر" then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local Awammer 	= redis:del(boss..":AwamerBot:"..msg.chat_id_)
redis:del(boss..":AwamerBotArray:"..msg.chat_id_)
redis:del(boss..":AwamerBotArray2:"..msg.chat_id_)
if Awammer ~= 0 then
return "- تم مسح قائمه الاوامر"
else
return "- القائمه بالفعل ممسوحه \n"
end
end


if MsgText[1] == "تعيين امر" or MsgText[1] == "تعين امر" or MsgText[1] == "اضف امر" then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if MsgText[2] then

local checkAmr = false
for k, Boss in pairs(XBoss) do if MsgText[2]:match(Boss) then  checkAmr = true end end      
if checkAmr then
redis:setex(boss..":Witting_changeamr:"..msg.chat_id_..msg.sender_user_id_,300,MsgText[2])
return "- حسننا عزيزي , لتغير امر {* "..MsgText[2].." *}  ارسل الامر الجديد الان"
else
return "- عذرا لا يوجد هذا الامر في البوت لتتمكن من تغييره  \n"
end
else
redis:setex(boss..":Witting_changeamr2:"..msg.chat_id_..msg.sender_user_id_,300,true)
return "- حسننا عزيزي , لتغير امر  ارسل الامر القديم الان"
end
end

if MsgText[1] == "مسح امر"  then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
if MsgText[2] then
local checkk = redis:hdel(boss..":AwamerBotArray2:"..msg.chat_id_,MsgText[2])
local AmrOld = redis:hgetall(boss..":AwamerBotArray:"..msg.chat_id_)
amrnew = ""
amrold = ""
amruser = MsgText[2].." @user"
amrid = MsgText[2].." 23434"
amrklma = MsgText[2].." ffffff"
amrfile = MsgText[2].." fff.lua"
for Amor,ik in pairs(AmrOld) do
if MsgText[2]:match(Amor) then			
print("꒐AMrnew : "..Amor,"꒐AMrOld : "..ik)
redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
elseif amruser:match(Amor) then
print("꒐AMrnew : "..Amor,"꒐AMrOld : "..ik)
redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
elseif amrid:match(Amor) then
print("꒐AMrnew : "..Amor,"꒐AMrOld : "..ik)
redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
elseif amrklma:match(Amor) then
print("꒐AMrnew : "..Amor,"꒐AMrOld : "..ik)
redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
elseif amrfile:match(Amor) then
print("꒐AMrnew : "..Amor,"꒐AMrOld : "..ik)
redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
end
end
if checkk ~=0 then
return "- تم مسح الامر {* "..MsgText[2].." *} من قائمه الاومر "
else
return "- هذا الامر ليس موجود ضمن الاوامر المضافه \n"
end
else
redis:setex(boss..":Witting_AmrDel:"..msg.chat_id_..msg.sender_user_id_,300,true)
return "-  ارسل الامر الجديد المضاف بالقوائم الا"
end


end


--=====================================================================================


if msg.SudoBase then

if MsgText[1] == "نقل ملكيه البوت"  then
redis:setex(boss..":Witting_MoveBot:"..msg.chat_id_..msg.sender_user_id_,300,true)
return "- حسننا عزيزي\n- الان ارسل معرف المستخدم لنقل ملكية البوت له ."
end





if MsgText[1] == 'تعيين قائمه الاوامر' then 
redis:setex(boss..":Witting_awamr_witting"..msg.chat_id_..msg.sender_user_id_,1000,true)
return '- ارسل امر القائمه المراد تعيينهم مثل الاتي "\n꒐`م1` , `م2 `, `م3 `, `م المطور ` , `اوامر الرد `,  `اوامر الملفات` \n➼' 
end


if MsgText[1] == "رفع مطور" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات ") end
local UserID = data.sender_user_id_
if UserID == our_id then 
return sendMsg(ChatID,MsgID,"- عذرا لا يمكنني رفع بوت ") 
end
GetUserID(UserID,function(arg,data)
RUSERNAME = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..':SUDO_BOT:',arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد رفعه مطور  في البوت") 
else
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم رفعه مطور  في البوت") 
redis:hset(boss..'username:'..arg.UserID,'username',RUSERNAME)
redis:sadd(boss..':SUDO_BOT:',arg.UserID)
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end


if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
local UserID = data.id_
ReUsername = arg.UserName
NameUser = Hyper_Link_Name(data)
if redis:sismember(boss..':SUDO_BOT:',UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد رفعه مطور  في البوت") 
else
redis:hset(boss..'username:'..UserID,'username',ReUsername)
redis:sadd(boss..':SUDO_BOT:',UserID)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم رفعه مطور  في البوت") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
end 


if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="up_sudo"}) 
end
return false
end

if MsgText[1] == "تنزيل مطور" then
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات ") end
local UserID = data.sender_user_id_
GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..':SUDO_BOT:',arg.UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد تنزيله مطور  في البوت") 
else
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله مطور  في البوت") 
redis:srem(boss..':SUDO_BOT:',arg.UserID)
end  
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end
--================================================
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..':SUDO_BOT:',UserID) then 
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم بالتاكيد تنزيله مطور  في البوت") 
else
redis:srem(boss..':SUDO_BOT:',UserID)
sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n- تم تنزيله مطور  في البوت") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
end 
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="dn_sudo"}) 
end
return false
end

if MsgText[1] == "تنظيف المجموعات" then
local groups = redis:smembers(boss..'group:ids')
local GroupsIsFound = 0
for i = 1, #groups do 
GroupTitle(groups[i],function(arg,data)
if data.code_ and data.code_ == 400 then
rem_data_group(groups[i])
print(" Del Group From list ")
else
print(" Name Group : "..data.title_)
GroupsIsFound = GroupsIsFound + 1
end
print(GroupsIsFound..' : '..#groups..' : '..i)
if #groups == i then
local GroupDel = #groups - GroupsIsFound 
if GroupDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'- جـيـد , لا توجد مجموعات وهميه \n')
else
sendMsg(msg.chat_id_,msg.id_,'- عدد المجموعات •⊱ { *'..#groups..'*  } ⊰•\n- تـم تنظيف  •⊱ { *'..GroupDel..'*  } ⊰• مجموعه \n- اصبح العدد الحقيقي الان •⊱ { *'..GroupsIsFound..'*  } ⊰• مجموعه')
end
end
end)
end
return false
end
if MsgText[1] == "تنظيف المشتركين" then
local pv = redis:smembers(boss..'users')
local NumPvDel = 0
for i = 1, #pv do
GroupTitle(pv[i],function(arg,data)
sendChatAction(pv[i],"Typing",function(arg,data)
if data.ID and data.ID == "Ok"  then
print("Sender Ok")
else
print("Failed Sender Nsot Ok")
redis:srem(boss..'users',pv[i])
NumPvDel = NumPvDel + 1
end
if #pv == i then 
if NumPvDel == 0 then
sendMsg(msg.chat_id_,msg.id_,'- جـيـد , لا يوجد مشتركين وهمي')
else
local SenderOk = #pv - NumPvDel
sendMsg(msg.chat_id_,msg.id_,'- عدد المشتركين •⊱ { *'..#pv..'*  } ⊰•\n- تـم تنظيف  •⊱ { *'..NumPvDel..'*  } ⊰• مشترك \n- اصبح العدد الحقيقي الان •⊱ { *'..SenderOk..'*  } ⊰• من المشتركين') 
end
end
end)
end)
end
return false
end
if MsgText[1] == "ضع صوره للترحيب" then
redis:setex(boss..'welcom_ph:witting'..msg.sender_user_id_..msg.chat_id_,300,true) 
return'- حسننا عزيزي \n- الان قم بارسال الصوره للترحيب ' 
end

if MsgText[1] == "تعطيل البوت خدمي"  then 
return lock_service(msg) 
end

if MsgText[1] == "تفعيل البوت خدمي"  then 
return unlock_service(msg) 
end

if MsgText[1] == "صوره الترحيب" then
local Photo_Weloame = redis:get(boss..':WELCOME_BOT')
if Photo_Weloame then
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
if SUDO_USER:match('@[%a%d_]+') then 
SUDO_USERR = "- مـعرف المـطـور  » "..SUDO_USER.." "
else
SUDO_USERR = ""
end
sendPhoto(msg.chat_id_,msg.id_,Photo_Weloame,[[- مـرحبا انا بوت اسـمـي ]]..redis:get(boss..':NameBot:')..[[ 🎖
- اختصـاصـي حمـايه‏‏ المـجمـوعات
- مـن السـبام والتوجيه‏‏ والتكرار والخ...
]]..SUDO_USERR) 
return false
else
return "- لا توجد صوره مضافه للترحيب في البوت \n- لاضافه صوره الترحيب ارسل `ضع صوره للترحيب`"
end
end

if MsgText[1] == "ضع كليشه المطور" then 
redis:setex(boss..'text_sudo:witting'..msg.sender_user_id_,1200,true) 
return '- حسننا عزيزي \n- الان قم بارسال الكليشه' 
end

if MsgText[1] == "مسح كليشه المطور" then 
if not redis:get(boss..":TEXT_SUDO") then
return '- لا يوجد كليشه مطور اساساً' end
redis:del(boss..':TEXT_SUDO') 
return '- اهلا عزيزي '..msg.TheRank..'\n- تم مسح كليشه المطور ' 
end


if MsgText[1] == "ضع شرط التفعيل" and MsgText[2] and MsgText[2]:match('^%d+$') then 
redis:set(boss..':addnumberusers',MsgText[2]) 
return '- تم وضـع شـرط التفعيل البوت اذا كانت المجموعه‏‏ اكثر مـن *【'..MsgText[2]..'】* عضـو  \n' 
end

if MsgText[1] == "شرط التفعيل" then 
return'- شـرط التفعيل البوت اذا كانت المجموعه‏‏ اكثر مـن *【'..redis:get(boss..':addnumberusers')..'】* عضـو  \n' 
end 
end

if MsgText[1] == 'المجموعات' or MsgText[1] == "المجموعات 🔝" then 
if not msg.SudoUser then return "- هذا الامر يخص {المطور} فقط  \n" end
return '- عدد المجموعات المفعلة » `'..redis:scard(boss..'group:ids')..'`  ➼' 
end

if MsgText[1] == 'مسح كليشه الايدي عام' or MsgText[1] == 'مسح الايدي عام' or MsgText[1] == 'مسح ايدي عام'  or MsgText[1] == 'مسح كليشة الايدي عام' or MsgText[1] == 'مسح كليشه الايدي عام' then 
if not msg.SudoUser then return "- هذا الامر يخص {المطور} فقط  \n" end
if not msg.SudoBase and not redis:get(boss.."lockidedit") then return "- الامر معطل من قبل المطور الاساسي  \n" end
redis:del(boss..":infoiduser")
return sendMsg(msg.chat_id_,msg.id_,"- تم مسح كليشة الايدي العام بنجاح ")
end

if MsgText[1] == 'تعيين كليشه الايدي عام' or MsgText[1] == 'عام تعيين الايدي' or MsgText[1] == 'تعيين ايدي عام'  or MsgText[1] == 'تعيين كليشة الايدي عام'  or MsgText[1] == 'تعيين كليشه الايدي عام' then 
if not msg.SudoUser then return "- هذا الامر يخص {المطور} فقط  \n" end
if not msg.SudoBase and not redis:get(boss.."lockidedit") then return "- تعيين الايدي معطل من قبل المطور الاساسي  \n" end
redis:setex(boss..":Witting_KleshaID"..msg.chat_id_..msg.sender_user_id_,1000,true)
return '- حسننا , الان ارسل كليشه الايدي الجديده \n- علما ان الاختصارات كالاتي : \n \n- {الاسم} : لوضع اسم المستخدم\n- {الايدي} : لوضع ايدي المستخدم\n- {المعرف} : لوضع معرف المستخدم \n- {الرتبه} : لوضع نوع رتبه المستخدم \n- {التفاعل} : لوضع تفاعل المستخدم \n- {الرسائل} : لاضهار عدد الرسائل \n- {النقاط} : لاضهار عدد النقاط \n- {التعديل} : لاضهار عدد السحكات \n- {البوت} : لاضهار اسم البوت\n- {المطور} : لاضهار معرف المطور الاساسي\n- {الردود} : لاضهار ردود عشوائيه .\n- قناه تعليمات ونشر كلايش الايدي \n- قناه الكلايش : [@Change_id] \n➼' 
end


if MsgText[1] == 'قائمه المجموعات' then 
if not msg.SudoBase then return "- هذا الامر يخص {المطور} فقط  \n" end
return chat_list(msg) 
end


if MsgText[1] == 'تعطيل' and MsgText[2] and MsgText[2]:match("(%d+)") then
if not msg.SudoUser then return "- هذا الامر يخص {المطور} فقط  \n" end
local idgrup = "-100"..MsgText[2]
local name_gp = redis:get(boss..'group:name'..idgrup)
GroupTitle(idgrup,function(arg,data)
if data.ID and data.ID == "Error" and data.message_ == "CHANNEL_INVALID" then
if redis:sismember(boss..'group:ids',arg.Group) then
rem_data_group(arg.Group)
sendMsg(arg.chat_id_,arg.id_,'- البوت ليس بالمجموعة ولكن تم مسح بياناتها \n- المجموعةة » ['..arg.name_gp..']\n- الايدي » ( *'..arg.Group..'* ) ')
else 
sendMsg(arg.chat_id_,arg.id_,'- البوت ليس مفعل بالمجموعه \n- ولا يوجد بيانات لها ️')
end
else
StatusLeft(arg.Group,our_id)
if redis:sismember(boss..'group:ids',arg.Group) then
sendMsg(arg.Group,0,'- تم تعطيل المجموعه بامر من المطور  \n- سوف اغادر جاوو ... ✘')
rem_data_group(arg.Group)
sendMsg(arg.chat_id_,arg.id_,'- تم تعطيل المجموعه ومغادرتها \n- المجموعةة » ['..arg.name_gp..']\n- الايدي » ( *'..arg.Group..'* ) ')
else 
sendMsg(arg.chat_id_,arg.id_,'- البوت ليس مفعل بالمجموعة \n- ولكن تم مغادرتها\n- المجموعةة » ['..arg.name_gp..'] ')
end
end 
end,{chat_id_=msg.chat_id_,id_=msg.id_,Group=idgrup,name_gp=name_gp})
return false
end

if MsgText[1] == 'المطور' then
GetUserID(SUDO_ID,function(arg,data)
local SUDO_NAME = '['..Flter_Markdown(data.first_name_..' '..(data.last_name_ or ""))..'](tg://user?id='..SUDO_ID..')'
return send_msg(msg.chat_id_,redis:get(boss..":TEXT_SUDO") or SUDO_NAME,msg.id_)
end,nil)
end

if MsgText[1] == "اذاعه بالتثبيت"  or MsgText[1] =="اذاعه بالتثبيت " then
if not msg.SudoUser then return"✦¹  هذا الامر يخص {المطور} فقط  \n" end
redis:setex(boss..':prod_pin:'..msg.chat_id_..msg.sender_user_id_,300, true) 
return "✦¹  حسننا الان ارسل رساله ليتم اذاعتها بالتثبيت  \n" 
end

if MsgText[1] == "اذاعه عام بالتوجيه"  then
if not msg.SudoUser then return"- هذا الامر يخص {المطور} فقط  \n" end
if not msg.SudoBase and not redis:get(boss..'lock_brod') then 
return "- الاذاعه مقفوله من قبل المطور الاساسي  " 
end
redis:setex(boss..'fwd:'..msg.sender_user_id_,300, true) 
return "- حسننا الان ارسل التوجيه للاذاعه " 
end

if MsgText[1] == "اذاعه عام"  then		
if not msg.SudoUser then return"- هذا الامر يخص {المطور} فقط  \n" end
if not msg.SudoBase and not redis:get(boss..'lock_brod') then 
return "- الاذاعه مقفوله من قبل المطور الاساسي" 
end
redis:setex(boss..'fwd:all'..msg.sender_user_id_,300, true) 
return "- حسننا الان ارسل الكليشه للاذاعه عام" 
end

if MsgText[1] == "اذاعه خاص" then	
if not msg.SudoUser then return "- هذا الامر يخص {المطور} فقط  \n" end
if not msg.SudoBase and not redis:get(boss..'lock_brod') then 
return "- الاذاعه مقفوله من قبل المطور الاساسي" 
end
redis:setex(boss..'fwd:pv'..msg.sender_user_id_,300, true) 
return "- حسننا الان ارسل الكليشه للاذاعه خاص"
end

if MsgText[1] == "اذاعه"  then	
if not msg.SudoUser then return"- هذا الامر يخص {المطور} فقط  \n" end
if not msg.SudoBase and not redis:get(boss..'lock_brod') then 
return "- الاذاعه مقفوله من قبل المطور الاساسي" 
end
redis:setex(boss..'fwd:groups'..msg.sender_user_id_,300, true) 
return "- حسننا الان ارسل الكليشه للاذاعه للمجموعات " 
end

if MsgText[1] == "المطورين"  then
if not msg.SudoUser then return"- هذا الامر يخص {المطور} فقط  \n" end
return sudolist(msg) 
end

if MsgText[1] == "قائمه العام"  then 
if not msg.SudoUser then return"- هذا الامر يخص {المطور} فقط  \n" end
return GetListGeneralBanned(msg) 
end

if MsgText[1] == "تعطيل التواصل"  then 
if not msg.SudoBase then return"- هذا الامر يخص {المطور الاساسي} فقط  \n" end
return lock_twasel(msg) 
end

if MsgText[1] == "تفعيل التواصل"  then 
if not msg.SudoBase then return"- هذا الامر يخص {المطور الاساسي} فقط  \n" end
return unlock_twasel(msg) 
end

if MsgText[1] == "حظر عام" then
if not msg.SudoBase then return "- هذا الامر يخص {المطور الاساسي} فقط  \n" end
if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات ") end
local UserID = data.sender_user_id_
if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر البوت ؛") 
elseif  UserID == 656329268 or UserID == 1765160742 or UserID == 1714422669 then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر مطور السورس ؛")
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر المطور الاساسي ؛")
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر المطور ؛") 
end
GetUserID(UserID,function(arg,data)
NameUser = Hyper_Link_Name(data)
USERNAME = ResolveUserName(data)
if GeneralBanned(arg.UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم بالتاكيد حظره عام  من المجموعات ") 
else
redis:hset(boss..'username:'..arg.UserID,'username',USERNAME)
redis:sadd(boss..'gban_users',arg.UserID)
kick_user(arg.UserID,arg.ChatID)
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم حظره عام  من المجموعات ") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.id_})
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
local UserID = data.id_
UserName = arg.UserName
NameUser = Hyper_Link_Name(data)

if UserID == our_id then   
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر البوت ؛") 
elseif  UserID == 656329268 or UserID == 1765160742 or UserID == 1714422669 then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر مطور السورس ؛")
elseif UserID == SUDO_ID then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر المطور الاساسي ؛")
elseif redis:sismember(boss..':SUDO_BOT:',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر المطور ؛") 
end
if redis:sismember(boss..'gban_users',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم بالتاكيد حظره عام  من المجموعات ") 
else
redis:hset(boss..'username:'..UserID,'username',UserName)
redis:sadd(boss..'gban_users',UserID)
kick_user(UserID,arg.ChatID)
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم حظره عام  من المجموعات ") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
end 
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="bandall"}) 
end
return false
end

if MsgText[1] == "الغاء العام" or MsgText[1] == "الغاء عام" then
if not msg.SudoBase then return"- هذا الامر يخص {المطور الاساسي} فقط  \n" end

if not MsgText[2] and msg.reply_id then 
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.sender_user_id_ then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا العضو ليس موجود ضمن المجموعات ") end
local UserID = data.sender_user_id_
GetUserID(UserID,function(arg,data)
USERNAME = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)

if GeneralBanned(arg.UserID) then 
redis:srem(boss..'gban_users',arg.UserID)
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم بالتاكيد الغاء حظره العام  من المجموعات ") 
else
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم الغاء حظره العام  من المجموعات ") 
end
end,{ChatID=arg.ChatID,UserID=UserID,MsgID=arg.MsgID})
end,{ChatID=msg.chat_id_,MsgID=msg.reply_id})
end
if MsgText[2] and MsgText[2]:match('^%d+$') then 
GetUserID(MsgText[2],action_by_id,{msg=msg,cmd="unbandall"}) 
end
if MsgText[2] and MsgText[2]:match('@[%a%d_]+') then 
GetUserName(MsgText[2],function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.ID == "ChannelChatInfo" then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") end
local UserID = data.id_
UserName = arg.UserName
NameUser = Hyper_Link_Name(data)

if not redis:sismember(boss..'gban_users',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم بالتاكيد الغاء حظره العام  من المجموعات ") 
else
redis:srem(boss..'gban_users',UserID)
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم الغاء حظره العام  من المجموعات ") 
end
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=MsgText[2]})
end 
return false
end 

if MsgText[1] == "رتبتي" then return '- رتبتك » '..msg.TheRank..'' end

----------------- استقبال الرسائل ---------------
if MsgText[1] == "الغاء الامر" or MsgText[1] == "الغاء" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
redis:del(boss..'welcom:witting'..msg.chat_id_..msg.sender_user_id_,
boss..'rulse:witting'..msg.chat_id_..msg.sender_user_id_,
boss..'name:witting'..msg.chat_id_..msg.sender_user_id_,
boss..'about:witting'..msg.chat_id_..msg.sender_user_id_,
boss..'fwd:all'..msg.sender_user_id_,
boss..'fwd:pv'..msg.sender_user_id_,
boss..'fwd:groups'..msg.sender_user_id_,
boss..'namebot:witting'..msg.sender_user_id_,
boss..'addrd_all:'..msg.sender_user_id_,
boss..'delrd:'..msg.sender_user_id_,
boss..'addrd:'..msg.sender_user_id_,
boss..'delrdall:'..msg.sender_user_id_,
boss..'text_sudo:witting'..msg.sender_user_id_,
boss..":Witting_KleshaID"..msg.chat_id_..msg.sender_user_id_,
boss..":Witting_KleshaID_public"..msg.chat_id_..msg.sender_user_id_,
boss..":Witting_awamr_witting"..msg.chat_id_..msg.sender_user_id_,
boss..'addrd:'..msg.chat_id_..msg.sender_user_id_,
boss..':KStart:'..msg.chat_id_..msg.sender_user_id_,
boss.."WiCmdLink"..msg.chat_id_..msg.sender_user_id_,
boss..":uploadingsomeon:"..msg.chat_id_..msg.sender_user_id_,
boss..":uploadingsomeon2:"..msg.chat_id_..msg.sender_user_id_,
boss..":Witting_changeamr:"..msg.chat_id_..msg.sender_user_id_,
boss..":Witting_changeamr2:"..msg.chat_id_..msg.sender_user_id_,
boss..":Witting_MoveBot:"..msg.chat_id_..msg.sender_user_id_,
boss..":firstAmrOld:"..msg.chat_id_..msg.sender_user_id_,
boss..':prod_pin:'..msg.chat_id_..msg.sender_user_id_,
boss..":ForceSub:"..msg.sender_user_id_,
boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_,
boss..'addrdRandom1:'..msg.chat_id_..msg.sender_user_id_,
boss..'addrdRandom:'..msg.chat_id_..msg.sender_user_id_,
boss..'replay1Random'..msg.chat_id_..msg.sender_user_id_,
boss..'addrdRandom1:'..msg.sender_user_id_,
boss..'addrdRandom:'..msg.sender_user_id_,
boss..'replay1Random'..msg.sender_user_id_)

return '- تم الغاء الامـر بنجاح '
end  

if (MsgText[1] == '/files' or MsgText[1]== "الملفات"  ) then
if not msg.SudoBase then return "- هذا الامر يخص {المطور الاساسي} فقط  \n" end
return All_File()
end   


if MsgText[1] == 'اصدار السورس' or MsgText[1] == 'الاصدار' then
return '- اصدار سورس علام : *v'..version..'* '
end

if MsgText[1] == 'اصدار السورس' or MsgText[1] == 'الاصدار' then
return 'ঌ اصدار سورس علام*v'..version..'* \n'
end

if (MsgText[1] == 'تحديث السورس' or MsgText[1] == 'تحديث السورس ™') then
if not msg.SudoBase then return "✦¹  هذا الامر يخص {المطور الاساسي} فقط  \n" end
local GetVerison = https.request('https://raw.githubusercontent.com/iamabazawhourhhhhhh/iamabazawhourhhhhhh.github.io/main/GetVersion.txt') or "0"
GetVerison = GetVerison:gsub("\n",""):gsub(" ","")
if GetVerison > version then
UpdateSourceStart = true
sendMsg(msg.chat_id_,msg.id_,'✦¹  يوجد تحديث جديد الان \n✦¹  جاري تنزيل وتثبيت التحديث  ...')
redis:set(boss..":VERSION",GetVerison)
return false
else
return "ঌ الاصدار الحالي : *v"..version.."* \n✦¹  لديـك احدث اصدار\n - [ABAZA](t.me/jjxxh)"
end
return false
end



if MsgText[1] == 'نسخه احتياطيه للمجموعات' then
if not msg.SudoBase then return"⌔︙  هذا الامر يخص {المطور الاساسي} فقط  \n" end
return buck_up_groups(msg)
end 


if MsgText[1] == 'رفع نسخه الاحتياطيه' then
if not msg.SudoBase then return "- هذا الامر يخص {المطور الاساسي} فقط  \n" end
if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg, data)
if data.content_.ID == 'MessageDocument' then
local file_name = data.content_.document_.file_name_
if file_name:match('.json')then
if file_name:match('@[%a%d_]+.json') then
if file_name:lower():match('@[%a%d_]+') == Bot_User:lower() then 
io.popen("rm -f ../.telegram-cli/data/document/*")
local file_id = data.content_.document_.document_.id_ 
tdcli_function({ID = "DownloadFile",file_id_ = file_id},function(arg, data) 
if data.ID == "Ok" then
Uploaded_Groups_Ok = true
Uploaded_Groups_CH = arg.chat_id_
Uploaded_Groups_MS = arg.id_
print(Uploaded_Groups_CH)
print(Uploaded_Groups_MS)
sendMsg(arg.chat_id_,arg.id_,'- جاري رفع النسخه انتظر قليلا ... ')
end
end,{chat_id_=arg.chat_id_,id_=arg.id_})
else 
sendMsg(arg.chat_id_,arg.id_,"- عذرا النسخه الاحتياطيه هذا ليست للبوت » ["..Bot_User.."] ")
end
else 
sendMsg(arg.chat_id_,arg.id_,'- عذرا اسم الملف غير مدعوم للنظام او لا يتوافق مع سورس اباظة يرجى جلب الملف الاصلي الذي قمت بسحبه وبدون تعديل ع الاسم ')
end  
else
sendMsg(arg.chat_id_,arg.id_,'- عذرا الملف ليس بصيغه Json !? ')
end 
else
sendMsg(arg.chat_id_,arg.id_,'- عذرا هذا ليس ملف النسحه الاحتياطيه للمجموعات ')
end 
end,{chat_id_=msg.chat_id_,id_=msg.id_})
else 
return "- ارسل ملف النسخه الاحتياطيه اولا\n- ثم قم بالرد على الملف وارسل \" `رفع نسخه الاحتياطيه` \" "
end 
return false
end

if (MsgText[1]=="تيست" or MsgText[1]=="test") then 
if not msg.SudoBase then return"- هذا الامر يخص {المطور الاساسي} فقط  \n" end
return " البوت شـغــال" 
end

if MsgText[1]== "ايدي" and msg.type == "pv" then return  "\n"..msg.sender_user_id_.."\n"  end

if MsgText[1]== "قناة السورس" and msg.type == "pv" then
local inline = {{{text="قناه‏‏ السـورس : علام ",url="t.me/sourcemedo"}}}
send_key(msg.sender_user_id_,'  [قناة السورس: علام](t.me/sourcemedo)',nil,inline,msg.id_)
return false
end

if MsgText[1]== "الاحصائيات" then
if not msg.SudoBase then return"- هذا الامر يخص {المطور الاساسي} فقط  \n" end
return 'الاحصائيات  \n\n- عدد المجموعات المفعله : '..redis:scard(boss..'group:ids')..'\n- عدد المشتركين في البوت : '..redis:scard(boss..'users')..' '
end
---------------[End Function data] -----------------------
if MsgText[1]=="اضف رد عام" then
if not msg.SudoBase then return"- هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:setex(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_,300,true)
redis:del(boss..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
return "- حسننا الان ارسل كلمة الرد العام "
end

---------------[End Function data] -----------------------
if MsgText[1] == "تعيين كليشه الستارت" or MsgText[1] == "تعيين كليشة الستارت"  then
if not msg.SudoBase then return"- هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:setex(boss..':KStart:'..msg.chat_id_..msg.sender_user_id_,900,true)
return "- حسننا الان ارسل كليشة الستارت \n\n- علما ان الاختصارات كالاتي : \n \n- {الاسم} : لوضع اسم المستخدم\n- {الايدي} : لوضع ايدي المستخدم\n- {المعرف} : لوضع معرف المستخدم \n- {الرتبه} : لوضع نوع رتبه المستخدم \n- {البوت} : لاضهار اسم البوت \n- {المطور} : لاضهار معرف المطور الاساسي .\n- {الردود} : لاضهار ردود عشوائيه ."
end
if MsgText[1] == "مسح كليشه الستارت" or MsgText[1] == "مسح كليشة الستارت"  then
if not msg.SudoBase then return"- هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:del(boss..':Text_Start')
return "- تم مسح كليشه الستارت "
end

if MsgText[1]== 'مسح' and MsgText[2]== 'الردود' then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local names 	= redis:exists(boss..'replay:'..msg.chat_id_)
local photo 	= redis:exists(boss..'replay_photo:group:'..msg.chat_id_)
local voice 	= redis:exists(boss..'replay_voice:group:'..msg.chat_id_)
local imation   = redis:exists(boss..'replay_animation:group:'..msg.chat_id_)
local audio	 	= redis:exists(boss..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:exists(boss..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:exists(boss..'replay_video:group:'..msg.chat_id_)
local file 	= redis:exists(boss..'replay_files:group:'..msg.chat_id_)
if names or photo or voice or imation or audio or sticker or video or file then
redis:del(boss..'replay:'..msg.chat_id_,boss..'replay_photo:group:'..msg.chat_id_,boss..'replay_voice:group:'..msg.chat_id_,
boss..'replay_animation:group:'..msg.chat_id_,boss..'replay_audio:group:'..msg.chat_id_,boss..'replay_sticker:group:'..msg.chat_id_,boss..'replay_video:group:'..msg.chat_id_,boss..'replay_files:group:'..msg.chat_id_)
return " تم مسح كل الردود"
else
return '- لا يوجد ردود ليتم مسحها \n'
end
end

if MsgText[1] == 'مسح' and MsgText[2] == 'الردود العامه' then
if not msg.SudoBase then return" للمطورين فقط " end
local names 	= redis:exists(boss..'replay:all')
local photo 	= redis:exists(boss..'replay_photo:group:')
local voice 	= redis:exists(boss..'replay_voice:group:')
local imation 	= redis:exists(boss..'replay_animation:group:')
local audio 	= redis:exists(boss..'replay_audio:group:')
local sticker 	= redis:exists(boss..'replay_sticker:group:')
local video 	= redis:exists(boss..'replay_video:group:')
local file 	= redis:exists(boss..'replay_files:group:')
if names or photo or voice or imation or audio or sticker or video or file then
redis:del(boss..'replay:all',boss..'replay_photo:group:',boss..'replay_voice:group:',boss..'replay_animation:group:',boss..'replay_audio:group:',boss..'replay_sticker:group:',boss..'replay_video:group:',boss..'replay_files:group:')
return " تم مسح كل الردود العامه"
else
return "لا يوجد ردود عامه ليتم مسحها ! "
end
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد عام' then
if not msg.SudoBase then return"- هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:set(boss..'delrdall:'..msg.sender_user_id_,true) 
return "- حسننا عزيزي\n- الان ارسل الرد لمسحها من  المجموعات"
end

if MsgText[1]== 'مسح' and MsgText[2]== 'رد' then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
redis:set(boss..'delrd:'..msg.sender_user_id_,true)
return "- حسننا عزيزي\n- الان ارسل الرد لمسحها من  للمجموعه"
end

if MsgText[1]== 'الردود' then

if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
local names  	= redis:hkeys(boss..'replay:'..msg.chat_id_)
local photo 	= redis:hkeys(boss..'replay_photo:group:'..msg.chat_id_)
local voice  	= redis:hkeys(boss..'replay_voice:group:'..msg.chat_id_)
local imation 	= redis:hkeys(boss..'replay_animation:group:'..msg.chat_id_)
local audio 	= redis:hkeys(boss..'replay_audio:group:'..msg.chat_id_)
local sticker 	= redis:hkeys(boss..'replay_sticker:group:'..msg.chat_id_)
local video 	= redis:hkeys(boss..'replay_video:group:'..msg.chat_id_)
local files 	= redis:hkeys(boss..'replay_files:group:'..msg.chat_id_)
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 and #files==0  then 
return '- لا يوجد ردود مضافه حاليا ' 
end
local ii = 1
local message = '- ردود البوت في المجموعه  :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *} ⋙ *( صوره ) \n' 	 ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *} ⋙ *( نص) \n'  	 ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..  voice[i]..' *} ⋙ *( بصمه) \n' 	 ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *} ⋙ *( متحركه) \n' ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *} ⋙ *( صوتيه) \n'  ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *} ⋙ *( ملصق) \n' 	 ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *} ⋙ *( فيديو) \n' ii = ii + 1 end
for i=1, #files 	do message = message ..ii..' - *{* '..	files[i]..' *} ⋙ *( ملف) \n' ii = ii + 1 end
message = message..'\n➖➖➖'
if utf8.len(message) > 4096 then
return "- لا يمكن عرض الردود بسبب القائمه كبيره جدا ."
else
return message
end
end

if MsgText[1]== 'الردود العامه' then
if not msg.SudoBase then return " للمطور فقط " end
local names 	= redis:hkeys(boss..'replay:all')
local photo 	= redis:hkeys(boss..'replay_photo:group:')
local voice 	= redis:hkeys(boss..'replay_voice:group:')
local imation 	= redis:hkeys(boss..'replay_animation:group:')
local audio 	= redis:hkeys(boss..'replay_audio:group:')
local sticker 	= redis:hkeys(boss..'replay_sticker:group:')
local video 	= redis:hkeys(boss..'replay_video:group:')
local files 	= redis:hkeys(boss..'replay_files:group:')
if #names==0 and #photo==0 and #voice==0 and #imation==0 and #audio==0 and #sticker==0 and #video==0 and #files==0 then 
return '- لا يوجد ردود مضافه حاليا ' 
end
local ii = 1
local message = '- الردود العامه في البوت :   :\n\n'
for i=1, #photo 	do message = message ..ii..' - *{* '..	photo[i]..' *} ⋙ *( صوره ) \n' 	ii = ii + 1 end
for i=1, #names 	do message = message ..ii..' - *{* '..	names[i]..' *} ⋙ *( نص) \n'  	ii = ii + 1 end
for i=1, #voice 	do message = message ..ii..' - *{* '..	voice[i]..' *} ⋙ *( بصمه) \n' 	ii = ii + 1 end
for i=1, #imation 	do message = message ..ii..' - *{* '..imation[i]..' *} ⋙ *( متحركه) \n'ii = ii + 1 end
for i=1, #audio 	do message = message ..ii..' - *{* '..	audio[i]..' *} ⋙ *( صوتيه) \n' ii = ii + 1 end
for i=1, #sticker 	do message = message ..ii..' - *{* '..sticker[i]..' *} ⋙ *( ملصق) \n' 	ii = ii + 1 end
for i=1, #video 	do message = message ..ii..' - *{* '..	video[i]..' *} ⋙ *( فيديو) \n'ii = ii + 1 end
for i=1, #files 	do message = message ..ii..' - *{* '..	files[i]..' *} ⋙ *( ملف) \n' ii = ii + 1 end
message = message..'\n➖➖➖'
if utf8.len(message) > 4096 then
return "- لا يمكن عرض الردود بسبب القائمه كبيره جدا ."
else
return message
end
end

----=================================| كود الرد العشوائي المجموعات|===============================================
if MsgText[1]=="اضف رد عشوائي" and msg.GroupActive then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
redis:setex(boss..'addrdRandom1:'..msg.chat_id_..msg.sender_user_id_,1400,true) 
redis:del(boss..'replay1Random'..msg.chat_id_..msg.sender_user_id_)
return "- حسننا ,  الان ارسل كلمه الرد للعشوائي"
end


if MsgText[1]== "مسح رد عشوائي" then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
redis:setex(boss..':DelrdRandom:'..msg.chat_id_..msg.sender_user_id_,300,true)
return "- حسننا عزيزي\n- الان ارسل الرد العشوائي لمسحها "
end


if MsgText[1] == "مسح الردود العشوائيه" then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
local AlRdod = redis:smembers(boss..':KlmatRRandom:'..msg.chat_id_) 
if #AlRdod == 0 then return "- الردود العشوائيه محذوفه بالفعل " end
for k,v in pairs(AlRdod) do redis:del(boss..':ReplayRandom:'..msg.chat_id_..":"..v) redis:del(boss..':caption_replay:Random:'..msg.chat_id_..v) 
end
redis:del(boss..':KlmatRRandom:'..msg.chat_id_) 
return "- اهلا عزيزي "..msg.TheRankCmd.."  \n- تم مسح جميع الردود العشوائيه "
end

if MsgText[1] == "الردود العشوائيه" then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  " end
message = "- الردود العشـوائيه :\n\n"
local AlRdod = redis:smembers(boss..':KlmatRRandom:'..msg.chat_id_) 
if #AlRdod == 0 then 
message = message .."- لا توجد ردود عشوائيه مضافه !\n"
else
for k,v in pairs(AlRdod) do
local incrr = redis:scard(boss..':ReplayRandom:'..msg.chat_id_..":"..v) 
message = message..k..'- ['..v..'] ⋙ •⊱ {*'..incrr..'*} ⊰• رد\n'
end
end
return message.."\n"
end
----=================================|نهايه كود الرد العشوائي المجموعات|===============================================

----=================================|كود الرد العشوائي العام|===============================================

if MsgText[1]=="اضف رد عشوائي عام" then
if not msg.SudoUser then return "- هذا الامر يخص {المطور} فقط  \n" end
redis:setex(boss..'addrdRandom1Public:'..msg.chat_id_..msg.sender_user_id_,1400,true) 
redis:del(boss..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_)
return "- حسننا ,  الان ارسل كلمه الرد للعشوائي العام "
end


if MsgText[1]== "مسح رد عشوائي عام" then
if not msg.SudoUser then return "- هذا الامر يخص {المطور} فقط  \n" end
redis:setex(boss..':DelrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_,300,true)
return "- حسننا عزيزي\n- الان ارسل الرد العشوائي العام لمسحها"
end

if MsgText[1] == "مسح الردود العشوائيه العامه" then
if not msg.SudoUser then return "- هذا الامر يخص {المطور} فقط  \n" end
local AlRdod = redis:smembers(boss..':KlmatRRandom:') 
if #AlRdod == 0 then return "- الردود العشوائيه محذوفه بالفعل " end
for k,v in pairs(AlRdod) do redis:del(boss..":ReplayRandom:"..v) redis:del(boss..':caption_replay:Random:'..v)  end
redis:del(boss..':KlmatRRandom:') 
return "- اهلا عزيزي "..msg.TheRankCmd.."  \n- تم مسح جميع الردود العشوائيه "
end

if MsgText[1] == "الردود العشوائيه العام" then
if not msg.SudoUser then return "- هذا الامر يخص {المطور} فقط  \n" end
message = "- الردود العشـوائيه العام :\n\n"
local AlRdod = redis:smembers(boss..':KlmatRRandom:') 
if #AlRdod == 0 then 
message = message .."- لا توجد ردود عشوائيه مضافه !\n"
else
for k,v in pairs(AlRdod) do
local incrr = redis:scard(boss..":ReplayRandom:"..v) 
message = message..k..'- ['..v..'] ⋙ •⊱ {*'..incrr..'*} ⊰• رد\n'
end
end
return message.."\n"
end

----=================================|نهايه كود الرد العشوائي العام|===============================================


if MsgText[1]=="اضف رد" and msg.GroupActive then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
redis:setex(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_,300,true) 
redis:del(boss..'replay1'..msg.chat_id_..msg.sender_user_id_)
return "- حسننا , الان ارسل كلمه الرد "
end

if MsgText[1] == "ضع اسم للبوت"  then
if not msg.SudoBase then return"- هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:setex(boss..'namebot:witting'..msg.sender_user_id_,300,true)
return"- حسننا عزيزي\n- الان ارسل الاسم  للبوت "
end

if MsgText[1] == 'server' then
if not msg.SudoUser then return "For Sudo Only." end
return io.popen([[

linux_version=`lsb_release -ds 2>/dev/null || cat /etc/*release 2>/dev/null | head -n1 || uname -om`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo '- •⊱ { Seystem } ⊰•\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*- •⊱ { Memory } ⊰•\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*- •⊱ { HardDisk } ⊰•\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*- •⊱ { Processor } ⊰•\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*- •⊱ { Location } ⊰•\n*»» '`curl http://th3boss.com/ip/location`'*'
echo '*------------------------------\n*- •⊱ { Server[_]Login } ⊰•\n*»» '`whoami`'*'
echo '*------------------------------\n*- •⊱ { Uptime } ⊰•  \n*»» '"$uptime"'*'
]]):read('*all')
end


if MsgText[1] == 'السيرفر' then
if not msg.SudoUser then return "For Sudo Only." end
return io.popen([[

linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`

echo '- •⊱ { نظام التشغيل } ⊰•\n*»» '"$linux_version"'*' 
echo '*------------------------------\n*- •⊱ { الذاكره العشوائيه } ⊰•\n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*- •⊱ { وحـده الـتـخـزيـن } ⊰•\n*»» '"$HardDisk"'*'
echo '*------------------------------\n*- •⊱ { الـمــعــالــج } ⊰•\n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*- •⊱ { موقـع الـسـيـرفـر } ⊰•\n*»» '`curl http://th3boss.com/ip/location`'*'
echo '*------------------------------\n*- •⊱ { الــدخــول } ⊰•\n*»» '`whoami`'*'
echo '*------------------------------\n*- •⊱ { مـده تـشغيـل الـسـيـرفـر } ⊰•  \n*»» '"$uptime"'*'
]]):read('*all')
end



if msg.type == 'channel' and msg.GroupActive then

if msg.SudoBase and (MsgText[1]=="م1" or MsgText[1]=="م2" or MsgText[1]=="م3" or MsgText[1]=="م المطور" or MsgText[1]=="اوامر الرد" or MsgText[1]=="الاوامر" or MsgText[1]=="اوامر الملفات") and redis:get(boss..":Witting_awamr_witting"..msg.chat_id_..msg.sender_user_id_) then 
redis:del(boss..":Witting_awamr_witting"..msg.chat_id_..msg.sender_user_id_)
redis:setex(boss..":changawmer:"..msg.chat_id_..msg.sender_user_id_,900,MsgText[1])
sendMsg(msg.chat_id_,msg.id_,"- حسننا لتعيين كليشة الـ *"..MsgText[1].."* \n- ارسل الكليشه الجديده الان \n\n- علما يمكنك استخدام الاختصارات الاتي : \n \n- {الاسم} : لوضع اسم المستخدم\n- {الايدي} : لوضع ايدي المستخدم\n- {المعرف} : لوضع معرف المستخدم \n- {الرتبه} : لوضع نوع رتبه المستخدم \n- {التفاعل} : لوضع تفاعل المستخدم \n- {الرسائل} : لاضهار عدد الرسائل \n- {النقاط} : لاضهار عدد النقاط \n- {التعديل} : لاضهار عدد السحكات \n- {البوت} : لاضهار اسم البوت\n- {المطور} : لاضهار معرف المطور الاساسي\n- {الردود} : لاضهار ردود عشوائيه .\n➼")
return false
end



if MsgText[1] == "اعدادات المجموعة" or MsgText[1] == "اعدادات المجموعه" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
msg.textmsg = "- اهلا بك في لستة الاوامر  اختر القسم للتحكم بالاوامر ."
msg.KeyboardCmd = keyboardSitting
SendMsgInline(msg)
return false
end

if MsgText[1] == "الاوامر" then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end

SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
text = [[للاستفسار - []]..SUDO_ @FACKYOOOOOU..[[]
➖➖➖

- قائمه الاوامر 
- م1 ( اوامر الإداره)
- م2 ( اوامر إعدادات المجموعه )
- م3 ( اوامر الحمايه ) 
- م المطور ( اوامر المطور ) 
- اوامر الرد ( لإضافه رد معين )
- اوامر الملفات ( للتحكم بالملفات ) ]]
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg
local textD = redis:get(boss..":awamer_Klesha_m:")
if textD then
textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
else
textD = text
end
msg.textmsg = [[ للاستفسار - []]..SUDO_ @FACKYOOOOOU..[[]
➖➖➖

- قائمه الاوامر 
- م1 ( اوامر الإداره)
- م2 ( اوامر إعدادات المجموعه )
- م3 ( اوامر الحمايه ) 
- م المطور ( اوامر المطور ) 
- اوامر الرد ( لإضافه رد معين )
- اوامر الملفات ( للتحكم بالملفات ) 

➖➖➖]]
msg.KeyboardCmd = keyboardCmd
SendMsgInline(msg)
end,{msg=msg})
return false
end


if MsgText[1]== 'م1' then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
local text = [[ اهلا بك في قائمة اوامر الاداريين
للاستفسار - []]..SUDO_ @FACKYOOOOOU..[[]

﹎﹎﹎﹎﹎اوامر الرفع والتنزيل﹎﹎﹎﹎﹎
- رفع - تنزيل منشى اساسي
- رفع - تنزيل منشى
- رفع - تنزيل مشرف
- رفع - تنزيل مدير
- رفع - تنزيل ادمن
- رفع - تنزيل مميز
- تنزيل الكل - لازاله جميع الرتب اعلاه

﹎﹎﹎﹎﹎اوامر المسح﹎﹎﹎﹎﹎
- مسح المنشئين الاساسيين
- مسح المنشئين
- مسح المدراء
- مسح الادمنيه
- مسح المميزين
- مسح المحظورين
- مسح المكتومين
- مسح قائمه العام
- مسح قائمه المنع
- مسح الردود العامه
- مسح الردود
- مسح الميديا
- مسح الاوامر
- مسح + عدد
- مسح بالرد
- مسح ايدي عام
- مسح كليشه الايدي
- مسح كليشه الستارت
- مسح الترحيب
- مسح الرابط
- مسح كلايش التعليمات

﹎﹎﹎﹎﹎اوامر الطرد الحظر الكتم﹎﹎﹎﹎﹎
- حظر - بالرد،بالمعرف،بالايدي
- طرد - بالرد،بالمعرف،بالايدي 
- كتم - بالرد،بالمعرف،بالايدي
- تقيد - بالرد،بالمعرف،بالايدي
- الغاء الحظر - بالرد،بالمعرف،بالايدي
- الغاء الكتم - بالرد،بالمعرف،بالايدي
- فك التقييد - بالرد،بالمعرف،بالايدي
- رفع القيود - لحذف ↜ كتم،حظر،حظر عام،تقييد
- منع + الكلمه
- الغاء منع + الكلمه
- طرد البوتات
- طرد المحذوفين
- كشف البوتات]]

GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg
local textD = redis:get(boss..":awamer_Klesha_m1:")
if textD then
textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
else
textD = text
end
sendMsg(msg.chat_id_,msg.id_,textD)
end,{msg=msg})
return false
end


if MsgText[1]== 'م2' then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username

local text = [[ اهلا بك في قائمة اوامر المجموعه
للاستفسار - []]..SUDO_ @FACKYOOOOOU..[[]

﹎﹎﹎﹎اوامر الوضع ﹎﹎﹎﹎
- ضع الترحيب
- ضع القوانين
- ضع وصف
- ضـع رابط
- اضف امر
- اضف رد عام
- تعيين ايدي عام
- تعيين كليشه الايدي

﹎﹎﹎﹎اوامر رؤية الاعدادات﹎﹎﹎﹎
- المطورين
- المنشئين الاساسيين
- المنشئين 
- الادمنيه
- المدراء
- المميزين
- المحظورين
- القوانين
- المكتومين
- المطور 
- معلوماتي 
- الحمايه  
- الوسائط
- الاعدادت
- المجموعه ]]

GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg
local textD = redis:get(boss..":awamer_Klesha_m2:")
if textD then
textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
else
textD = text
end
sendMsg(msg.chat_id_,msg.id_,textD)
end,{msg=msg})
return false
end


if MsgText[1]== 'مين ضافني' then
if not redis:get(boss..":Added:Me:"..msg.chat_id_) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da and da.status_.ID == "ChatMemberStatusCreator" then
sendMsg(msg.chat_id_,msg.id_,'*✶انت منشئ المجموعه *') 
return false
end
local Added_Me = redis:get(boss..":Added:Me:Who:Added:Me"..msg.chat_id_..':'..msg.sender_user_id_)
if Added_Me then 
tdcli_function ({ID = "GetUser",user_id_ = Added_Me},function(extra,result,success)
local Name = '['..result.first_name_..'](tg://user?id='..result.id_..')'
Text = '*✶الشخص الذي قام باضافتك هو * '..Name
sendMsg(msg.chat_id_,msg.id_,Text) 
end,nil)
else
sendMsg(msg.chat_id_,msg.id_,'*✶انت دخلت عبر الرابط*') 
end
end,nil)
else
sendMsg(msg.chat_id_,msg.id_,'*✶امر مين ضافني تم تعطيله من قبل المدراء *') 
end
end

if MsgText[1]== 'م3' then
if not msg.Admin then return "- هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username

local text = [[  اهلا بك في قائمة الحماية
للاستفسار - []]..SUDO_ @FACKYOOOOOU..[[]

﹎﹎﹎ اوامر القفل والفتح بالمسح ﹎﹎﹎
- قفل - فتح التعديل  
•️ قفل - فتح البصمات 
- قفل - فتح الفيديو 
- قفل - فتح الـصــور 
- قفل - فتح الملصقات 
- قفل - فتح المتحركه 

- قفل - فتح الدردشه 
- قفل - فتح الروابط 
- قفل - فتح التاك 
- قفل - فتح البوتات 
- ️قفل - فتح المعرفات 
- قفل - فتح البوتات بالطرد 

- قفل - فتح الكلايش 
•️ قفل - فتح التكرار 
- قفل - فتح التوجيه 
- قفل - فتح الانلاين 
- قفل - فتح الجهات 
- قفل - فتح الــكـــل 

- قفل - فتح الفشار
- قفل - فتح الفارسيه
- قفل - فتح الانكليزيه
- قفل - فتح الاضافه
- قفل - فتح الصوت
- قفل - فتح الالعاب
- قفل - فتح الماركدوان
- قفل - فتح الويب

﹎﹎﹎﹎اوامر الفتح والقفل بالتقييد﹎﹎﹎
- قفل - فتح التوجيه بالتقييد 
- قفل - فتح الروابط بالتقييد 
- قفل - فتح المتحركه بالتقييد 
- قفل - فتح الصور بالتقييد 
- قفل - فتح الفيديو بالتقييد 

﹎﹎﹎﹎اوامر التفعيل والتعطيل ﹎﹎﹎﹎
- تفعيل - تعطيل الترحيب 
- تفعيل - تعطيل الردود 
- تفعيل - تعطيل التحذير 
- تفعيل - تعطيل الايدي
- تفعيل - تعطيل الرابط
- تفعيل - تعطيل المغادره
- تفعيل - تعطيل الحظر
- تفعيل - تعطيل الحمايه
- تفعيل - تعطيل تاك للكل
- تفعيل - تعطيل الايدي بالصوره
- تفعيل - تعطيل التحقق 
- تفعيل - تعطيل ردود السورس 
- تفعيل - تعطيل التنظيف التلقائي 
]]


GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg
local textD = redis:get(boss..":awamer_Klesha_m3:")
if textD then
textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
else
textD = text
end
sendMsg(msg.chat_id_,msg.id_,textD)
end,{msg=msg})
return false
end

if MsgText[1]== "م المطور" then
if not msg.SudoBase then return "- للمطور الاساسي فقط  🎖" end
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username

local text = [[  اهلا بك في قائمة اوامر المطورين
للاستفسار - []]..SUDO_ @FACKYOOOOOU..[[]

- تفعيل
- تعطيل
- اسم بوتك + غادر
- مسح الادمنيه
- مسح المميزين
- مسح المدراء
- مسح المطورين
- مسح المنشئين
- مسح المنشئين الاساسيين
- مسح كلايش التعليمات
- اذاعه
- اذاعه خاص
- اذاعه عام
- اذاعه بالتثبيت
- اذاعه عام بالتوجيه
- تعيين قائمه الاوامر
- مسح كلايش التعليمات
- تعيين كليشه ستارت
- تعيين ايدي عام
- مسح ايدي عام
- تفعيل / تعطيل تعيين الايدي
- تحديث
- تحديث السورس ]]

GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg
local textD = redis:get(boss..":awamer_Klesha_mtwr:")
if textD then
textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
else
textD = text
end
sendMsg(msg.chat_id_,msg.id_,textD)
end,{msg=msg})
return false
end

if MsgText[1]== 'اوامر الرد' then
if not msg.Director then return "- هذا الامر يخص {المطور,المنشئ,المدير} فقط  \n" end
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username


local text = [[  اهلا بك في قائمة اوامر الردود
للاستفسار - []]..SUDO_ @FACKYOOOOOU..[[]

-  جميع اوامر الردود 
- الردود : لعرض الردود المثبته
-  اضف رد : لاضافه رد جديد
- مسح رد  الرد المراد مسحه
- مسح الردود : لمسح كل الردود
-  اضف رد عام : لاضافه رد لكل المجموعات
-  مسح رد عام : لمسح الرد العام 
- مسح الردود العامه : لمسح كل ردود العامه ]]

GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg
local textD = redis:get(boss..":awamer_Klesha_mrd:")
if textD then
textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
else
textD = text
end
sendMsg(msg.chat_id_,msg.id_,textD)
end,{msg=msg})
return false
end

if MsgText[1]== "اوامر الملفات" then
if not msg.SudoBase then return"- هذا الامر يخص {المطور الاساسي} فقط  \n" end
local text = [[  اهلا بك في قائمة اوامر الملفات
للاستفسار - []]..SUDO_ @FACKYOOOOOU..[[]

- اوامر الملفات

-  `/files`  لعرض قائمه الملفات 
-  `/store`  لعرض متجر الملفات 
-  `sp file.lua`   تثبيت الملف 
-  `dp file.lua`  الملف المراد حذفه ]]


GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg
local textD = redis:get(boss..":awamer_Klesha_mf:")
if textD then
textD = Flter_Markdown(convert_Klmat(msg,data,textD,true))
else
textD = text
end
sendMsg(msg.chat_id_,msg.id_,textD)
end,{msg=msg})
return false
end


if MsgText[1] == "مغادره" or MsgText[1] == "ادفرني" or MsgText[1] == "احظرني" or MsgText[1] == "اطردني" then
if msg.Admin then return "- لا استطيع طرد المدراء والادمنيه والمنشئين  \n" end
if not redis:get(boss.."lock_leftgroup"..msg.chat_id_) then  return "- امر المغادره معطل من قبل اداره المجموعة  \n" end
kick_user(msg.sender_user_id_,msg.chat_id_,function(arg,data)
if data.ID == "Ok" then
StatusLeft(msg.chat_id_,msg.sender_user_id_)
send_msg(msg.sender_user_id_,"- اهلا عزيزي , لقد تم طردك من المجموعه بامر منك \n- اذا كان هذا بالخطا او اردت الرجوع للمجموعه \n\n-فهذا رابط المجموعه \n-"..Flter_Markdown(redis:get(boss..'group:name'..msg.chat_id_)).." :\n\n["..redis:get(boss..'linkGroup'..msg.chat_id_).."]\n")
sendMsg(msg.chat_id_,msg.id_,"- لقد تم طردك بنجاح , ارسلت لك رابط المجموعه في الخاص اذا وصلت لك تستطيع الرجوع متى شئت ")
else
sendMsg(msg.chat_id_,msg.id_,"- لا استطيع طردك لانك مشرف في المجموعه  ")
end
end)
return false
end

end 



if MsgText[1] == "باسل"  then
local text = " اهلاً بك عزيزي"
local inline = {
{{text = '-𝐃𝐄𝐕 👑',url="https://t.me/xb_0b"}},
}   
return send_inline(msg.chat_id_,text,inline,msg.id_)
end


if MsgText[1] == "علام" then
local text = " [مطور السورس🌐 ](t.me/FACKYOOOOOU)"
local inline = {
{{text = '-𝙳𝙴𝚅 👑',url="https://t.me/FACKYOOOOOU"}},
}   
return send_inline(msg.chat_id_,text,inline,msg.id_)
end

if MsgText[1] == "السورس" or MsgText[1]=="سورس" then
local text = "𝙒𝙀𝙇𝘾𝙊𝙈𝙀 𝙏𝙊 𝙎𝙊𝙐𝙍𝘾𝙀 𝘼𝘽𝘼𝙕𝘼 ⩫"
local inline = {
{{text = '𝙎𝙊𝙐𝙍𝘾𝙀 𝘼𝘽𝘼𝙕𝘼 ⩫ ',url="https://t.me/sourcemedo"}},
{{text = '-𝘿𝙀𝙑   👑',url="https://t.me/FACKYOOOOOU"}},
{{text = '-𝘿𝙀𝙑   👑',url="https://t.me/REDDEVIILL"}},
{{text = '-𝙏𝙒𝘼𝙎𝙊𝙇 💬 ',url="https://t.me/A_L_L_A_Mbot"}},
}   
return send_inline(msg.chat_id_,text,inline,msg.id_)
end

if MsgText[1] == "متجر الملفات" or MsgText[1]:lower() == "/store"  then
if not msg.SudoBase then return "✦¹  هذا الامر يخص {المطور الاساسي} فقط  \n" end
local Get_Files, res = https.request("https://iamabazawhourhhhhhh.github.io/GetFiles.json")
print(Get_Files)
print(res)
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
if Get_info then
local TextS = res.IinFormation.Text_Msg
local TextE = res.IinFormation.BorderBy
local NumFile = 0
for name,Course in pairs(res.Plugins) do
local Check_File_is_Found = io.open("plugins/"..name,"r")
if Check_File_is_Found then
io.close(Check_File_is_Found)
CeckFile = "{✔}"
else
CeckFile = "{✖️}"
end
NumFile = NumFile + 1
TextS = TextS..NumFile.."- `"..name..'` ⇠ '..CeckFile..'\nl*⇠⇠* [{تفاصيل اكثر}]('..Course..")\n------------------------------------\n"
end
return TextS..TextE
else
return " اوبس , هناك خطأ في مصفوفه الجيسون راسل مطور السورس ليتمكن من حل المشكله في اسرع وقت ممكن.!"
end
else
return " اوبس , لا يوجد اتصال في الـapi راسل المطور ليتم حل المشكله في اسرع وقت ممكن.!"
end
return false
end

if MsgText[1]:lower() == "sp" and MsgText[2] then
if not msg.SudoBase then return"✦¹  هذا الامر يخص {المطور الاساسي} فقط  \n" end
local FileName = MsgText[2]:lower()
local Check_File_is_Found = io.open("plugins/"..FileName,"r")
if Check_File_is_Found then
io.close(Check_File_is_Found)
TText = " الملف موجود بالفعل \nঌ تم تحديث الملف  \n"
else
TText = "ঌ تم تثبيت وتفعيل الملف بنجاح \n"
end
local Get_Files, res = https.request("https://raw.githubusercontent.com/iamabazawhourhhhhhh/abaza/main/plugins/"..FileName)
if res == 200 then
print("DONLOADING_FROM_URL: "..FileName)
local FileD = io.open("plugins/"..FileName,'w+')
FileD:write(Get_Files)
FileD:close()
Start_Bot()

return TText
else
return " لا يوجد ملف بهذا الاسم في المتجر \n"
end
end

if MsgText[1]:lower() == "dp" and MsgText[2] then
if not msg.SudoBase then return"✦¹  هذا الامر يخص {المطور الاساسي} فقط  \n" end
local FileName = MsgText[2]:lower()
local Check_File_is_Found = io.open("plugins/"..FileName,"r")
if Check_File_is_Found then
io.close(Check_File_is_Found)
os.execute("rm -fr plugins/"..FileName)
TText = " الملف ~⪼ ["..FileName.."] \nঌ تم حذفه بنجاح  \n"
else
TText = " الملف ~⪼ ["..FileName.."] \nঌ بالفعل محذوف  \n"
end
Start_Bot()
return TText
end

if MsgText[1] == "الساعه" then
return "\n• الساعه الان : "..os.date("%I:%M%p")
end

if MsgText[1] == "التاريخ" then
return "\n• التاريخ : "..os.date("%Y/%m/%d")
end

if MsgText[1] == "صورتي" or MsgText[1] == 'افتاري' then
local my_ph = redis:get(boss..'my_photo:status:bot'..msg.chat_id_)
print(my_ph)
if not my_ph then
local function getpro(extra, result, success)
if result.photos_[0] then
sendPhoto(msg.chat_id_,msg.id_,result.photos_[0].sizes_[1].photo_.persistent_id_,'')
else
send(msg.chat_id_, msg.id_,'لا تمتلك صوره في حسابك')
end 
end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
end

if MsgText[1] == "تفعيل الاشتراك الاجباري" then
if not msg.SudoBase then return"- هذا الامر يخص {المطور الاساسي} فقط  \n" end
if redis:get(boss..":UserNameChaneel") then
return "- اهلا عزيزي المطور \n- الاشتراك بالتاكيد مفعل"
else
redis:setex(boss..":ForceSub:"..msg.sender_user_id_,350,true)
return "- مرحبا بـك في نظام الاشتراك الاجباري\n- الان ارسل معرف قـنـاتـك"
end
end

if MsgText[1] == "تعطيل الاشتراك الاجباري" then
if not msg.SudoBase then return"- هذا الامر يخص {المطور الاساسي} فقط  \n" end
local SubDel = redis:del(boss..":UserNameChaneel")
if SubDel == 1 then
return "- تم تعطيل الاشتراك الاجباري . "
else
return "- الاشتراك الاجباري بالفعل معطل . "
end
end

if MsgText[1] == "الاشتراك الاجباري" then
if not msg.SudoBase then return"- هذا الامر يخص {المطور الاساسي} فقط  \n" end
local UserChaneel = redis:get(boss..":UserNameChaneel")
if UserChaneel then
return "- اهلا عزيزي المطور \n- الاشتراك الاجباري للقناة : ["..UserChaneel.."] "
else
return "- لا يوجد قناة مفعله ع الاشتراك الاجباري. "
end
end

if MsgText[1] == "تغيير الاشتراك الاجباري" then
if not msg.SudoBase then return"- هذا الامر يخص {المطور الاساسي} فقط  \n" end
redis:setex(boss..":ForceSub:"..msg.sender_user_id_,350,true)
return "- مرحبا بـك في نظام الاشتراك الاجباري\n- الان ارسل معرف قـنـاتـك"
end





end




local function dBoss(msg)

if msg.type == "pv" then 

if not msg.SudoUser then
local msg_pv = tonumber(redis:get(boss..'user:'..msg.sender_user_id_..':msgs') or 0)
if msg_pv > 5 then
redis:setex(boss..':mute_pv:'..msg.sender_user_id_,18000,true)   
return sendMsg(msg.chat_id_,0,'- تم حظرك من البوت بسبب التكرار ') 
end
redis:setex(boss..'user:'..msg.sender_user_id_..':msgs',2,msg_pv+1)
end

if msg.text=="/start" then

if msg.SudoBase then
local text = '- اهلا عزيزي المـطـور \n- انته‏‏ المـطـور الاسـاسـي هنا \n\n- تسـتطـيع‏‏ التحكم بكل الاوامـر المـمـوجوده‏‏ بالكيبورد\n- فقط اضـغط ع الامـر الذي تريد تنفيذه‏‏'

local keyboard = {
{"الاحصائيات"},
{"ضع اسم للبوت","ضع صوره للترحيب"},
{"تعطيل التواصل","تفعيل التواصل"},
{"تعطيل تعيين الايدي","تفعيل تعيين الايدي"},

{"تعطيل البوت خدمي","تفعيل البوت خدمي"},
{"مسح كليشه الستارت","تعيين كليشه الستارت"},
{"مسح كليشه الايدي عام","تعيين كليشه الايدي عام"},

{"اذاعه بالتثبيت","تعطيل الاذاعه","تفعيل الاذاعه"},
{"اذاعه","اذاعه عام","اذاعه خاص"},
{"الملفات","اذاعه عام بالتوجيه"},
{"نسخه احتياطيه للمجموعات"},
{"المحظورين من التواصل","نقل ملكيه البوت"},
{"تحديث","قائمه العام","قناة السورس"},
{"المطورين","ايدي"},
{"اضف رد عام","الردود العامه"},
{"تحديث السورس"},
{"الغاء الامر"}}
return send_key(msg.sender_user_id_,text,keyboard,nil,msg.id_)
else
redis:sadd(boss..'users',msg.sender_user_id_)
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
if SUDO_USER:match('@[%a%d_]+') then 
SUDO_USERR = "- مـعرف المـطـور  : "..SUDO_USER
else
SUDO_USERR = ""
end


text = [[- مـرحبا انا بوت اسـمـي []]..redis:get(boss..':NameBot:')..[[] 🎖
- اختصـاصـي حمـايه‏‏ المـجمـوعات
- مـن السـبام والتوجيه‏‏ والتكرار والخ...
- فقط المـطـور يسـتطـيع تفعيل البوت
]]..SUDO_USERR..[[

]]
GetUserID(msg.sender_user_id_,function(arg,data)
if data.last_name_ then Name = data.first_name_ .." "..data.last_name_ else Name = data.first_name_ end
text = redis:get(boss..':Text_Start') or text
local edited = (redis:get(boss..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local points = redis:get(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_) or 0
local Emsgs = redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
if data.username_ then UserNameID = "@"..data.username_ else UserNameID = "لا يوجد" end  
text = text:gsub("{الاسم}",Name)
text = text:gsub("{الايدي}",msg.sender_user_id_)
text = text:gsub("{المعرف}",UserNameID)
text = text:gsub("{الرتبه}",msg.TheRank)
text = text:gsub("{البوت}",redis:get(boss..':NameBot:'))
text = text:gsub("{المطور}",SUDO_USER)
text = text:gsub("{الردود}",RandomText())

xsudouser = SUDO_USER:gsub('@','')
xsudouser = xsudouser:gsub([[\_]],'_')
local inline = {{{text="المـطـور ™",url="t.me/"..xsudouser}}}
send_key(msg.sender_user_id_,Flter_Markdown(text),nil,inline,msg.id_)
end,nil)
return false
end
end

if msg.SudoBase then
if msg.text then 
if msg.text == "المحظورين" or msg.text == "المحظورين من التواصل" then 
return sendMsg(msg.chat_id_,0,GetListBannedpv(msg) )  
end
if msg.text == "مسح المحظورين" then 
redis:del(boss..'bannedpv')
return sendMsg(msg.chat_id_,0,'- تم مسح كل المحظورين ') 
end


if msg.text:match('^حظر @[%a%d_]+') and not msg.reply_id then 
local utext = msg.text:gsub("حظر ","")
GetUserName(utext,function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") 
elseif UserID == 656329268 or UserID == 1765160742 or UserID == 1714422669 then 
return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنك حظر مطور السورس ؛") 
end

redis:hset(boss..'username:'..UserID,'username',arg.UserName)
if redis:sismember(boss..'bannedpv',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 ["..arg.UserName.."] 」 \n-  تم بالتاكيد حظره  من التواصل") 
end
redis:sadd(boss..'bannedpv',UserID)
sendMsg(UserID,arg.MsgID,"-  تم حظرك من التواصل") 
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 ["..arg.UserName.."] 」 \n-  تم حظره  من التواصل") 
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=utext})
return false
end
--============================================================
if msg.text:match('^حظر %d+$') and not msg.reply_id then 
local itext = msg.text:gsub("حظر ","")
GetUserID(itext,function(arg,data)
local ChatID = arg.msg.chat_id_
local MsgID = arg.msg.id_
if not data.id_ then return sendMsg(ChatID,MsgID,"- العضو لا يوجد ") end
local UserID = data.id_
local Resolv = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if UserID == 656329268 or UserID == 1765160742 or UserID == 1714422669then 
return sendMsg(ChatID,MsgID,"- لا يمكنك حظر مطور السورس ؛") 
end
if redis:sismember(boss..'bannedpv',UserID) then 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم بالتاكيد حظره  من التواصل ") 
end
redis:hset(boss..'username:'..UserID, 'username', Resolv)
redis:sadd(boss..'bannedpv',UserID)
sendMsg(UserID,MsgID,"-  تم حظرك من التواصل") 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم حظره  من التواصل ") 
end,{msg=msg}) 
return false
end 
--============================================================
--============================================================

if msg.text:match('^الغاء الحظر @[%a%d_]+') and not msg.reply_id then 
local utext = msg.text:gsub("الغاء الحظر ","")
print(utext)
GetUserName(utext,function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو به‌‏ذا المـعرف - ") end 
local UserID = data.id_
NameUser = Hyper_Link_Name(data)
if data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") 
end
if not redis:sismember(boss..'bannedpv',UserID) then 
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 ["..arg.UserName.."] 」 \n-  تم بالتاكيد الغاء الحظر  من التواصل") 
end
redis:srem(boss..'bannedpv',UserID)
sendMsg(UserID,arg.MsgID,"-  تم الغاء حظرك من التواصل") 
return sendMsg(arg.ChatID,arg.MsgID,"- المستخدم  ⋙「 ["..arg.UserName.."] 」 \n-  تم الغاء الحظر  من التواصل") 
end,{ChatID=msg.chat_id_,MsgID=msg.id_,UserName=utext})
return false
end
--============================================================
if msg.text:match('^الغاء الحظر %d+$') and not msg.reply_id then 
local itext = msg.text:gsub("الغاء الحظر ","")
GetUserID(itext,function(arg,data)
local ChatID = arg.msg.chat_id_
local MsgID = arg.msg.id_
if not data.id_ then return sendMsg(ChatID,MsgID,"- العضو لا يوجد") end
local UserID = data.id_
local Resolv = ResolveUserName(data)
NameUser = Hyper_Link_Name(data)
if not redis:sismember(boss..'bannedpv',UserID) then 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم بالتاكيد الغاء الحظر  من التواصل ") 
end
redis:srem(boss..'bannedpv',UserID)
sendMsg(UserID,MsgID,"-  تم الغاء حظرك من التواصل") 
return sendMsg(ChatID,MsgID,"- المستخدم  ⋙「 "..NameUser.." 」 \n-  تم الغاء الحظر  من التواصل ") 
end,{msg=msg}) 
return false
end 
end 
--============================================================
--============================================================


if msg.reply_id then
GetMsgInfo(msg.chat_id_,msg.reply_id,function(arg,data)
if not data.forward_info_ then return false end
local FwdUser = data.forward_info_.sender_user_id_
local MSG_ID = (redis:get(boss.."USER_MSG_TWASEL"..data.forward_info_.date_) or 1)
msg = arg.msg
local SendOk = false
if data.content_.ID == "MessageDocument" then return false end
if msg.text then
if msg.text  == "حظر" then
GetUserID(FwdUser,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data,20) end
if FwdUser == 656329268 then 
return sendMsg(arg.ChatID,arg.id_,"- لا يمكنك حظر مطور السورس ؛") 
end
redis:hset(boss..'username:'..arg.FwdUser,'username',USERNAME)
if redis:sismember(boss..'bannedpv',FwdUser) then 
return sendMsg(arg.ChatID,arg.id_,"- المستخدم  ⋙「 ["..USERNAME.."] 」 \n-  تم بالتاكيد حظره  من التواصل") 
end
redis:sadd(boss..'bannedpv',arg.FwdUser)
sendMsg(arg.FwdUser,arg.id_,"-  تم حظرك من التواصل") 
return SendMention(arg.sender_user_id_,data.id_,arg.id_,"- تم حظر العضو \n- معرفه : "..USERNAME.." ",39,utf8.len(USERNAME)) 
end,{sender_user_id_=msg.sender_user_id_,ChatID=msg.chat_id_,FwdUser=FwdUser,id_=msg.id_})
return false
elseif msg.text == "الغاء الحظر" then
GetUserID(FwdUser,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data,20) end
if not redis:sismember(boss..'bannedpv',arg.sender_user_id_) then 
return sendMsg(arg.ChatID,arg.id_,"- المستخدم  ⋙「 ["..USERNAME.."] 」 \n-  تم بالتاكيد الغاء حظره  من التواصل") 
end
redis:srem(boss..'bannedpv',arg.sender_user_id_)
sendMsg(arg.sender_user_id_,arg.id_,"-  تم الغاء حظرك من التواصل") 
return SendMention(arg.ChatID,data.id_,arg.id_,"- تم الغاء حظر العضو \n- معرفه : "..USERNAME.." 🏌🏻",38,utf8.len(USERNAME)) 
end,{ChatID=msg.chat_id_,sender_user_id_=FwdUser,id_=msg.id_})
return false
end
sendMsg(FwdUser,MSG_ID,Flter_Markdown(msg.text))
SendOk = true
elseif msg.content_.ID == "MessageSticker" then
sendSticker(FwdUser,MSG_ID,msg.content_.sticker_.sticker_.persistent_id_,msg.content_.caption_ or '')
SendOk = true
elseif msg.content_.ID == "MessagePhoto" then
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
sendPhoto(FwdUser,MSG_ID,photo_id,msg.content_.caption_ or '')
SendOk = true
elseif msg.content_.ID == "MessageVoice" then
sendVoice(FwdUser,MSG_ID,msg.content_.voice_.voice_.persistent_id_,msg.content_.caption_ or '')
SendOk = true
elseif msg.content_.ID == "MessageAnimation" then
sendAnimation(FwdUser,MSG_ID,msg.content_.animation_.animation_.persistent_id_,msg.content_.caption_ or '')
SendOk = true
elseif msg.content_.ID == "MessageVideo" then
sendVideo(FwdUser,MSG_ID,msg.content_.video_.video_.persistent_id_,msg.content_.caption_ or '')
SendOk = true
elseif msg.content_.ID == "MessageAudio" then
sendAudio(FwdUser,MSG_ID,msg.content_.audio_.audio_.persistent_id_,msg.content_.caption_ or '')
SendOk = true
end
if SendOk then
GetUserID(FwdUser,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data,20) end
SendMention(arg.sender_user_id_,data.id_,arg.id_,"- تم ارسـال الرسـال‏‏ه \n- الى : "..USERNAME.." ",39,utf8.len(USERNAME)) 
end,{sender_user_id_=msg.sender_user_id_,id_=msg.id_})
end
end,{msg=msg})
end
else
if redis:sismember(boss..'bannedpv',msg.sender_user_id_) then  return false end

if not redis:get(boss..'lock_twasel') then
if msg.forward_info_ or msg.content_.ID == "MessageSticker" or msg.content_.ID == "MessageUnsupported" or msg.content_.ID == "MessageDocument" then
return sendMsg(msg.chat_id_,msg.id_,"- عذرا لا يمـكنك ارسـال {ملف , توجيه‌‏ , مـلصـق , فديو كام} ")
end
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
if SUDO_USER:match('@[%a%d_]+') then 
SUDO_USERR = "\n "..SUDO_USER
else
SUDO_USERR = ""
end
redis:setex(boss.."USER_MSG_TWASEL"..msg.date_,43200,msg.id_)
sendMsg(msg.chat_id_,msg.id_,"- تم ارسـال رسـالتك الى المـطـور\n- سـارد عليك في اقرب وقت["..SUDO_USERR.."]")
fwdMsg(SUDO_ID,msg.chat_id_,msg.id_)
return false
end
end
end

function CaptionInsert(msg,input,public)
if msg.content_ and msg.content_.caption_ then 
if public then
redis:hset(boss..':caption_replay:Random:'..msg.klma,input,msg.content_.caption_) 
else
redis:hset(boss..':caption_replay:Random:'..msg.chat_id_..msg.klma,input,msg.content_.caption_) 
end
end
end

--====================== Reply Random Public =====================================
if redis:get(boss..'addrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_) and redis:get(boss..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_) then
klma = redis:get(boss..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_)
msg.klma = klma
if msg.text == "تم" then
redis:del(boss..'addrdRandom1Public:'..msg.chat_id_..msg.sender_user_id_)
redis:del(boss..'addrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_)
sendMsg(msg.chat_id_,msg.id_,'- تم اضافه رد متعدد عشوائي بنجاح \n- يمكنك ارسال (['..klma..']) لاضهار الردود العشوائيه .')
redis:del(boss..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_)
return false
end

local CountRdod = redis:scard(boss..':ReplayRandom:'..klma) or 1
local CountRdod2 = 10 - tonumber(CountRdod)
local CountRdod = 9 - tonumber(CountRdod)
if CountRdod2 == 0 then 
redis:del(boss..'addrdRandom1Public:'..msg.chat_id_..msg.sender_user_id_)
redis:del(boss..'addrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_)
sendMsg(msg.chat_id_,msg.id_,'- وصلت الحد الاقصى لعدد الردود \n- تم اضافه الرد (['..klma..']) للردود العشوائيه .')
redis:del(boss..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_)
return false
end
if msg.text then 
if utf8.len(msg.text) > 4000 then 
return sendMsg(msg.chat_id_,msg.id_,"- عذرا غير مسموح باضافه جواب الرد باكثر من 4000 حرف تم الغاء الامر ")
end
CaptionInsert(msg,msg.text,true)
redis:sadd(boss..':KlmatRRandom:',klma) 
redis:sadd(boss..':ReplayRandom:'..klma,":Text:"..msg.text) 
return sendMsg(msg.chat_id_,msg.id_,'تم ادراج الرد باقي '..CountRdod..'\n تم ادراج الرد ارسل رد اخر او ارسل {تم} ')
elseif msg.content_.ID == "MessagePhoto" then
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
redis:sadd(boss..':KlmatRRandom:',klma) 
redis:sadd(boss..':ReplayRandom:'..klma,":Photo:"..photo_id) 
CaptionInsert(msg,photo_id,true)
return sendMsg(msg.chat_id_,msg.id_,'- تم ادراج صور للرد باقي '..CountRdod..' \n- ارسل رد اخر او ارسل {تم} .')
elseif msg.content_.ID == "MessageVoice" then
redis:sadd(boss..':KlmatRRandom:',klma) 
redis:sadd(boss..':ReplayRandom:'..klma,":Voice:"..msg.content_.voice_.voice_.persistent_id_) 
CaptionInsert(msg,msg.content_.voice_.voice_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'- تم ادراج البصمه للرد باقي '..CountRdod..' \n-  ارسل رد اخر او ارسل {تم}')
elseif msg.content_.ID == "MessageAnimation" then
redis:sadd(boss..':KlmatRRandom:',klma) 
redis:sadd(boss..':ReplayRandom:'..klma,":Animation:"..msg.content_.animation_.animation_.persistent_id_) 
CaptionInsert(msg,msg.content_.animation_.animation_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'- تم ادراج المتحركه للرد باقي '..CountRdod..' \n- ارسل رد اخر او ارسل {تم} .')
elseif msg.content_.ID == "MessageVideo" then
redis:sadd(boss..':KlmatRRandom:',klma) 
redis:sadd(boss..':ReplayRandom:'..klma,":Video:"..msg.content_.video_.video_.persistent_id_) 
CaptionInsert(msg,msg.content_.video_.video_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'- تم ادراج الفيديو للرد باقي '..CountRdod..' \n- ارسل رد اخر او ارسل {تم} .')
elseif msg.content_.ID == "MessageAudio" then
redis:sadd(boss..':KlmatRRandom:',klma) 
redis:sadd(boss..':ReplayRandom:'..klma,":Audio:"..msg.content_.audio_.audio_.persistent_id_) 
CaptionInsert(msg,msg.content_.audio_.audio_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'- تم ادراج الصوت للرد باقي '..CountRdod..' \n- ارسل رد اخر او ارسل {تم} .')
elseif msg.content_.ID == "MessageDocument" then
redis:sadd(boss..':KlmatRRandom:',klma) 
redis:sadd(boss..':ReplayRandom:'..klma,":Document:"..msg.content_.document_.document_.persistent_id_) 
CaptionInsert(msg,msg.content_.document_.document_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'- تم ادراج الملف للرد باقي '..CountRdod..' \n- ارسل رد اخر او ارسل {تم} .')  
elseif msg.content_.ID == "MessageSticker" then
redis:sadd(boss..':KlmatRRandom:',klma) 
redis:sadd(boss..':ReplayRandom:'..klma,":Sticker:"..msg.content_.sticker_.sticker_.persistent_id_) 
CaptionInsert(msg,msg.content_.sticker_.sticker_.persistent_id_,true)
return sendMsg(msg.chat_id_,msg.id_,'- تم ادراج الملصق للرد باقي '..CountRdod..' \n- ارسل رد اخر او ارسل {تم} .')
end  

end
--====================== End Reply Random Public =====================================
--====================== Reply Random Only Group =====================================
if redis:get(boss..'addrdRandom:'..msg.chat_id_..msg.sender_user_id_) and redis:get(boss..'replay1Random'..msg.chat_id_..msg.sender_user_id_) then
klma = redis:get(boss..'replay1Random'..msg.chat_id_..msg.sender_user_id_)
msg.klma = klma
if msg.text == "تم" then
redis:del(boss..'addrdRandom1:'..msg.chat_id_..msg.sender_user_id_)
redis:del(boss..'addrdRandom:'..msg.chat_id_..msg.sender_user_id_)
sendMsg(msg.chat_id_,msg.id_,'- تم اضافه رد متعدد عشوائي بنجاح \n- يمكنك ارسال (['..klma..']) لاضهار الردود العشوائيه .')
redis:del(boss..'replay1Random'..msg.chat_id_..msg.sender_user_id_)
return false
end

local CountRdod = redis:scard(boss..':ReplayRandom:'..msg.chat_id_..":"..klma) or 1
local CountRdod2 = 10 - tonumber(CountRdod)
local CountRdod = 9 - tonumber(CountRdod)
if CountRdod2 == 0 then 
redis:del(boss..'addrdRandom1:'..msg.chat_id_..msg.sender_user_id_)
redis:del(boss..'addrdRandom:'..msg.chat_id_..msg.sender_user_id_)
sendMsg(msg.chat_id_,msg.id_,'- وصلت الحد الاقصى لعدد الردود \n- تم اضافه الرد (['..klma..']) للردود العشوائيه .')
redis:del(boss..'replay1Random'..msg.chat_id_..msg.sender_user_id_)
return false
end
if msg.text then 
if utf8.len(msg.text) > 4000 then 
return sendMsg(msg.chat_id_,msg.id_,"- عذرا غير مسموح باضافه جواب الرد باكثر من 4000 حرف تم الغاء الامر\n")
end
CaptionInsert(msg,msg.text,false)
redis:sadd(boss..':KlmatRRandom:'..msg.chat_id_,klma) 
redis:sadd(boss..':ReplayRandom:'..msg.chat_id_..":"..klma,":Text:"..msg.text) 
return sendMsg(msg.chat_id_,msg.id_,'تم ادراج الرد باقي '..CountRdod..'\n تم ادراج الرد ارسل رد اخر او ارسل {تم} \n')
elseif msg.content_.ID == "MessagePhoto" then
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
redis:sadd(boss..':KlmatRRandom:'..msg.chat_id_,klma) 
redis:sadd(boss..':ReplayRandom:'..msg.chat_id_..":"..klma,":Photo:"..photo_id) 
CaptionInsert(msg,photo_id,false)
return sendMsg(msg.chat_id_,msg.id_,'- تم ادراج صور للرد باقي '..CountRdod..' \n- ارسل رد اخر او ارسل {تم} .')
elseif msg.content_.ID == "MessageVoice" then
redis:sadd(boss..':KlmatRRandom:'..msg.chat_id_,klma) 
redis:sadd(boss..':ReplayRandom:'..msg.chat_id_..":"..klma,":Voice:"..msg.content_.voice_.voice_.persistent_id_) 
CaptionInsert(msg,msg.content_.voice_.voice_.persistent_id_,false)
return sendMsg(msg.chat_id_,msg.id_,'- تم ادراج البصمه للرد باقي '..CountRdod..' \n-  ارسل رد اخر او ارسل {تم}')
elseif msg.content_.ID == "MessageAnimation" then
redis:sadd(boss..':KlmatRRandom:'..msg.chat_id_,klma) 
redis:sadd(boss..':ReplayRandom:'..msg.chat_id_..":"..klma,":Animation:"..msg.content_.animation_.animation_.persistent_id_) 
CaptionInsert(msg,msg.content_.animation_.animation_.persistent_id_,false)
return sendMsg(msg.chat_id_,msg.id_,'- تم ادراج المتحركه للرد باقي '..CountRdod..' \n- ارسل رد اخر او ارسل {تم} .')
elseif msg.content_.ID == "MessageVideo" then
redis:sadd(boss..':KlmatRRandom:'..msg.chat_id_,klma) 
redis:sadd(boss..':ReplayRandom:'..msg.chat_id_..":"..klma,":Video:"..msg.content_.video_.video_.persistent_id_) 
CaptionInsert(msg,msg.content_.video_.video_.persistent_id_,false)
return sendMsg(msg.chat_id_,msg.id_,'- تم ادراج الفيديو للرد باقي '..CountRdod..' \n- ارسل رد اخر او ارسل {تم} .')
elseif msg.content_.ID == "MessageAudio" then
redis:sadd(boss..':KlmatRRandom:'..msg.chat_id_,klma) 
redis:sadd(boss..':ReplayRandom:'..msg.chat_id_..":"..klma,":Audio:"..msg.content_.audio_.audio_.persistent_id_) 
CaptionInsert(msg,msg.content_.audio_.audio_.persistent_id_,false)
return sendMsg(msg.chat_id_,msg.id_,'- تم ادراج الصوت للرد باقي '..CountRdod..' \n- ارسل رد اخر او ارسل {تم} .')
elseif msg.content_.ID == "MessageDocument" then
redis:sadd(boss..':KlmatRRandom:'..msg.chat_id_,klma) 
redis:sadd(boss..':ReplayRandom:'..msg.chat_id_..":"..klma,":Document:"..msg.content_.document_.document_.persistent_id_) 
CaptionInsert(msg,msg.content_.document_.document_.persistent_id_,false)
return sendMsg(msg.chat_id_,msg.id_,'- تم ادراج الملف للرد باقي '..CountRdod..' \n- ارسل رد اخر او ارسل {تم} .')  
elseif msg.content_.ID == "MessageSticker" then
redis:sadd(boss..':KlmatRRandom:'..msg.chat_id_,klma) 
redis:sadd(boss..':ReplayRandom:'..msg.chat_id_..":"..klma,":Sticker:"..msg.content_.sticker_.sticker_.persistent_id_) 
CaptionInsert(msg,msg.content_.sticker_.sticker_.persistent_id_,false)
return sendMsg(msg.chat_id_,msg.id_,'- تم ادراج الملصق للرد باقي '..CountRdod..' \n- ارسل رد اخر او ارسل {تم} .')
end  

end
--====================== End Reply Random Only Group =====================================


--====================== Reply Only Group =====================================
if redis:get(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_) and redis:get(boss..'replay1'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(boss..'replay1'..msg.chat_id_..msg.sender_user_id_)
if msg.content_ and msg.content_.caption_ then redis:hset(boss..':caption_replay:'..msg.chat_id_,klma,msg.content_.caption_) end
if msg.text then 
redis:del(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_)
if utf8.len(msg.text) > 4000 then 
return sendMsg(msg.chat_id_,msg.id_,"- عذرا غير مسموح باضافه جواب الرد باكثر من 4000 حرف تم الغاء الامر ")
end
redis:hset(boss..'replay:'..msg.chat_id_,klma,msg.text)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n   تم اضافت الرد')
elseif msg.content_.ID == "MessagePhoto" then
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
redis:hset(boss..'replay_photo:group:'..msg.chat_id_,klma,photo_id)
redis:del(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'- تم اضافه صوره للرد بنجاح \n- يمكنك ارسال (['..klma..']) لاضهار الصوره الاتيه .')
elseif msg.content_.ID == "MessageVoice" then
redis:hset(boss..'replay_voice:group:'..msg.chat_id_,klma,msg.content_.voice_.voice_.persistent_id_)
redis:del(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'- تم اضافه بصمه صوت للرد بنجاح \n- يمكنك ارسال (['..klma..']) لسماع البصمه الاتيه .')
elseif msg.content_.ID == "MessageAnimation" then
redis:hset(boss..'replay_animation:group:'..msg.chat_id_,klma,msg.content_.animation_.animation_.persistent_id_)
redis:del(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'- تم اضافه متحركه للرد بنجاح \n- يمكنك ارسال (['..klma..']) لاضهار الصوره الاتيه .')
elseif msg.content_.ID == "MessageVideo" then
redis:hset(boss..'replay_video:group:'..msg.chat_id_,klma,msg.content_.video_.video_.persistent_id_)
redis:del(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'- تم اضافه فيديو للرد بنجاح \n- يمكنك ارسال (['..klma..']) لاضهار الفيديو الاتي .')
elseif msg.content_.ID == "MessageAudio" then
redis:hset(boss..'replay_audio:group:'..msg.chat_id_,klma,msg.content_.audio_.audio_.persistent_id_)
redis:del(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'- تم اضافه للصوت للرد بنجاح \n- يمكنك ارسال (['..klma..']) لاضهار الصوت الاتي .')
elseif msg.content_.ID == "MessageDocument" then
redis:hset(boss..'replay_files:group:'..msg.chat_id_,klma,msg.content_.document_.document_.persistent_id_ )
redis:del(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'- تم اضافه ملف للرد بنجاح \n- يمكنك ارسال (['..klma..']) لاضهار الملف الاتي .')  
elseif msg.content_.ID == "MessageSticker" then
redis:hset(boss..'replay_sticker:group:'..msg.chat_id_,klma,msg.content_.sticker_.sticker_.persistent_id_)
redis:del(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'- تم اضافه ملصق للرد بنجاح \n- يمكنك ارسال (['..klma..']) لاضهار الملصق الاتي .')
end  

end

--====================== Reply All Groups =====================================
if redis:get(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) and redis:get(boss..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then
local klma = redis:get(boss..'allreplay:'..msg.chat_id_..msg.sender_user_id_)
if msg.content_.caption_ then redis:hset(boss..':caption_replay:',klma,msg.content_.caption_) end
if msg.text then
redis:del(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
if utf8.len(msg.text) > 4000 then 
return sendMsg(msg.chat_id_,msg.id_,"- عذرا غير مسموح باضافه جواب الرد باكثر من 4000 حرف تم الغاء الامر ")
end
redis:hset(boss..'replay:all',klma,msg.text)
return sendMsg(msg.chat_id_,msg.id_,'(['..klma..'])\n   تم اضافت الرد لكل المجموعات ')
elseif msg.content_.ID == "MessagePhoto" then 
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
redis:hset(boss..'replay_photo:group:',klma,photo_id)
redis:del(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'- تم اضافه صوره للرد العام \n- يمكنك ارسال (['..klma..']) لاضهار الصوره الاتيه .')
elseif msg.content_.ID == "MessageVoice" then
redis:hset(boss..'replay_voice:group:',klma,msg.content_.voice_.voice_.persistent_id_)
redis:del(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'- تم اضافه بصمه صوت للرد العام \n- يمكنك ارسال (['..klma..']) لسماع البصمه الاتيه .')
elseif msg.content_.ID == "MessageAnimation" then
redis:hset(boss..'replay_animation:group:',klma,msg.content_.animation_.animation_.persistent_id_)
redis:del(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'- تم اضافه متحركه للرد العام \n- يمكنك ارسال (['..klma..']) لاضهار الصوره الاتيه .')
elseif msg.content_.ID == "MessageVideo" then
redis:hset(boss..'replay_video:group:',klma,msg.content_.video_.video_.persistent_id_)
redis:del(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'- تم اضافه فيديو للرد العام \n- يمكنك ارسال (['..klma..']) لاضهار الفيديو الاتي .')
elseif msg.content_.ID == "MessageAudio" then
redis:hset(boss..'replay_audio:group:',klma,msg.content_.audio_.audio_.persistent_id_)
redis:del(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'- تم اضافه للصوت للرد العام \n- يمكنك ارسال (['..klma..']) لاضهار الصوت الاتي .')
elseif msg.content_.ID == "MessageDocument" then
redis:hset(boss..'replay_files:group:',klma,msg.content_.document_.document_.persistent_id_ )
redis:del(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'- تم اضافه ملف للرد العام \n- يمكنك ارسال (['..klma..']) لاضهار ملف الاتي .')  
elseif msg.content_.ID == "MessageSticker" then
redis:hset(boss..'replay_sticker:group:',klma,msg.content_.sticker_.sticker_.persistent_id_)
redis:del(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,'- تم اضافه ملصق للرد العام \n- يمكنك ارسال (['..klma..']) لاضهار الملصق الاتي .')
end  

end

if msg.text then
--====================== Requst UserName Of Channel For ForceSub ==============

if msg.Director and (msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.text:match("[Hh][Tt][Tt][Pp]://") or msg.text:match("[Ww][Ww][Ww].") or msg.text:match(".[Cc][Oo][Mm]") or msg.text:match(".[Oo][Rr][Gg]")) and redis:get(boss.."WiCmdLink"..msg.chat_id_..msg.sender_user_id_) then 
redis:del(boss.."WiCmdLink"..msg.chat_id_..msg.sender_user_id_)
redis:set(boss..'linkGroup'..msg.chat_id_,msg.text)
sendMsg(msg.chat_id_,msg.id_,"- تم تعيين الرابط بنجاح  ")
return false
end

if msg.Creator and redis:get(boss..":Witting_KleshaID_public"..msg.chat_id_..msg.sender_user_id_) then 
redis:del(boss..":Witting_KleshaID_public"..msg.chat_id_..msg.sender_user_id_)
redis:set(boss..":infoiduser_public:"..msg.chat_id_,msg.text)
sendMsg(msg.chat_id_,msg.id_,"- تم تعيين كليشة الايدي بنجاح \n- يمكنك تجربة الامر الان ")
return false
end

if msg.SuperCreator and redis:get(boss..":uploadingsomeon:"..msg.chat_id_..msg.sender_user_id_) then 

NameUser = redis:get(boss..":uploadingsomeon:"..msg.chat_id_..msg.sender_user_id_)
UserID = redis:get(boss..":uploadingsomeon2:"..msg.chat_id_..msg.sender_user_id_)
if not msg.text:match("[1234567]") and not msg.text:match("[*]") and not msg.text:match("[*][*]") then
redis:del(boss..":uploadingsomeon:"..msg.chat_id_..msg.sender_user_id_)
redis:del(boss..":uploadingsomeon2:"..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم الغاء الامر , يجب ان يحتوي رسالتك ع ارقام الصلاحيات المعروضه . ")   
end

Nikname = msg.text:gsub("[1234567]","")
Nikname = Nikname:gsub("[*]","")
ResAdmin = UploadAdmin(msg.chat_id_,UserID,msg.text)  
if ResAdmin == '{"ok":false,"error_code":400,"description":"Bad Request: not enough rights"}' then
sendMsg(msg.chat_id_,msg.id_,"- عذرا البوت ليس لديه صلاحيه رفع مشرفين في المجموعه ") 
elseif ResAdmin == '{"ok":false,"error_code":400,"description":"Bad Request: can\'t remove chat owner"}' then
sendMsg(msg.chat_id_,msg.id_,"- عذرا لا يمكنني التحكم بصلاحيات المنشئ للمجموعه. ") 
elseif ResAdmin == '{"ok":false,"error_code":400,"description":"Bad Request: CHAT_ADMIN_REQUIRED"}' then
sendMsg(msg.chat_id_,msg.id_,"- عذرا لا يمكنني التحكم بصلاحيات المشرف مرفوع من قبل منشئ اخر . ") 
elseif ResAdmin == '{"ok":true,"result":true}' then
ChangeNikname(msg.chat_id_,UserID,Nikname)
redis:sadd(boss..'admins:'..msg.chat_id_,UserID)
local trues = "✓"
local falses = "✖️"

infochange = falses
infochange1 = falses
infochange2 = falses
infochange3 = falses
infochange4 = falses
infochange5 = falses
if msg.text:match(1) then
infochange = trues
end
if msg.text:match(2) then
infochange1 = trues
end
if msg.text:match(3) then
infochange2 = trues
end
if msg.text:match(4) then
infochange3 = trues
end
if msg.text:match(5) then
infochange4 = trues
end
if msg.text:match(6) then
infochange5 = trues
end
if msg.text:match("[*][*]") then
infochange = trues
infochange1 = trues
infochange2 = trues
infochange3 = trues
infochange4 = trues
infochange5 = trues
elseif msg.text:match("[*]") then
infochange = trues
infochange1 = trues
infochange2 = trues
infochange3 = trues
infochange4 = trues
end

if Nikname == "" then Nikname = "بدون" end
sendMsg(msg.chat_id_,msg.id_,"- المشرف  ⋙ 「 "..NameUser.." 」 صلاحياته : \n\n"
.."- تغيير معلومات المجموعه : "..infochange.."\n"
.."- صلاحيه حذف الرسائل : "..infochange1.."\n"
.."- صلاحيه دعوه مستخدمين : "..infochange2.."\n"
.."- صلاحيه حظر وتقيد المستخدمين : "..infochange3.."\n"
.."- صلاحيه تثبيت الرسائل : "..infochange4.."\n"
.."- صلاحيه رفع مشرفين اخرين : "..infochange5.."\n\n"
.."- الـكـنـيـة : ["..Nikname.."]\n"
.."") 
else
sendMsg(msg.chat_id_,msg.id_,"- المشرف  ⋙ 「 "..NameUser.." 」  حدث خطا ما ") 
end
redis:del(boss..":uploadingsomeon:"..msg.chat_id_..msg.sender_user_id_)
redis:del(boss..":uploadingsomeon2:"..msg.chat_id_..msg.sender_user_id_)
return false
end


if msg.Creator and redis:get(boss..":changawmer:"..msg.chat_id_..msg.sender_user_id_) and not redis:get(boss..":Witting_awamr_witting"..msg.chat_id_..msg.sender_user_id_) then 
if msg.text=="م1" or msg.text=="م2" or msg.text=="م3" or msg.text=="م المطور" or msg.text=="اوامر الرد" or msg.text=="الاوامر" or msg.text=="اوامر الملفات" then return false end
local amr = redis:get(boss..":changawmer:"..msg.chat_id_..msg.sender_user_id_)
if amr == "م1" then
redis:set(boss..":awamer_Klesha_m1:",msg.text)
elseif amr == "م2" then
redis:set(boss..":awamer_Klesha_m2:",msg.text)
elseif amr == "م3" then
redis:set(boss..":awamer_Klesha_m3:",msg.text)
elseif amr == "م المطور" then
redis:set(boss..":awamer_Klesha_mtwr:",msg.text)
elseif amr == "اوامر الرد" then
redis:set(boss..":awamer_Klesha_mrd:",msg.text)
elseif amr == "اوامر الملفات" then
redis:set(boss..":awamer_Klesha_mf:",msg.text)
elseif amr == "الاوامر" then
redis:set(boss..":awamer_Klesha_m:",msg.text)
end
redis:del(boss..":changawmer:"..msg.chat_id_..msg.sender_user_id_)
return sendMsg(msg.chat_id_,msg.id_,"- تم تعيين كليشة التعليمات بنجاح \n- يمكنك تجربة الامر *{"..amr.."}* ")
end


if msg.SudoUser and redis:get(boss..":Witting_KleshaID"..msg.chat_id_..msg.sender_user_id_) then 
redis:del(boss..":Witting_KleshaID"..msg.chat_id_..msg.sender_user_id_)
redis:set(boss..":infoiduser",msg.text)
sendMsg(msg.chat_id_,msg.id_,"- تم تعيين كليشة الايدي بنجاح \n- يمكنك تجربة الامر الان ")
return false
end

--==========================================================================================================

if msg.Director and redis:get(boss..":Witting_changeamr:"..msg.chat_id_..msg.sender_user_id_) then
local Awammer 	= redis:hgetall(boss..":AwamerBotArray2:"..msg.chat_id_)
Amr = redis:get(boss..":Witting_changeamr:"..msg.chat_id_..msg.sender_user_id_)
checknewamr = false

for name,Course in pairs(Awammer) do
if name == msg.text then 
checknewamr = true 
end 
end
if checknewamr  then
sendMsg(msg.chat_id_,msg.id_,"- عذرا لايمكن اضافه امر مكرر في القائمه")
else
for k, Boss in pairs(XBoss) do 
local cceck,sec = Boss:gsub("[(]"..Amr.."[)]","("..msg.text..")")
print(cceck,sec)
if sec ~= 0 then
redis:hset(boss..":AwamerBotArray:"..msg.chat_id_,cceck,Boss)
redis:hset(boss..":AwamerBotArray2:"..msg.chat_id_,msg.text,Amr)
end
end  
redis:hset(boss..":AwamerBot:"..msg.chat_id_,msg.text,Amr)
sendMsg(msg.chat_id_,msg.id_,"- تم تغيير الامر القديم ["..Amr.."] \n- الى الامر الجديد ["..msg.text.."] ")
end
redis:del(boss..":Witting_changeamr:"..msg.chat_id_..msg.sender_user_id_)
return false
end

if msg.Director and not redis:get(boss..":Witting_changeamr2:"..msg.chat_id_..msg.sender_user_id_) and redis:get(boss..":firstAmrOld:"..msg.chat_id_..msg.sender_user_id_) then
local Awammer 	= redis:hgetall(boss..":AwamerBotArray2:"..msg.chat_id_)
local Amr = redis:get(boss..":firstAmrOld:"..msg.chat_id_..msg.sender_user_id_)

local checknewamr = false

for name,Course in pairs(Awammer) do if name == msg.text then checknewamr = true end end 
if checknewamr  then
sendMsg(msg.chat_id_,msg.id_,"- عذرا لايمكن اضافه امر مكرر في القائمه ")
else
for k, Boss in pairs(XBoss) do 
local cceck,sec = Boss:gsub("[(]"..Amr.."[)]","("..msg.text..")")
if sec ~= 0 then
redis:hset(boss..":AwamerBotArray:"..msg.chat_id_,cceck,Boss) 
redis:hset(boss..":AwamerBotArray2:"..msg.chat_id_,msg.text,Amr)
end
end 
redis:hset(boss..":AwamerBot:"..msg.chat_id_,msg.text,Amr)
sendMsg(msg.chat_id_,msg.id_,"- تم تغيير الامر القديم ["..Amr.."] \n- الى الامر الجديد ["..msg.text.."] ")
end
redis:del(boss..":firstAmrOld:"..msg.chat_id_..msg.sender_user_id_)
return false
end

if msg.Director and redis:get(boss..":Witting_changeamr2:"..msg.chat_id_..msg.sender_user_id_) then
local checkAmr = false
for k, Boss in pairs(XBoss) do if msg.text:match(Boss) then checkAmr = true end end      
if checkAmr then
sendMsg(msg.chat_id_,msg.id_,"- حسننا عزيزي , لتغير امر {* "..msg.text.." *} \n꒐ ارسل الامر الجديد الان ")
redis:setex(boss..":firstAmrOld:"..msg.chat_id_..msg.sender_user_id_,900,msg.text)
else
sendMsg(msg.chat_id_,msg.id_,"- عذرا لا يوجد هذا الامر في البوت لتتمكن من تغييره  \n")
end
redis:del(boss..":Witting_changeamr2:"..msg.chat_id_..msg.sender_user_id_)
return false
end


if msg.SudoUser and msg.text and redis:get(boss..":Witing_DelNewRtba:"..msg.chat_id_..msg.sender_user_id_) then 
redis:del(boss..":Witing_DelNewRtba:"..msg.chat_id_..msg.sender_user_id_)

if msg.text ~= "مطور اساسي" and msg.text ~= "مطور" and msg.text ~= "منشئ اساسي" and msg.text ~= "منشئ" and msg.text ~= "مدير" and msg.text ~= "ادمن" and msg.text ~= "مميز" then
sendMsg(msg.chat_id_,msg.id_,"عذرا هذه الرتبه غير متوفره في السورس \n-  تم الغاء الامر")
return false
end

if msg.text == "مطور اساسي" then
redis:del(boss..":RtbaNew1:"..msg.chat_id_)
elseif msg.text == "مطور" then
redis:del(boss..":RtbaNew2:"..msg.chat_id_)
elseif msg.text == "مالك" then
redis:del(boss..":RtbaNew8:"..msg.chat_id_)
elseif msg.text == "منشئ اساسي" then
redis:del(boss..":RtbaNew3:"..msg.chat_id_)
elseif msg.text == "منشئ" then
redis:del(boss..":RtbaNew4:"..msg.chat_id_)
elseif msg.text == "مدير" then
redis:del(boss..":RtbaNew5:"..msg.chat_id_)
elseif msg.text == "ادمن" then
redis:del(boss..":RtbaNew6:"..msg.chat_id_)
elseif msg.text == "مميز" then
redis:del(boss..":RtbaNew7:"..msg.chat_id_)
end

sendMsg(msg.chat_id_,msg.id_,"- تم حذف الرتبه المضافه")
return false
end

if msg.SudoUser and msg.text and redis:get(boss..":Witing_NewRtba:"..msg.chat_id_..msg.sender_user_id_) then 
redis:del(boss..":Witing_NewRtba:"..msg.chat_id_..msg.sender_user_id_)

if msg.text ~= "مطور اساسي" and msg.text ~= "مالك"  and msg.text ~= "مطور" and msg.text ~= "منشئ اساسي" and msg.text ~= "منشئ" and msg.text ~= "مدير" and msg.text ~= "ادمن" and msg.text ~= "مميز" then
sendMsg(msg.chat_id_,msg.id_,"عذرا هذه الرتبه غير متوفره في السورس \n- تم الغاء الامر")
return false
end

redis:setex(boss..":Witting_NewRtba2:"..msg.chat_id_..msg.sender_user_id_,1000,msg.text)
sendMsg(msg.chat_id_,msg.id_,"- الان ارسل الرتبه الجديده")
return false
end


if msg.SudoUser and msg.text and redis:get(boss..":Witting_NewRtba2:"..msg.chat_id_..msg.sender_user_id_) then 


local rtbanamenew = redis:get(boss..":Witting_NewRtba2:"..msg.chat_id_..msg.sender_user_id_)
if rtbanamenew == "مطور اساسي" then
redis:set(boss..":RtbaNew1:"..msg.chat_id_,msg.text)
elseif rtbanamenew == "مطور" then
redis:set(boss..":RtbaNew2:"..msg.chat_id_,msg.text)
elseif rtbanamenew == "مالك" then
redis:set(boss..":RtbaNew8:"..msg.chat_id_,msg.text)
elseif rtbanamenew == "منشئ اساسي" then
redis:set(boss..":RtbaNew3:"..msg.chat_id_,msg.text)
elseif rtbanamenew == "منشئ" then
redis:set(boss..":RtbaNew4:"..msg.chat_id_,msg.text)
elseif rtbanamenew == "مدير" then
redis:set(boss..":RtbaNew5:"..msg.chat_id_,msg.text)
elseif rtbanamenew == "ادمن" then
redis:set(boss..":RtbaNew6:"..msg.chat_id_,msg.text)
elseif rtbanamenew == "مميز" then
redis:set(boss..":RtbaNew7:"..msg.chat_id_,msg.text)
end

redis:del(boss..":Witting_NewRtba2:"..msg.chat_id_..msg.sender_user_id_)
sendMsg(msg.chat_id_,msg.id_,"- تم تغيير الرتبه بنجاح  \n\n•  ["..rtbanamenew.."] ◁ ["..msg.text.."]\n")
return false
end


if msg.Director and redis:get(boss..":Witting_AmrDel:"..msg.chat_id_..msg.sender_user_id_) then
local checkk = redis:hdel(boss..":AwamerBotArray2:"..msg.chat_id_,msg.text)

local AmrOld = redis:hgetall(boss..":AwamerBotArray:"..msg.chat_id_)
amrnew = ""
amrold = ""
amruser = msg.text.." @user"
amrid = msg.text.." 23434"
amrklma = msg.text.." ffffff"
amrfile = msg.text.." fff.lua"
for Amor,ik in pairs(AmrOld) do
if msg.text:match(Amor) then			
print("꒐AMrnew : "..Amor,"꒐AMrOld : "..ik)
redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
elseif amruser:match(Amor) then
print("꒐AMrnew : "..Amor,"꒐AMrOld : "..ik)
redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
elseif amrid:match(Amor) then
print("꒐AMrnew : "..Amor,"꒐AMrOld : "..ik)
redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
elseif amrklma:match(Amor) then
print("꒐AMrnew : "..Amor,"꒐AMrOld : "..ik)
redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
elseif amrfile:match(Amor) then
print("꒐AMrnew : "..Amor,"꒐AMrOld : "..ik)
redis:hdel(boss..":AwamerBotArray:"..msg.chat_id_,Amor)
end
end

if checkk ~=0 then
tiires =  "- تم مسح الامر {* "..msg.text.." *} من قائمه الاومر "
else
tiires = "- هذا الامر ليس موجود ضمن الاوامر المضافه "
end
sendMsg(msg.chat_id_,msg.id_,tiires)
redis:del(boss..":Witting_AmrDel:"..msg.chat_id_..msg.sender_user_id_)
return false
end

--==========================================================================================================

if msg.Director and redis:get(boss..":Witting_AmrDel:"..msg.chat_id_..msg.sender_user_id_) then

local checkk = redis:hdel(boss..":AwamerBot:"..msg.chat_id_,msg.text)
if checkk ~=0 then
tiires =  "- تم مسح الامر {* "..msg.text.." *} من قائمه الاومر "
else
tiires = "- هذا الامر ليس موجود ضمن الاوامر المضافه "
end
sendMsg(msg.chat_id_,msg.id_,tiires)
redis:del(boss..":Witting_AmrDel:"..msg.chat_id_..msg.sender_user_id_)
return false
end


if msg.SudoBase and redis:get(boss..":Witting_MoveBot:"..msg.chat_id_..msg.sender_user_id_) then
if msg.text:match("^@[%a%d_]+$") then
GetUserName(msg.text,function(arg,data)
if not data.id_ then return sendMsg(arg.ChatID,arg.MsgID,"- لا يوجد عضـو بهذا المعرف") end 
if data.type_.user_ and data.type_.user_.type_.ID == "UserTypeBot" then return sendMsg(arg.ChatID,arg.MsgID,"- لا يمكنني رفع حساب بوت") end 
local UserID = data.id_
if UserID == our_id then 
return sendMsg(arg.ChatID,arg.MsgID,"- عذرا لا يمكنني رفع البوت") 
elseif data.type_.ID == "ChannelChatInfo" then 
return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا معرف قناة وليس حساب ؛") 
end
if CheckUserinstall(arg.USERNAME) then return sendMsg(arg.ChatID,arg.MsgID,"- عذرا هذا الحساب محظور من سيرفرات حماية اباظة ") end
redis:set(boss..":SUDO_ID:",UserID)
local usero = arg.USERNAME:gsub([[\_]],"_")
redis:hset(boss..'username:'..UserID,'username',usero)
sendMsg(msg.chat_id_,msg.id_,"- تمت العملية بنجاح وتم تحويل ملكية البوت \n- الى الحساب الاتي : ["..arg.USERNAME:gsub([[\_]],"_").."]")
dofile("./inc/Run.lua")
print("Update Source And Reload ~ ./inc/Run.lua And change username sudo")
end,{ChatID=msg.chat_id_,MsgID=msg.id_,USERNAME=msg.text})

else
sendMsg(msg.chat_id_,msg.id_,"- عذرا , هناك خطا لديك \n- هذا ليس معرف مستخدم ولا يحتوي على @  .")
end
redis:del(boss..":Witting_MoveBot:"..msg.chat_id_..msg.sender_user_id_)
return false 
end


if redis:get(boss..":ForceSub:"..msg.sender_user_id_) then
redis:del(boss..":ForceSub:"..msg.sender_user_id_)
if msg.text:match("^@[%a%d_]+$") then
local url , res = https.request(ApiToken..'/getchatmember?chat_id='..msg.text..'&user_id='..msg.sender_user_id_)
if res == 400 then
local Req = JSON.decode(url)
if Req.description == "Bad Request: chat not found" then 
sendMsg(msg.chat_id_,msg.id_,"- عذرا , هناك خطا لديك \n- المعرف الذي ارسلته ليس معرف قناة.")
return false
elseif Req.description == "Bad Request: user not found" then
sendMsg(msg.chat_id_,msg.id_,"- عذرا , لقد نسيت شيئا \n- يجب رفع البوت مشرف في قناتك لتتمكن من تفعيل الاشتراك الاجباري .")
elseif Req.description == "Bad Request: CHAT_ADMIN_REQUIRED" then
sendMsg(msg.chat_id_,msg.id_,"- عذرا , لقد نسيت شيئا \n- يجب رفع البوت مشرف في قناتك لتتمكن من تفعيل الاشتراك الاجباري .")
return false
end
else
redis:set(boss..":UserNameChaneel",msg.text)
sendMsg(msg.chat_id_,msg.id_,"- جـيـد , الان لقد تم تفعيل الاشتراك الاجباري\n- على قناتك : ["..msg.text.."]")
return false
end
else
sendMsg(msg.chat_id_,msg.id_,"- عذرا , عزيزي المطور \n- هذا ليس معرف قناة , حاول مجددا .")
return false
end
end

if redis:get(boss..'namebot:witting'..msg.sender_user_id_) then --- استقبال اسم البوت 
redis:del(boss..'namebot:witting'..msg.sender_user_id_)
redis:set(boss..':NameBot:',msg.text)
Start_Bot() 
sendMsg(msg.chat_id_,msg.id_,"- تم تغير اسم البوت \n- الان اسمه "..Flter_Markdown(msg.text).." ")
return false
end

if redis:get(boss..'addrd_all:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد لكل المجموعات
if not redis:get(boss..'allreplay:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال كلمه الرد لكل المجموعات
if utf8.len(msg.text) > 25 then 
return sendMsg(msg.chat_id_,msg.id_,"- عذرا غير مسموح باضافه كلمه الرد باكثر من 25 حرف \n")
end
redis:hdel(boss..'replay_photo:group:',msg.text)
redis:hdel(boss..'replay_voice:group:',msg.text)
redis:hdel(boss..'replay_animation:group:',msg.text)
redis:hdel(boss..'replay_audio:group:',msg.text)
redis:hdel(boss..'replay_sticker:group:',msg.text)
redis:hdel(boss..'replay_video:group:',msg.text)
redis:hdel(boss..'replay_files:group:',msg.text)
redis:setex(boss..'allreplay:'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"- جيد , يمكنك الان ارسال جوا ب الردالعام \n- [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه,ملف ]] \n\n\n- علما ان الاختصارات كالاتي : \n \n- {الاسم} : لوضع اسم المستخدم\n- {الايدي} : لوضع ايدي المستخدم\n- {المعرف} : لوضع معرف المستخدم \n- {الرتبه} : لوضع نوع رتبه المستخدم \n- {التفاعل} : لوضع تفاعل المستخدم \n- {الرسائل} : لاضهار عدد الرسائل \n- {النقاط} : لاضهار عدد النقاط \n- {التعديل} : لاضهار عدد السحكات \n- {البوت} : لاضهار اسم البوت\n- {المطور} : لاضهار معرف المطور الاساسي\n- {الردود} : لاضهار ردود عشوائيه .\n➼")
end
end

if redis:get(boss..':KStart:'..msg.chat_id_..msg.sender_user_id_) then
redis:del(boss..':KStart:'..msg.chat_id_..msg.sender_user_id_)
redis:set(boss..':Text_Start',msg.text)
return sendMsg(msg.chat_id_,msg.id_,'- تم اضافه كليشة الستارت بنجاح \n\n-ملاحظه : كليشة الستارت للمطور الاساسي تكون ثابته اما لغير الرتب تكون حسب الي وضعتها')
end


if redis:get(boss..'delrdall:'..msg.sender_user_id_) then
redis:del(boss..'delrdall:'..msg.sender_user_id_)
local names = redis:hget(boss..'replay:all',msg.text)
local photo =redis:hget(boss..'replay_photo:group:',msg.text)
local voice = redis:hget(boss..'replay_voice:group:',msg.text)
local animation = redis:hget(boss..'replay_animation:group:',msg.text)
local audio = redis:hget(boss..'replay_audio:group:',msg.text)
local sticker = redis:hget(boss..'replay_sticker:group:',msg.text)
local video = redis:hget(boss..'replay_video:group:',msg.text)
local file = redis:hget(boss..'replay_files:group:',msg.text)
if not (names or photo or voice or animation or audio or sticker or video or file) then
return sendMsg(msg.chat_id_,msg.id_,'- هذا الرد ليس مضاف في قائمه الردود')
else
redis:hdel(boss..'replay:all',msg.text)
redis:hdel(boss..'replay_photo:group:',msg.text)
redis:hdel(boss..'replay_voice:group:',msg.text)
redis:hdel(boss..'replay_audio:group:',msg.text)
redis:hdel(boss..'replay_animation:group:',msg.text)
redis:hdel(boss..'replay_sticker:group:',msg.text)
redis:hdel(boss..'replay_video:group:',msg.text)
redis:hdel(boss..'replay_files:group:',msg.text)
return sendMsg(msg.chat_id_,msg.id_,'('..Flter_Markdown(msg.text)..')\n   تم مسح الرد ')
end 
end 


if redis:get(boss..'text_sudo:witting'..msg.sender_user_id_) then -- استقبال كليشه المطور
redis:del(boss..'text_sudo:witting'..msg.sender_user_id_) 
redis:set(boss..':TEXT_SUDO',Flter_Markdown(msg.text))
return sendMsg(msg.chat_id_,msg.id_, "- تم وضع الكليشه بنجاح كلاتي \n\n*{*  "..Flter_Markdown(msg.text).."  *}* ")
end
if redis:get(boss..'welcom:witting'..msg.chat_id_..msg.sender_user_id_) then -- استقبال كليشه الترحيب
redis:del(boss..'welcom:witting'..msg.chat_id_..msg.sender_user_id_) 
redis:set(boss..'welcome:msg'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"- تم وضع الترحيب بنجاح كلاتي " )
end
if redis:get(boss..'rulse:witting'..msg.chat_id_..msg.sender_user_id_) then --- استقبال القوانين
redis:del(boss..'rulse:witting'..msg.chat_id_..msg.sender_user_id_) 
redis:set(boss..'rulse:msg'..msg.chat_id_,Flter_Markdown(msg.text)) 
return sendMsg(msg.chat_id_,msg.id_,'- مرحبا عزيزي\n- تم حفظ القوانين بنجاح \n- ارسل [[ القوانين ]] لعرضها ')
end
if redis:get(boss..'name:witting'..msg.chat_id_..msg.sender_user_id_) then --- استقبال الاسم
redis:del(boss..'name:witting'..msg.chat_id_..msg.sender_user_id_) 
tdcli_function({ID= "ChangeChatTitle",chat_id_=msg.chat_id_,title_=msg.text},dl_cb,nil)
end
if redis:get(boss..'about:witting'..msg.chat_id_..msg.sender_user_id_) then --- استقبال الوصف
redis:del(boss..'about:witting'..msg.chat_id_..msg.sender_user_id_) 
tdcli_function({ID="ChangeChannelAbout",channel_id_=msg.chat_id_:gsub('-100',''),about_ = msg.text},function(arg,data) 
if data.ID == "Ok" then 
return sendMsg(msg.chat_id_,msg.id_,"- تم وضع الوصف بنجاح ")
end 
end,nil)
end


if redis:get(boss..'fwd:all'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه عام
redis:del(boss..'fwd:all'..msg.sender_user_id_)
local pv = redis:smembers(boss..'users')  
local groups = redis:smembers(boss..'group:ids')
local allgp =  #pv + #groups
if allgp >= 300 then
sendMsg(msg.chat_id_,msg.id_,'- اهلا عزيزي المطور \n- جاري نشر التوجيه للمجموعات وللمشتركين ...')			
end
for i = 1, #pv do 
sendMsg(pv[i],0,Flter_Markdown(msg.text))
end
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text))
end
return sendMsg(msg.chat_id_,msg.id_,'- تم اذاعه الكليشه بنجاح \n- للمـجمـوعات » *'..#groups..'* كروب \n- للمـشـتركين » '..#pv..' مـشـترك  ')
end

if redis:get(boss..'fwd:pv'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه خاص
redis:del(boss..'fwd:pv'..msg.sender_user_id_)
local pv = redis:smembers(boss..'users')
if #pv >= 300 then
sendMsg(msg.chat_id_,msg.id_,'- اهلا عزيزي المطور \n- جاري نشر الرساله للمشتركين ...')			
end
local NumPvDel = 0
for i = 1, #pv do
sendMsg(pv[i],0,Flter_Markdown(msg.text))
end
sendMsg(msg.chat_id_,msg.id_,'- عدد المشتركين : '..#pv..'\n- تم الاذاعه بنجاح ') 
end

if redis:get(boss..':prod_pin:'..msg.chat_id_..msg.sender_user_id_) then 
redis:del(boss..':prod_pin:'..msg.chat_id_..msg.sender_user_id_)
local groups = redis:smembers(boss..'group:ids')
if #groups >= 300 then
sendMsg(msg.chat_id_,msg.id_,' اهلا عزيزي المطور \nঌ جاري نشر الرساله للمجموعات ...')			
end
local NumGroupsDel = 0
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text),function(arg,data)
if data.chat_id_ then redis:setex(boss..":propin"..data.chat_id_,100,data.content_.text_) end
end)
end
sendMsg(msg.chat_id_,msg.id_,'📑 عدد المجموعات •⊱ { *'..#groups..'*  } ⊰•\n تـم الاذاعه بالتثبيت بنجاح ')
end 

if redis:get(boss..'fwd:groups'..msg.sender_user_id_) then ---- استقبال رساله الاذاعه خاص
redis:del(boss..'fwd:groups'..msg.sender_user_id_)
local groups = redis:smembers(boss..'group:ids')
if #groups >= 300 then
sendMsg(msg.chat_id_,msg.id_,'- اهلا عزيزي المطور \n- جاري نشر الرساله للمجموعات ...')			
end
local NumGroupsDel = 0
for i = 1, #groups do 
sendMsg(groups[i],0,Flter_Markdown(msg.text))
end
sendMsg(msg.chat_id_,msg.id_,'- عدد المجموعات •⊱ { *'..#groups..'*  } ⊰•\n- تـم الاذاعه بنجاح ')
end 
end 

if msg.forward_info_ and redis:get(boss..'fwd:'..msg.sender_user_id_) then
redis:del(boss..'fwd:'..msg.sender_user_id_)
local pv = redis:smembers(boss..'users')
local groups = redis:smembers(boss..'group:ids')
local allgp =  #pv + #groups
if allgp == 500 then
sendMsg(msg.chat_id_,msg.id_,'- اهلا عزيزي المطور \n- جاري نشر التوجيه للمجموعات وللمشتركين ...')			
end
local number = 0
for i = 1, #pv do 
fwdMsg(pv[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
for i = 1, #groups do 
fwdMsg(groups[i],msg.chat_id_,msg.id_,dl_cb,nil)
end
return sendMsg(msg.chat_id_,msg.id_,'- تم اذاعه التوجيه بنجاح \n- للمـجمـوعات » *'..#groups..'* \n- للخاص » '..#pv..'\n')			
end



if msg.text and msg.type == "channel" then
if msg.text:match("^"..Bot_Name.." غادر$") and (msg.SudoBase or msg.SudoUser) then
sendMsg(msg.chat_id_,msg.id_,'اوك باي ') 
rem_data_group(msg.chat_id_)
StatusLeft(msg.chat_id_,our_id)
return false
end
end

if msg.content_.ID == "MessagePhoto" and redis:get(boss..'welcom_ph:witting'..msg.sender_user_id_..msg.chat_id_) then
redis:del(boss..'welcom_ph:witting'..msg.sender_user_id_..msg.chat_id_)
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
redis:set(boss..':WELCOME_BOT',photo_id)
return sendMsg(msg.chat_id_,msg.id_,'- تم تغيير صـوره‏‏ الترحيب للبوت ')
end 

if msg.content_.ID == "MessagePhoto" and msg.type == "channel" and msg.GroupActive then
if redis:get(boss..'photo:group'..msg.chat_id_..msg.sender_user_id_) then
redis:del(boss..'photo:group'..msg.chat_id_..msg.sender_user_id_)
if msg.content_.photo_.sizes_[3] then 
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else 
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function({ID="ChangeChatPhoto",chat_id_=msg.chat_id_,photo_=GetInputFile(photo_id)},function(arg,data)
if data.code_ == 3 then
sendMsg(arg.chat_id_,arg.id_,'- ليس لدي صلاحيه تغيير الصوره \n- يجب اعطائي صلاحيه `تغيير معلومات المجموعه ` ')
end
end,{chat_id_=msg.chat_id_,id_=msg.id_})
return false
end
end

--=============================================================================================================================
if msg.SudoUser and msg.text and redis:get(boss..'addrdRandom1Public:'..msg.chat_id_..msg.sender_user_id_) then 
if not redis:get(boss..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_) then  -- كلمه الرد
if utf8.len(msg.text) > 25 then return sendMsg(msg.chat_id_,msg.id_,"- عذرا غير مسموح باضافه كلمه الرد باكثر من 25 حرف ") end
redis:setex(boss..'addrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_,1400,true) 
redis:setex(boss..'replay1RandomPublic'..msg.chat_id_..msg.sender_user_id_,1400,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"- جيد , يمكنك الان ارسال جواب الرد المتعدد العام \n- [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه,ملف ]] \n\n- علما ان الاختصارات كالاتي : \n \n- {الاسم} : لوضع اسم المستخدم\n- {الايدي} : لوضع ايدي المستخدم\n- {المعرف} : لوضع معرف المستخدم \n- {الرتبه} : لوضع نوع رتبه المستخدم \n- {التفاعل} : لوضع تفاعل المستخدم \n- {الرسائل} : لاضهار عدد الرسائل \n- {النقاط} : لاضهار عدد النقاط \n- {التعديل} : لاضهار عدد السحكات \n- {البوت} : لاضهار اسم البوت\n- {المطور} : لاضهار معرف المطور الاساسي\n- {الردود} : لاضهار ردود عشوائيه .\n\n- يمكنك اضافه 10 ردود متعدد كحد اقصى  \n➼")
end
end



if  msg.SudoUser and msg.text and redis:get(boss..':DelrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_) then
redis:del(boss..':DelrdRandomPublic:'..msg.chat_id_..msg.sender_user_id_)
local DelRd = redis:del(boss..':ReplayRandom:'..msg.text) 
if DelRd == 0 then 
return sendMsg(msg.chat_id_,msg.id_,'- هذا الرد ليس مضاف في الردود العشوائيه ')
end
redis:del(boss..':caption_replay:Random:'..msg.text) 
redis:srem(boss..':KlmatRRandom:',msg.text) 
return sendMsg(msg.chat_id_,msg.id_,'- تم حذف الرد بنجاح ')
end
--=============================================================================================================================


if not msg.GroupActive then return false end
if msg.text then

if redis:get(boss..'addrdRandom1:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد للمجموعه فقط

if not redis:get(boss..'replay1Random'..msg.chat_id_..msg.sender_user_id_) then  -- كلمه الرد
if utf8.len(msg.text) > 25 then 
return sendMsg(msg.chat_id_,msg.id_,"- عذرا غير مسموح باضافه كلمه الرد باكثر من 25 حرف ")
end
redis:setex(boss..'addrdRandom:'..msg.chat_id_..msg.sender_user_id_,1400,true) 
redis:setex(boss..'replay1Random'..msg.chat_id_..msg.sender_user_id_,1400,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"- جيد , يمكنك الان ارسال جواب الرد المتعدد العام \n- [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه,ملف ]] \n\n- علما ان الاختصارات كالاتي : \n \n- {الاسم} : لوضع اسم المستخدم\n- {الايدي} : لوضع ايدي المستخدم\n- {المعرف} : لوضع معرف المستخدم \n- {الرتبه} : لوضع نوع رتبه المستخدم \n- {التفاعل} : لوضع تفاعل المستخدم \n- {الرسائل} : لاضهار عدد الرسائل \n- {النقاط} : لاضهار عدد النقاط \n- {التعديل} : لاضهار عدد السحكات \n- {البوت} : لاضهار اسم البوت\n- {المطور} : لاضهار معرف المطور الاساسي\n- {الردود} : لاضهار ردود عشوائيه .\n\n- يمكنك اضافه 10 ردود متعدد كحد اقصى  \n➼")
end
end


if redis:get(boss..'addrd:'..msg.chat_id_..msg.sender_user_id_) then -- استقبال الرد للمجموعه فقط
if not redis:get(boss..'replay1'..msg.chat_id_..msg.sender_user_id_) then  -- كلمه الرد
if utf8.len(msg.text) > 25 then 
return sendMsg(msg.chat_id_,msg.id_,"- عذرا غير مسموح باضافه كلمه الرد باكثر من 25 حرف ")
end
redis:hdel(boss..'replay:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_video:group:'..msg.chat_id_,msg.text)
redis:setex(boss..'replay1'..msg.chat_id_..msg.sender_user_id_,300,msg.text)
return sendMsg(msg.chat_id_,msg.id_,"- جيد , يمكنك الان ارسال جواب الرد \n- [[ نص,صوره,فيديو,متحركه,بصمه,اغنيه,ملف ]] \n\n- علما ان الاختصارات كالاتي : \n \n- {الاسم} : لوضع اسم المستخدم\n- {الايدي} : لوضع ايدي المستخدم\n- {المعرف} : لوضع معرف المستخدم \n- {الرتبه} : لوضع نوع رتبه المستخدم \n- {التفاعل} : لوضع تفاعل المستخدم \n- {الرسائل} : لاضهار عدد الرسائل \n- {النقاط} : لاضهار عدد النقاط \n- {التعديل} : لاضهار عدد السحكات \n- {البوت} : لاضهار اسم البوت\n- {المطور} : لاضهار معرف المطور الاساسي\n- {الردود} : لاضهار ردود عشوائيه .\n➼")
end
end

if msg.text and redis:get(boss..':DelrdRandom:'..msg.chat_id_..msg.sender_user_id_) then
redis:del(boss..':DelrdRandom:'..msg.chat_id_..msg.sender_user_id_)
local DelRd = redis:del(boss..':ReplayRandom:'..msg.chat_id_..":"..msg.text) 
if DelRd == 0 then 
return sendMsg(msg.chat_id_,msg.id_,'- هذا الرد ليس مضاف في الردود العشوائيه ')
end
redis:del(boss..':caption_replay:Random:'..msg.chat_id_..msg.text) 
redis:srem(boss..':KlmatRRandom:'..msg.chat_id_,msg.text) 
return sendMsg(msg.chat_id_,msg.id_,'- تم حذف الرد بنجاح ')
end

if redis:get(boss..'delrd:'..msg.sender_user_id_) then
redis:del(boss..'delrd:'..msg.sender_user_id_)
local names 	= redis:hget(boss..'replay:'..msg.chat_id_,msg.text)
local photo 	= redis:hget(boss..'replay_photo:group:'..msg.chat_id_,msg.text)
local voice 	= redis:hget(boss..'replay_voice:group:'..msg.chat_id_,msg.text)
local animation = redis:hget(boss..'replay_animation:group:'..msg.chat_id_,msg.text)
local audio 	= redis:hget(boss..'replay_audio:group:'..msg.chat_id_,msg.text)
local files 	= redis:hget(boss..'replay_files:group:'..msg.chat_id_,msg.text)
local sticker 	= redis:hget(boss..'replay_sticker:group:'..msg.chat_id_,msg.text)
local video 	= redis:hget(boss..'replay_video:group:'..msg.chat_id_,msg.text)
if not (names or photo or voice or animation or audio or files or sticker or video) then
return sendMsg(msg.chat_id_,msg.id_,'- هذا الرد ليس مضاف في قائمه الردود ')
else
redis:hdel(boss..'replay:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_photo:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_voice:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_audio:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_files:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_animation:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_sticker:group:'..msg.chat_id_,msg.text)
redis:hdel(boss..'replay_video:group:'..msg.chat_id_,msg.text)
return sendMsg(msg.chat_id_,msg.id_,'(['..msg.text..'])\n   تم مسح الرد ')
end 
end

end

if msg.content_.ID == "MessagePinMessage" then
print(" -- pinned -- ")
local msg_pin_id = redis:get(boss..":MsgIDPin:"..msg.chat_id_)
if not msg.Director and not msg.OurBot and redis:get(boss..'lock_pin'..msg.chat_id_) then
if msg_pin_id then
print(" -- pinChannelMessage -- ")
tdcli_function({ID ="PinChannelMessage",
channel_id_ = msg.chat_id_:gsub('-100',''),
message_id_ = msg_pin_id,
disable_notification_ = 0},
function(arg,data)
if data.ID == "Ok" then
sendMsg(arg.chat_id_,arg.id_,"- عذرا التثبيت مقفل من قبل الاداره تم ارجاع التثبيت القديم")
end
end,{chat_id_=msg.chat_id_,id_=msg.id_})
else
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100','')},
function(arg,data) 
if data.ID == "Ok" then
sendMsg(msg.chat_id_,msg.id_,"- عذرا التثبيت مقفل من قبل الاداره تم الغاء التثبيت ")      
end
end,{chat_id_=msg.chat_id_,id_=msg.id_})
end
return false
end
redis:set(boss..":MsgIDPin:"..msg.chat_id_,msg.id_)
end

if msg.content_.ID == "MessageChatChangePhoto" then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end
sendMsg(msg.chat_id_,msg.id_," - قام  ["..UserName.."] بتغير صوره المجموعه  ")
end,{chat_id_=msg.chat_id_,id_=msg.id_})
end

if msg.content_.ID == "MessageChatChangeTitle" then
GetUserID(msg.sender_user_id_,function(arg,data)
redis:set(boss..'group:name'..arg.chat_id_,arg.title_)
if data.username_ then UserName = "@"..data.username_ else UserName = "احد المشرفين" end
sendMsg(arg.chat_id_,arg.id_,"- قام  ["..UserName.."]\n- بتغير اسم المجموعه  \n- الى "..Flter_Markdown(msg.content_.title_).." ") 
end,{chat_id_=msg.chat_id_,id_=msg.id_,title_=msg.content_.title_})
end

if msg.content_.ID == "MessageChatAddMembers" and redis:get(boss..'welcome:get'..msg.chat_id_) then
local adduserx = tonumber(redis:get(boss..'user:'..msg.sender_user_id_..':msgs') or 0)
if adduserx > 3 then 
redis:del(boss..'welcome:get'..msg.chat_id_)
end
redis:setex(boss..'user:'..msg.sender_user_id_..':msgs',3,adduserx+1)
end

if (msg.content_.ID == "MessageChatAddMembers") then
if redis:get(boss..'welcome:get'..msg.chat_id_) then
if msg.adduserType then
welcome = (redis:get(boss..'welcome:msg'..msg.chat_id_) or "- مرحباً عزيزي\n- نورت المجموعة ")
welcome = welcome:gsub("{القوانين}", redis:get(boss..'rulse:msg'..msg.chat_id_) or "- مرحبا عزيري  القوانين كلاتي \n- ممنوع نشر الروابط \n- ممنوع التكلم او نشر صور اباحيه \n- ممنوع  اعاده توجيه \n- ممنوع التكلم بلطائفه \n- الرجاء احترام المدراء والادمنيه \n")
if msg.addusername then UserName = '@'..msg.addusername else UserName = '< لا يوجد معرف >' end
local edited = (redis:get(boss..':edited:'..msg.chat_id_..':'..msg.adduser) or 0)
local points = redis:get(boss..':User_Points:'..msg.chat_id_..msg.adduser) or 0
local msgs = redis:get(boss..'msgs:'..msg.adduser..':'..msg.chat_id_) or 1

if msg.adduser == 656329268 or msg.adduser ==  1765160742 or msg.adduser ==  1714422669 then 
gtupe = 'مطور السورس' 
elseif msg.adduser == SUDO_ID then 
gtupe = 'المطور الاساسي' 
elseif redis:sismember(boss..':SUDO_BOT:',msg.adduser) then 
gtupe = 'المطور'
elseif msg.GroupActive and redis:sismember(boss..':MONSHA_Group:'..msg.chat_id_,msg.adduser) then 
gtupe = 'منشئ اساسي'
elseif msg.GroupActive and redis:sismember(boss..':MONSHA_BOT:'..msg.chat_id_,msg.adduser) then 
gtupe = 'المنشىء'
elseif msg.GroupActive and redis:sismember(boss..'owners:'..msg.chat_id_,msg.adduser) then 
gtupe = 'المدير' 
elseif msg.GroupActive and redis:sismember(boss..'admins:'..msg.chat_id_,msg.adduser) then 
gtupe = 'الادمن'
elseif msg.GroupActive and redis:sismember(boss..'whitelist:'..msg.chat_id_,msg.adduser) then 
gtupe = 'عضو مميز'
elseif msg.adduser == our_id then
gtupe = "بوت"
else
gtupe = 'فقط عضو '
end

welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(boss..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",UserName)
local welcome = welcome:gsub("{الايدي}",msg.adduser)
local welcome = welcome:gsub("{الرتبه}",gtupe)
local welcome = welcome:gsub("{التفاعل}",Get_Ttl(msgs))
local welcome = welcome:gsub("{الرسائل}",msgs)
local welcome = welcome:gsub("{النقاط}",points)
local welcome = welcome:gsub("{بايو}",biouser)
local welcome = welcome:gsub("{التعديل}",edited)
local welcome = welcome:gsub("{البوت}",redis:get(boss..':NameBot:'))
local welcome = welcome:gsub("{المطور}",SUDO_USER)
local welcome = welcome:gsub("{الردود}",RandomText())

local welcome = welcome:gsub("{الاسم}",FlterName(msg.addname,20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome))
return false
end 
end 
end 

if (msg.content_.ID == "MessageChatJoinByLink") then
if redis:get(boss..'welcome:get'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
welcome = (redis:get(boss..'welcome:msg'..msg.chat_id_) or "- مرحباً عزيزي\n- نورت المجموعة ")
welcome = welcome:gsub("{القوانين}", redis:get(boss..'rulse:msg'..msg.chat_id_) or "- مرحبا عزيري  القوانين  \n- ممنوع نشر الروابط \n- ممنوع التكلم او نشر صور اباحيه \n- ممنوع  اعاده توجيه \n- ممنوع التكلم بلطائفه \n- الرجاء احترام المدراء والادمنيه \n")
if data.username_ then UserName = '@'..data.username_ else UserName = '< لا يوجد معرف >' end
local edited = (redis:get(boss..':edited:'..msg.chat_id_..':'..msg.sender_user_id_) or 0)
local points = redis:get(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_) or 0
local msgs = redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_) or 1
welcome = welcome:gsub("{المجموعه}",Flter_Markdown((redis:get(boss..'group:name'..msg.chat_id_) or '')))
local welcome = welcome:gsub("{المعرف}",UserName)
local welcome = welcome:gsub("{الايدي}",msg.sender_user_id_)
local welcome = welcome:gsub("{الرتبه}",msg.TheRank)
local welcome = welcome:gsub("{التفاعل}",Get_Ttl(msgs))
local welcome = welcome:gsub("{الرسائل}",msgs)
local welcome = welcome:gsub("{النقاط}",points)
local welcome = welcome:gsub("{بايو}",biouser)
local welcome = welcome:gsub("{التعديل}",edited)
local welcome = welcome:gsub("{البوت}",redis:get(boss..':NameBot:'))
local welcome = welcome:gsub("{المطور}",SUDO_USER)
local welcome = welcome:gsub("{الردود}",RandomText())

local welcome = welcome:gsub("{الاسم}",FlterName(data.first_name_..' '..(data.last_name_ or "" ),20))
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(welcome)) 
end)
end
return false
end

if msg.edited and not msg.SuperCreator and redis:get(boss.."antiedit"..msg.chat_id_) then 
if not msg.text then
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local usersmnc   = ""
local NameUser   = Hyper_Link_Name(data)
if data.username_  then uuseri = "\n معرفه : @["..data.username_.."]"  else uuseri = "" end
local monsha = redis:smembers(boss..':MONSHA_Group:'..msg.chat_id_)
Rwers = ""
if msg.content_.ID == "MessagePhoto" then
Rwers = "صوره"
elseif msg.content_.ID == "MessageSticker"  then
Rwers = "ملصق"
elseif msg.content_.ID == "MessageVoice"  then
Rwers = "بصمه"
elseif msg.content_.ID == "MessageAudio"  then
Rwers = "صوت"
elseif msg.content_.ID == "MessageVideo"  then
Rwers = "فيديو"
elseif msg.content_.ID == "MessageAnimation"  then
Rwers = "متحركه"
else
Rwers = "نصي رابط"
end
if #monsha ~= 0 then 
for k,v in pairs(monsha) do
local info = redis:hgetall(boss..'username:'..v) if info and info.username and info.username:match("@[%a%d_]+") then usersmnc = usersmnc..info.username.." - " end
sendMsg(v,0,"- هناك شخص قام بالتعديل \n- الاسم : ⋙「 "..NameUser.." 」 "..uuseri.."\n- الايدي : `"..msg.sender_user_id_.."`\n- رتبته : "..Getrtba(msg.sender_user_id_,msg.chat_id_).."\n- نوع التعديل : "..Rwers.."\n- المجموعة : "..Flter_Markdown((redis:get(boss..'group:name'..msg.chat_id_) or '')).."\n- الرابط : "..redis:get(boss..'linkGroup'..msg.chat_id_).." " )
end
end
return sendMsg(msg.chat_id_,msg.id_,"- نداء لمنشئيين : ["..usersmnc.."] \n- هناك شخص قام بالتعديل"..uuseri.."\n- الاسم : ⋙「 "..NameUser.." 」 \n- الايدي : `"..msg.sender_user_id_.."`\n- رتبته : "..Getrtba(msg.sender_user_id_,msg.chat_id_).."\n- نوع التعديل : "..Rwers.."" )   

end,{msg=msg})
Del_msg(msg.chat_id_,msg.id_)
end
if (msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") 
or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.text:match(".[Pp][Ee]") 
or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.text:match("[Hh][Tt][Tt][Pp]://") 
or msg.text:match("[Ww][Ww][Ww].") 
or msg.text:match(".[Cc][Oo][Mm]")) 
then
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local usersmnc   = ""
local NameUser   = Hyper_Link_Name(data)
if data.username_  then uuseri = "\n معرفه : @["..data.username_.."]"  else uuseri = "" end
local monsha = redis:smembers(boss..':MONSHA_Group:'..msg.chat_id_)

Rwers = "نصي رابط"

if #monsha ~= 0 then 
for k,v in pairs(monsha) do
local info = redis:hgetall(boss..'username:'..v) if info and info.username and info.username:match("@[%a%d_]+") then usersmnc = usersmnc..info.username.." - " end
sendMsg(v,0,"- هناك شخص قام بالتعديل \n- الاسم : ⋙「 "..NameUser.." 」 "..uuseri.."\n- الايدي : `"..msg.sender_user_id_.."`\n- رتبته : "..Getrtba(msg.sender_user_id_,msg.chat_id_).."\n- نوع التعديل : "..Rwers.."\n- المجموعة : "..Flter_Markdown((redis:get(boss..'group:name'..msg.chat_id_) or '')).."\n- الرابط : "..redis:get(boss..'linkGroup'..msg.chat_id_).." " )
end
end
return sendMsg(msg.chat_id_,msg.id_,"- نداء لمنشئيين : ["..usersmnc.."] \n- هناك شخص قام بالتعديل"..uuseri.."\n- الاسم : ⋙「 "..NameUser.." 」 \n- الايدي : `"..msg.sender_user_id_.."`\n- رتبته : "..Getrtba(msg.sender_user_id_,msg.chat_id_).."\n- نوع التعديل : "..Rwers.." " )   

end,{msg=msg})
Del_msg(msg.chat_id_,msg.id_)
end
end



if not msg.Admin and not msg.Special then -- للاعضاء فقط  

if not msg.forward_info_ and msg.content_.ID ~= "MessagePhoto" and redis:get(boss..'lock_flood'..msg.chat_id_)  then
local msgs = (redis:get(boss..'user:'..msg.sender_user_id_..':msgs') or 0)
local NUM_MSG_MAX = (redis:get(boss..'num_msg_max'..msg.chat_id_) or 5)
if tonumber(msgs) > tonumber(NUM_MSG_MAX) then 
redis:setex(boss..'sender:'..msg.sender_user_id_..':'..msg.chat_id_..'flood',30,true)
GetUserID(msg.sender_user_id_,function(arg,datau)
Restrict(arg.chat_id_,arg.sender_user_id_,1)
if datau.username_ then USERNAME = '@'..datau.username_ else USERNAME = FlterName(datau.first_name_..' '..(datau.last_name_ or "")) end
SendMention(arg.chat_id_,datau.id_,arg.id_,"- العضو » "..USERNAME.."\n- قمـت بتكرار اكثر مـن "..arg.NUM_MSG_MAX.." رسـاله‌‏ , لذا تم تقييدك مـن المجموعه‌‏ \n",14,utf8.len(USERNAME)) 
end,{chat_id_=msg.chat_id_,id_=msg.id_,NUM_MSG_MAX=NUM_MSG_MAX,sender_user_id_=msg.sender_user_id_})
return false
end 
redis:setex(boss..'user:'..msg.sender_user_id_..':msgs',2,msgs+1)
end


if msg.forward_info_ then
if redis:get(boss..'mute_forward'..msg.chat_id_) then -- قفل التوجيه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd \27[0m")

if data.ID == "Error" and data.code_ == 6 then 
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) and not redis:get(boss..':User_Fwd_Msg:'..msg.sender_user_id_..':flood') then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- عذرا ممنوع اعادة التوجيه  ",14,utf8.len(USERNAME)) 
return redis:setex(boss..':User_Fwd_Msg:'..msg.sender_user_id_..':flood',15,true)
end,nil)
end
end)
return false
elseif redis:get(boss..':tqeed_fwd:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del Becuse Send Fwd tqeed \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false 
end
elseif msg.edited and msg.content_.ID ~= "MessageText" and redis:get(boss..'lock_edit'..msg.chat_id_) then -- قفل التعديل
Del_msg(msg.chat_id_,msg.id_,function(arg,data) 
print("\27[1;31m Msg Del becuse send Edit \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- عذراً ممنوع التعديل تم المسح ",14,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif tonumber(msg.via_bot_user_id_) ~= 0 and redis:get(boss..'mute_inline'..msg.chat_id_) then -- قفل الانلاين
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send inline \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- عذرا الانلاين مقفول  ",14,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif msg.text then -- رسايل فقط
if utf8.len(msg.text) > 500 and redis:get(boss..'lock_spam'..msg.chat_id_) then -- قفل الكليشه 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send long msg \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- ممنوع ارسال الكليشه والا سوف تجبرني على طردك  ",14,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif (msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") 
or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.text:match(".[Pp][Ee]") 
or msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.text:match("[Hh][Tt][Tt][Pp]://") 
or msg.text:match("[Ww][Ww][Ww].") 
or msg.text:match(".[Cc][Oo][Mm]")) 
and redis:get(boss..':tqeed_link:'..msg.chat_id_)  then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user i restricted becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,1)
end)
return false
elseif (msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Oo][Rr][Gg]/") 
or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match(".[Pp][Ee]")) 
and redis:get(boss..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- ممنوع ارسال الروابط  ",14,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif (msg.text:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.text:match("[Hh][Tt][Tt][Pp]://") or msg.text:match("[Ww][Ww][Ww].") or msg.text:match(".[Cc][Oo][Mm]") or msg.text:match(".[Tt][Kk]") or msg.text:match(".[Mm][Ll]") or msg.text:match(".[Oo][Rr][Gg]")) and redis:get(boss..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web link \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- ممنوع ارسال روابط الويب   ",14,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif (msg.text:match("ی") or msg.text:match('چ') or msg.text:match('گ') or msg.text:match('ک') or msg.text:match('پ') or msg.text:match('ژ') or msg.text:match('ٔ') or msg.text:match('۴') or msg.text:match('۵') or msg.text:match('۶')) and redis:get(boss.."lock_pharsi"..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send lock_pharsi \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- ممنوع ارسال الفارسيه  ",14,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif redis:get(boss.."lock_mmno3"..msg.chat_id_) and KlmatMmno3(msg.text)  then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send mseeea \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- ممنوع ارسال الكلمات المسيئه  ",14,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif msg.text:match("[a-zA-Z]") and redis:get(boss.."lock_lang"..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send En \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- ممنوع ارسال الانكليزيه  ",14,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif msg.text:match("#.+") and redis:get(boss..'lock_tag'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send tag \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- ممنوع ارسال التاك  ",14,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif msg.text:match("@[%a%d_]+")  and redis:get(boss..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- ممنوع ارسال المعرف   ",14,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif not msg.textEntityTypeBold and (msg.textEntityTypeBold or msg.textEntityTypeItalic) and redis:get(boss..'lock_markdown'..msg.chat_id_) then 
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send markdown \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- ممنوع ارسال الماركدوان  ",14,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif msg.textEntityTypeTextUrl and redis:get(boss..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send web page \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n-  .ممنوع ارسال روابط الويب   ",14,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
end 
elseif msg.content_.ID == "MessageUnsupported" and redis:get(boss..'mute_video'..msg.chat_id_) then -- قفل الفيديو
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- عذرا ممنوع ارسال الفيديو كام ",14,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif msg.content_.ID == "MessagePhoto" then
if redis:get(boss..'mute_photo'..msg.chat_id_)  then -- قفل الصور
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- عذرا ممنوع ارسال الصور  ",14,utf8.len(USERNAME))
end,nil)
end
end)
return false
elseif redis:get(boss..':tqeed_photo:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user resctricted becuse send photo \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.content_.ID == "MessageVideo" then
if redis:get(boss..'mute_video'..msg.chat_id_) then -- قفل الفيديو
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send vedio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- عذرا ممنوع ارسال الفيديو  ",14,utf8.len(USERNAME)) 
end,nil)   
end
end)
return false
elseif redis:get(boss..':tqeed_video:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send video \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.content_.ID == "MessageDocument" and redis:get(boss..'mute_document'..msg.chat_id_) then -- قفل الملفات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send file \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- عذرا ممنوع ارسال الملفات  ",14,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif msg.content_.ID == "MessageSticker" and redis:get(boss..'mute_sticker'..msg.chat_id_) then --قفل الملصقات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send sticker \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- عذرا ممنوع ارسال الملصقات  ",14,utf8.len(USERNAME)) 
end,nil)   
end
end)
return false
elseif msg.content_.ID == "MessageAnimation" then
if redis:get(boss..'mute_gif'..msg.chat_id_) then -- قفل المتحركه
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- عذرا ممنوع ارسال الصور المتحركه  ",14,utf8.len(USERNAME)) 
end,nil)   
end
end)
return false
elseif redis:get(boss..':tqeed_gif:'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m The user restricted becuse send gif \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
Restrict(msg.chat_id_,msg.sender_user_id_,3)
end)
return false
end
elseif msg.content_.ID == "MessageContact" and redis:get(boss..'mute_contact'..msg.chat_id_) then -- قفل الجهات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send Contact \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME..'\n- عذرا ممنوع ارسال جهات الاتصال  ',14,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif msg.content_.ID == "MessageLocation" and redis:get(boss..'mute_location'..msg.chat_id_) then -- قفل الموقع
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send location \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- عذرا ممنوع ارسال الموقع  ",14,utf8.len(USERNAME))
end,nil)
end
end)
return false
elseif msg.content_.ID == "MessageVoice" and redis:get(boss..'mute_voice'..msg.chat_id_) then -- قفل البصمات
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send voice \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- عذرا ممنوع ارسال البصمات  ",14,utf8.len(USERNAME))
end,nil)   
end
end)
return false
elseif msg.content_.ID == "MessageGame" and redis:get(boss..'mute_game'..msg.chat_id_) then -- قفل الالعاب
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send game \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- عذرا ممنوع لعب الالعاب  ",14,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif msg.content_.ID == "MessageAudio" and redis:get(boss..'mute_audio'..msg.chat_id_) then -- قفل الصوت
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send audio \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- عذرا ممنوع ارسال الصوت  ",14,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif msg.reply_markup and  msg.reply_markup.ID == "replyMarkupInlineKeyboard" and redis:get(boss..'mute_keyboard'..msg.chat_id_) then -- كيبورد
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send keyboard \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- عذرا الكيبورد مقفول  ",14,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
end

if msg.content_.caption_ then -- الرسايل الي بالكابشن
if (msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or msg.content_.caption_:match("[Tt].[Mm][Ee]/") 
or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or msg.content_.caption_:match(".[Pp][Ee]")) 
and redis:get(boss..'lock_link'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send link caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- عذرا ممنوع ارسال الروابط  ",14,utf8.len(USERNAME)) 
end,nil)
end
end)
return false
elseif (msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") 
or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") 
or msg.content_.caption_:match("[Ww][Ww][Ww].") 
or msg.content_.caption_:match(".[Cc][Oo][Mm]")) 
and redis:get(boss..'lock_webpage'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send webpage caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- عذرا ممنوع ارسال روابط الويب  ",14,utf8.len(USERNAME))
end,nil)
end
end)
return false
elseif msg.content_.caption_:match("@[%a%d_]+") and redis:get(boss..'lock_username'..msg.chat_id_) then
Del_msg(msg.chat_id_,msg.id_,function(arg,data)
print("\27[1;31m Msg Del becuse send username caption \27[0m")
if data.ID == "Error" and data.code_ == 6 then
return sendMsg(msg.chat_id_,msg.id_,'- لا يمكنني مسح الرساله المخالفه .\n- لست مشرف او ليس لدي صلاحيه  الحذف  ')    
end
if redis:get(boss..'lock_woring'..msg.chat_id_) then
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
SendMention(msg.chat_id_,data.id_,msg.id_,"- العضو » "..USERNAME.."\n- عذرا ممنوع ارسال التاك او المعرف  ",14,utf8.len(USERNAME))
end,nil)
end 
end)
return false
end 


end --========{ End if } ======

end 
SaveNumMsg(msg)

if msg.text then
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg



if redis:get(boss.."lock_RandomRdod"..msg.chat_id_) then 
local Replay = 0
Replay = redis:smembers(boss..':ReplayRandom:'..msg.text) 
if #Replay ~= 0 then 
local Replay = Replay[math.random(#Replay)]
Replay = convert_Klmat(msg,data,Replay,true)
local CaptionFilter = Replay:gsub(":Text:",""):gsub(":Document:",""):gsub(":Voice:",""):gsub(":Photo:",""):gsub(":Animation:",""):gsub(":Audio:",""):gsub(":Sticker:",""):gsub(":Video:","")
Caption = redis:hget(boss..':caption_replay:Random:'..msg.text,CaptionFilter)
Caption = convert_Klmat(msg,data,Caption)
if Replay:match(":Text:") then
return sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Replay:gsub(":Text:","")))
elseif Replay:match(":Document:") then 
return sendDocument(msg.chat_id_,msg.id_,Replay:gsub(":Document:",""),Caption)  
elseif Replay:match(":Photo:") then 
return sendPhoto(msg.chat_id_,msg.id_,Replay:gsub(":Photo:",""),Caption)  
elseif Replay:match(":Voice:") then 
return sendVoice(msg.chat_id_,msg.id_,Replay:gsub(":Voice:",""),Caption)
elseif Replay:match(":Animation:") then 
return sendAnimation(msg.chat_id_,msg.id_,Replay:gsub(":Animation:",""),Caption)  
elseif Replay:match(":Audio:") then 
return sendAudio(msg.chat_id_,msg.id_,Replay:gsub(":Audio:",""),"",Caption)  
elseif Replay:match(":Sticker:") then 
return sendSticker(msg.chat_id_,msg.id_,Replay:gsub(":Sticker:",""))  
elseif Replay:match(":Video:") then 
return sendVideo(msg.chat_id_,msg.id_,Replay:gsub(":Video:",""),Caption)
end
end


local Replay = 0
Replay = redis:smembers(boss..':ReplayRandom:'..msg.chat_id_..":"..msg.text) 
if #Replay ~= 0 then 
local Replay = Replay[math.random(#Replay)]
Replay = convert_Klmat(msg,data,Replay,true)
local CaptionFilter = Replay:gsub(":Text:",""):gsub(":Document:",""):gsub(":Voice:",""):gsub(":Photo:",""):gsub(":Animation:",""):gsub(":Audio:",""):gsub(":Sticker:",""):gsub(":Video:","")
Caption = redis:hget(boss..':caption_replay:Random:'..msg.chat_id_..msg.text,CaptionFilter)
Caption = convert_Klmat(msg,data,Caption)
if Replay:match(":Text:") then
return sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Replay:gsub(":Text:","")))
elseif Replay:match(":Document:") then 
return sendDocument(msg.chat_id_,msg.id_,Replay:gsub(":Document:",""),Caption)  
elseif Replay:match(":Photo:") then 
return sendPhoto(msg.chat_id_,msg.id_,Replay:gsub(":Photo:",""),Caption)  
elseif Replay:match(":Voice:") then 
return sendVoice(msg.chat_id_,msg.id_,Replay:gsub(":Voice:",""),Caption)
elseif Replay:match(":Animation:") then 
return sendAnimation(msg.chat_id_,msg.id_,Replay:gsub(":Animation:",""),Caption)  
elseif Replay:match(":Audio:") then 
return sendAudio(msg.chat_id_,msg.id_,Replay:gsub(":Audio:",""),"",Caption)  
elseif Replay:match(":Sticker:") then 
return sendSticker(msg.chat_id_,msg.id_,Replay:gsub(":Sticker:",""))  
elseif Replay:match(":Video:") then 
return sendVideo(msg.chat_id_,msg.id_,Replay:gsub(":Video:",""),Caption)
end
end

end

if redis:get(boss..'replay'..msg.chat_id_) then
local Replay = false

Replay = redis:hget(boss..'replay:all',msg.text)
if Replay then
Replay = convert_Klmat(msg,data,Replay,true)
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Replay))
return false
end

Replay = redis:hget(boss..'replay:'..msg.chat_id_,msg.text)
if Replay then 
Replay = convert_Klmat(msg,data,Replay,true)
sendMsg(msg.chat_id_,msg.id_,Flter_Markdown(Replay)) 
return false
end

Replay = redis:hget(boss..'replay_photo:group:',msg.text)
if Replay then 
Caption = redis:hget(boss..':caption_replay:',msg.text)
Caption = convert_Klmat(msg,data,Caption)
print(Caption)
sendPhoto(msg.chat_id_,msg.id_,Replay,Caption)  
return false
end

Replay = redis:hget(boss..'replay_voice:group:',msg.text)
if Replay then 
Caption = redis:hget(boss..':caption_replay:',msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendVoice(msg.chat_id_,msg.id_,Replay,Caption)
return false
end

Replay = redis:hget(boss..'replay_animation:group:',msg.text)
if Replay then 
Caption = redis:hget(boss..':caption_replay:',msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendAnimation(msg.chat_id_,msg.id_,Replay,Caption)  
return false
end

Replay = redis:hget(boss..'replay_audio:group:',msg.text)
if Replay then 
Caption = redis:hget(boss..':caption_replay:',msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendAudio(msg.chat_id_,msg.id_,Replay,"",Caption)  
return false
end


Replay = redis:hget(boss..'replay_files:group:'..msg.chat_id_,msg.text)
if Replay then 
Caption = redis:hget(boss..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendDocument(msg.chat_id_,msg.id_,Replay,Caption)  
return false
end

Replay = redis:hget(boss..'replay_files:group:',msg.text)
if Replay then 
Caption = redis:hget(boss..':caption_replay:',msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendDocument(msg.chat_id_,msg.id_,Replay,Caption)  
return false
end

Replay = redis:hget(boss..'replay_sticker:group:',msg.text)
if Replay then 
sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(boss..'replay_video:group:',msg.text)
if Replay then 
Caption = redis:hget(boss..':caption_replay:',msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendVideo(msg.chat_id_,msg.id_,Replay,Caption)
return false
end

Replay = redis:hget(boss..'replay_photo:group:'..msg.chat_id_,msg.text)
if Replay then 
Caption = redis:hget(boss..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendPhoto(msg.chat_id_,msg.id_,Replay,Caption)  
return false
end

Replay = redis:hget(boss..'replay_voice:group:'..msg.chat_id_,msg.text)
if Replay then 
Caption = redis:hget(boss..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendVoice(msg.chat_id_,msg.id_,Replay,Caption)
return false
end

Replay = redis:hget(boss..'replay_animation:group:'..msg.chat_id_,msg.text)
if Replay then 
Caption = redis:hget(boss..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendAnimation(msg.chat_id_,msg.id_,Replay,Caption)  
return false
end

Replay = redis:hget(boss..'replay_audio:group:'..msg.chat_id_,msg.text)
if Replay then 
Caption = redis:hget(boss..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendAudio(msg.chat_id_,msg.id_,Replay,"",Caption)  
return false
end

Replay = redis:hget(boss..'replay_sticker:group:'..msg.chat_id_,msg.text)
if Replay then 
sendSticker(msg.chat_id_,msg.id_,Replay)  
return false
end

Replay = redis:hget(boss..'replay_video:group:'..msg.chat_id_,msg.text)
if Replay then 
Caption = redis:hget(boss..':caption_replay:'..msg.chat_id_,msg.text)
Caption = convert_Klmat(msg,data,Caption)
sendVideo(msg.chat_id_,msg.id_,Replay,Caption)
return false
end
end

end,{msg=msg})


------------------------------{ Start Replay Send }------------------------



end

if msg.text and redis:get(boss.."lock_rdodSource"..msg.chat_id_) then

--================================{{  Reply Bot  }} ===================================
local hhh = {
"* جماد بحرف ⏎ ر  *", 
"* مدينة بحرف ⏎ ع  *",
"* حيوان ونبات بحرف ⏎ خ  *", 
"* اسم بحرف ⏎ ح  *", 
"* اسم ونبات بحرف ⏎ م  *", 
"* دولة عربية بحرف ⏎ ق  *", 
"* جماد بحرف ⏎ ي  *", 
"* نبات بحرف ⏎ ج  *", 
"* اسم بنت بحرف ⏎ ع  *", 
"* اسم ولد بحرف ⏎ ع  *", 
"* اسم بنت وولد بحرف ⏎ ث  *", 
"* جماد بحرف ⏎ ج  *",
"* حيوان بحرف ⏎ ص  *",
"* دولة بحرف ⏎ س  *",
"* نبات بحرف ⏎ ج  *",
"* مدينة بحرف ⏎ ب  *",
"* نبات بحرف ⏎ ر  *",
"* اسم بحرف ⏎ ك  *",
"* حيوان بحرف ⏎ ظ  *",
"* جماد بحرف ⏎ ذ  *",
"* مدينة بحرف ⏎ و  *",
"* اسم بحرف ⏎ م  *",
"* اسم بنت بحرف ⏎ خ  *",
"* اسم و نبات بحرف ⏎ ر  *",
"* نبات بحرف ⏎ و  *",
"* حيوان بحرف ⏎ س  *",
"* مدينة بحرف ⏎ ك  *",
"* اسم بنت بحرف ⏎ ص  *",
"* اسم ولد بحرف ⏎ ق  *",
"* نبات بحرف ⏎ ز  *",
"*  جماد بحرف ⏎ ز  *",
"*  مدينة بحرف ⏎ ط  *",
"*  جماد بحرف ⏎ ن  *",
"*  مدينة بحرف ⏎ ف  *",
"*  حيوان بحرف ⏎ ض  *",
"*  اسم بحرف ⏎ ك  *",
"*  نبات و حيوان و مدينة بحرف ⏎ س  *", 
"*  اسم بنت بحرف ⏎ ج  *", 
"*  مدينة بحرف ⏎ ت  *", 
"*  جماد بحرف ⏎ ه  *", 
"*  اسم بنت بحرف ⏎ ر  *", 
"* اسم ولد بحرف ⏎ خ  *", 
"* جماد بحرف ⏎ ع  *",
"* حيوان بحرف ⏎ ح  *",
"* نبات بحرف ⏎ ف  *",
"* اسم بنت بحرف ⏎ غ  *",
"* اسم ولد بحرف ⏎ و  *",
"* نبات بحرف ⏎ ل  *",
"*مدينة بحرف ⏎ ع  *",
"*دولة واسم بحرف ⏎ ب  *",
}
local drok = {
  "*أكثر جملة أثرت بك في حياتك؟ *",
  "*إيموجي يوصف مزاجك حاليًا؟ *",
  "*أجمل اسم بنت بحرف الباء؟ *",
  "*كيف هي أحوال قلبك؟ *",
  "*أجمل مدينة؟ *",
  "*كيف كان أسبوعك؟ *",
  "*شيء تشوفه اكثر من اهلك ؟ *",
  "*اخر مره فضفضت؟ *",
  "*قد كرهت احد بسبب اسلوبه؟ *",
  "*قد حبيت شخص وخذلك؟ *",
  "*كم مره حبيت؟ *",
  "*اكبر غلطة بعمرك؟ *",
  "*نسبة النعاس عندك حاليًا؟ *",
  "*شرايكم بمشاهير التيك توك؟ *",
  "*ما الحاسة التي تريد إضافتها للحواس الخمسة؟ *",
  "*اسم قريب لقلبك؟ *",
  "*مشتاق لمطعم كنت تزوره قبل الحظر؟ *",
  "*أول شيء يخطر في بالك إذا سمعت كلمة (ابوي يبيك)؟ *",
  "*ما أول مشروع تتوقع أن تقوم بإنشائه إذا أصبحت مليونير؟ *",
  "*أغنية عالقة في ذهنك هاليومين؟ *",
  "*متى اخر مره قريت قرآن؟ *",
  "*كم صلاة فاتتك اليوم؟ *",
  "*تفضل التيكن او السنقل؟ *",
  "*وش أفضل بوت برأيك؟ *",
"*كم لك بالتلي؟ *",
"*وش الي تفكر فيه الحين؟ *",
"*كيف تشوف الجيل ذا؟ *",
"*منشن شخص وقوله، تحبني؟ *",
"*لو جاء شخص وعترف لك كيف ترده؟ *",
"*مر عليك موقف محرج؟ *",
"*وين تشوف نفسك بعد سنتين؟ *",
"*لو فزعت/ي لصديق/ه وقالك مالك دخل وش بتسوي/ين؟ *",
"*وش اجمل لهجة تشوفها؟ *",
"*قد سافرت؟ *",
"*افضل مسلسل عندك؟ *",
"*افضل فلم عندك؟ *",
"*مين اكثر يخون البنات/العيال؟ *",
"*متى حبيت؟ *",
  "*بالعادة متى تنام؟ *",
  "*شيء من صغرك ماتغير فيك؟ *",
  "*شيء بسيط قادر يعدل مزاجك بشكل سريع؟ *",
  "*تشوف الغيره انانيه او حب؟ *",
"*حاجة تشوف نفسك مبدع فيها؟ *",
  "*مع او ضد : يسقط جمال المراة بسبب قبح لسانها؟ *",
  "*عمرك بكيت على شخص مات في مسلسل ؟ *",
  "*‏- هل تعتقد أن هنالك من يراقبك بشغف؟ *",
  "*تدوس على قلبك او كرامتك؟ *",
  "*اكثر لونين تحبهم مع بعض؟ *",
  "*مع او ضد : النوم افضل حل لـ مشاكل الحياة؟ *",
  "*سؤال دايم تتهرب من الاجابة عليه؟ *",
  "*تحبني ولاتحب الفلوس؟ *",
  "*العلاقه السريه دايماً تكون حلوه؟ *",
  "*لو أغمضت عينيك الآن فما هو أول شيء ستفكر به؟ *",
"*كيف ينطق الطفل اسمك؟ *",
  "*ما هي نقاط الضعف في شخصيتك؟ *",
  "*اكثر كذبة تقولها؟ *",
  "*تيكن ولا اضبطك؟ *",
  "*اطول علاقة كنت فيها مع شخص؟ *",
  "*قد ندمت على شخص؟ *",
  "*وقت فراغك وش تسوي؟ *",
  "*عندك أصحاب كثير؟ ولا ينعد بالأصابع؟ *",
  "*حاط نغمة خاصة لأي شخص؟ *",
  "*وش اسم شهرتك؟ *",
  "*أفضل أكلة تحبه لك؟ *",
"*عندك شخص تسميه ثالث والدينك؟ *",
  "*عندك شخص تسميه ثالث والدينك؟ *",
  "*اذا قالو لك تسافر أي مكان تبيه وتاخذ معك شخص واحد وين بتروح ومين تختار؟ *",
  "*أطول مكالمة كم ساعة؟ *",
  "*تحب الحياة الإلكترونية ولا الواقعية؟ *",
  "*كيف حال قلبك ؟ بخير ولا مكسور؟ *",
  "*أطول مدة نمت فيها كم ساعة؟ *",
  "*تقدر تسيطر على ضحكتك؟ *",
  "*أول حرف من اسم الحب؟ *",
  "*تحب تحافظ على الذكريات ولا تمسحه؟ *",
  "*اسم اخر شخص زعلك؟ *",
"*وش نوع الأفلام اللي تحب تتابعه؟ *",
  "*أنت انسان غامض ولا الكل يعرف عنك؟ *",
  "*لو الجنسية حسب ملامحك وش بتكون جنسيتك؟ *",
  "*عندك أخوان او خوات من الرضاعة؟ *",
  "*إختصار تحبه؟ *",
  "*إسم شخص وتحس أنه كيف؟ *",
  "*وش الإسم اللي دايم تحطه بالبرامج؟ *",
  "*وش برجك؟ *",
  "*لو يجي عيد ميلادك تتوقع يجيك هدية؟ *",
  "*اجمل هدية جاتك وش هو؟ *",
  "*الصداقة ولا الحب؟ *",
"*الصداقة ولا الحب؟ *",
  "*الغيرة الزائدة شك؟ ولا فرط الحب؟ *",
  "*قد حبيت شخصين مع بعض؟ وانقفطت؟ *",
  "*وش أخر شي ضيعته؟ *",
  "*قد ضيعت شي ودورته ولقيته بيدك؟ *",
  "*تؤمن بمقولة اللي يبيك مايحتار فيك؟ *",
  "*سبب وجوك بالتليجرام؟ *",
  "*تراقب شخص حاليا؟ *",
  "*عندك معجبين ولا محد درا عنك؟ *",
  "*لو نسبة جمالك بتكون بعدد شحن جوالك كم بتكون؟ *",
  "*أنت محبوب بين الناس؟ ولاكريه؟ *",
"*كم عمرك؟ *",
  "*لو يسألونك وش اسم امك تجاوبهم ولا تسفل فيهم؟ *",
  "*تؤمن بمقولة الصحبة تغنيك الحب؟ *",
  "*وش مشروبك المفضل؟ *",
  "*قد جربت الدخان بحياتك؟ وانقفطت ولا؟ *",
  "*أفضل وقت للسفر؟ الليل ولا النهار؟ *",
  "*انت من النوع اللي تنام بخط السفر؟ *",
  "*عندك حس فكاهي ولا نفسية؟ *",
  "*تبادل الكراهية بالكراهية؟ ولا تحرجه بالطيب؟ *",
  "*أفضل ممارسة بالنسبة لك؟ *",
  "*لو قالو لك تتخلى عن شي واحد تحبه بحياتك وش يكون؟ *",
"*لو احد تركك وبعد فتره يحاول يرجعك بترجع له ولا خلاص؟ *",
  "*برأيك كم العمر المناسب للزواج؟ *",
  "*اذا تزوجت بعد كم بتخلف عيال؟ *",
  "*فكرت وش تسمي أول اطفالك؟ *",
  "*من الناس اللي تحب الهدوء ولا الإزعاج؟ *",
  "*الشيلات ولا الأغاني؟ *",
  "*عندكم شخص مطوع بالعايلة؟ *",
  "*تتقبل النصيحة من اي شخص؟ *",
  "*اذا غلطت وعرفت انك غلطان تحب تعترف ولا تجحد؟ *",
  "*جربت شعور احد يحبك بس انت مو قادر تحبه؟ *",
  "*دايم قوة الصداقة تكون بإيش؟ *",
"*أفضل البدايات بالعلاقة بـ وش؟ *",
  "*وش مشروبك المفضل؟ او قهوتك المفضلة؟ *",
  "*تحب تتسوق عبر الانترنت ولا الواقع؟ *",
  "*انت من الناس اللي بعد ماتشتري شي وتروح ترجعه؟ *",
  "*أخر مرة بكيت متى؟ وليش؟ *",
  "*عندك الشخص اللي يقلب الدنيا عشان زعلك؟ *",
  "*أفضل صفة تحبه بنفسك؟ *",
  "*كلمة تقولها للوالدين؟ *",
  "*أنت من الناس اللي تنتقم وترد الاذى ولا تحتسب الأجر وتسامح؟ *",
  "*كم عدد سنينك بالتليجرام؟ *",
  "*تحب تعترف ولا تخبي؟ *",
"*انت من الناس الكتومة ولا تفضفض؟ *",
  "*أنت بعلاقة حب الحين؟ *",
  "*عندك اصدقاء غير جنسك؟ *",
  "*أغلب وقتك تكون وين؟ *",
  "*لو المقصود يقرأ وش بتكتب له؟ *",
  "*تحب تعبر بالكتابة ولا بالصوت؟ *",
  "*عمرك كلمت فويس احد غير جنسك؟ *",
  "*لو خيروك تصير مليونير ولا تتزوج الشخص اللي تحبه؟ *",
  "*لو عندك فلوس وش السيارة اللي بتشتريها؟ *",
  "*كم أعلى مبلغ جمعته؟ *",
  "*اذا شفت احد على غلط تعلمه الصح ولا تخليه بكيفه؟ *",
"*قد جربت تبكي فرح؟ وليش؟ *",
  "*تتوقع إنك بتتزوج اللي تحبه؟ *",
  "*ما هو أمنيتك؟ *",
  "*وين تشوف نفسك بعد خمس سنوات؟ *",
  "*لو خيروك تقدم الزمن ولا ترجعه ورا؟ *",
  "*لعبة قضيت وقتك فيه بالحجر المنزلي؟ *",
  "*تحب تطق الميانة ولا ثقيل؟ *",
  "*باقي معاك للي وعدك ما بيتركك؟ *",
  "*اول ماتصحى من النوم مين تكلمه؟ *",
  "*عندك الشخص اللي يكتب لك كلام كثير وانت نايم؟ *",
  "*قد قابلت شخص تحبه؟ وولد ولا بنت؟ *",
"*اذا قفطت احد تحب تفضحه ولا تستره؟ *",
  "*كلمة للشخص اللي يسب ويسطر؟ *",
  "*آية من القران تؤمن فيه؟ *",
  "*تحب تعامل الناس بنفس المعاملة؟ ولا تكون أطيب منهم؟ *",
"*حاجة ودك تغيرها هالفترة؟ *",
  "*كم فلوسك حاليا وهل يكفيك ام لا؟ *",
  "*وش لون عيونك الجميلة؟ *",
  "*من الناس اللي تتغزل بالكل ولا بالشخص اللي تحبه بس؟ *",
  "*اذكر موقف ماتنساه بعمرك؟ *",
  "*وش حاب تقول للاشخاص اللي بيدخل حياتك؟ *",
  "*ألطف شخص مر عليك بحياتك؟ *",
"*انت من الناس المؤدبة ولا نص نص؟ *",
  "*كيف الصيد معاك هالأيام ؟ وسنارة ولاشبك؟ *",
  "*لو الشخص اللي تحبه قال بدخل حساباتك بتعطيه ولا تكرشه؟ *",
  "*أكثر شي تخاف منه بالحياه وش؟ *",
  "*اكثر المتابعين عندك باي برنامج؟ *",
  "*متى يوم ميلادك؟ ووش الهدية اللي نفسك فيه؟ *",
  "*قد تمنيت شي وتحقق؟ *",
  "*قلبي على قلبك مهما صار لمين تقولها؟ *",
  "*وش نوع جوالك؟ واذا بتغيره وش بتأخذ؟ *",
  "*كم حساب عندك بالتليجرام؟ *",
  "*متى اخر مرة كذبت؟ *",
"*كذبت في الاسئلة اللي مرت عليك قبل شوي؟ *",
  "*تجامل الناس ولا اللي بقلبك على لسانك؟ *",
  "*قد تمصلحت مع أحد وليش؟ *",
  "*وين تعرفت على الشخص اللي حبيته؟ *",
  "*قد رقمت او احد رقمك؟ *",
  "*وش أفضل لعبته بحياتك؟ *",
  "*أخر شي اكلته وش هو؟ *",
  "*حزنك يبان بملامحك ولا صوتك؟ *",
  "*لقيت الشخص اللي يفهمك واللي يقرا افكارك؟ *",
  "*فيه شيء م تقدر تسيطر عليه ؟ *",
  "*منشن شخص متحلطم م يعجبه شيء؟ *",
"*اكتب تاريخ مستحيل تنساه *",
  "*شيء مستحيل انك تاكله ؟ *",
  "*تحب تتعرف على ناس جدد ولا مكتفي باللي عندك ؟ *",
  "*انسان م تحب تتعامل معاه ابداً ؟ *",
  "*شيء بسيط تحتفظ فيه؟ *",
  "*فُرصه تتمنى لو أُتيحت لك ؟ *",
  "*شيء مستحيل ترفضه ؟. *",
  "*لو زعلت بقوة وش بيرضيك ؟ *",
  "*تنام بـ اي مكان ، ولا بس غرفتك ؟ *",
  "*ردك المعتاد اذا أحد ناداك ؟ *",
  "*مين الي تحب يكون مبتسم دائما ؟ *",
"* إحساسك في هاللحظة؟ *",
  "*وش اسم اول شخص تعرفت عليه فالتلقرام ؟ *",
  "*اشياء صعب تتقبلها بسرعه ؟ *",
  "*شيء جميل صار لك اليوم ؟ *",
  "*اذا شفت شخص يتنمر على شخص قدامك شتسوي؟ *",
  "*يهمك ملابسك تكون ماركة ؟ *",
  "*ردّك على شخص قال (أنا بطلع من حياتك)؟. *",
  "*مين اول شخص تكلمه اذا طحت بـ مصيبة ؟ *",
  "*تشارك كل شي لاهلك ولا فيه أشياء ما تتشارك؟ *",
  "*كيف علاقتك مع اهلك؟ رسميات ولا ميانة؟ *",
  "*عمرك ضحيت باشياء لاجل شخص م يسوى ؟ *",
"*اكتب سطر من اغنية او قصيدة جا فـ بالك ؟ *",
  "*شيء مهما حطيت فيه فلوس بتكون مبسوط ؟ *",
  "*مشاكلك بسبب ؟ *",
  "*نسبه الندم عندك للي وثقت فيهم ؟ *",
  "*اول حرف من اسم شخص تقوله? بطل تفكر فيني ابي انام؟ *",
  "*اكثر شيء تحس انه مات ف مجتمعنا؟ *",
  "*لو صار سوء فهم بينك وبين شخص هل تحب توضحه ولا تخليه كذا  لان مالك خلق توضح ؟ *",
  "*كم عددكم بالبيت؟ *",
  "*عادي تتزوج من برا القبيلة؟ *",
  "*أجمل شي بحياتك وش هو؟ *",
}

local srah = {
  "*صراحه  |  صوتك حلو؟ *",
  "*صراحه  |  التقيت الناس مع ابو وجهين؟ *",
  "*صراحه  |  شيء كنت تبي تحققه؟ *",
  "*صراحه  |  أنا شخص ضعيف عندما؟ *",
  "*صراحه  |  هل ترغب في إظهار حبك ومرفق لشخص أو رؤية هذا الضعف؟ *",
  "*صراحه  |  يدل على أن الكذب مرات تكون ضرورية شي؟ *",
  "*صراحه  |  أشعر بالوحدة على الرغم من أنني تحيط بك كثيرا؟ *",
  "*صراحه  |  كيفية الكشف عن من يكمن عليك؟ *",
  "*صراحه  |  إذا حاول شخص ما أن يكرهه أن يقترب منك ويهتم بك تعطيه فرصة؟ *",
  "*صراحه  |  أشجع شيء حلو في حياتك؟ *",
  'صراحه  |  طريقة جيدة يقنع حتى لو كانت الفكرة خاطئة"* توافق؟',
  "*صراحه  |  كيف تتصرف مع من يسيئون فهمك ويأخذ على ذهنه ثم ينتظر أن يرفض؟ *",
  "*صراحه  |  التغيير العادي عندما يكون الشخص الذي يحبه؟ *",
  "*صراحه  |  المواقف الصعبة تضعف لك ولا ترفع؟ *",
  "*صراحه  |  نظرة تفسد الصداقة؟ *",
  "*صراحه  |  ‏‏إذا أحد قالك كلام سيء بالغالب وش تكون ردة فعلك؟ *",
  "*صراحه  |  شخص معك بالحلوه والمُره؟ *",
  "*صراحه  |  ‏هل تحب إظهار حبك وتعلقك بالشخص أم ترى ذلك ضعف؟ *",
  "*صراحه  |  تأخذ بكلام اللي ينصحك ولا تسوي اللي تبي؟ *",
  "*صراحه  |  وش تتمنى الناس تعرف عليك؟ *",
  "*صراحه  |  ابيع المجرة عشان؟ *",
  "*صراحه  |  أحيانا احس ان الناس ، كمل؟ *",
  "*صراحه  |  مع مين ودك تنام اليوم؟ *",
  "*صراحه  |  صدفة العمر الحلوة هي اني؟ *",
  'صراحه  |  الكُره العظيم دايم يجي بعد حُب قوي "* تتفق؟',
  "*صراحه  |  صفة تحبها في نفسك؟ *",
  'صراحه  |  ‏الفقر فقر العقول ليس الجيوب "* ، تتفق؟',
  "*صراحه  |  تصلي صلواتك الخمس كلها؟ *",
  "*صراحه  |  ‏تجامل أحد على راحتك؟ *",
  "*صراحه  |  اشجع شيء سويتة بحياتك؟ *",
  "*صراحه  |  وش ناوي تسوي اليوم؟ *",
  "*صراحه  |  وش شعورك لما تشوف المطر؟ *",
  "*صراحه  |  غيرتك هاديه ولا تسوي مشاكل؟ *",
  "*صراحه  |  ما اكثر شي ندمان عليه؟ *",
  "*صراحه  |  اي الدول تتمنى ان تزورها؟ *",
  "*صراحه  |  متى اخر مره بكيت؟ *",
  "*صراحه  |  تقيم حظك ؟ من عشره؟ *",
  "*صراحه  |  هل تعتقد ان حظك سيئ؟ *",
  "*صراحه  |  شـخــص تتمنــي الإنتقــام منـــه؟ *",
  "*صراحه  |  كلمة تود سماعها كل يوم؟ *",
  "*صراحه  |  **هل تُتقن عملك أم تشعر بالممل؟ *",
  "*صراحه  |  هل قمت بانتحال أحد الشخصيات لتكذب على من حولك؟ *",
  "*صراحه  |  متى آخر مرة قمت بعمل مُشكلة كبيرة وتسببت في خسائر؟ *",
  "*صراحه  |  ما هو اسوأ خبر سمعته بحياتك؟ *",
  "*‏صراحه | هل جرحت شخص تحبه من قبل ؟ *",
  "*صراحه  |  ما هي العادة التي تُحب أن تبتعد عنها؟ *",
  "*‏صراحه | هل تحب عائلتك ام تكرههم؟ *",
  "*‏صراحه  |  من هو الشخص الذي يأتي في قلبك بعد الله – سبحانه وتعالى- ورسوله الكريم – صلى الله عليه وسلم؟ *",
  "*‏صراحه  |  هل خجلت من نفسك من قبل؟ *",
  "*‏صراحه  |  ما هو ا الحلم  الذي لم تستطيع ان تحققه؟ *",
  "*‏صراحه  |  ما هو الشخص الذي تحلم به كل ليلة؟ *",
  "*‏صراحه  |  هل تعرضت إلى موقف مُحرج جعلك تكره صاحبهُ؟ *",
  "*‏صراحه  |  هل قمت بالبكاء أمام من تُحب؟ *",
  "*‏صراحه  |  ماذا تختار حبيبك أم صديقك؟ *",
  "*‏صراحه  | هل حياتك سعيدة أم حزينة؟ *",
  "*صراحه  |  ما هي أجمل سنة عشتها بحياتك؟ *",
  "*‏صراحه  |  ما هو عمرك الحقيقي؟ *",
  "*‏صراحه  |  ما اكثر شي ندمن عليه؟ *",
  "*صراحه  |  ما هي أمنياتك المُستقبلية؟‏ *",
  "*صراحه | نفسك فـ ايه ؟ *",
  "*صراحه | هل تحب فتاه او احببت من قبل ؟ *",
  "*صراحه | هل شكلك حلو او جيد او متوسط او سئ ؟ *",
  "*صراحه | ما هي الماده الدراسيه التي تحبها اكثر وتفضلها؟ *",
  "*صراحه | هل تحب مدرستك ؟ *",
  "*صراحه | ما الشئ الذي تتمني ان يحصل ؟ *",
  "*صراحه | هل تحب عائلتك ؟ *",
}

local ker = {
"*لو خيروك |  بين الإبحار لمدة أسبوع كامل أو السفر على متن طائرة لـ 3 أيام متواصلة؟ *",
"*لو خيروك |  بين شراء منزل صغير أو استئجار فيلا كبيرة بمبلغ معقول؟ *",
"*لو خيروك |  أن تعيش قصة فيلم هل تختار الأكشن أو الكوميديا؟ *",
"*لو خيروك |  بين تناول البيتزا وبين الآيس كريم وذلك بشكل دائم؟ *",
"*لو خيروك |  بين إمكانية تواجدك في الفضاء وبين إمكانية تواجدك في البحر؟ *",
"*لو خيروك |  بين تغيير وظيفتك كل سنة أو البقاء بوظيفة واحدة طوال حياتك؟ *",
"*لو خيروك |  أسئلة محرجة أسئلة صراحة ماذا ستختار؟ *",
"*لو خيروك |  بين الذهاب إلى الماضي والعيش مع جدك أو بين الذهاب إلى المستقبل والعيش مع أحفادك؟ *",
"*لو كنت شخص آخر هل تفضل البقاء معك أم أنك ستبتعد عن نفسك؟ *",
"*لو خيروك |  بين الحصول على الأموال في عيد ميلادك أو على الهدايا؟ *",
"*لو خيروك |  بين القفز بمظلة من طائرة أو الغوص في أعماق البحر؟ *",
"*لو خيروك |  بين الاستماع إلى الأخبار الجيدة أولًا أو الاستماع إلى الأخبار السيئة أولًا؟ *",
"*لو خيروك |  بين أن تكون رئيس لشركة فاشلة أو أن تكون موظف في شركة ناجحة؟ *",
"*لو خيروك |  بين أن يكون لديك جيران صاخبون أو أن يكون لديك جيران فضوليون؟ *",
"*لو خيروك |  بين أن تكون شخص مشغول دائمًا أو أن تكون شخص يشعر بالملل دائمًا؟ *",
"*لو خيروك |  بين قضاء يوم كامل مع الرياضي الذي تشجعه أو نجم السينما الذي تحبه؟ *",
"*لو خيروك |  بين استمرار فصل الشتاء دائمًا أو بقاء فصل الصيف؟ *",
"*لو خيروك |  بين العيش في القارة القطبية أو العيش في الصحراء؟ *",
"*لو خيروك |  بين أن تكون لديك القدرة على حفظ كل ما تسمع أو تقوله وبين القدرة على حفظ كل ما تراه أمامك؟ *",
"*لو خيروك |  بين أن يكون طولك 150 سنتي متر أو أن يكون 190 سنتي متر؟ *",
"*لو خيروك |  بين إلغاء رحلتك تمامًا أو بقائها ولكن فقدان الأمتعة والأشياء الخاص بك خلالها؟ *",
"*لو خيروك |  بين أن تكون اللاعب الأفضل في فريق كرة فاشل أو أن تكون لاعب عادي في فريق كرة ناجح؟ *",
"*لو خيروك |  بين ارتداء ملابس البيت لمدة أسبوع كامل أو ارتداء البدلة الرسمية لنفس المدة؟ *",
"*لو خيروك |  بين امتلاك أفضل وأجمل منزل ولكن في حي سيء أو امتلاك أسوأ منزل ولكن في حي جيد وجميل؟ *",
"*لو خيروك |  بين أن تكون غني وتعيش قبل 500 سنة، أو أن تكون فقير وتعيش في عصرنا الحالي؟ *",
"*لو خيروك |  بين ارتداء ملابس الغوص ليوم كامل والذهاب إلى العمل أو ارتداء ملابس جدك/جدتك؟ *",
"*لو خيروك |  بين قص شعرك بشكل قصير جدًا أو صبغه باللون الوردي؟ *",
"*لو خيروك |  بين أن تضع الكثير من الملح على كل الطعام بدون علم أحد، أو أن تقوم بتناول شطيرة معجون أسنان؟ *",
"*لو خيروك |  بين قول الحقيقة والصراحة الكاملة مدة 24 ساعة أو الكذب بشكل كامل مدة 3 أيام؟ *",
"*لو خيروك |  بين تناول الشوكولا التي تفضلها لكن مع إضافة رشة من الملح والقليل من عصير الليمون إليها أو تناول ليمونة كاملة كبيرة الحجم؟ *",
"*لو خيروك |  بين وضع أحمر الشفاه على وجهك ما عدا شفتين أو وضع ماسكارا على شفتين فقط؟ *",
"*لو خيروك |  بين الرقص على سطح منزلك أو الغناء على نافذتك؟ *",
"*لو خيروك |  بين تلوين شعرك كل خصلة بلون وبين ارتداء ملابس غير متناسقة لمدة أسبوع؟ *",
"*لو خيروك |  بين تناول مياه غازية مجمدة وبين تناولها ساخنة؟ *",
"*لو خيروك |  بين تنظيف شعرك بسائل غسيل الأطباق وبين استخدام كريم الأساس لغسيل الأطباق؟ *",
"*لو خيروك |  بين تزيين طبق السلطة بالبرتقال وبين إضافة البطاطا لطبق الفاكهة؟ *",
"*لو خيروك |  بين اللعب مع الأطفال لمدة 7 ساعات أو الجلوس دون فعل أي شيء لمدة 24 ساعة؟ *",
"*لو خيروك |  بين شرب كوب من الحليب أو شرب كوب من شراب عرق السوس؟ *",
"*لو خيروك |  بين الشخص الذي تحبه وصديق الطفولة؟ *",
"*لو خيروك |  بين أمك وأبيك؟ *",
"*لو خيروك |  بين أختك وأخيك؟ *",
"*لو خيروك |  بين نفسك وأمك؟ *",
"*لو خيروك |  بين صديق قام بغدرك وعدوك؟ *",
"*لو خيروك |  بين خسارة حبيبك/حبيبتك أو خسارة أخيك/أختك؟ *",
"*لو خيروك |  بإنقاذ شخص واحد مع نفسك بين أمك أو ابنك؟ *",
"*لو خيروك |  بين ابنك وابنتك؟ *",
"*لو خيروك |  بين زوجتك وابنك/ابنتك؟ *",
"*لو خيروك |  بين جدك أو جدتك؟ *",
"*لو خيروك |  بين زميل ناجح وحده أو زميل يعمل كفريق؟ *",
"*لو خيروك |  بين لاعب كرة قدم مشهور أو موسيقي مفضل بالنسبة لك؟ *",
"*لو خيروك |  بين مصور فوتوغرافي جيد وبين مصور سيء ولكنه عبقري فوتوشوب؟ *",
"*لو خيروك |  بين سائق سيارة يقودها ببطء وبين سائق يقودها بسرعة كبيرة؟ *",
"*لو خيروك |  بين أستاذ اللغة العربية أو أستاذ الرياضيات؟ *",
"*لو خيروك |  بين أخيك البعيد أو جارك القريب؟ *",
"*لو خيروك |  يبن صديقك البعيد وبين زميلك القريب؟ *",
"*لو خيروك |  بين رجل أعمال أو أمير؟ *",
"*لو خيروك |  بين نجار أو حداد؟ *",
"*لو خيروك |  بين طباخ أو خياط؟ *",
"*لو خيروك |  بين أن تكون كل ملابس بمقاس واحد كبير الحجم أو أن تكون جميعها باللون الأصفر؟ *",
"*لو خيروك |  بين أن تتكلم بالهمس فقط طوال الوقت أو أن تصرخ فقط طوال الوقت؟ *",
"*لو خيروك |  بين أن تمتلك زر إيقاف موقت للوقت أو أن تمتلك أزرار للعودة والذهاب عبر الوقت؟ *",
"*لو خيروك |  بين أن تعيش بدون موسيقى أبدًا أو أن تعيش بدون تلفاز أبدًا؟ *",
"*لو خيروك |  بين أن تعرف متى سوف تموت أو أن تعرف كيف سوف تموت؟ *",
"*لو خيروك |  بين العمل الذي تحلم به أو بين إيجاد شريك حياتك وحبك الحقيقي؟ *",
"*لو خيروك |  بين معاركة دب أو بين مصارعة تمساح؟ *",
"*لو خيروك |  بين إما الحصول على المال أو على المزيد من الوقت؟ *",
"*لو خيروك |  بين امتلاك قدرة التحدث بكل لغات العالم أو التحدث إلى الحيوانات؟ *",
"*لو خيروك |  بين أن تفوز في اليانصيب وبين أن تعيش مرة ثانية؟ *",
"*لو خيروك |  بأن لا يحضر أحد إما لحفل زفافك أو إلى جنازتك؟ *",
"*لو خيروك |  بين البقاء بدون هاتف لمدة شهر أو بدون إنترنت لمدة أسبوع؟ *",
"*لو خيروك |  بين العمل لأيام أقل في الأسبوع مع زيادة ساعات العمل أو العمل لساعات أقل في اليوم مع أيام أكثر؟ *",
"*لو خيروك |  بين مشاهدة الدراما في أيام السبعينيات أو مشاهدة الأعمال الدرامية للوقت الحالي؟ *",
"*لو خيروك |  بين التحدث عن كل شيء يدور في عقلك وبين عدم التحدث إطلاقًا؟ *",
"*لو خيروك |  بين مشاهدة فيلم بمفردك أو الذهاب إلى مطعم وتناول العشاء بمفردك؟ *",
"*لو خيروك |  بين قراءة رواية مميزة فقط أو مشاهدتها بشكل فيلم بدون القدرة على قراءتها؟ *",
"*لو خيروك |  بين أن تكون الشخص الأكثر شعبية في العمل أو المدرسة وبين أن تكون الشخص الأكثر ذكاءً؟ *",
"*لو خيروك |  بين إجراء المكالمات الهاتفية فقط أو إرسال الرسائل النصية فقط؟ *",
"*لو خيروك |  بين إنهاء الحروب في العالم أو إنهاء الجوع في العالم؟ *",
"*لو خيروك |  بين تغيير لون عينيك أو لون شعرك؟ *",
"*لو خيروك |  بين امتلاك كل عين لون وبين امتلاك نمش على خديك؟ *",
"*لو خيروك |  بين الخروج بالمكياج بشكل مستمر وبين الحصول على بشرة صحية ولكن لا يمكن لك تطبيق أي نوع من المكياج؟ *",
"*لو خيروك |  بين أن تصبحي عارضة أزياء وبين ميك آب أرتيست؟ *",
"*لو خيروك |  بين مشاهدة كرة القدم أو متابعة الأخبار؟ *",
"*لو خيروك |  بين موت شخصية بطل الدراما التي تتابعينها أو أن يبقى ولكن يكون العمل الدرامي سيء جدًا؟ *",
"*لو خيروك |  بين العيش في دراما قد سبق وشاهدتها ماذا تختارين بين الكوميديا والتاريخي؟ *",
"*لو خيروك |  بين امتلاك القدرة على تغيير لون شعرك متى تريدين وبين الحصول على مكياج من قبل خبير تجميل وذلك بشكل يومي؟ *",
"*لو خيروك |  بين نشر تفاصيل حياتك المالية وبين نشر تفاصيل حياتك العاطفية؟ *",
"*لو خيروك |  بين البكاء والحزن وبين اكتساب الوزن؟ *",
"*لو خيروك |  بين تنظيف الأطباق كل يوم وبين تحضير الطعام؟ *",
"*لو خيروك |  بين أن تتعطل سيارتك في نصف الطريق أو ألا تتمكنين من ركنها بطريقة صحيحة؟ *",
"*لو خيروك |  بين إعادة كل الحقائب التي تملكينها أو إعادة الأحذية الجميلة الخاصة بك؟ *",
"*لو خيروك |  بين قتل حشرة أو متابعة فيلم رعب؟ *",
"*لو خيروك |  بين امتلاك قطة أو كلب؟ *",
"*لو خيروك |  بين الصداقة والحب *",
"*لو خيروك |  بين تناول الشوكولا التي تحبين طوال حياتك ولكن لا يمكنك الاستماع إلى الموسيقى وبين الاستماع إلى الموسيقى ولكن لا يمكن لك تناول الشوكولا أبدًا؟ *",
"*لو خيروك |  بين مشاركة المنزل مع عائلة من الفئران أو عائلة من الأشخاص المزعجين الفضوليين الذين يتدخلون في كل كبيرة وصغيرة؟ *",
}
local mkl = {
"• {  *يلا - اكتب - اول - مقال - في - بوت - جعفر - الصملاوي - وره - سرعتك* }",
"• {  *اول - مقال - نشوف - من - الاسرع - في - القروب - والاقدح* }",
"• {  *يلا - اكتب - خلينا - نشوف - سرعتك - يا - بطل - انتبه - تخسر - ذا - المقال* }",
"• {  *للحين - المستوى - فاشل - ما - اشوف مستوى - خلك - اسرع - السارعين - يا - وحش* }",
"• {  *وحش - وحش - مستواك - اسطوري - بس - صعبه - عليك - تطوفني* }",
"• {  *راح - تصمل - مافيه - هروب - يلا - حاول تطوفني - يا - بطوط* }",
"• {  *اذا - انت - تشوف - نفسك - منجد - سريع ؟ - حاول - ما - تخسر - ذي - المقاله* }",
"• {  *شوف - للحين - مطوفك - وكاسر - عينك - والقروب - كله - شاهد* }",
"• {  *يلا - مستوى - يا - وحش - يا - اسطوره - اكتب - مقال - سريع - جداً* }",
"• {  *نبي - لعب - نظيف - بدون - نسخ - وبعص* }",
"• {  *اكتب - اكتب - معي - خلك - طياره - خلك - اسطوره - اصدمهم - بسرعتك* }",
"• {  *اصدم - خصمك - بسرعتك - خلك - اسطوره - يا - وحش - تعب - خصمك* }",
"• {  *الي - يسولف - واجد - وما - يلعب - يقلب - وجه - نبي - لعب - مرتب - شريف - قوي* }",
"• {  *شوف - كيف - بدعس - عليك - واطوفك - وامحطك - راقب - وتعلم* }",
"• {  *يلا - ذا - المقال - مقالك - اكسر - عين - خصمك - لعيون - بوت - جعفر* }",
"• {  *العب - العب - صدقني - مدعوس - عليك - يا - بطه - طور - من - مستواك* }",
"• {  *اسرع - اسرع - انتبه - يضحكون - عليك - تكون - مصخره - اي - احد - يجي - يدعسك* }",
"• {  *مقال - ضد - التكليج - حاول - تاخذه - بدون - ولا - كلجه - يا - اسطوري* }",
"• {  *مافيه - انسحاب - راح - تلعب - يعني - راح - تلعب - صمله - يعني - صمله* }",
"• {  *اكتب - بدون طلسمه - سيطر - على - كيبوردك - يلا - يا - وحش* }",
"• {  *اي - احد - راح - يبعص - اللعب - راح - ينطرد - برا - القروب* }",
"• {  *يلا - مستوى - يا - وحش - يا - اسطوره - اكتب - مقال - سريع -* }",
"• {  *ماتقدر - تطوفني - صاحي - انت - ما - تعرفني - يسموني - كنق - المقالات - وفحل - الكيبورد* }",
"• {  *هيا - ذا - المقال - مقالك - ذا - المقال - لك - لا - تخلي - احد - ياخذه* }",
"• {  *يلا - يا - وحش - ادعس - خصمك - لا - تفشل - نفسك - لا - تخلي - احد - يطوفك* }",
"• {  *لو - كان - مستواك - في - الكتابه - ضعيف - حاول - تلعب - مقالات - كثير - عشان - تطور - من - مستواك* }",
"• {  *كم - مره - نقلك - لا - تكلج - العب - زين - ولا - ضف - وجهك* }",
"• {  *اقلك - ماراح - تقدر - تطوفني - صدقني - تراك - بطه - سامع - يا - بطيء* }",
"• {  *طور - من - مستواك - وارجع - حاول - تجاريني - يا - بطوط - مستواك - زق - الصراحه - وجدا - جدا* }",
"• {  *خليك - اسرع - واحد - في - القروب* }",
"• {  *دعستك - صح - طوفتك - صح - ماقدرت - علي - صح - ماراح - تقدر - يا - هطف* }",
"• {  *راح - تتعب - معي - العب - شوف - كيف - بكل - جوله - اكسر - عينك* }",
"• {  *وضعك - يفشل - كل - من - جا - يطوفك - سلامات - اسرع - اسرع* }",
"• {  *العب - بتركيز - وبنفس - الوقت - بسرعه - يلا - ورنا - تقدر - او - لا* }", 
"• {  *هيا - قم - ورنا - كيف - تكتب - كيف - تدعس - عليهم - يا - طياره* }",
"• {  *اول - مقال - نشوف - من - الاسرع - في - القروب - والاقدح* }",
"• {  *يلا - اكتب - اول - مقال - في - بوت - جعفر - الصملاوي - وره - سرعتك* }",
"• {  *المقال - يبي - له - واحد - يلعب - بسرعه - ويتنجب - الهبد* }",
"• {  *اقلك - ماراح - تقدر - تطوفني - صدقني - تراك - بطه - سامع - يا - بطيء - هذا المقال - رقم - 30* }",
"• {  *اكره - شيء - الي - يحط - لك - بيسات - يعني - وش - وضعك - يا - لحجي* }",
"• {  *هيا - قم - ورنا - كيف - تكتب - كيف - تدعس - عليهم - يا - طياره* }",
"• {  *يلا - مقال - لعيونك - ولعيون - خصمك - نشوف - من - يدعس - الثاني* }",
"• {  *لو - عجزت - تطوفني - بتصمل - معي - لين - تطوفني - يا - بطيء* }",
"• {  *المقال - يبي - له - واحد - يلعب - بسرعه - ويتنجب - الهبد* }",
"• {  *الصراحه - وذا - مستواك - عيب - احطك - خصم - برا - يا - بطه* }",
"• {  *يلا - ذي - الجولة - باسمك - اكسبها - عشان - تثبت - لاعضاء - القروب - انك - قوي* }",
"• {  *طيب - الحين - خلك - سريع - واكسب - ذا - المقال - بدون - كلج* }",
"• {  *شوف - حتى - وانا - بوت - قاعد - اشوفك - تنجلد - عيب - عليك - ياخي* }",
"• {  *للحين - المستوى - فاشل - ما - اشوف مستوى - خلك - اسرع - السارعين - يا - وحش* }",
"• {  *يلا - اكتب - خلينا - نشوف - سرعتك - يا - بطل - انتبه - تخسر - ذا - المقال* }",
"• {  *اكتب - اكتب - معي - خلك - طياره - خلك - اسطوره - اصدمهم - بسرعتك* }",
"• {  *مقال - بين - اثنين - ون - في - ون - نشوف - من - راح - يكسر - عين - الثاني* }",
"• {  *العب - شوي - نشوف - بتقدر - تطوفني - او - بتاكل - زق - امزح - حلاوه* }",
"• {  *طيب - حاول - تطوفني - الحين - بهاذا - المقال - القصير* }",
"• {  *تشوف - نفسك - سريع - امش - العب - واختبر - سرعتك - طيب* }",
"• {  *اقول - امش - العب - معي - اعلمك - كيف - تكتب - وامحطك* }",
"• {  *اكتب - سريع - اسرع - من - السريع - يا - سريع - يا - اسرع - من - السارعين* }",
"• {  *يلا - نلعب - ونشوف - مين - اقوى - واسرع - واحد* }",
"• {  *العب - بتركيز - وبسرعه - ركز - لا - تنلخم - يا - وحش* }",
"• {  *يلا - ادعس - خصمك - خله - يندم - انه - لعب - مع - شخص - قوي - مثلك* }",
"• {  *المقال - هاذا - مقال - قصير - بس - بخليه - شوي - طويل* }",
"• {  *تبي - يتطور - مستواك - حاول - تلعب - مقالات - كثير - تصير - سريع* }",
"• {  *خليك - كفو - لو - مره - وحده - وحاول - تسيطر - على - كيبوردك - يا - طلسومي* }",
"• {  *طيب - يلا - يا - مسكين - تقول - تبي - تطوفني - صدقني - ما - بتقدر - يا - هطف* }",
"• {  *لما - تهابد - على - الكيبورد - راح - تخسر - المقال - هديها - شوي* }",
"• {  *ارحم - كيبوردك - بشويش - عليه - مسكين - كذا - حتى - المقال - تخسره* }",
"• {  *الكل - يدري - انك - اسرع - واحد - واقوى - واحد - اقول - العب - لا - تصدق - نفسك* }",
"• {  *وش - فيك - مرتبك - وخايف - روق - خذ - نفس - عميق - العب - مقال - هادي* }",
"• {  *يلا - ذا - المقال - مقالك - شوف - خصمك - حاط - عينه - عليه - انتبه - ياخذه* }",
"• {  *مستواك - قوي - وخصمك - اقوى - يعني - منافسه - قويه - اثبت - لهم - انك - اقوى* }",
"• {  *يعمري - مستواك - حلو - مستواك - اسطوري - ابهرهم - اكثر - هيا* }",
"• {  *مقال - يقال - فيه - انه - اقوى - مقال* }",
"• {  *هاي - هلا - باي* }",
"• {  *انا - اقول - كمل - لعب - حتى - لو - اندعس - عليك - طور - مستواك - يلا* }",
"• {  *اليوم - يندعس - عليك - بكرا - تدعس - عليهم - لا - تفقد - الامل - دنيا - دواره* }",
"• {  *يا - مدري - وش - اسمك - العب - شفيك - خايف - ما - تقدر - تجاريني - صح* }",
"• {  *بل - بل - مغير - هبد - على - الكيبورد - القروب - قلب - كله - سحر - وش - ذا* }",
"• {  *اسمع - اسمع - اكتب - بسرعه - ياخي - شفيك - بطيء - شفيك - سريع* }",
"• {  *اكسب - ذا - المقال - بكل - قوه - ابتجح - وادعسهم - يلا - يا - وحش* }",
"• {  *يا - حبيبي - شفيك - تطلسم - سلامات - يلا - اكتب - بدون - طلسمه* }",
"• {  *بسم - الله - ذا - المقال - بتاخذه - غصب - عنهم - يلا - يا - حلو* }",
"• {  *العب - لعب - قوي - اسطوري - العب - اكسر - عين - اي - احد - يلعب - معك* }",
}

local bott = {
"انت البوت",
"يا روح قلب البوت💙",
"تفضل عيـني❤",
"عيـونـي لك😍",
"حيـاة البوت🖤",
"اسمي ["..Bot_Name.."] .",
}

local su = {
  "اهلا بمطوري الحلو 🔥😍.",
  "ارحب يالمطور💕.",
  "هلا .",
  "عيون ["..Bot_Name.."] .",
  "ارحب ."
}
  local ss97 = {
  "روح [".. Bot_Name.."]💕.",
"امرني يعيني ♥.",
  "امرني .","نعم","هاه.","شفيه",
  "لبييه .","عيوني لك.","امرني يا حلو.",
  "ها يا روحي.","هلا .","شتبغى.",
  "عيون ["..Bot_Name.."] .",
  }
  
  local bs = {
"يع اي القرف ده يعم شوفلنا حد عدل😢.",
"اووف هي دي الشفايف😍💋",
"الوش مش مساعد🙁",
"هفرتك شفايفك💋🤤",
}

local Text = msg.text
local Text2 = Text:match("^"..Bot_Name.." (%d+)$")

if msg.SudoUser and Text == Bot_Name and not Text2 then
return sendMsg(msg.chat_id_,msg.id_,su[math.random(#su)])
elseif not msg.SudoUser and Text== Bot_Name and not Text2 then  
return sendMsg(msg.chat_id_,msg.id_,ss97[math.random(#ss97)])

elseif Text:match("^قول (.*)$") then
if utf8.len(Text:match("^قول (.*)$")) > 100 then 
return sendMsg(msg.chat_id_,msg.id_,"- ماقدرش اقول اكتر من 100 حرف 🍂")
end
local callback_Text = FlterName(Text:match("^قول (.*)$"),100)
if callback_Text and callback_Text == 'الاسم سبام ' then
return sendMsg(msg.chat_id_,msg.id_,"- للاسف النص هذا مخالف ")
else
return sendMsg(msg.chat_id_,0,callback_Text) 
end

elseif Text:match("^بوس (.*)$") then 
if msg.reply_id then 
return sendMsg(msg.chat_id_,msg.reply_id,bs[math.random(#bs)])
else
return sendMsg(msg.chat_id_,msg.id_,"ابوس مين بقا اعملو رد🌚")
end 

elseif not msg.SudoUser and Text==" خيروك" then
sendMsg(msg.chat_id_,msg.id_,ker[math.random(#ker)])
elseif not msg.SudoUser and Text==" حروف" or Text == "حروف" or Text == " حر" or Text == "حر" then
sendMsg(msg.chat_id_,msg.id_,hhh[math.random(#hhh)])

elseif not msg.SudoUser and Text=="كت" or Text == "كت تويت" or Text == "كت" or Text == "تويت" then
sendMsg(msg.chat_id_,msg.id_,drok[math.random(#drok)])
elseif not msg.SudoUser and Text==" مقالات" or Text == "مقالات" or Text == " 0" or Text == "0" then

sendMsg(msg.chat_id_,msg.id_,mkl[math.random(#mkl)])
elseif not msg.SudoUser and Text==" صراحه" or Text == "صراحه" then
sendMsg(msg.chat_id_,msg.id_,srah[math.random(#srah)])


elseif not msg.SudoUser and Text=="بوت" or Text == "البوت" or Text == "بوت" then
sendMsg(msg.chat_id_,msg.id_,bott[math.random(#bott)])

elseif Text== "باسل" or Text== "بيسو" or Text== "بسله" then return sendMsg(msg.chat_id_,msg.id_,"[مطور السورس👑](T.ME/xb_0b)")
elseif Text== "ايديي" or Text=="ايدي 🆔" then 
GetUserID(msg.sender_user_id_,function(arg,data)
if data.username_ then USERNAME = '@'..data.username_ else USERNAME = FlterName(data) end
USERNAME = USERNAME:gsub([[\_]],"_")
USERCAR = utf8.len(USERNAME) 
SendMention(msg.chat_id_,data.id_,msg.id_," آضـغط على آلآيدي ليتم آلنسـخ\n\n "..USERNAME.." ~⪼ ( "..data.id_.." )",37,USERCAR)  
return false
end)
elseif Text=="اريد رابط الحذف" or Text=="اريد رابط حذف" or Text=="رابط حذف" or Text=="رابط الحذف" then
return sendMsg(msg.chat_id_,msg.id_,[[
 رابط حذف حـساب التيليجرام ↯
 بالتـوفيـق ...
 ¦ـ  https://telegram.org/deactivate
]] )
--=====================================
elseif Text== "انا مين" or Text== "مين انا" then
if msg.SudoUser then  
return sendMsg(msg.chat_id_,msg.id_,"مطوري العشق")
elseif msg.Creator then 
return sendMsg(msg.chat_id_,msg.id_,"المنشئ تاج راسي")
elseif msg.Director then 
return sendMsg(msg.chat_id_,msg.id_,"مدير المجموعه الهيبه")
elseif msg.Admin then 
return sendMsg(msg.chat_id_,msg.id_,"فقط ادمن")
else 
return sendMsg(msg.chat_id_,msg.id_,"تيسك")
end 
end 

end


------------------------------{ End Replay Send }------------------------

------------------------------{ Start Checking CheckExpire }------------------------

if redis:get(boss..'CheckExpire::'..msg.chat_id_) then
local ExpireDate = redis:ttl(boss..'ExpireDate:'..msg.chat_id_)
SUDO_USER = redis:hgetall(boss..'username:'..SUDO_ID).username
if SUDO_USER:match('@[%a%d_]+') then 
SUDO_USERR = "\n- راسل المطور للتجديد ["..SUDO_USER.."]"
else
SUDO_USERR = ""
end
if not ExpireDate and not msg.SudoUser then
rem_data_group(msg.chat_id_)
sendMsg(SUDO_ID,0,'- انتهى الاشتراك في احد المجموعات \n- المجموعه : '..FlterName(redis:get(boss..'group:name'..msg.chat_id_))..'\n- ايدي : '..msg.chat_id_)
sendMsg(msg.chat_id_,0,'- انتهى الاشتراك البوت\n- سوف اغادر المجموعه فرصه سعيده '..SUDO_USERR..' ')
return StatusLeft(msg.chat_id_,our_id)
else
local DaysEx = (redis:ttl(boss..'ExpireDate:'..msg.chat_id_) / 86400)
if tonumber(DaysEx) > 0.208 and ExpireDate ~= -1 and msg.Admin then
if tonumber(DaysEx + 1) == 1 and not msg.SudoUser then
sendMsg(msg.chat_id_,'- باقي يوم واحد وينتهي الاشتراك \n '..SUDO_USERR..'')
end 
end 
end
end

------------------------------{ End Checking CheckExpire }------------------------


end 

return {
Boss = {
"^(اضف رد عشوائي)$",
"^(مسح رد عشوائي)$",
"^(مسح الردود العشوائيه)$",
"^(الردود العشوائيه)$",
"^(اضف رد عشوائي عام)$",
"^(مسح رد عشوائي عام)$",
"^(مسح الردود العشوائيه العامه)$",
"^(الردود العشوائيه العام)$",
"^(مسح المطورين)$",
"^(مسح قائمه العام)$",
"^(مسح الادمنيه)$",
"^(مسح المنشئين الاساسين)$",
"^(مسح المنشئيين الاساسيين)$",
"^(مسح المنشئين الاساسيين)$",
"^(مسح المنشئيين الاساسين)$",
"^(مسح الرسائل المجدوله)$",
"^(مسح الميديا)$",
"^(مسح الوسائط)$",
"^(مسح التعديلات)$",
"^(مسح سحكاتي)$",
"^(مسح تعديلاتي)$",
"^(مسح قائمه المنع)$",
"^(مسح القوانين)$",
"^(مسح الترحيب)$",
"^(مسح المنشئيين)$",
"^(مسح المنشئين)$",
"^(مسح المدراء)$",
"^(مسح المحظورين)$",
"^(مسح المكتومين)$",
"^(مسح المميزين)$",
"^(مسح القرده)$",
"^(مسح القلوب)$",
"^(مسح الوتك)$",
"^(مسح زوجاتي)$",
"^(مسح ازواجي)$",
"^(مسح الرابط)$",

"^(مسح قائمه الرتب)$",
"^(مسح الرتبه)$",
"^(تغير الرتبه)$",
"^(قائمه الرتب)$",
"^(المالك)$",
"^(المنشئ)$",
"^(المنشى)$",
"^(رفع القيود)$",
"^(رفع القيود) (%d+)$",
"^(رفع القيود) (@[%a%d_]+)$",
"^(تقييد) (%d+)$",
"^(تقييد) (@[%a%d_]+)$",
"^(فك التقييد) (%d+)$",
"^(فك التقييد) (@[%a%d_]+)$",
"^(فك تقييد) (%d+)$",
"^(فك تقييد) (@[%a%d_]+)$",
"^(ضع شرط التفعيل) (%d+)$",
"^(التفاعل) (@[%a%d_]+)$",
"^(التفاعل) (%d+)$",
"^(ايدي) (@[%a%d_]+)$",
"^(كشف) (%d+)$",
"^(كشف) (@[%a%d_]+)$",
'^(رفع مميز) (@[%a%d_]+)$',
'^(رفع مميز) (%d+)$',
'^(رفع قرد) (@[%a%d_]+)$',
'^(رفع قرد) (%d+)$',
'^(تنزيل قرد) (@[%a%d_]+)$', 
'^(تنزيل قرد) (%d+)$',
'^(رفع قلبي) (@[%a%d_]+)$',
'^(رفع قلبي) (%d+)$',
'^(تنزيل قلبي) (@[%a%d_]+)$', 
'^(تنزيل قلبي) (%d+)$',
'^(رفع وتكه) (@[%a%d_]+)$',
'^(رفع وتكه) (%d+)$',
'^(تنزيل وتكه) (@[%a%d_]+)$', 
'^(تنزيل وتكه) (%d+)$',
'^(رفع زوجي) (@[%a%d_]+)$',
'^(رفع زوجي) (%d+)$',
'^(تنزيل زوجي) (@[%a%d_]+)$', 
'^(تنزيل زوجي) (%d+)$',
'^(رفع زوجتي) (@[%a%d_]+)$',
'^(رفع زوجتي) (%d+)$',
'^(تنزيل زوجتي) (@[%a%d_]+)$', 
'^(تنزيل زوجتي) (%d+)$',
'^(تنزيل الكل) (@[%a%d_]+)$',
'^(تنزيل الكل) (%d+)$',
'^(تنزيل مميز) (@[%a%d_]+)$',
'^(تنزيل مميز) (%d+)$',
'^(رفع ادمن) (@[%a%d_]+)$',
'^(رفع ادمن) (%d+)$',
'^(تنزيل ادمن) (@[%a%d_]+)$',
'^(تنزيل ادمن) (%d+)$', 
'^(رفع مدير) (@[%a%d_]+)$',
'^(رفع المدير) (@[%a%d_]+)$',
'^(رفع المدير) (%d+)$',
'^(رفع مدير) (%d+)$',
'^(رفع منشئ) (@[%a%d_]+)$',
'^(رفع منشى) (%d+)$',
'^(رفع منشئ) (%d+)$',
'^(رفع منشى) (@[%a%d_]+)$',
'^(رفع مشرف) (@[%a%d_]+)$',
'^(تنزيل مشرف)$',
'^(تنزيل مشرف) (%d+)$',
'^(رفع مشرف)$',
'^(رفع مشرف) (%d+)$',
'^(تنزيل منشئ) (%d+)$',
'^(تنزيل منشى) (%d+)$',
'^(تنزيل مشرف) (@[%a%d_]+)$',
'^(تنزيل منشى) (@[%a%d_]+)$',
'^(تنزيل منشئ) (@[%a%d_]+)$',
'^(تنزيل مدير) (@[%a%d_]+)$',
'^(تنزيل المدير) (@[%a%d_]+)$',
'^(تنزيل المدير) (%d+)$',
'^(تنزيل مدير) (%d+)$',
'^(ضع تكرار) (%d+)$',
'^(ضع وقت التنظيف) (%d+)$',
"^(مسح)$",
"^(مسح) (.+)$",
'^(منع) (.+)$',
'^(الغاء منع) (.+)$',
"^(حظر عام) (@[%a%d_]+)$",
"^(حظر عام) (%d+)$",
"^(الغاء العام) (@[%a%d_]+)$",
"^(الغاء العام) (%d+)$",
"^(الغاء عام) (@[%a%d_]+)$",
"^(الغاء عام) (%d+)$",
"^(حظر) (@[%a%d_]+)$",
"^(حظر) (%d+)$",
"^(الغاء الحظر) (@[%a%d_]+)$",
"^(الغاء الحظر) (%d+)$",
"^(الغاء حظر) (@[%a%d_]+)$",
"^(الغاء حظر) (%d+)$",
"^(طرد) (@[%a%d_]+)$",
"^(طرد) (%d+)$",
"^(كتم) (@[%a%d_]+)$",
"^(كتم) (%d+)$",
"^(الغاء الكتم) (@[%a%d_]+)$",
"^(الغاء الكتم) (%d+)$",
"^(الغاء كتم) (@[%a%d_]+)$",
"^(الغاء كتم) (%d+)$",
"^(رفع مطور) (@[%a%d_]+)$",
"^(رفع مطور) (%d+)$",
"^(تنزيل مطور) (%d+)$",
"^(تنزيل مطور) (@[%a%d_]+)$",
"^(رفع منشئ اساسي) (@[%a%d_]+)$",
"^(رفع منشئ اساسي) (%d+)$",
"^(تنزيل منشئ اساسي) (@[%a%d_]+)$",
"^(تنزيل منشئ اساسي) (%d+)$",

"^(رفع منشى اساسي) (@[%a%d_]+)$",
"^(رفع منشى اساسي) (%d+)$",
"^(تنزيل منشى اساسي) (@[%a%d_]+)$",
"^(تنزيل منشى اساسي) (%d+)$",


"^(الاشتراك) ([123])$",
"^(شحن) (%d+)$",
"^(تعيين امر) (.*)$",
"^(تعين امر) (.*)$",
"^(اضف امر) (.*)$",
"^(اضف امر)$",
"^(مسح امر) (.*)$",
"^(مسح امر)$",

"^([Ss][pP]) ([%a%d_]+.lua)$", 
"^([dD][pP]) ([%a%d_]+.lua)$", 


"^(تاك للكل)$",
"^(تاك للكل) (ل %d+)$",
"^(الادارين)$",
"^(الاداريين)$",
"^(المشرفين)$",
"^(الاداريين)$",
"^(الادارين)$",

"^(تنزيل الكل)$",
"^(تقييد)$",
"^(فك التقييد)$",
"^(فك تقييد)$",
"^(التفاعل)$",
"^([iI][dD])$",
"^(ايدي)$",
"^(كشف)$",
'^(رفع مميز)$',
'^(تنزيل مميز)$',
'^(رفع قرد)$',
'^(تنزيل قرد)$',
'^(رفع قلبي)$',
'^(تنزيل قلبي)$',
'^(رفع وتكه)$',
'^(تنزيل وتكه)$',
'^(رفع زوجتي)$',
'^(تنزيل زوجتي)$',
'^(رفع زوجي)$',
'^(تنزيل زوجي)$',
'^(رفع ادمن)$',
'^(تنزيل ادمن)$', 
'^(رفع المدير)$',
'^(رفع مدير)$',
'^(رفع منشى)$',
'^(المالكين)$',
'^(مسح المالكين)$',
'^(رفع مالك)$',
'^(رفع مالك) (%d+)$',
'^(رفع مالك) (@[%a%d_]+)$',
'^(تنزيل مالك)$',
'^(تنزيل مالك) (%d+)$',
'^(تنزيل مالك) (@[%a%d_]+)$',
'^(رفع منشئ)$',
'^(تنزيل منشئ)$',
'^(تنزيل منشى)$',
'^(تنزيل المدير)$',
'^(تنزيل مدير)$',
'^(تفعيل)$',
'^(تعطيل)$',
'^(تعطيل) [-]100(%d+)$',

"^(مسح كلايش التعليمات)$",



"^(تعديلاتي)$",
"^(سحكاتي)$",
"^(تعين الايدي)$",
"^(تعيين ايدي)$",
"^(تعيين كليشه الستارت)$",
"^(مسح كليشه الستارت)$",
"^(تعيين كليشه الايدي عام)$",
"^(تعيين ايدي عام)$",

"^(تعيين كليشة الايدي)$",
"^(تعيين الايدي)$",
"^(حظر عام)$",
"^(الغاء العام)$",
"^(الغاء عام)$",
"^(حظر)$",
"^(الغاء الحظر)$",
"^(الغاء حظر)$",
"^(طرد)$",
"^(كتم)$",
"^(الغاء الكتم)$",
"^(الغاء كتم)$",
"^(رفع مطور)$",
"^(تنزيل مطور)$",
"^(رفع منشئ اساسي)$",
"^(تنزيل منشئ اساسي)$",
"^(رفع منشى اساسي)$",
"^(تنزيل منشى اساسي)$",
"^(تعيين قائمه الاوامر)$",
"^(اعدادات المجموعة)$",
"^(اعدادات المجموعه)$",
"^(الاشتراك)$",
"^(المجموعه)$",
"^(كشف البوت)$",
"^(انشاء رابط)$",
"^(ضع الرابط)$",
"^(تثبيت)$",
"^(الغاء التثبيت)$",
"^(الغاء تثبيت)$",
"^(الغاء التثبيت الكل)$",
"^(الغاء تثبيت الكل)$",
"^(مسح التثبيتات)$",
"^(رابط)$",
"^(الرابط)$",
"^(القوانين)$",
"^(ضع القوانين)$",
"^(ضع قوانين)$",
"^(ضع تكرار)$",
"^(ضع التكرار)$",
"^(المنشئين)$",
"^(المنشئيين)$",
"^(الادمنيه)$",
"^(قائمه المنع)$",
"^(المدراء)$",
"^(المميزين)$",
"^(قائمه القرده)$",
"^(قائمه القلوب)$",
"^(قائمه الوتك)$",
"^(قائمه زوجاتي)$",
"^(قائمه ازواجي)$",
"^(المكتومين)$",
"^(ضع الترحيب)$",
"^(الترحيب)$",
"^(المحظورين)$",
"^(ضع اسم)$",
"^(ضع صوره)$",
"^(ضع وصف)$",
"^(طرد البوتات)$",
"^(كشف البوتات)$",
"^(طرد المحذوفين)$",
"^(رسائلي)$",
"^(رسايلي)$",
"^(احصائياتي)$",
"^(معلوماتي)$",
"^(موقعي)$",
"^(رفع الادمنيه)$",
"^(صوره الترحيب)$",
"^(ضع كليشه المطور)$",
"^(مسح كليشه المطور)$",
"^(المطور)$",
"^(شرط التفعيل)$",
"^(قائمه المجموعات)$",
"^(المجموعات)$",
"^(اذاعه)$",
"^(اذاعه عام)$",
"^(اذاعه خاص)$",
"^(اذاعه عام بالتوجيه)$", 
"^(اذاعه)$", 
"^(قائمه العام)$",
"^(المطورين)$",
"^(تيست)$",
"^(test)$",
"^(قناة السورس)$",
"^(الاحصائيات)$",
"^(اضف رد عام)$",
"^(مسح الردود)$",
"^(مسح الردود العامه)$",
"^(ضع اسم للبوت)$",
"^(حذف صوره)$",
"^(مسح رد)$",
"^(الردود)$",
"^(الردود العامه)$",
"^(اضف رد)$",
"^(/UpdateSource)$",
"^(تحديث السورس)$",
"^(تنظيف المجموعات)$",
"^(تنظيف المشتركين)$",
"^(رتبتي)$",
"^(ضع اسم للبوت)$",
"^(ضع صوره للترحيب)$",
"^(الحمايه)$",
"^(الاعدادات)$",
"^(الوسائط)$",
"^(الغاء الامر)$",
"^(الرتبه)$",
"^(الغاء)$",
"^(الساعه)$",
"^(التاريخ)$",
"^(اباظه)$",
"^(متجر الملفات)$",
"^(الملفات)$",
"^(اصدار السورس)$",
"^(الاصدار)$",
"^(server)$",
"^(تعيين امر)$",
"^(تعين امر)$",
"^(السيرفر)$",
"^(اذاعه بالتثبيت)$",
"^(نسخه احتياطيه للمجموعات)$",
"^(رفع نسخه الاحتياطيه)$", 

"^(تعطيل الردود العشوائيه)$", 
"^(تفعيل الردود العشوائيه)$", 
"^(تفعيل ردود السورس)$", 
"^(تعطيل ردود السورس)$", 
"^(تفعيل التنظيف التلقائي)$", 
"^(تعطيل التنظيف التلقائي)$", 

"^(تفعيل الاشتراك الاجباري)$", 
"^(تعطيل الاشتراك الاجباري)$", 
"^(تغيير الاشتراك الاجباري)$", 
"^(الاشتراك الاجباري)$", 
"^(ادفرني)$", 
"^(مغادره)$", 
"^(قائمه الاوامر)$", 
"^(مسح الاوامر)$", 
"^(احظرني)$", 
"^(اطردني)$", 
"^(جهاتي)$", 
"^(ضع رابط)$", 
"^(نقل ملكيه البوت)$", 
"^(مسح كليشه الايدي)$", 
"^(مسح الايدي)$", 
"^(مسح ايدي)$", 
"^(مسح كليشة الايدي)$", 
"^(مسح كليشه الايدي عام)$", 
"^(مسح الايدي عام)$", 
"^(مسح ايدي عام)$", 
"^(مسح كليشة الايدي عام)$", 
"^(السورس)$",
"^(سورس)$",
"^(م المطور)$", 
"^(اوامر الرد)$",
"^(اوامر الملفات)$",
"^(الاوامر)$",
"^(م1)$",
"^(م2)$",
"^(م3)$", 
"^(/store)$", 
"^(/files)$", 
"^(قفل الصور بالتقييد)$",
"^(قفل الفيديو بالتقييد)$",
"^(قفل المتحركه بالتقييد)$",
"^(قفل التوجيه بالتقييد)$",
"^(قفل الروابط بالتقييد)$",
"^(قفل الدردشه)$",
"^(قفل المتحركه)$",
"^(قفل الصور)$",
"^(قفل الفيديو)$",
"^(قفل البصمات)$",
"^(قفل الصوت)$",
"^(قفل الملصقات)$",
"^(قفل الجهات)$",
"^(قفل التوجيه)$",
"^(قفل الموقع)$",
"^(قفل الملفات)$",
"^(قفل الاشعارات)$",
"^(قفل الانلاين)$",
"^(قفل الالعاب)$",
"^(قفل الكيبورد)$",
"^(قفل الروابط)$",
"^(قفل التاك)$",
"^(قفل المعرفات)$",
"^(قفل التعديل)$",
"^(قفل الكلايش)$",
"^(قفل التكرار)$",
"^(قفل البوتات)$",
"^(قفل البوتات بالطرد)$",
"^(قفل الماركدوان)$",
"^(قفل الويب)$",
"^(قفل التثبيت)$",
"^(قفل الاضافه)$",
"^(قفل الانكليزيه)$",
"^(قفل الفارسيه)$",
"^(قفل الفشار)$",
"^(فتح الصور بالتقييد)$",
"^(فتح الفيديو بالتقييد)$",
"^(فتح المتحركه بالتقييد)$",
"^(فتح التوجيه بالتقييد)$",
"^(فتح الروابط بالتقييد)$",
"^(فتح الدردشه)$",
"^(فتح المتحركه)$",
"^(فتح الصور)$",
"^(فتح الفيديو)$",
"^(فتح البصمات)$",
"^(فتح الصوت)$",
"^(فتح الملصقات)$",
"^(فتح الجهات)$",
"^(فتح التوجيه)$",
"^(فتح الموقع)$",
"^(فتح الملفات)$",
"^(فتح الاشعارات)$",
"^(فتح الانلاين)$",
"^(فتح الالعاب)$",
"^(فتح الكيبورد)$",
"^(فتح الروابط)$",
"^(فتح التاك)$",
"^(فتح المعرفات)$",
"^(فتح التعديل)$",
"^(فتح الكلايش)$",
"^(فتح التكرار)$",
"^(فتح البوتات)$",
"^(فتح البوتات بالطرد)$",
"^(فتح الماركدوان)$",
"^(فتح الويب)$",
"^(فتح التثبيت)$",
"^(فتح الاضافه)$",
"^(فتح الانكليزيه)$",
"^(فتح الفارسيه)$",
"^(البايو)$",
"^(فتح الفشار)$",
"^(تعطيل الردود)$",
"^(تعطيل الاذاعه)$",
 "^(صورتي)$",
"^(تعطيل الايدي)$",
"^(تعطيل الترحيب)$",
"^(تعطيل التحذير)$",
"^(تعطيل الايدي بالصوره)$",
"^(تعطيل الحمايه)$",
"^(تعطيل المغادره)$",
"^(تعطيل تعيين الايدي)$",
"^(تعطيل الحظر)$",
"^(تعطيل الرابط)$",
"^(تعطيل تاك للكل)$",
"^(تعطيل التحقق)$",
"^(تفعيل الردود)$",
"^(تفعيل الاذاعه)$",
"^(تفعيل الايدي)$",
"^(تفعيل الترحيب)$",
"^(تفعيل التحذير)$",
"^(تفعيل الايدي بالصوره)$",
"^(تفعيل الحمايه)$",
"^(تفعيل المغادره)$",
"^(تفعيل تعيين الايدي)$",
"^(تفعيل الحظر)$",
"^(تفعيل الرابط)$",
"^(تفعيل تاك للكل)$",
"^(تفعيل التحقق)$",
"^(تفعيل البوت خدمي)$",
"^(تعطيل البوت خدمي)$",
"^(تفعيل ضافني)$",
"^(تعطيل ضافني)$",
"^(مين ضافني)$",
"^(تفعيل التواصل)$",
"^(تعطيل التواصل)$",
"^(قفل الكل)$",
"^(فتح الكل)$",
"^(قفل الوسائط)$",
"^(فتح الوسائط)$",
"^(منع)$",
},
iBoss = iBoss,
dBoss = dBoss,
} 
