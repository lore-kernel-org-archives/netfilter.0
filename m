From: "George Gao" <ggao@nortelnetworks.com>
Subject: How to differentiate packets generated locally or received from t
	he network using the NF_IP_PRE_ROUTING filter
Date: Mon, 5 Apr 2004 15:02:03 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2F1FC1DEA077D5119FAD00508BCFD6D20BBB0110@zsc3c030.us.nortel.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C41B59.A0951C64"
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

------_=_NextPart_001_01C41B59.A0951C64
Content-Type: text/plain

Hi there,
     I'm working on the sample Netfilter driver to put something together
for a prototype. I ran into a problem which I wish you can help me out. When
I set my input filter hook number to NF_IP_PRE_ROUTING, I saw local
generated IP multicast/Broadcast packets and inbound packets from network.
Is there any way to differentiate a local IP Multicast or IP brocast from an
inbound mal-formed packet with the exact same content? Thanks much in
advance!
Cheers!
George 

------_=_NextPart_001_01C41B59.A0951C64
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2656.31">
<TITLE>How to differentiate packets generated locally or received from =
the network using the NF_IP_PRE_ROUTING filter</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2 FACE=3D"Arial">Hi there,</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp;&nbsp; I'm working =
on the sample Netfilter driver to put something together for a =
prototype. I ran into a problem which I wish you can help me out. When =
I set my input filter hook number to NF_IP_PRE_ROUTING, I saw local =
generated IP multicast/Broadcast packets and inbound packets from =
network. Is there any way to differentiate a local IP Multicast or IP =
brocast from an inbound mal-formed packet with the exact same content? =
Thanks much in advance!</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Cheers!</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">George </FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C41B59.A0951C64--

