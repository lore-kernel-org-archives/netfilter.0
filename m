From: <inghau@perkom.co.id>
Subject: help..... pleeaseeee
Date: Fri, 31 Jan 2003 13:21:53 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <010b01c2c8f1$0c023520$210aa8c0@sabirin>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0108_01C2C92B.B83939D0"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0108_01C2C92B.B83939D0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

hello everybody

i ''m having problem accessing FTP sites on the net through my linux =
firewall

here is what happened when i'm connecting using ftp command from win2k =
prompt
ftp> open
To 202.xxx.xx.xxx
Connected to 202.xxx.xxx.xxx.
220 flsvr Microsoft FTP Service (Version 5.0).
User (202.xxx.xx.xxx.:(none)): xxx
331 Password required for amon.
Password:
230-Welcome To FlSvr Perkom FTP Site
230 User xxx logged in.
ftp> ls
500 Invalid PORT Command.
150 Opening ASCII mode data connection for file list.
    (then the connection seems to hang out..)

and then when i'm using windows explorer to open the ftp
the error is :
--FTP Folder Error--
An error occured opening that folder on the FTP server, make sure you =
have permission to access that folder
Details :=20
200 Type set to A.
500 Invalid PORT command
500 "LPRT 6,16,0,0,0,00,0,0,0,0,0,0,0,0,0,0,0,9,4......':command not =
understood

        BUT  if i'm using WS-FTP here is the log file.=20
ftp> open
To 202.169.39.132
Connected to 202.169.39.132.
220 flsvr Microsoft FTP Service (Version 5.0).
User (202.169.39.132:(none)): amon
331 Password required for amon.
Password:
230-Welcome To FlSvr Perkom FTP Site
230 User amon logged in.
ftp> ls
500 Invalid PORT Command.
150 Opening ASCII mode data connection for file list.

some of my friend told me that because WS-FTP support "passive transfer =
mode" so the program can connect through the firewall. Which is not =
supported if i'm using FTP ftom command or windows explorer
is there any one can tell me what did i miss on my firewall rules ?
can someone give me a clue ??

thanks

inghau






------=_NextPart_000_0108_01C2C92B.B83939D0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>hello everybody</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>i ''m having problem accessing FTP =
sites on the net=20
through my linux firewall</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>here is what happened when i'm =
connecting using ftp=20
command from win2k prompt</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>ftp&gt; open<BR>To =
202.xxx.xx.xxx<BR>Connected to=20
202.xxx.xxx.xxx.<BR>220 flsvr Microsoft FTP Service (Version =
5.0).<BR>User=20
(202.xxx.xx.xxx.:(none)): xxx<BR>331 Password required for=20
amon.<BR>Password:<BR>230-Welcome To FlSvr Perkom FTP Site<BR>230 User =
xxx=20
logged in.<BR>ftp&gt; ls<BR>500 Invalid PORT Command.<BR>150 Opening =
ASCII mode=20
data connection for file list.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; (then the connection =
seems to=20
hang out..)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>and then when i'm using windows =
explorer to open=20
the ftp</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>the error is :</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>--FTP Folder Error--</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>An error occured opening that folder on =
the FTP=20
server, make sure you have permission to access that folder</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Details : </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>200 Type set to A.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>500 Invalid PORT command</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>500 "LPRT=20
6,16,0,0,0,00,0,0,0,0,0,0,0,0,0,0,0,9,4......':command not=20
understood</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
BUT &nbsp;if=20
i'm using WS-FTP here is the log file. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>ftp&gt; open<BR>To =
202.169.39.132<BR>Connected to=20
202.169.39.132.<BR>220 flsvr Microsoft FTP Service (Version =
5.0).<BR>User=20
(202.169.39.132:(none)): amon<BR>331 Password required for=20
amon.<BR>Password:<BR>230-Welcome To FlSvr Perkom FTP Site<BR>230 User =
amon=20
logged in.<BR>ftp&gt; ls<BR>500 Invalid PORT Command.<BR>150 Opening =
ASCII mode=20
data connection for file list.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>some of my friend told me that because =
WS-FTP=20
support "passive transfer mode" so the program can connect through the =
firewall.=20
Which is not supported if i'm using FTP ftom command&nbsp;or windows=20
explorer</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>is there any one can tell me what did i =
miss on my=20
firewall rules ?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>can someone give me a clue =
??</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>thanks</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>inghau</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0108_01C2C92B.B83939D0--



