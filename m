From: "Travis Crook" <travis@visionsbeyond.com>
Subject: ftp forward to internal machine
Date: Tue, 4 Jun 2002 16:00:13 -0600
Sender: netfilter-admin@lists.samba.org
Message-ID: <009201c20c13$347b4140$6702a8c0@mindtrip.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_008F_01C20BE0.E99DADC0"
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

------=_NextPart_000_008F_01C20BE0.E99DADC0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello everyone,
    I have a firewall configured to forward port 80 traffic to an =
internal machine.  I was wondering if the same thing is possible with =
ftp traffic.  The rules I am using are as follows:

iptables -A PREROUTING -t nat -i EXTINF -p tcp -d 1.2.3.4 --dport 21 -j =
DNAT --to 192.168.2.5:21

iptables -A FORWARD -i EXTINF -p tcp -d 192.168.2.5 --dport 21 ACCEPT

iptables -A FORWARD -i EXTINF -o INTIF -p tcp --dport 21 -m state =
--state NEW,ESTABLISHED,RELATED -j ACCEPT

iptables -t nat -A PREROUTING -i EXTINF -p tcp --dport 21 -d 1.2.3.4 -j =
DNAT --to-destination 192.168.2.5:21

iptables -t nat -A POSTROUTING -o INTIF -p tcp --dport 21 -d 192.168.2.5 =
-j SNAT --to-source 192.168.2.254

I can connect to the ftp server but then I cannot establish a data =
channel between the client and the server.=20

Any help would be appreciated.  If you want to see output of anything I =
can include it.

Thanks

Travis Crook
Visions Beyond

------=_NextPart_000_008F_01C20BE0.E99DADC0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4728.2300" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>Hello everyone,</DIV>
<DIV>&nbsp;&nbsp;&nbsp; I have a firewall configured to forward port 80 =
traffic=20
to an internal machine.&nbsp; I was wondering if the same thing is =
possible with=20
ftp traffic.&nbsp; The rules I am using are as follows:</DIV>
<DIV>&nbsp;</DIV>
<DIV>iptables -A PREROUTING -t nat -i EXTINF -p tcp -d 1.2.3.4 --dport =
21 -j=20
DNAT --to 192.168.2.5:21</DIV>
<DIV>&nbsp;</DIV>
<DIV>iptables -A FORWARD -i EXTINF -p tcp -d 192.168.2.5 --dport 21 =
ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV>iptables -A FORWARD -i EXTINF -o INTIF -p tcp --dport 21 -m state =
--state=20
NEW,ESTABLISHED,RELATED -j ACCEPT</DIV>
<DIV>&nbsp;</DIV>
<DIV>iptables -t nat -A PREROUTING -i EXTINF -p tcp --dport 21 -d =
1.2.3.4 -j=20
DNAT --to-destination 192.168.2.5:21</DIV>
<DIV>&nbsp;</DIV>
<DIV>iptables -t nat -A POSTROUTING -o INTIF -p tcp --dport 21 -d =
192.168.2.5 -j=20
SNAT --to-source 192.168.2.254</DIV>
<DIV>&nbsp;</DIV>
<DIV>I can connect to the ftp server but then I cannot establish a data =
channel=20
between the client and the server. </DIV>
<DIV>&nbsp;</DIV>
<DIV>Any help would be appreciated.&nbsp; If you want to see output of =
anything=20
I can include it.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks</DIV>
<DIV>&nbsp;</DIV>
<DIV>Travis Crook</DIV>
<DIV>Visions Beyond</DIV></BODY></HTML>

------=_NextPart_000_008F_01C20BE0.E99DADC0--


