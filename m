From: Eugene Joubert <eugenej@centratel.co.za>
Subject: Transparent Proxy server
Date: Wed, 5 Jun 2002 15:25:39 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1406037015A4D511B3E100B0D0DF4DC4C2F0@TELECOMS04>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C20C94.7C498000"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C20C94.7C498000
Content-Type: text/plain

Hi,

I have the following scenario: My default policy for INPUT and FORWARD is
drop. My default policy for OUTPUT is ACCEPT.
I am using transparent proxy server in my firewall rules.
When I try and access the Internet with proxy setting enabled on my browser
I can't get anywhere. When I make the default policy for INPUT ACCEPT my
proxy server settings work....

If I disable my proxy server on my browser, add the necessary rule in my
FORWARD chain I can access the Internet just fine...

My question is this, do you need to allow anything in the INPUT chain if
your default policy is DROP for squid to work?

Thanks in advance....

PS : If you need any other info please let me know



------_=_NextPart_001_01C20C94.7C498000
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>Transparent Proxy server</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2 FACE=3D"Arial">Hi,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I have the following scenario: My =
default policy for INPUT and FORWARD is drop. My default policy for =
OUTPUT is ACCEPT.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">I am using transparent proxy server =
in my firewall rules.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">When I try and access the Internet =
with proxy setting enabled on my browser I can't get anywhere. When I =
make the default policy for INPUT ACCEPT my proxy server settings =
work....</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">If I disable my proxy server on my =
browser, add the necessary rule in my FORWARD chain I can access the =
Internet just fine...</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">My question is this, do you need to =
allow anything in the INPUT chain if your default policy is DROP for =
squid to work?</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Thanks in advance....</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">PS : If you need any other info please =
let me know</FONT>
</P>
<BR>

</BODY>
</HTML>
------_=_NextPart_001_01C20C94.7C498000--

