From: Naleendra@dms.lanka.net
Subject: why can't I telnet
Date: Mon, 16 Sep 2002 19:45:16 +0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <6029A399F5BFD6118BB200104B0DF37302764B@MAILGATE>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C25D87.4A22D4C0"
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C25D87.4A22D4C0
Content-Type: text/plain;
	charset="iso-8859-1"

HI LIST,

	I can't telnet when my Iptables rule set is active. However the
moment I stop thee service I am able to do so. Mine is a default drop
policy. However I can ping with no problems. Telnet pertaining portion lines
are,

	iptables -A INPUT -i <adaptor> -d <ip-address> -p tcp --dport 23 -j
ACCEPT
	iptables -A OUTPUT -o <adaptor> -s <ip-address> -p tcp --sport 23 -j
ACCEPT


 I tried adding the states for both the rules. Any advice is appreeciated
greatly.

 nal        

------_=_NextPart_001_01C25D87.4A22D4C0
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
<TITLE>why can't I telnet</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2 FACE=3D"Arial">HI LIST,</FONT>
</P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">I can't telnet when my Iptables rule set is active. =
However the moment I stop thee service I am able to do so. Mine is a =
default drop policy. However I can ping with no problems. Telnet =
pertaining portion lines are,</FONT></P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">iptables -A INPUT -i &lt;adaptor&gt; -d =
&lt;ip-address&gt; -p tcp --dport 23 -j ACCEPT</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Arial">iptables -A OUTPUT -o &lt;adaptor&gt; -s =
&lt;ip-address&gt; -p tcp --sport 23 -j ACCEPT</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;I tried adding the states for =
both the rules. Any advice is appreeciated greatly.</FONT>
</P>

<P><FONT SIZE=3D2 =
FACE=3D"Arial">&nbsp;nal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C25D87.4A22D4C0--

