From: Niels Bach <NB@maconomy.dk>
Subject: PPTP through iptables firewall
Date: Tue, 11 Feb 2003 11:54:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E88493086664D511A1E4000103330E82027FE067@mail.maconomy.dk>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2D1BB.E6F0DE70"
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

------_=_NextPart_001_01C2D1BB.E6F0DE70
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Setup:=20
LAN A, LAN B, LAN C and LAN D all separate LAN's behind four different
firewalls.=20
=20
The only connection between the LAN's is NAT through their respective
firewalls.=20
=20
LAN D contains a PPTP server which I would like all the clients on all =
four
LAN's to be able to access. LAN D is protected with a firewall
(iptables/debian =
3.0/kernel-2.4.20/patch-o-matic-20030107/iptables-1.2.7a).
=20
Problem:
LAN A (working)
LAN B (working)
LAN C (broken -- only one connection at a time)
LAN D (containing the PPTP server)
=20
Details:
hmm it actually works from the 2 LAN's (A and B) but the last one is
problematic. From the two working ones (LAN A and LAN B) you can =
connect
with no problem to the PPTP server behind the firewall protecting LAN =
D.
=20
From the broken LAN (LAN C) the problem is as follow:
you can connect one person at a time. When this one person from LAN C =
has
finished and logged off there is a 10 minute/600 seconds timeout before =
it
is possible for another client to connect to the PPTP server from LAN C =
(and
we are still talking about the PPTP server on LAN D).
=20
So what I'm wondering about is what the difference is between =
connections
from LAN A and LAN B and connections from LAN C ???
=20
The only debugging information I found was in /proc/net/ip_conntrack =
which
looks like this:
--------------------------------------------------------
gre      47 428648 timeout=3D600, stream_timeout=3D432000 src=3Dx.x.x.x
dst=3Dx.x.x.x version=3D1 protocol=3D0x880b srckey=3D0x0 =
dstkey=3D0xc3e7 src=3D192.168.0
.200 dst=3Dx.x.x.x version=3D1 protocol=3D0x880b srckey=3D0xc3e7 =
dstkey=3D0x47d
[ASSURED] use=3D1

tcp      6 424347 ESTABLISHED src=3Dx.x.x.x dst=3Dx.x.x.x sport=3D1149 =
dport=3D1723
src=3D192.168.0.200 dst=3Dx.x.x.x sport=3D1723 dport=3D1149 [ASSURE
D] use=3D2
=20
........

----------------------------------------------------------
where x.x.x.x represents the IP numbers for the server and the client.
=20
The thing that is wondering me is that connections from the broken LAN =
C
hangs in the /proc/net/ip_conntrack file, this connection which is =
still
recorded was terminated more than one hour ago. Other connections from =
LAN A
and LAN B have been made since, but they leave no trace ?
=20
Niels
=20

-----Original Message-----
From: Diego Sarasua [mailto:debian@sarasuasys.com.ar]
Sent: 10. februar 2003 17:37
To: Niels Bach
Subject: Re: PPTP through iptables firewall


ok  then U have to make pptp support kernel compilation  in your =
firewalls
and it will work for your clients
loading the properly iptables modules
=20
please reply to : dsarasua@sarasuasys.com.ar
<mailto:dsarasua@sarasuasys.com.ar> =20
=20
and maybe i can hel U with some Support v=EDa MSN at =
asadopower@hotmail.com
<mailto:asadopower@hotmail.com>=20
=20
anything U need to serv U=20
bye=20
Diego

----- Original Message -----=20
From: Niels Bach <mailto:NB@maconomy.dk> =20
To: 'Diego Sarasua' <mailto:debian@sarasuasys.com.ar> =20
Sent: Monday, February 10, 2003 1:17 PM
Subject: RE: PPTP through iptables firewall

3 LAN behind 3 different firewalls.=20
=20
On one LAN a PPTP server is placed and I want to access it from the =
clients
placed on the different LANs.=20
=20
Niels
=20

