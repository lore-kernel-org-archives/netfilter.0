From: Eugene Joubert <EugeneJ@centratel.co.za>
Subject: RE: Web server access
Date: Tue, 15 Jul 2003 14:44:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20B8C822B36ED71199D0005004D778B81512@TELECOMS04>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C34ACE.D56880E0"
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
To: =?iso-8859-1?Q?=27Jorge_Uma=F1a=27?= <jorgeaub@hotmail.com>, netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C34ACE.D56880E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Is your web server gateway set to your be that of your linux box?

Have you tried using tcpdump to "see" what is happening with those =
packets
on that specific port?



-----Original Message-----
From: Jorge Uma=F1a [mailto:jorgeaub@hotmail.com]=20
Sent: 14/07/2003 05:10 PM
To: netfilter@lists.netfilter.org
Subject: Web server access


I have a LINUX box with a public ip. I need to use iptables to send all =
the=20
packages that come to the 80 port to my Web server in Windows. I am =
using=20
this chain:
iptables -t nat -A PREROUTING -p tcp -d $ipPUBLIC --dport 80 -j DNAT=20
--to-destination $ipWEBSERVER

I tried to access my web page from outside but does not work

I will appreciate your help
Thanks

_________________________________________________________________
Charla con tus amigos en l=EDnea mediante MSN Messenger:=20
http://messenger.yupimsn.com/


------_=_NextPart_001_01C34ACE.D56880E0
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
<TITLE>RE: Web server access</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>Is your web server gateway set to your be that of =
your linux box?</FONT>
</P>

<P><FONT SIZE=3D2>Have you tried using tcpdump to &quot;see&quot; what =
is happening with those packets on that specific port?</FONT>
</P>
<BR>
<BR>

<P><FONT SIZE=3D2>-----Original Message-----</FONT>
<BR><FONT SIZE=3D2>From: Jorge Uma=F1a [<A =
HREF=3D"mailto:jorgeaub@hotmail.com">mailto:jorgeaub@hotmail.com</A>] =
</FONT>
<BR><FONT SIZE=3D2>Sent: 14/07/2003 05:10 PM</FONT>
<BR><FONT SIZE=3D2>To: netfilter@lists.netfilter.org</FONT>
<BR><FONT SIZE=3D2>Subject: Web server access</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>I have a LINUX box with a public ip. I need to use =
iptables to send all the </FONT>
<BR><FONT SIZE=3D2>packages that come to the 80 port to my Web server =
in Windows. I am using </FONT>
<BR><FONT SIZE=3D2>this chain:</FONT>
<BR><FONT SIZE=3D2>iptables -t nat -A PREROUTING -p tcp -d $ipPUBLIC =
--dport 80 -j DNAT </FONT>
<BR><FONT SIZE=3D2>--to-destination $ipWEBSERVER</FONT>
</P>

<P><FONT SIZE=3D2>I tried to access my web page from outside but does =
not work</FONT>
</P>

<P><FONT SIZE=3D2>I will appreciate your help</FONT>
<BR><FONT SIZE=3D2>Thanks</FONT>
</P>

<P><FONT =
SIZE=3D2>_______________________________________________________________=
__</FONT>
<BR><FONT SIZE=3D2>Charla con tus amigos en l=EDnea mediante MSN =
Messenger: </FONT>
<BR><FONT SIZE=3D2><A HREF=3D"http://messenger.yupimsn.com/" =
TARGET=3D"_blank">http://messenger.yupimsn.com/</A></FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C34ACE.D56880E0--

