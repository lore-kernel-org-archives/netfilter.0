From: "Sathi" <sathiyan@gmx.net>
Subject: Destination NAT
Date: Fri, 14 Mar 2003 16:31:44 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <045501c2ea19$1dfc4830$870110ac@samsi>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0452_01C2EA47.332FBF60"
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

------=_NextPart_000_0452_01C2EA47.332FBF60
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello All,

I am running squid as reverse proxy and its working fine.

Now i need to set iptables rules to forward ftp ports directly to =
backend server for file upload.

I set in prerouting rule as

/sbin/iptables -t nat -A PREROUTING -p tcp --dport 20 -d 172.16.1.10 -j =
DNAT --to 172.16.1.25
/sbin/iptables -t nat -A PREROUTING -p tcp --dport 21 -d 172.16.1.10 -j =
DNAT --to 172.16.1.25

Note: Reverse proxy and backend servers are running in same network.and =
by reverse proxy has only one network interface.

but i was not able to connect to backend server.

In tcpdump i can see a request from client to squid server but it is not =
forwarding to backend server.

What is the correct rule to forward the ftp ports to backend server.

Regards,
Sathi

------=_NextPart_000_0452_01C2EA47.332FBF60
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2314.1000" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello All,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I am running squid as reverse proxy and =
its working=20
fine.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Now i need to set iptables rules to =
forward ftp=20
ports directly to backend server for file upload.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I set in prerouting rule =
as</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>/sbin/iptables -t nat -A PREROUTING -p =
tcp --dport=20
20 -d 172.16.1.10 -j DNAT --to 172.16.1.25</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>/sbin/iptables -t nat -A PREROUTING -p =
tcp --dport=20
21 -d 172.16.1.10 -j DNAT --to 172.16.1.25</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>Note: Reverse proxy and backend servers are running in same =
network.and by=20
reverse proxy has only one network interface.</DIV>
<DIV>&nbsp;</DIV>
<DIV>but i was not able to connect to backend server.</DIV>
<DIV>&nbsp;</DIV>
<DIV>In tcpdump i can see a request from client to squid server but it =
is not=20
forwarding to backend server.</DIV>
<DIV>&nbsp;</DIV>
<DIV>What is the correct rule to forward the ftp ports to backend =
server.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Regards,</DIV>
<DIV>Sathi</DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_0452_01C2EA47.332FBF60--