-----Original Message-----
From: Diego Sarasua [mailto:debian@sarasuasys.com.ar]
Sent: 7. februar 2003 17:52
To: Niels Bach
Subject: Re: PPTP through iptables firewall


Please givme some more info=20
Are U talking of this ?
=20
USER\
USER -------->   Firewall    !! PPTP Server!!
USER/
=20
Thanks
Diego
i have "patch-o-mated" my server with kernel  2.4.20 and it doesnt work =
,
try with lower version of kernel  i have workig around 5 servers one =
with
2.4.20 and 4 with 2.4..17
thanks
bye=20
Diego
=20
----- Original Message -----=20

From: Niels Bach <mailto:NB@maconomy.dk> =20
To: 'netfilter@lists.netfilter.org' =
<mailto:'netfilter@lists.netfilter.org'>

Sent: Friday, February 07, 2003 5:43 AM
Subject: PPTP through iptables firewall



I have an MS PPTP server (win2k) behind a linux firewall (kernel 2.4.20 =
/
iptables 1.2.7a) this does not work very well. You can only connect =
from one
source at a time. Then there is a 10 minute (600 seconds) timeout =
before the
next connection from a different source can be made. If you come from a =
LAN
that is NAT'ed to one IP address (the firewalls) then all these clients =
can
connect simultaneously. So it is either one client with a public ip =
address
or several clients sharing a public IP address. But once their is a
connection (either type) everybody else is blocked out.

I have tried to patch the kernel (patch-o-matic-20030107) with the
pptp-conntrack-nat.patch. With this patch the firewall is able to =
recognize
the GRE protocol. This can be seen in /proc/net/ip_conntrack where the
connections involving GRE has changed from UNKNOWN to GRE. But with =
this
patch it is not possible to connect, now the windows client only reach
"verifying username and password" and then times out.=20

Without the patch it is possible to connect to the server one at a time =
and
wait 10 minutes before the next connection from a different location

With the patch it is not possible to connect at all.=20

I run Debian 3.0 (woody) Kernel 2.4.20 and iptables 1.2.7a with the =
patched
version and 1.2.6a with the unpatched version of the kernel.

I have seen more people talking about this issue on the web, but no one
seems to have at solution.=20

regards Niels=20



------_=_NextPart_001_01C2D1BB.E6F0DE70
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; charset=3Diso-8859-=
1">
<TITLE>PPTP through iptables firewall</TITLE>

<META content=3D"MSHTML 6.00.2722.900" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN=20
class=3D939482110-11022003>Setup: </SPAN></FONT></DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN class=3D939482110-=
11022003>LAN=20
A, LAN B, LAN C and LAN D all separate LAN's behind four different firewall=
s.=20
</SPAN></FONT></DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN=20
class=3D939482110-11022003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN class=3D939482110-=
11022003>The=20
only connection between the LAN's is NAT through their respective firewalls=
.=20
</SPAN></FONT></DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN=20
class=3D939482110-11022003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN class=3D939482110-=
11022003>LAN=20
D contains a PPTP server which I would like all the clients on all four LAN=
's to=20
be able to access. LAN D is protected with a firewall (iptables/debian=20
3.0/kernel-2.4.20/patch-o-matic-20030107/iptables-1.2.7a).</SPAN></FONT></D=
IV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN=20
class=3D939482110-11022003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN=20
class=3D939482110-11022003>Problem:</SPAN></FONT></DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN class=3D939482110-=
11022003>LAN=20
A (working)</SPAN></FONT></DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN class=3D939482110-=
11022003>LAN=20
B (working)</SPAN></FONT></DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN class=3D939482110-=
11022003>LAN=20
C (broken -- only one connection at a time)</SPAN></FONT></DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN class=3D939482110-=
11022003>LAN=20
D (containing the PPTP server)</SPAN></FONT></DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN=20
class=3D939482110-11022003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN=20
class=3D939482110-11022003>Details:</SPAN></FONT></DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN class=3D939482110-=
11022003>hmm=20
it actually works from the 2 LAN's (A and B) but the last one is problemati=
c.=20
From the two working ones (LAN A and LAN B) you can connect with no problem=
 to=20
