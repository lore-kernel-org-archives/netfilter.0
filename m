From: "Zhang Junbiao (Princeton)" <junbiao.zhang@thomson.net>
Subject: delay in deleting a rule?
Date: Tue, 18 Feb 2003 12:29:31 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0BCAE6FBFB16D511922A0002A507DACE030D86A0@INDYEXCH24>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2D773.4BE5FDD0"
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2D773.4BE5FDD0
Content-Type: text/plain;
	charset="iso-8859-1"

Hi all,

	I'm observing some strange behavior with using iptables. In
particular, when I used iptables to remove a rule in the nat table, it took
quite a while before it actually took effect. I didn't have such problem
when inserting the rule. More specifically, when I ran

iptables -t nat -I PREROUTING 1 -m mac --mac-source $mac -j RETURN

	it took effect immediately, the device with the $mac address didn't
pass through the rest of the rules in the PREROUTING chain. However, when I
ran

iptables -t nat -D PREROUTING -m mac --mac-source $mac -j RETURN

	iptables -t nat -L shows that the rule has been removed, but the
device with the $mac address was still treated the same way as if the rule
was still in place. It sometimes took more than 1 minute before the rule was
no longer in effect. 

	Are there some type of caching in netfilter or iptables? Or is this
a bug? I'm using Linux Kernel 2.4.17, I tried both iptables v.1.2.2 and
iptables v.1.2.3, both with the same problem.

	Thanks. 

Regards,

J.B.

----------------------------------------------------------- 
As of February 12, 2003 Thomson unified its email addresses on a worldwide
basis.  Please note my new email address: junbiao.zhang@thomson.net 

Thomson is the leader in solutions and technologies for the entertainment
and media industries and serves its customers under its four strategic
brands: Technicolor, Grass Valley, RCA and THOMSON. 
More about Thomson: http://www.thomson.net/videochain 

------_=_NextPart_001_01C2D773.4BE5FDD0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>delay in deleting a rule?</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2 FACE=3D"Arial">Hi all,</FONT>
</P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">I'm observing some strange behavior with using iptables. =
In particular, when I used iptables to remove a rule in the nat table, =
it took quite a while before it actually took effect. I didn't have =
such problem when inserting the rule. More specifically, when I =
ran</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">iptables -t nat -I PREROUTING 1 -m mac =
--mac-source $mac -j RETURN</FONT>
</P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">it took effect immediately, the device with the $mac =
address didn't pass through the rest of the rules in the PREROUTING =
chain. However, when I ran</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">iptables -t nat -D PREROUTING -m mac =
--mac-source $mac -j RETURN</FONT>
</P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">iptables -t nat -L shows that the rule has been removed, =
but the device with the $mac address was still treated the same way as =
if the rule was still in place. It sometimes took more than 1 minute =
before the rule was no longer in effect. </FONT></P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">Are there some type of caching in netfilter or iptables? =
Or is this a bug? I'm using Linux Kernel 2.4.17, I tried both iptables =
v.1.2.2 and iptables v.1.2.3, both with the same problem.</FONT></P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">Thanks. </FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Regards,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">J.B.</FONT>
</P>

<P><FONT SIZE=3D2 =
FACE=3D"Arial">---------------------------------------------------------=
-- </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">As of February 12, 2003 Thomson =
unified its email addresses on a worldwide basis.&nbsp; Please note my =
new email address: junbiao.zhang@thomson.net </FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Thomson is the leader in solutions and =
technologies for the entertainment and media industries and serves its =
customers under its four strategic brands: Technicolor, Grass Valley, =
RCA and THOMSON. </FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">More about Thomson: <A =
HREF=3D"http://www.thomson.net/videochain" =
TARGET=3D"_blank">http://www.thomson.net/videochain</A> </FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2D773.4BE5FDD0--

