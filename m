From: "WT" <wtangcc@hotmail.com>
Subject: UDP forwarding and IPIP forwarding problem
Date: Sat, 30 Nov 2002 00:06:24 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OE29sSmz6UuEhjJ8uT600006c0a@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000B_01C29804.526A6230"
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

------=_NextPart_000_000B_01C29804.526A6230
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

Hi guys,

I am trying to set up 2 IPtables based Firewall/NAT with UDP and IPIP =
forwarding function as listed below:

1) Forward UDP (port 434) package to an internal host;
2) Forward IPIP package to a host in the same subnet as the Firewall's, =
where the outer IP head of the IPIP package has a destination to a =
special IP address.=20

Here is an illustration of the scenario:

   package from 192.168.0.1
                 to 192.168.0.10 (UDP 434)
                        |=20
                        v
--------------192.168.0.10-----------------=20
               10.3.10.10
                        | forward to 10.3.10.201
                        v
--------------10.3.10.201---------------------------------------- =
10.3.10.13----------------
                                    to 172.3.10.5 (IPIP)        =
172.3.10.13
                                    from 10.3.10.201                  |
                                                                         =
     | forward to 172.3.10.5
                                                                         =
     v
                                                                        =
172.3.10.5 (get IPIP package and reply to 192.168.0.1)
                                                                         =
           =20

The IPIP reply from 172.3.10.5 to 192.168.0.1 needs to be forwarded by =
10.3.10.13 to 10.3.10.201.

I used IPtable and Linux 8 on 192.168.0.10 and 10.3.10.13 and =
encountered both problems:
1) Only one UDP package (the 1st one?) is forwarded to 10.3.10.201, =
others are dropped. And once a while (every 12 minutes), there is one =
package forwarded. That's it.
2) I can Ping the 10.3.10.201 in the Firewall's subnet, but IPIP package =
is not forwarded at all. They are still sent to 192.168.0.1 and =
dropped...

Can any expert give me some idea what may be wrong? I followed the =
instruction of the IPtables. But it just doesn't work well. Please help.

Thanks!

Wey
------=_NextPart_000_000B_01C29804.526A6230
Content-Type: text/html;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dgb2312">
<META content=3D"MSHTML 6.00.2800.1126" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi guys,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I am trying to set up&nbsp;2 IPtables =
based=20
Firewall/NAT with UDP and IPIP forwarding function as listed =
below:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>1) Forward UDP (port 434) package to an =
internal=20
host;<BR>2) Forward IPIP package to a host in the same subnet as the =
Firewall's,=20
where the outer IP head of the IPIP package has a destination to a =
special IP=20
address. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Here is an illustration of the=20
scenario:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;package from=20
192.168.0.1</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;to=20
192.168.0.10 (UDP 434)</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;|=20
</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
v</FONT></DIV>
<DIV><FONT face=3DArial =
size=3D2>--------------192.168.0.10-----------------=20
</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
10.3.10.10</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;=20
| forward to 10.3.10.201</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;v</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>--------------10.3.10.201---------------------------------------=
-=20
10.3.10.13----------------</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;to&nbsp;172.3.10.5=20
(IPIP)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
172.3.10.13</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;from=20
10.3.10.201&nbsp;&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =

|</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|=20
forward to 172.3.10.5</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
v</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;172.3.10.5=20
(get IPIP package and reply to 192.168.0.1)</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;=20
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>The IPIP&nbsp;reply from 172.3.10.5 to =
192.168.0.1=20
needs to be forwarded by 10.3.10.13 to 10.3.10.201.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I used IPtable&nbsp;and Linux 8 on =
192.168.0.10 and=20
10.3.10.13 and encountered both problems:<BR>1) Only one UDP package =
(the 1st=20
one?) is forwarded to 10.3.10.201, others are dropped. And once a while =
(every=20
12 minutes), there is one package forwarded. That's it.<BR>2) I can Ping =

the&nbsp;10.3.10.201 in the Firewall's subnet, but IPIP package is not =
forwarded=20
at all. They are still sent to 192.168.0.1 and dropped...</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Can any expert give me some idea what =
may be wrong?=20
I followed the instruction of the IPtables. But it just doesn't work =
well.=20
Please help.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks!</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Wey</FONT></DIV></BODY></HTML>

------=_NextPart_000_000B_01C29804.526A6230--

