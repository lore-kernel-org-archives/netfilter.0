From: =?iso-8859-1?Q?Oriol_Magran=E9?= <omagrane@mediapro.es>
Subject: Simple newbie's question
Date: Mon, 16 Feb 2004 18:29:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001701c3f4b2$648798f0$a704a8c0@mpro4167>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0014_01C3F4BA.C5D26420"
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

------=_NextPart_000_0014_01C3F4BA.C5D26420
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


    Hello!!
    I have a linux box (with ip 192.168.4.172) connected to the Internet =
through an ADSL router (with ip 192.168.4.10).
    Now I'd like to do some port forwarding on the box itself, so that =
outgoing connections to port 80 of host 212.59.199.45 goes to port 110 =
of host 212.59.199.75.

    So I do:

        iptables -t nat -A PREROUTING -p tcp -d 212.59.199.45 --dport 80 =
-j DNAT --to 212.59.199.75:110

    Which it seems the logical thing to do.
    But when I telnet 212.59.199.45 80 the kernel continues to send =
packets to port 80 of 212.59.199.45 ignoring my wishes and commands.
    What am I doing wrong?

    Thank you very much in advance!!

    Oriol
    Barcelona


------=_NextPart_000_0014_01C3F4BA.C5D26420
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Hello!!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; I have a linux box =
(with ip=20
192.168.4.172) connected to the Internet through an ADSL router (with ip =

192.168.4.10).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Now I'd like to do =
some port=20
forwarding on the box itself, so that outgoing connections to port 80 of =
host=20
212.59.199.45 goes to port 110 of host 212.59.199.75.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; So I =
do:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
iptables -t=20
nat -A PREROUTING -p tcp -d 212.59.199.45 --dport 80 -j DNAT --to=20
212.59.199.75:110</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Which it seems the =
logical thing=20
to do.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; But when I telnet =
212.59.199.45=20
80&nbsp;the kernel continues to send&nbsp;packets to port 80 of =
212.59.199.45=20
ignoring my wishes and commands.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; What am I doing=20
wrong?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Thank you very much =
in=20
advance!!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Oriol</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; =
Barcelona</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0014_01C3F4BA.C5D26420--


