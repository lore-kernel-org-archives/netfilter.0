From: Metzger Kobi <Yaakov_Metzger@persay.com>
Subject: Changing the source on incoming messages
Date: Wed, 9 Oct 2002 15:06:58 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <385D702A9C11D511A9E90008C7160AD5C38887@ismail1.comverse.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C26F94.BFEC5658"
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

------_=_NextPart_001_01C26F94.BFEC5658
Content-Type: text/plain;
	charset="windows-1255"

Hi,

I am quite new to the netfilter buisiness, however I have the following
problem that I am not sure wether i can solve using iptables.

I would like to fool an aplication in my computer so while it thinks it
communicates with x.y.z.w it will actually connect to a.b.c.d. (port number
unchanged).


I succeeded in diverting the outgoing messages using DNAT on teh OUTPUT. The
problem is that I could not change the source address on the incoming
messages,
 and the aplication won't work if the source is different. The SNAT cannot
be put on the incoming messages (while DNAT can be put
on outgoing messages).

Is there any other way to do this without touching other components on the
net, and without touching the application.

Coby.

------_=_NextPart_001_01C26F94.BFEC5658
Content-Type: text/html;
	charset="windows-1255"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dwindows-1255">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2655.35">
<TITLE>Changing the source on incoming messages</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2 FACE=3D"Arial">Hi,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I am quite new to the netfilter =
buisiness, however I have the following problem that I am not sure =
wether i can solve using iptables.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I would like to fool an aplication in =
my computer so while it thinks it communicates with x.y.z.w it will =
actually connect to a.b.c.d. (port number unchanged).</FONT></P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">I succeeded in diverting the outgoing =
messages using DNAT on teh OUTPUT. The problem is that I could not =
change the source address on the incoming messages,</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;and the aplication won't work if =
the source is different. The SNAT cannot be put on the incoming =
messages (while DNAT can be put</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">on outgoing messages).</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Is there any other way to do this =
without touching other components on the net, and without touching the =
application.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Coby.</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C26F94.BFEC5658--

