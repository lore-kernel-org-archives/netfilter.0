From: "Ryan Beisner" <ryanb@thedataarc.com>
Subject: DMZ Scenario
Date: Thu, 14 Nov 2002 18:33:45 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000c01c28c3e$ab3603a0$64dc0a0a@i>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0009_01C28C0C.5D66A760"
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

------=_NextPart_000_0009_01C28C0C.5D66A760
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi

I have successfully installed a mail + web server in my new dmz, =
filtered by netfilter in Redhat 7.3.  My problem is, the request =
addresses show up as the dmz interface's ip address (of the packet =
filter box).  This presents a problem with Sendmail, Postfix, Apache, =
etc. for logging and security purposes.  For instance, to allow Postfix =
to relay for your specific IP range, it won't work because Postfix & =
Sendmail see xxx.xxx.177.25 as the originating IP.

So, the effect is that EVERYONE can relay through the box ... uh oh!   =
I've temporarily moved it back into the real world with it's own =
iptables script.  For lots of reasons, I want it in the DMZ.

Is there a way to forward packets without MASQing?  I think that's what =
I need to do here.  All help is appreciated.  Thanks!

ps.  You'll notice that right now I'm allowing ALL traffic to/fro these =
two DMZ ip's.  I plan to tighten that up later.
.
.
.
.
xxx's =3D external IPs
...............

PRESext=3Dxxx.xxx.177.24
KEYext=3Dxxx.xxx.177.25
PRESdmz=3D10.10.177.24
KEYdmz=3D10.10.177.25

$ipt -A FORWARD -s 0/0 -d $PRESext -j ACCEPT
$ipt -A FORWARD -s $PRESext -d 0/0 -j ACCEPT
$ipt -A FORWARD -s 0/0 -d $PRESdmz -j ACCEPT
$ipt -A FORWARD -s $PRESdmz -d 0/0 -j ACCEPT

$ipt -A PREROUTING -t nat -d $PRESext -j DNAT --to $PRESdmz
$ipt -A POSTROUTING -t nat -d $PRESdmz -j SNAT --to $PRESext


$ipt -A FORWARD -s 0/0 -d $KEYext -j ACCEPT
$ipt -A FORWARD -s $KEYext -d 0/0 -j ACCEPT
$ipt -A FORWARD -s 0/0 -d $KEYdmz -j ACCEPT
$ipt -A FORWARD -s $KEYdmz -d 0/0 -j ACCEPT

$ipt -A PREROUTING -t nat -d $KEYext -j DNAT --to $KEYdmz
$ipt -A POSTROUTING -t nat -d $KEYdmz -j SNAT --to $KEYext
...............
.
.
.
.
.
.
TIA

-Ryan Beisner


=3D=3D=3Dlinux everywhere=3D=3D=3D

------=_NextPart_000_0009_01C28C0C.5D66A760
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2614.3500" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have successfully installed a mail + =
web server=20
in my new dmz, filtered by netfilter in Redhat 7.3.&nbsp; My problem is, =
the=20
request addresses show up as the dmz interface's ip address (of the =
packet=20
filter box).&nbsp; This presents a problem with Sendmail, Postfix, =
Apache, etc.=20
for logging and security purposes.&nbsp; For instance, to allow Postfix =
to relay=20
for your specific IP range, it won't work because Postfix &amp; Sendmail =
see=20
xxx.xxx.177.25 as the originating IP.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>So, the effect is that EVERYONE can =
relay through=20
the box ... uh oh!&nbsp;&nbsp; I've temporarily moved it back into the =
real=20
world with it's own iptables script.&nbsp; For lots of reasons, I want =
it in the=20
DMZ.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Is there a way to forward packets =
without=20
MASQing?&nbsp; I think that's what I need to do here.&nbsp; All help is=20
appreciated.&nbsp; Thanks!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>ps.&nbsp; You'll notice that right now =
I'm allowing=20
ALL traffic to/fro these two DMZ ip's.&nbsp; I plan to tighten that up=20
later.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>xxx's =3D external IPs</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial =
size=3D2>...............</FONT></DIV></FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>PRESext=3Dxxx.xxx.177.24<BR>KEYext=3Dxxx.xxx.177.25<BR>PRESdmz=3D=
10.10.177.24<BR>KEYdmz=3D10.10.177.25</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>$ipt -A FORWARD -s 0/0 -d $PRESext -j=20
ACCEPT<BR>$ipt -A FORWARD -s $PRESext -d 0/0 -j ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>$ipt -A FORWARD -s 0/0 -d $PRESdmz -j=20
ACCEPT<BR>$ipt -A FORWARD -s $PRESdmz -d 0/0 -j ACCEPT</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>$ipt -A PREROUTING -t nat -d $PRESext =
-j DNAT --to=20
$PRESdmz<BR>$ipt -A POSTROUTING -t nat -d $PRESdmz -j SNAT --to=20
$PRESext</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>$ipt -A FORWARD -s 0/0 -d $KEYext -j =
ACCEPT<BR>$ipt=20
-A FORWARD -s $KEYext -d 0/0 -j ACCEPT</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>$ipt -A FORWARD -s 0/0 -d $KEYdmz -j =
ACCEPT<BR>$ipt=20
-A FORWARD -s $KEYdmz -d 0/0 -j ACCEPT</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>$ipt -A PREROUTING -t nat -d $KEYext -j =
DNAT --to=20
$KEYdmz<BR>$ipt -A POSTROUTING -t nat -d $KEYdmz -j SNAT --to=20
$KEYext</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>...............</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>TIA</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>-Ryan Beisner</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>=3D=3D=3Dlinux =
everywhere=3D=3D=3D</FONT></DIV></BODY></HTML>

------=_NextPart_000_0009_01C28C0C.5D66A760--