the PPTP server behind the firewall protecting LAN D.</SPAN></FONT></DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN=20
class=3D939482110-11022003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN class=3D939482110-=
11022003>From=20
the broken LAN (LAN C) the problem is as follow:</SPAN></FONT></DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN class=3D939482110-=
11022003>you=20
can connect one person at a time. When this one person from LAN C has finis=
hed=20
and logged off there is a 10 minute/600 seconds timeout&nbsp;before&nbsp;it=
 is=20
possible for another client to connect to the PPTP server from LAN C (and w=
e are=20
still talking about the PPTP server&nbsp;on LAN D).</SPAN></FONT></DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN=20
class=3D939482110-11022003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN class=3D939482110-=
11022003>So=20
what I'm wondering about is what the difference is between connections from=
 LAN=20
A and&nbsp;LAN B&nbsp;and connections from LAN C ???</SPAN></FONT></DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN=20
class=3D939482110-11022003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN class=3D939482110-=
11022003>The=20
only debugging&nbsp;information I&nbsp;found was in /proc/net/ip_conntrack =
which=20
looks like this:</SPAN></FONT></DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN=20
class=3D939482110-11022003>------------------------------------------------=
--------</SPAN></FONT></DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN=20
class=3D939482110-11022003>gre&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 47 428648=20
timeout=3D600, stream_timeout=3D432000 src=3Dx.x.x.x dst=3Dx.x.x.x version=
=3D1=20
protocol=3D0x880b srckey=3D0x0 dstkey=3D0xc3e7 src=3D192.168.0<BR>.200 dst=
=3Dx.x.x.x=20
version=3D1 protocol=3D0x880b srckey=3D0xc3e7 dstkey=3D0x47d [ASSURED]=20
use=3D1<BR></SPAN></FONT><FONT face=3DVerdana color=3D#0000ff size=3D2><SPA=
N=20
class=3D939482110-11022003></SPAN></FONT></DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN=20
class=3D939482110-11022003>tcp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6 424347 ESTAB=
LISHED=20
src=3Dx.x.x.x dst=3Dx.x.x.x sport=3D1149 dport=3D1723 src=3D192.168.0.200 d=
st=3Dx.x.x.x=20
sport=3D1723 dport=3D1149 [ASSURE<BR>D] use=3D2</SPAN></FONT></DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN=20
class=3D939482110-11022003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN=20
class=3D939482110-11022003>........</DIV>
<DIV><BR>----------------------------------------------------------</SPAN><=
/FONT></DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN=20
class=3D939482110-11022003>where x.x.x.x represents the IP numbers for the =
server=20
and the client.</SPAN></FONT></DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN=20
class=3D939482110-11022003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN class=3D939482110-=
11022003>The=20
thing that is wondering me is that connections from the broken LAN C hangs =
in=20
the /proc/net/ip_conntrack file, this connection which is still recorded wa=
s=20
terminated more than one hour ago. Other connections from LAN A and LAN B h=
ave=20
been made since, but they leave no trace ?</SPAN></FONT></DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN=20
class=3D939482110-11022003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN=20
class=3D939482110-11022003>Niels</SPAN></FONT></DIV>
<DIV><FONT face=3DVerdana color=3D#0000ff size=3D2><SPAN=20
class=3D939482110-11022003>&nbsp;</DIV></SPAN></FONT>
<BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">
  <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT face=3DTah=
oma=20
  size=3D2>-----Original Message-----<BR><B>From:</B> Diego Sarasua=20
  [mailto:debian@sarasuasys.com.ar]<BR><B>Sent:</B> 10. februar 2003=20
  17:37<BR><B>To:</B> Niels Bach<BR><B>Subject:</B> Re: PPTP through iptabl=
