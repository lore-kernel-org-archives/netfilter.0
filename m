From: "Walter Gnadenberger" <walter.gnadenberger@sphinx.at>
Subject: Problem VPN through iptables
Date: Thu, 19 Aug 2004 11:15:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c485cd$141be9a0$4d00a8c0@internal.sphinx.co.at>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0001_01C485DD.D7A4B9A0"
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

------=_NextPart_000_0001_01C485DD.D7A4B9A0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello!

I habe a problem with VPN (PPTP) through a FW (iptables)

Exercise:
I want through a iptables-fw to a ms vpn server.
(INTERNET) -> FW(iptables) -> VPN (PPTP MS SERVER)

I am able to make a vpn connect when I am in the same net. So VPN Server
works fine.
When I try to connect the VPN server from outside I get an Err 721.
when i trace the session with tcpdump, I see traffic in both directions
(GRE and TCP 1721)
With a sniffer at MS VPN Server I see incoming and outgoing traffic.
 
I do not know what I make wrong!
 
Hier ar my rules for the FW
 
 

ip_vpn_ext=xxx.xxx.xxx.xxx
ip_vpn_server=xxx.xxx.x.xx

trace_echo "VPN rules for LAN"





trace_echo "set VPN Lan Rules"


${IPTABLES} -t nat -A PREROUTING \
-i $i_external \
-p tcp \
-d $ip_vpn_ext --dport 1723 \
-j DNAT --to $ip_vpn_server:1723

${IPTABLES} -t nat -A PREROUTING \
-i $i_external \
-p gre \
-d $ip_vpn_ext \
-j DNAT --to $ip_vpn_server


${IPTABLES} -t nat -A POSTROUTING \
-o $i_external \
-p gre \
-s $ip_vpn_server \
-j SNAT --to-source $ip_vpn_ext

${IPTABLES} -t nat -A POSTROUTING \
-o $i_external \
-p tcp \
-s $ip_vpn_server --sport 1723 \
-j SNAT --to-source $ip_vpn_ext:1723


${IPTABLES} -A fwd_int \
-i $i_external \
-o $i_internal \
-p tcp \
-s $net_anywhere --sport $p_unpriv\
-m state --state NEW,ESTABLISHED \
-j ACCEPT

${IPTABLES} -A fwd_int \
-i $i_internal \
-o $i_external \
-p tcp \
-s $ip_vpn_server \
-m state --state ESTABLISHED \
-j ACCEPT 

------=_NextPart_000_0001_01C485DD.D7A4B9A0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<TITLE>Nachricht</TITLE>

