From: "Anthony Cesar" <Anthony.Cesar@abcdistributing.com>
Subject: foward ing specific ports
Date: Fri, 28 Jun 2002 16:55:54 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <3BC9CB95BC7EE44587FFFEAB0499147001E2F80F@KMCLUSTER.abcdistributing.net>
Mime-Version: 1.0
Content-Type: multipart/related;
	type="multipart/alternative";
	boundary="----_=_NextPart_001_01C21EE6.31E821EE"
Return-path: <netfilter-admin@lists.samba.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C21EE6.31E821EE
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_002_01C21EE6.31E821EE"


------_=_NextPart_002_01C21EE6.31E821EE
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

is it possible to tell iptables to allow forwarding of specific ports
that are staggered, in one entry?  for example, i know that you can do a
range of ports ( --sport 1024:65535) but what if i have only three ports
like 25,110, and 53?

does the syntax allow for me to list these ports in just one chain
(hypothetical: --sport 25-53-110)?

or do i have to generate a chain for each one?  it would help my typing
fingers a lot if what i'm asking was possible....

=20

--Anthony C--


*************************************************************************=
***************************
This e-mail and any files transmitted with it are confidential to abc dis=
tributing, inc.=20
("abc"), and may contain proprietary or copyrighted materials belonging t=
o abc, which=20
are intended solely for the individual named.  If you are not the named a=
ddressee, you=20
are notified that any copying, dissemination, distribution or disclosure =
of any or all of its=20
contents, and any action taken in reliance on the transmission, are unaut=
horized and=20
prohibited.  Please notify abc immediately by e-mail reply if you have re=
ceived this=20
transmission in error and take all necessary and appropriate actions to p=
ermanently=20
delete it from your system.
*************************************************************************=
****************************

------_=_NextPart_002_01C21EE6.31E821EE
Content-Type: text/html;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE id=3DridTitle>Message</TITLE>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dus-ascii"=
>
<STYLE>BODY {
	MARGIN-TOP: 25px; FONT-WEIGHT: bold; FONT-SIZE: 10pt; MARGIN-LEFT: 25px;=
 COLOR: #008080; FONT-FAMILY: Arial; BACKGROUND-COLOR: #ffffff
}
P.msoNormal {
	MARGIN-TOP: 0px; FONT-SIZE: 10pt; MARGIN-LEFT: 0px; COLOR: #ffffcc; FONT=
-FAMILY: Helvetica, "Times New Roman"
}
LI.msoNormal {
	MARGIN-TOP: 0px; FONT-SIZE: 10pt; MARGIN-LEFT: 0px; COLOR: #ffffcc; FONT=
-FAMILY: Helvetica, "Times New Roman"
}
</STYLE>

<META content=3D"MSHTML 6.00.2716.2200" name=3DGENERATOR></HEAD>
<BODY id=3DridBody=20
style=3D"FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR: #008080; FONT-FAMILY:=
 Arial; BACKGROUND-COLOR: #ffffff"=20
bgColor=3D#ffffff background=3Dcid:014594520@28062002-20F8>
<P><SPAN class=3D014594520-28062002>is it possible to tell iptables to al=
low=20
forwarding of specific ports that are&nbsp;staggered, in one entry?&nbsp;=
 for=20
example,&nbsp;i know that you can&nbsp;do a&nbsp;range of ports ( --sport=
=20
1024:65535) but&nbsp;what if i have&nbsp;only three ports like 25,110, an=
d=20
53?</SPAN></P>
<P><SPAN class=3D014594520-28062002>does the syntax allow for me to list =
these=20
ports in just one&nbsp;chain (hypothetical: --sport 25-53-110)?</SPAN></P=
>
<P><SPAN class=3D014594520-28062002>or do i have to generate a chain for =
each=20
one?&nbsp; it would help my typing fingers a lot if what i'm asking was=20
possible....</SPAN></P>
<P><SPAN class=3D014594520-28062002></SPAN>&nbsp;</P>
<P><SPAN class=3D014594520-28062002>--Anthony C--</SPAN></P><FONT SIZE=3D=
3 COLOR=3DBLUE><PRE>*****************************************************=
***********************************************
This e-mail and any files transmitted with it are confidential to abc dis=
tributing, inc.=20
("abc"), and may contain proprietary or copyrighted materials belonging t=
o abc, which=20
are intended solely for the individual named.  If you are not the named a=
ddressee, you=20
are notified that any copying, dissemination, distribution or disclosure =
of any or all of its=20
contents, and any action taken in reliance on the transmission, are unaut=
horized and=20
prohibited.  Please notify abc immediately by e-mail reply if you have re=
ceived this=20
transmission in error and take all necessary and appropriate actions to p=
ermanently=20
delete it from your system.
*************************************************************************=
****************************
</PRE></FONT>
</BODY></HTML>
=00
------_=_NextPart_002_01C21EE6.31E821EE--

------_=_NextPart_001_01C21EE6.31E821EE
Content-Type: image/gif;
	name="Blank Bkgrd.gif"
Content-Transfer-Encoding: base64
Content-ID: <014594520@28062002-20F8>
Content-Description: Blank Bkgrd.gif
Content-Location: Blank%20Bkgrd.gif

R0lGODlhLQAtAID/AP////f39ywAAAAALQAtAEACcAxup8vtvxKQsFon6d02898pGkgiYoCm6sq2
7iqWcmzOsmeXeA7uPJd5CYdD2g9oPF58ygqz+XhCG9JpJGmlYrPXGlfr/Yo/VW45e7amp2tou/lW
xo/zX513z+Vt+1n/tiX2pxP4NUhy2FM4xtjIUQAAOw==

------_=_NextPart_001_01C21EE6.31E821EE--