es=20
  firewall<BR><BR></FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>ok&nbsp; then U have to make pptp suppor=
t kernel=20
  compilation&nbsp; in your firewalls and it will work for your=20
  clients</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>loading the properly iptables=20
modules</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>please reply to : <A=20
  href=3D"mailto:dsarasua@sarasuasys.com.ar">dsarasua@sarasuasys.com.ar</A>=
=20
  </FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>and maybe i can hel U with some Support =
v=EDa MSN=20
  at <A=20
  href=3D"mailto:asadopower@hotmail.com">asadopower@hotmail.com</A></FONT><=
/DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>anything U need to serv U </FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>bye </FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>Diego</FONT></DIV>
  <BLOCKQUOTE dir=3Dltr=20
  style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-=
LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
    <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
    <DIV=20
    style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: black"><B>F=
rom:</B>=20
    <A title=3DNB@maconomy.dk href=3D"mailto:NB@maconomy.dk">Niels Bach</A>=
 </DIV>
    <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A title=3Ddebian@sarasuasys=
.com.ar=20
    href=3D"mailto:debian@sarasuasys.com.ar">'Diego Sarasua'</A> </DIV>
    <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Monday, February 10, 2003 =
1:17=20
    PM</DIV>
    <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> RE: PPTP through iptabl=
es=20
    firewall</DIV>
    <DIV><BR></DIV>
    <DIV><SPAN class=3D897031516-10022003><FONT face=3DVerdana color=3D#000=
0ff=20
    size=3D2>3 LAN behind 3 different firewalls. </FONT></SPAN></DIV>
    <DIV><SPAN class=3D897031516-10022003><FONT face=3DVerdana color=3D#000=
0ff=20
    size=3D2></FONT></SPAN>&nbsp;</DIV>
    <DIV><SPAN class=3D897031516-10022003><FONT face=3DVerdana color=3D#000=
0ff=20
    size=3D2>On one LAN a PPTP server is placed and I want to access it fro=
m the=20
    clients placed on the different LANs. </FONT></SPAN></DIV>
    <DIV><SPAN class=3D897031516-10022003><FONT face=3DVerdana color=3D#000=
0ff=20
    size=3D2></FONT></SPAN>&nbsp;</DIV>
    <DIV><SPAN class=3D897031516-10022003><FONT face=3DVerdana color=3D#000=
0ff=20
    size=3D2>Niels</FONT></SPAN></DIV>
    <DIV><SPAN class=3D897031516-10022003></SPAN>&nbsp;</DIV>
    <BLOCKQUOTE dir=3Dltr style=3D"MARGIN-RIGHT: 0px">
      <DIV class=3DOutlookMessageHeader dir=3Dltr align=3Dleft><FONT face=
=3DTahoma=20
      size=3D2>-----Original Message-----<BR><B>From:</B> Diego Sarasua=20
      [mailto:debian@sarasuasys.com.ar]<BR><B>Sent:</B> 7. februar 2003=20
      17:52<BR><B>To:</B> Niels Bach<BR><B>Subject:</B> Re: PPTP through=20
      iptables firewall<BR><BR></FONT></DIV>
      <DIV><FONT face=3DArial size=3D2>Please givme some more info </FONT><=
/DIV>
      <DIV><FONT face=3DArial size=3D2>Are U talking of this ?</FONT></DIV>
      <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
      <DIV><FONT face=3DArial size=3D2>USER\</FONT></DIV>
      <DIV><FONT face=3DArial size=3D2>USER&nbsp;--------&gt;&nbsp;&nbsp;=20
      Firewall&nbsp;&nbsp;&nbsp;&nbsp;!! PPTP Server!!</FONT></DIV>
      <DIV><FONT face=3DArial size=3D2>USER/</FONT></DIV>
      <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
      <DIV><FONT face=3DArial size=3D2>Thanks</FONT></DIV>
      <DIV><FONT face=3DArial size=3D2>Diego</FONT></DIV>
      <DIV><FONT face=3DArial size=3D2>i have "patch-o-mated" my server wit=
