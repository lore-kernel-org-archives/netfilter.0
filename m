From: "Keith R. Weiner" <keith@valiant.com>
Subject: RE: some body hacked my system
Date: Tue, 8 Oct 2002 11:17:34 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <AF435BB1224A4C4888B58C546728EE323005@s2.valiant.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C26EDD.D43D4878"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Sundaram Ramasamy <sun@percipia.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C26EDD.D43D4878
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

That looks like warcraft 3 if I had to take a guess.  It is a very good =
game. Did you try unarchiving it?
=20
You can block his ip address, but what is stopping this person from =
hitting you from another ip?
=20
Look at your ftp server.  Maybe disable anonymous logins. Maybe put =
quotas on.  Maybe see if there are any patches to your ftp daemon.
=20
What kind of ftp server are you using?  WuFTPD, ms IIS, etc...?
=20
I'm a newbie myself, but I'd just thought that I'd put in my 2 cents.

-----Original Message-----
From: Sundaram Ramasamy [mailto:sun@percipia.com]
Sent: Tuesday, October 08, 2002 11:08 AM
To: netfilter@lists.netfilter.org
Subject: some body hacked my system


Hi,

I am allowing ftp connection in my firewall, some body used ftp port, =
filled
my hard disk space. He logged-in from 68.65.58.159 IP (/var/log/message)

Oct  8 00:57:03 linux2 ftpd[25101]: FTP LOGIN FROM
va-staff-u1-c5a-159.frbgva.adelphia.net [68.65.58.159]

he created directory named WC3 and transfed follwoing files.

bash-2.04# cd WC3
bash-2.04# ls
wc3.part01.rar.gz  wc3.part07.rar.gz  wc3.part13.rar.gz  =
wc3.part19.rar.gz
wc3.part02.rar.gz  wc3.part08.rar.gz  wc3.part14.rar.gz  =
wc3.part20.rar.gz
wc3.part03.rar.gz  wc3.part09.rar.gz  wc3.part15.rar.gz  =
wc3.part21.rar.gz
wc3.part04.rar.gz  wc3.part10.rar.gz  wc3.part16.rar.gz
wc3.part05.rar.gz  wc3.part11.rar.gz  wc3.part17.rar.gz
wc3.part06.rar.gz  wc3.part12.rar.gz  wc3.part18.rar.gz

Is anybody knows what this file used for?

How will i block this IP Address in my firewall?

How will i check what else he did on my machine?

Thanks
SR



------_=_NextPart_001_01C26EDD.D43D4878
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><SPAN class=3D428361415-08102002><FONT face=3DArial color=3D#0000ff =
size=3D2>That=20
looks like warcraft 3 if I had to take a guess.&nbsp; It is a very good =
game.=20
Did you try unarchiving it?</FONT></SPAN></DIV>
<DIV><SPAN class=3D428361415-08102002><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D428361415-08102002>
<DIV><SPAN class=3D476331015-08102002><FONT face=3DArial color=3D#0000ff =
size=3D2>You=20
can block his ip address, but what is stopping this person from hitting =
you from=20
another ip?</FONT></SPAN></DIV>
<DIV><SPAN class=3D476331015-08102002><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D476331015-08102002><FONT face=3DArial color=3D#0000ff =
size=3D2>Look=20
at your ftp server.&nbsp; Maybe disable anonymous logins.&nbsp;<SPAN=20
class=3D428361415-08102002>Maybe put quotas on. </SPAN>&nbsp;Maybe see =
if there=20
are any patches to your ftp daemon.</FONT></SPAN></DIV>
<DIV><SPAN class=3D476331015-08102002><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D476331015-08102002><FONT face=3DArial color=3D#0000ff =
size=3D2>What=20
kind of ftp server are you using?&nbsp; WuFTPD, ms IIS,=20
etc...?</FONT></SPAN></DIV>
<DIV><SPAN class=3D476331015-08102002><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D476331015-08102002><SPAN =
class=3D428361415-08102002><FONT=20
face=3DArial color=3D#0000ff size=3D2>I'm a newbie myself, but I'd just =
thought that=20
I'd put in my 2 cents.</FONT></SPAN></SPAN></DIV></SPAN></DIV>
<BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT =
face=3DTahoma=20
  size=3D2>-----Original Message-----<BR><B>From:</B> Sundaram Ramasamy=20
  [mailto:sun@percipia.com]<BR><B>Sent:</B> Tuesday, October 08, 2002 =
11:08=20
  AM<BR><B>To:</B> netfilter@lists.netfilter.org<BR><B>Subject:</B> some =
body=20
  hacked my system<BR><BR></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2><FONT face=3D"Times New Roman" =
size=3D3>Hi,<BR><BR>I=20
  am allowing ftp connection in my firewall, some body used ftp port,=20
  filled<BR>my hard disk space. He logged-in from 68.65.58.159 IP=20
  (/var/log/message)<BR><BR>Oct&nbsp; 8 00:57:03 linux2 ftpd[25101]: FTP =
LOGIN=20
  FROM<BR>va-staff-u1-c5a-159.frbgva.adelphia.net =
[68.65.58.159]<BR><BR>he=20
  created directory named WC3 and transfed follwoing =
files.<BR><BR>bash-2.04# cd=20
  WC3<BR>bash-2.04# ls<BR>wc3.part01.rar.gz&nbsp; =
wc3.part07.rar.gz&nbsp;=20
  wc3.part13.rar.gz&nbsp; wc3.part19.rar.gz<BR>wc3.part02.rar.gz&nbsp;=20
  wc3.part08.rar.gz&nbsp; wc3.part14.rar.gz&nbsp;=20
  wc3.part20.rar.gz<BR>wc3.part03.rar.gz&nbsp; wc3.part09.rar.gz&nbsp;=20
  wc3.part15.rar.gz&nbsp; wc3.part21.rar.gz<BR>wc3.part04.rar.gz&nbsp;=20
  wc3.part10.rar.gz&nbsp; wc3.part16.rar.gz<BR>wc3.part05.rar.gz&nbsp;=20
  wc3.part11.rar.gz&nbsp; wc3.part17.rar.gz<BR>wc3.part06.rar.gz&nbsp;=20
  wc3.part12.rar.gz&nbsp; wc3.part18.rar.gz<BR><BR>Is anybody knows what =
this=20
  file used for?<BR><BR>How will i block this IP Address in my=20
  firewall?<BR><BR>How will i check what else he did on my=20
  =
machine?<BR><BR>Thanks<BR>SR</FONT><BR></FONT></DIV></BLOCKQUOTE></BODY><=
/HTML>

------_=_NextPart_001_01C26EDD.D43D4878--

