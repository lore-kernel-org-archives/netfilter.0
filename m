From: "Dimitrios Chr. Ioannidis" <dchri@internet.gr>
Subject: IGMP Query on Remote IP
Date: Mon, 28 Oct 2002 00:11:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <042a01c27e06$226d57d0$01000001@olimpos>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0427_01C27E16.A0F70A00"
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
To: netFilter General List <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0427_01C27E16.A0F70A00
Content-Type: text/plain;
	charset="iso-8859-7"
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi all,

    i try to setup a small network, and i have this problem...

    The network is a private class C, 192.168.0.0/24 and connected
to the Internet through ISDN Dialup...

    I use a ISDN Card in a GNU\Linux Box to do the
Firewalling/Routing. All
is working fine except that i can't make the automatic hangup to
work...=20
So i try to investigate and find that, even when i have done the
following :

A)
    IPTABLES -P INPUT DROP
    IPTABLES -P OUTPUT DROP
    IPTABLES -P FORWARD DROP

B)
connect to ISP and get the

    local IP address xxx.xxx.xxx.10
    remote IP address yyy.yyy.yyy.4

C)
run tcpdump on ISDN interface=20

    tcpdump -i ippp0


Result

i see traffic between remote IP Address (not local IP address)
and PIM-ROUTERS.MCAST.NET and ALL-SYSTEMS.MCAST.NET
and the connection is remaining open ...

    Is this normal ? Does anyone know if this kind of traffic=20
prevent the isdn4linux to hangup? And if it is how do i block it?

Dimitris

-----BEGIN PGP SIGNATURE-----
Version: PGPfreeware 7.0.3 for non-commercial use <http://www.pgp.com>

iQA/AwUBPbxkqmOJo0Km83ffEQIqHQCeMegrOsiM0s5cHG5+v8MkzpUltWEAnRW7
7EWljHdOvSvqznn1Qc4JPVVa
=3DkFKI
-----END PGP SIGNATURE-----


------=_NextPart_000_0427_01C27E16.A0F70A00
Content-Type: text/html;
	charset="iso-8859-7"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-7" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.3315.2870" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>-----BEGIN PGP SIGNED MESSAGE-----<BR>Hash: SHA1</DIV>
<DIV>&nbsp;</DIV>
<DIV>Hi all,</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp; i try to setup a small network, and i have this=20
problem...</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp; The network is a private class C, 192.168.0.0/24 =
and=20
connected<BR>to the Internet through ISDN Dialup...</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp; I use a ISDN Card in a GNU\Linux Box to do=20
the<BR>Firewalling/Routing. All<BR>is working fine except that i can't =
make the=20
automatic hangup to<BR>work... <BR>So i try to investigate and find =
that, even=20
when i have done the<BR>following :</DIV>
<DIV>&nbsp;</DIV>
<DIV>A)<BR>&nbsp;&nbsp;&nbsp; IPTABLES -P INPUT =
DROP<BR>&nbsp;&nbsp;&nbsp;=20
IPTABLES -P OUTPUT DROP<BR>&nbsp;&nbsp;&nbsp; IPTABLES -P FORWARD =
DROP</DIV>
<DIV>&nbsp;</DIV>
<DIV>B)<BR>connect to ISP and get the</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp; local IP address =
xxx.xxx.xxx.10<BR>&nbsp;&nbsp;&nbsp;=20
remote IP address yyy.yyy.yyy.4</DIV>
<DIV>&nbsp;</DIV>
<DIV>C)<BR>run tcpdump on ISDN interface </DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp; tcpdump -i ippp0</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>Result</DIV>
<DIV>&nbsp;</DIV>
<DIV>i see traffic between remote IP Address (not local IP =
address)<BR>and=20
PIM-ROUTERS.MCAST.NET and ALL-SYSTEMS.MCAST.NET<BR>and the connection is =

remaining open ...</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp; Is this normal ? Does anyone know if this kind =
of=20
traffic <BR>prevent the isdn4linux to hangup? And if it is how do i =
block=20
it?</DIV>
<DIV>&nbsp;</DIV>
<DIV>Dimitris</DIV>
<DIV>&nbsp;</DIV>
<DIV>-----BEGIN PGP SIGNATURE-----<BR>Version: PGPfreeware 7.0.3 for=20
non-commercial use &lt;<A=20
href=3D"http://www.pgp.com">http://www.pgp.com</A>&gt;</DIV>
<DIV>&nbsp;</DIV>
<DIV>iQA/AwUBPbxkqmOJo0Km83ffEQIqHQCeMegrOsiM0s5cHG5+v8MkzpUltWEAnRW7<BR>=
7EWljHdOvSvqznn1Qc4JPVVa<BR>=3DkFKI<BR>-----END=20
PGP SIGNATURE-----<BR></DIV></BODY></HTML>

------=_NextPart_000_0427_01C27E16.A0F70A00--