h=20
      kernel&nbsp; 2.4.20 and it doesnt work , try with lower version of=20
      kernel&nbsp; i have workig around 5 servers one with 2.4.20 and 4 wit=
h=20
      2.4..17</FONT></DIV>
      <DIV><FONT face=3DArial size=3D2>thanks</FONT></DIV>
      <DIV><FONT face=3DArial size=3D2>bye </FONT></DIV>
      <DIV><FONT face=3DArial size=3D2>Diego</FONT></DIV>
      <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
      <DIV>----- Original Message ----- </DIV>
      <BLOCKQUOTE=20
      style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BOR=
DER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
        <DIV=20
        style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: black">=
<B>From:</B>=20
        <A title=3DNB@maconomy.dk href=3D"mailto:NB@maconomy.dk">Niels Bach=
</A>=20
        </DIV>
        <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A=20
        title=3Dnetfilter@lists.netfilter.org=20
        href=3D"mailto:'netfilter@lists.netfilter.org'">'netfilter@lists.ne=
tfilter.org'</A>=20
        </DIV>
        <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Friday, February 07, 2=
003=20
        5:43 AM</DIV>
        <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> PPTP through iptabl=
es=20
        firewall</DIV>
        <DIV><FONT face=3DVerdana color=3D#0000ff size=3D2></FONT><BR></DIV>
        <P><FONT face=3DVerdana size=3D2>I have an MS PPTP server (win2k) b=
ehind a=20
        linux firewall (kernel 2.4.20 / iptables 1.2.7a) this does not work=
 very=20
        well. You can only connect from one source at a time. Then there is=
 a 10=20
        minute (600 seconds) timeout before the next connection from a diff=
erent=20
        source can be made. If you come from a LAN that is NAT'ed to one IP=
=20
        address (the firewalls) then all these clients can connect=20
        simultaneously. So it is either one client with a public ip address=
 or=20
        several clients sharing a public IP address. But once their is a=20
        connection (either type) everybody else is blocked out.</FONT></P>
        <P><FONT face=3DVerdana size=3D2>I have tried to patch the kernel=20
        (patch-o-matic-20030107) with the pptp-conntrack-nat.patch. With th=
is=20
        patch the firewall is able to recognize the GRE protocol. This can =
be=20
        seen in /proc/net/ip_conntrack where the connections involving GRE =
has=20
        changed from UNKNOWN to GRE. But with this patch it is not possible=
 to=20
        connect, now the windows client only reach "verifying username and =

        password" and then times out. </FONT></P>
        <P><FONT face=3DVerdana size=3D2>Without the patch it is possible t=
o connect=20
        to the server one at a time and wait 10 minutes before the next=20
        connection from a different location</FONT></P>
        <P><FONT face=3DVerdana size=3D2>With the patch it is not possible =
to=20
        connect at all.</FONT> </P>
        <P><FONT face=3DVerdana size=3D2>I run Debian 3.0 (woody) Kernel 2.=
4.20 and=20
        iptables 1.2.7a with the patched version and 1.2.6a with the unpatc=
hed=20
        version of the kernel.</FONT></P>
        <P><FONT face=3DVerdana size=3D2>I have seen more people talking ab=
out this=20
        issue on the web, but no one seems to have at solution. </FONT></P>
        <P><FONT face=3DVerdana size=3D2>regards Niels</FONT>=20
    </P><BR></BLOCKQUOTE></BLOCKQUOTE></BLOCKQUOTE></BLOCKQUOTE></BODY></HT=
ML>

------_=_NextPart_001_01C2D1BB.E6F0DE70--

