From: "John Paul" <john@pinoylinux.sytes.net>
Subject: Help: ip_pptp_*  Issue
Date: Thu, 5 Jun 2003 07:54:25 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008e01c32af4$a12047e0$fd00a8c0@homes>
Reply-To: "John Paul" <john@pinoylinux.sytes.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_008B_01C32B37.AEC9EB10"
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

------=_NextPart_000_008B_01C32B37.AEC9EB10
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Folks,

My Config:

PC1 (192.168.0.20) ----> gateway(LinuxServer) <-------------------> =
internet <--------------------> VPN Server
PC2 (192.168.0.21)       eth0 : 242.x.x.x
                                    eth1 : 192.168.0.1


I have my private network configured as 192.168.0.0/24. PC1 and PC2 can =
connect to the VPN Server BUT ONLY ONE AT A TIME. Is there any way to =
configure "gateway(LinuxServer) so PC1 and PC2 can connect at the same =
time? Is it something to do with the ip_pptp_* issue?

Appreciate any help.

TIA.


"lsmod"

Module                  Size  Used by    Tainted: P
ip_conntrack_pptp       3984   0  (unused)
ip_conntrack_proto_gre    6036   0  [ip_conntrack_pptp]
ppp_deflate             4568   0  (autoclean)
zlib_deflate           21624   0  (autoclean) [ppp_deflate]
zlib_inflate           21828   0  (autoclean) [ppp_deflate]
ppp_mppe               24088   0  (autoclean)
bsd_comp                5464   0  (autoclean)
ipt_LOG                 4248   5  (autoclean)
ipt_limit               1688   3  (autoclean)
ipt_state               1048   7  (autoclean)
iptable_mangle          2776   0  (autoclean) (unused)
ipt_MASQUERADE          2872   1  (autoclean)
ipt_REDIRECT            1368   1  (autoclean)
iptable_nat            30072   1  (autoclean) [ipt_MASQUERADE =
ipt_REDIRECT]
ip_conntrack           41824   4  (autoclean) [ip_conntrack_pptp =
ip_conntrack_proto_gre ipt_state ipt_MASQUERADE ipt_REDIRECT =
iptable_nat]
ppp_synctty             8384   0  (unused)
ppp_async               9888   1
ppp_generic            23936   3  [ppp_deflate ppp_mppe bsd_comp =
ppp_synctty ppp_async]
slhc                    6844   0  [ppp_generic]
3c59x                  30608   1
iptable_filter          2412   1  (autoclean)
ip_tables              18584  10  [ipt_LOG ipt_limit ipt_state =
iptable_mangle ipt_MASQUERADE ipt_REDIRECT iptable_nat iptable_filter]


------=_NextPart_000_008B_01C32B37.AEC9EB10
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2726.2500" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#edfefc>
<DIV><FONT face=3DArial size=3D2>Hello Folks,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><STRONG>My =
Config:</STRONG></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>PC1&nbsp;(192.168.0.20) ----&gt;=20
gateway(LinuxServer) &lt;-------------------&gt; internet=20
&lt;--------------------&gt; VPN Server</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>PC2=20
(192.168.0.21)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; eth0 : =
242.x.x.x</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; eth1 :=20
192.168.0.1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have my private network configured as =

192.168.0.0/24. PC1 and PC2 can connect to the VPN Server BUT ONLY ONE =
AT A=20
TIME. Is there any way to configure "gateway(LinuxServer) so PC1 and PC2 =
can=20
connect at the same time? Is it something to do with the ip_pptp_*=20
issue?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Appreciate any help.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>TIA.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><STRONG>"lsmod"</STRONG></FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>Module&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Size&nbsp; Used by&nbsp;&nbsp;&nbsp; Tainted:=20
P<BR>ip_conntrack_pptp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
3984&nbsp;&nbsp;=20
0&nbsp; (unused)<BR>ip_conntrack_proto_gre&nbsp;&nbsp;&nbsp; =
6036&nbsp;&nbsp;=20
0&nbsp;=20
[ip_conntrack_pptp]<BR>ppp_deflate&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
4568&nbsp;&nbsp; 0&nbsp;=20
(autoclean)<BR>zlib_deflate&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
21624&nbsp;&nbsp; 0&nbsp; (autoclean)=20
[ppp_deflate]<BR>zlib_inflate&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
21828&nbsp;&nbsp; 0&nbsp; (autoclean)=20
[ppp_deflate]<BR>ppp_mppe&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
24088&nbsp;&nbsp; 0&nbsp;=20
(autoclean)<BR>bsd_comp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
5464&nbsp;&nbsp; 0&nbsp;=20
(autoclean)<BR>ipt_LOG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
4248&nbsp;&nbsp; 5&nbsp;=20
(autoclean)<BR>ipt_limit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1688&nbsp;&nbsp; 3&nbsp;=20
(autoclean)<BR>ipt_state&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
1048&nbsp;&nbsp; 7&nbsp;=20
(autoclean)<BR>iptable_mangle&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;=20
2776&nbsp;&nbsp; 0&nbsp; (autoclean)=20
(unused)<BR>ipt_MASQUERADE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
2872&nbsp;&nbsp; 1&nbsp;=20
(autoclean)<BR>ipt_REDIRECT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;=20
1368&nbsp;&nbsp; 1&nbsp;=20
(autoclean)<BR>iptable_nat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
30072&nbsp;&nbsp; 1&nbsp; (autoclean) [ipt_MASQUERADE=20
ipt_REDIRECT]<BR>ip_conntrack&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
41824&nbsp;&nbsp; 4&nbsp; (autoclean) [ip_conntrack_pptp =
ip_conntrack_proto_gre=20
ipt_state ipt_MASQUERADE ipt_REDIRECT=20
iptable_nat]<BR>ppp_synctty&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;=20
8384&nbsp;&nbsp; 0&nbsp;=20
(unused)<BR>ppp_async&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
9888&nbsp;&nbsp;=20
1<BR>ppp_generic&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;=20
23936&nbsp;&nbsp; 3&nbsp; [ppp_deflate ppp_mppe bsd_comp ppp_synctty=20
ppp_async]<BR>slhc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
6844&nbsp;&nbsp; 0&nbsp;=20
[ppp_generic]<BR>3c59x&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
30608&nbsp;&nbsp;=20
1<BR>iptable_filter&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
=20
2412&nbsp;&nbsp; 1&nbsp;=20
(autoclean)<BR>ip_tables&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
18584&nbsp; 10&nbsp; [ipt_LOG ipt_limit ipt_state iptable_mangle =
ipt_MASQUERADE=20
ipt_REDIRECT iptable_nat iptable_filter]<BR></FONT></DIV></BODY></HTML>

------=_NextPart_000_008B_01C32B37.AEC9EB10--


