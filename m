From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: HAlinux,ipsec and proxies..
Date: Thu, 7 Aug 2003 16:48:03 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C076@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C35CAF.D9734BF0"
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "Netfilter Mailling List (E-mail)" <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C35CAF.D9734BF0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,
=20
My first question in a very very long time.. ;)
=20
I have 2 firewalls which are soon to be running HAlinux. Both external =
interfaces are eth1 on both machines and running a 10.10.10.1 and =
10.10.10.2 for each firewall for HAlinux.
When HAlinux starts up, the scripts add the external IP to the main =
firewall (FWa) using iproute2 so eth1 will always be the external =
device/IP...
=20
        HA-Linux
  v-- aa.bb.cc.dd --v
10.10.10.1   10.10.10.2
----------   ----------
|  FWa   |   |   FWb  |
----------   ----------
=20
=20
The 2 firewalls use the same config files/firewall scripts..etc.etc..so =
for the iptables script to work, firewallb looks at eth1 using a script =
and gets the last IP added to the interface as we don't want it to =
firewall based on the 10.10.10.X addresses assigned for HAlinux...
=20
The script below grabs the correct IP of aa.bb.cc.dd from firewalla and =
firewallb (when fallover occurs). And all rules work with the "-d =
$EXTIP" being used..
=20
getipfromdevice()
{
        DEV=3D"$1"
        DEVIP=3D`ip addr show dev $DEV | grep "inet" |tail -1 |awk =
{'print $2'} | cut -f1 -d "/"`
        echo "$DEVIP"
}
EXTDEV=3Deth1
EXTIP=3Dgetipfromdevice $EXTDEV
=20
Now my main problem..
=20
IPSEC has to be told which interface to use for the VPN.
I use "interface=3Deth1" and it grabs 10.10.10.X which isn't correct and =
you can't tell ipsec to use another IP on the interface(AFAIK).
I found ipsec works with "interface=3Deth1:1" but then the firewall =
scripts are a muck.. I prefer not to use aliasing if possible...
=20
any other ideas or best solution??
=20
Thanks,
=20
George Vieira.

------_=_NextPart_001_01C35CAF.D9734BF0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">


<META content=3D"MSHTML 6.00.2800.1106" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D892322806-07082003>Hi=20
all,</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D892322806-07082003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D892322806-07082003>My =
first question in=20
a very very long time.. ;)</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D892322806-07082003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D892322806-07082003>I have =
2 firewalls=20
which are soon to be running HAlinux. Both external interfaces are eth1 =
on both=20
machines and running a 10.10.10.1 and 10.10.10.2 for each firewall for=20
HAlinux.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D892322806-07082003>When =
HAlinux starts=20
up, the scripts add the external IP to the main firewall (FWa) using =
iproute2 so=20
eth1 will always be the external device/IP...</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN =
class=3D892322806-07082003></SPAN></FONT><FONT=20
face=3DArial size=3D2><SPAN =
class=3D892322806-07082003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Lucida Console" size=3D2><SPAN=20
class=3D892322806-07082003>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
HA-Linux</SPAN></FONT></DIV>
<DIV><FONT face=3D"Lucida Console" size=3D2><SPAN=20
class=3D892322806-07082003>&nbsp;&nbsp;v-- aa.bb.cc.dd =
--v</SPAN></FONT></DIV>
<DIV><FONT face=3D"Lucida Console" size=3D2><SPAN=20
class=3D892322806-07082003>10.10.10.1&nbsp;&nbsp; =
10.10.10.2</SPAN></FONT></DIV>
<DIV><FONT face=3D"Lucida Console" size=3D2><SPAN=20
class=3D892322806-07082003>----------&nbsp;&nbsp; =
----------</SPAN></FONT></DIV>
<DIV><FONT face=3D"Lucida Console" size=3D2><SPAN =
class=3D892322806-07082003>|&nbsp;=20
FWa&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp; FWb&nbsp; =
|</SPAN></FONT></DIV>
<DIV><FONT face=3D"Lucida Console" size=3D2><SPAN=20
class=3D892322806-07082003>----------&nbsp;&nbsp; =
----------</SPAN></FONT></DIV>
<DIV><FONT face=3D"Lucida Console" size=3D2><SPAN=20
class=3D892322806-07082003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Lucida Console" size=3D2><SPAN=20
class=3D892322806-07082003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D892322806-07082003>The 2 =
firewalls use=20
the same config files/firewall scripts..etc.etc..so for =
the&nbsp;iptables script=20
to work,&nbsp;firewallb looks at eth1 using a script and gets the last =
IP added=20
to the interface as we don't want it to firewall based on the 10.10.10.X =

addresses assigned for HAlinux...</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D892322806-07082003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D892322806-07082003>The =
script below=20
grabs the correct IP of aa.bb.cc.dd from firewalla and firewallb (when =
fallover=20
occurs). And all rules work with the "-d $EXTIP" being=20
used..</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D892322806-07082003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D892322806-07082003>getipfromdevice()<BR>{<BR>&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;=20
DEV=3D"$1"<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEVIP=3D`ip =
addr show dev=20
$DEV | grep "inet" |tail -1 |awk {'print $2'} | cut -f1 -d=20
"/"`<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo=20
"$DEVIP"<BR>}</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D892322806-07082003>EXTDEV=3Deth1</DIV></SPAN></FONT>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D892322806-07082003>EXTIP=3Dgetipfromdevice =
$EXTDEV</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D892322806-07082003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D892322806-07082003>Now my =
main=20
problem..</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D892322806-07082003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D892322806-07082003>IPSEC =
has to be told=20
which interface to use for the VPN.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D892322806-07082003>I use=20
"interface=3Deth1" and it&nbsp;grabs 10.10.10.X which isn't correct and =
you can't=20
tell ipsec to use another IP on the =
interface(AFAIK).</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D892322806-07082003>I =
found&nbsp;ipsec=20
works with "interface=3Deth1:1" but then the firewall scripts are a =
muck.. I=20
prefer not to use aliasing if possible...</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D892322806-07082003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D892322806-07082003>any =
other ideas=20
or&nbsp;best solution??</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D674251008-03092002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D674251008-03092002>Thanks,</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D674251008-03092002></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D674251008-03092002><SPAN=20
class=3D892322806-07082003>George =
Vieira.</SPAN></SPAN></FONT></DIV></BODY></HTML>

------_=_NextPart_001_01C35CAF.D9734BF0--

