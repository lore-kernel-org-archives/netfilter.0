From: Dotan Lior <Lior.Dotan@innowave-ws.com>
Subject: IPTables counters
Date: Tue, 9 Jul 2002 16:41:00 +0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <DEFBF1A79446684593DB6374EA131C2D6BDC16@titan.ecitele.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2274E.43118830"
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

------_=_NextPart_001_01C2274E.43118830
Content-Type: text/plain

Hello,

I have a simple setup. A linux RH7.3 box doing NAT and connected to the
internet with one windows2000 client sitting behind it. I've set up iptables
to NAT the windows internal address to a legal IP address.
So far it works well, However when I inspect the NAT table with "iptables -L
-t nat -v -n -x", 
the bytes counter shows extremely low values. I've transfer a 200Kb file via
FTP on the windows
client, but the counter was less than 100 bytes. It seems as if only the
first packet of a connection
is listed.
Is there a way to see the real bytes count? Also I would to know the number
of bytes that traveled
on both ways (from the client and to the client), is that also possible
using iptables?

Thanks.

------_=_NextPart_001_01C2274E.43118830
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2652.35">
<TITLE>IPTables counters</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2 FACE=3D"Tahoma">Hello,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Tahoma">I have a simple setup. A linux RH7.3 =
box doing NAT and connected to the internet with one windows2000 client =
sitting behind it. I've set up iptables to NAT the windows internal =
address to a legal IP address.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Tahoma">So far it works well, However when I =
inspect the NAT table with &quot;iptables -L -t nat -v -n -x&quot;, =
</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Tahoma">the bytes counter shows extremely =
low values. I've transfer a 200Kb file via FTP on the windows</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Tahoma">client, but the counter was less =
than 100 bytes. It seems as if only the first packet of a =
connection</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Tahoma">is listed.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Tahoma">Is there a way to see the real bytes =
count? Also I would to know the number of bytes that traveled</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Tahoma">on both ways (from the client and to =
the client), is that also possible using iptables?</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Tahoma">Thanks.</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2274E.43118830--

