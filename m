From: "Big Daddy" <bigdaddy@monster-solutions.net>
Subject: HTTP Port forwarding issues
Date: Mon, 8 Jul 2002 15:37:38 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <001f01c226b6$eb0a4f60$6702a8c0@internal.monstersolutions.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001C_01C22695.63CF5570"
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

------=_NextPart_000_001C_01C22695.63CF5570
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

all,
     for some reason i can get my smtp and pop3 to route from the  =
internet, but i cannot get http requests to forward correctly.
 iptables -A FORWARD -p tcp -i eth0 -d $int_ip -p tcp --dport http -m =
state --state NEW -j ACCEPT
 iptables -A FORWARD -p tcp -i eth0 -d $int_ip -p tcp --dport smtp -m =
state --state NEW -j ACCEPT (works)
 iptables -A FORWARD -p tcp -i eth0 -d $int_ip -p tcp --dport pop3 -m =
state --state NEW -j ACCEPT (works)

 iptables -t nat -A PREROUTING -d $ext_ip -p tcp --dport smtp -j DNAT =
--to-destination $int_smtp:25 (works)
 iptables -t nat -A PREROUTING -d $ext_ip -p tcp --dport pop3 -j DNAT =
--to-destination $int_pop3:110 (works)
 iptables -t nat -A PREROUTING -d $ext_ip -p tcp --dport http -j DNAT =
--to-destination $int_http:80

 web server is running IIS5.
any help would be great!
Big D@ddy


------=_NextPart_000_001C_01C22695.63CF5570
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2716.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>all,<BR>&nbsp;&nbsp;&nbsp;&nbsp; for some reason i can get my smtp =
and pop3=20
to route from the&nbsp;&nbsp;internet, but i cannot get http requests to =
forward=20
correctly.</DIV>
<DIV>&nbsp;iptables -A FORWARD -p tcp -i eth0 -d $int_ip -p tcp --dport =
http -m=20
state --state NEW -j ACCEPT<BR>&nbsp;iptables -A FORWARD -p tcp -i eth0 =
-d=20
$int_ip -p tcp --dport smtp -m state --state NEW -j ACCEPT=20
(works)<BR>&nbsp;iptables -A FORWARD -p tcp -i eth0 -d $int_ip -p tcp =
--dport=20
pop3 -m state --state NEW -j ACCEPT (works)<BR><BR>&nbsp;iptables -t nat =
-A=20
PREROUTING -d $ext_ip -p tcp --dport smtp -j DNAT --to-destination =
$int_smtp:25=20
(works)<BR>&nbsp;iptables -t nat -A PREROUTING -d $ext_ip -p tcp --dport =
pop3 -j=20
DNAT --to-destination $int_pop3:110 (works)<BR>&nbsp;iptables -t nat -A=20
PREROUTING -d $ext_ip -p tcp --dport http -j DNAT --to-destination=20
$int_http:80<BR><BR>&nbsp;web server is running IIS5.<BR>any help would =
be=20
great!<BR>Big <A href=3D"mailto:D@ddy">D@ddy</A><BR></DIV></BODY></HTML>

------=_NextPart_000_001C_01C22695.63CF5570--