<META content=3D"MSHTML 6.00.2800.1458" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial><FONT size=3D2><SPAN=20
class=3D506431009-19082004>Hello</SPAN>!<BR></FONT></FONT></DIV>
<DIV><FONT><SPAN class=3D506431009-19082004></SPAN><FONT face=3DArial =
size=3D2>I<SPAN=20
class=3D506431009-19082004> habe a problem with VPN (PPTP) through a FW=20
(iptables)</SPAN><BR><BR><SPAN=20
class=3D506431009-19082004>Exercise:</SPAN></FONT></FONT></DIV>
<DIV><FONT><FONT face=3DArial size=3D2><SPAN =
class=3D506431009-19082004>I want through=20
a iptables-fw to a ms vpn server.</SPAN></FONT></FONT></DIV>
<DIV><FONT><FONT face=3DArial size=3D2>(INTERNET) -&gt; FW(iptables) =
-&gt; VPN=20
(<SPAN class=3D506431009-19082004>PPTP </SPAN>MS =
SERVER)<BR></FONT></FONT></DIV>
<DIV><FONT><FONT><SPAN class=3D506431009-19082004></SPAN><FONT =
face=3DArial=20
size=3D2>I<SPAN class=3D506431009-19082004> am able to make a vpn =
connect when I am=20
in the same net. So VPN Server works =
fine.</SPAN></FONT></FONT></FONT></DIV>
<DIV><FONT><FONT><FONT><SPAN class=3D506431009-19082004></SPAN><SPAN=20
class=3D506431009-19082004></SPAN><FONT face=3DArial size=3D2>W<SPAN=20
class=3D506431009-19082004>hen I try to connect the VPN server from =
outside I get=20
an Err 721.</SPAN></FONT></FONT></FONT></FONT></DIV>
<DIV><FONT><FONT><FONT><FONT face=3DArial size=3D2><SPAN=20
class=3D506431009-19082004>when i trace the session with tcpdump, I see =
traffic in=20
both directions (GRE and TCP =
1721)</SPAN></FONT></FONT></FONT></FONT></DIV>
<DIV><FONT><FONT><FONT><FONT face=3DArial size=3D2><SPAN=20
class=3D506431009-19082004>With a sniffer at MS VPN Server I see =
incoming and=20
outgoing traffic.</SPAN></FONT></FONT></FONT></FONT></DIV>
<DIV><FONT><FONT><FONT><FONT face=3DArial size=3D2><SPAN=20
class=3D506431009-19082004></SPAN></FONT></FONT></FONT></FONT>&nbsp;</DIV=
>
<DIV><FONT><FONT><FONT><FONT face=3DArial size=3D2><SPAN =
class=3D506431009-19082004>I=20
do not know what I make wrong!</SPAN></FONT></FONT></FONT></FONT></DIV>
<DIV><FONT><FONT><FONT><FONT face=3DArial size=3D2><SPAN=20
class=3D506431009-19082004></SPAN></FONT></FONT></FONT></FONT>&nbsp;</DIV=
>
<DIV><FONT><FONT><FONT><FONT face=3DArial size=3D2><SPAN=20
class=3D506431009-19082004>Hier ar my rules for the=20
FW</SPAN></FONT></FONT></FONT></FONT></DIV>
<DIV><FONT><FONT><FONT><FONT face=3DArial size=3D2><SPAN=20
class=3D506431009-19082004></SPAN></FONT></FONT></FONT></FONT>&nbsp;</DIV=
>
<DIV><FONT><FONT><FONT><FONT face=3DArial size=3D2><SPAN=20
class=3D506431009-19082004></SPAN></FONT></FONT></FONT></FONT>&nbsp;</DIV=
>
<DIV><FONT><FONT><FONT><FONT face=3DArial=20
size=3D2><BR>ip_vpn_ext=3Dxxx.xxx.xxx.xxx<BR>ip_vpn_server=3Dxxx.xxx.x.xx=
<BR><BR>trace_echo=20
"VPN rules for LAN"<BR><BR><BR><BR><BR><BR>trace_echo "set VPN Lan=20
Rules"<BR><BR><BR>${IPTABLES} -t nat -A PREROUTING \<BR>-i $i_external =
\<BR>-p=20
tcp \<BR>-d $ip_vpn_ext --dport 1723 \<BR>-j DNAT --to=20
$ip_vpn_server:1723<BR><BR>${IPTABLES} -t nat -A PREROUTING \<BR>-i =
$i_external=20
\<BR>-p gre \<BR>-d $ip_vpn_ext \<BR>-j DNAT --to=20
$ip_vpn_server<BR><BR><BR>${IPTABLES} -t nat -A POSTROUTING \<BR>-o =
$i_external=20
\<BR>-p gre \<BR>-s $ip_vpn_server \<BR>-j SNAT --to-source=20
$ip_vpn_ext<BR><BR>${IPTABLES} -t nat -A POSTROUTING \<BR>-o $i_external =
\<BR>-p=20
tcp \<BR>-s $ip_vpn_server --sport 1723 \<BR>-j SNAT --to-source=20
$ip_vpn_ext:1723<BR><BR><BR>${IPTABLES} -A fwd_int \<BR>-i $i_external =
\<BR>-o=20
$i_internal \<BR>-p tcp \<BR>-s $net_anywhere --sport $p_unpriv\<BR>-m =
state=20
--state NEW,ESTABLISHED \<BR>-j ACCEPT<BR><BR>${IPTABLES} -A fwd_int =
\<BR>-i=20
$i_internal \<BR>-o $i_external \<BR>-p tcp \<BR>-s $ip_vpn_server =
\<BR>-m state=20
--state ESTABLISHED \<BR>-j ACCEPT=20
</FONT></FONT></FONT></FONT></DIV></BODY></HTML>

------=_NextPart_000_0001_01C485DD.D7A4B9A0--


