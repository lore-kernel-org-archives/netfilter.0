From: "Tim" <tim@optushome.com.au>
Subject: download limit
Date: Sat, 15 Jun 2002 15:23:33 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <00ef01c214bb$4979e3c0$0b00a8c0@tims>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00EC_01C21480.9CAD07B0"
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
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_00EC_01C21480.9CAD07B0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi im just wondering if you would be able to help me with the following.
Im trying to make a download limit on the forward chain so that when it =
has hit 100mg it will stop all my traffic on the lan... to stop getting =
internet access. But even when i try and use your rule below im getting =
cant load match..=20
Thanks for your help
Regards Tim

iptables -A INPUT -p tcp --dport 80 -m quota --quota 52428800 -j ACCEPT
iptables v1.2.5: Couldn't load match =
`quota':/lib/iptables/libipt_quota.so: cannot open shared object file: =
No such file or directory

Try `iptables -h' or 'iptables --help' for more information.
[root@tb root]# quota quota
quota: User quota doesn't exist.

Or is they any other way i can make a rule so i cant download more than =
100mg a day?

------=_NextPart_000_00EC_01C21480.9CAD07B0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4134.600" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>Hi im just wondering if you would be =
able to help=20
me with the following.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Im trying to make a download limit on =
the forward=20
chain so that when it has hit 100mg it will stop all my traffic on the =
lan... to=20
stop getting internet access. But even when i try and use your rule =
below im=20
getting cant load match.. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Thanks for your help</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Regards Tim</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>iptables -A INPUT -p tcp --dport 80 -m =
quota=20
--quota 52428800 -j ACCEPT<BR>iptables v1.2.5: Couldn't load match=20
`quota':/lib/iptables/libipt_quota.so: cannot open shared object file: =
No such=20
file or directory</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Try `iptables -h' or 'iptables --help' =
for more=20
information.<BR>[root@tb root]# quota quota<BR>quota: User quota doesn't =

exist.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>Or is they any other way i can make a rule so i cant download more =
than=20
100mg a day?</DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_00EC_01C21480.9CAD07B0--


