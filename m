From: "Leonardo Santagostini" <lsantagostini@celletech.com.ar>
Subject: A question and a little ascii art
Date: Thu, 16 Oct 2003 13:26:44 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000e01c39402$49e648e0$1900a8c0@celletech.com.ar>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000F_01C393E9.249910E0"
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

------=_NextPart_000_000F_01C393E9.249910E0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit



Here is my litle ascii art :-|

        internet
           |  ____________200.68.69.xxx
           | /
       firewall
           | \________192.168.0.254
       ---------------------------
       |                         |
192.168.0.1      192.168.0.25


In the 192.168.0.1 i'm publishing some app made in home at port 80
But on the public ip of mi FW im publishing my web page too
The question is:
I can view my app on 192.168.0.1 trough the following rule
    iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 15000 -j DNAT
--to 192.168.0.1:80 
But on the LAN side (162.168.0.0) i cant see the app pointing to
200.68.69.xxx:15000

Any idea, suggestion ???

Thanks in avance,
Yours,
Leonardo

------=_NextPart_000_000F_01C393E9.249910E0
Content-Type: text/html;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.4630.0">
<TITLE>A question and a little ascii art</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->
<BR>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">Here is my litle ascii art :-|</FONT>
</P>

<P><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
internet</FONT>

<BR><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; |&nbsp; ____________200.68.69.xxx</FONT>

<BR><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; | /</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
firewall</FONT>

<BR><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; | \________192.168.0.254</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
---------------------------</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
|</FONT>

<BR><FONT SIZE=3D2 =
FACE=3D"Arial">192.168.0.1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
192.168.0.25</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">In the 192.168.0.1 i'm publishing some =
app made in home at port 80</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">But on the public ip of mi FW im =
publishing my web page too</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">The question is:</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">I can view my app on 192.168.0.1 =
trough the following rule</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp; iptables -t nat -A =
PREROUTING -p tcp -i eth0 --dport 15000 -j DNAT --to 192.168.0.1:80 =
</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">But on the LAN side (162.168.0.0) i =
cant see the app pointing to 200.68.69.xxx:15000</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Any idea, suggestion ???</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Thanks in avance,</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Yours,</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Leonardo</FONT>
</P>

</BODY>
</HTML>
------=_NextPart_000_000F_01C393E9.249910E0--


