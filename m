From: "Tim Rodriguez" <twr@bellsouth.net>
Subject: SNAT static vs. dynamic ip = pppoe
Date: Sat, 30 Nov 2002 20:50:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001e01c298dc$0a32e590$0a0110ac@nebuchadnezza>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001B_01C298B2.20F1E6C0"
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
To: iptables-list <netfilter@lists.samba.org>

This is a multi-part message in MIME format.

------=_NextPart_000_001B_01C298B2.20F1E6C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Ok, I have loaded roaming peguin pppoe client for my DSL connection and =
I need to alter my rules script to allow connections out the ppp0 =
interface that rp-pppoe client creates. If my understanding is correct, =
(please feel free to make constructive suggestions), if you have a =
dynamically assigned ip address, it is better to use MASQUERADE.

Example: iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

This due to the fact that MASQUERADE will obtain the presently assigned =
dynamic ip address and assigning it to every single packet going out =
through ppp0....correct? So no matter what ip address is dynamically =
assigned by my ISP I will always have a connection to the Internet via =
MASQUERADE...correct?

If I have a static ip address, (and I do), it is better to use SNAT.=20

Example: iptables -t nat -A POSTROUTING -o ppp0 -j SNAT --to 1.2.3.4  =20

This will make matters more efficient due to the fact that SNAT =
automatically assigns the --to 1.2.3.4 ip address to every packet =
without the overhead of having to obtained the ip address. Is this =
correct so far?

Now, I have had some problems with my ISP in then getting it right with =
my account statically assigning my ip address...I have had the =
experience where my ip address has changed in the past, as if I my =
account where set for dynamically assigned ip address. I have called =
then and they "supposedly" have fixed this. My ip address has recently =
stayed static.

To avoid future inabilities to access the Internet and knowing that my =
ISP has, in the past, bungle my account; would it be a safer bet to use =
MASQUERADE even though at the moment my ip address seems to be staying =
static? They may have finally gotten my account right.

Your comments, construtive suggestions, remarks and confirmations about =
my thinking will be gratefully appreciated, as always.

Sincerely,
Tim Rodriguez
Network Security Student

------=_NextPart_000_001B_01C298B2.20F1E6C0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2920.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Ok, I have loaded roaming peguin pppoe =
client for=20
my DSL connection and I need to alter my rules script to allow =
connections out=20
the ppp0 interface that rp-pppoe client creates. If my understanding is=20
correct,&nbsp;(please feel free to make constructive suggestions), if =
you have a=20
dynamically assigned ip address, it is better to use =
MASQUERADE.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Example: iptables -t nat -A POSTROUTING =
-o ppp0 -j=20
MASQUERADE</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>This due to the fact that MASQUERADE =
will obtain=20
the presently assigned dynamic ip address and assigning it to every =
single=20
packet going out through ppp0....correct? So no matter what ip address =
is=20
dynamically assigned by my ISP I will always have a connection to the =
Internet=20
via MASQUERADE...correct?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>If I have a static ip address, (and I =
do), it is=20
better to use SNAT. </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Example: iptables -t nat -A POSTROUTING =
-o ppp0 -j=20
SNAT --to 1.2.3.4&nbsp;&nbsp; </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>This will make matters more efficient =
due to the=20
fact that SNAT automatically assigns the --to 1.2.3.4 ip address to =
every packet=20
without the overhead of having to obtained the ip address. Is this =
correct so=20
far?</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Now, I have had some problems with my =
ISP in then=20
getting it right with my account statically assigning my ip address...I =
have had=20
the experience where my ip address has changed in the past, as if I my =
account=20
where set for dynamically assigned ip address. I have called then and =
they=20
"supposedly" have fixed this. My ip address has recently stayed=20
static.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>To avoid future inabilities to access =
the Internet=20
and knowing that my ISP has, in the past, bungle my account; would it be =
a safer=20
bet to use MASQUERADE even though at the moment my ip address seems to =
be=20
staying static? They may have finally gotten my account =
right.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Your comments, construtive suggestions, =
remarks and=20
confirmations about my thinking will be gratefully appreciated, as=20
always.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Sincerely,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Tim Rodriguez</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Network Security =
Student</FONT></DIV></BODY></HTML>

------=_NextPart_000_001B_01C298B2.20F1E6C0--



