From: "=?ISO-8859-1?Q? Patrik=20Kar=E9n?=" <patrik.karen@home.se>
Subject: Dropped fin acks (iptables + lvs)
Date: Wed, 24 Jan 2007 16:05:10 +0000
Message-ID: <163461433411784@lycos-europe.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_NextPart_Lycos_117841634614335_ID";
	boundary="=_NextPart_Lycos_117841634614335_ID"
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand this format, some or all of this message may not be legible.

--=_NextPart_Lycos_117841634614335_ID
Content-Type: text/plain; charset="windows-1252"; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi!

I am running iptables and lvs on two boxes loadbalancing http[s] and ssh =
traffic to two real servers.
Everything is working just fine from the users point of view. However, I =
keep seeing a lot of dropped packets of type ack/fin and ack/rst in my ip=
tables log. Seems like the connection tracking isn't working the way I ex=
pect it to. The iptables config in short is:

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD DROP
$IPTABLES -N Firewall-INPUT
$IPTABLES -A INPUT -j Firewall-INPUT
$IPTABLES -A FORWARD -j Firewall-INPUT
#This is the rule that should allow established connections, right?
$IPTABLES -A Firewall-INPUT -m state --state ESTABLISHED,RELATED -j ACCEP=
T
#The next rule allows everything from the inside. Since the above rule do=
esn't seem to work
#all replies from the webservers to the clients will be dropped if this r=
ule is not in place.
$IPTABLES -A Firewall-INPUT -i eth1 -j ACCEPT
$IPTABLES -A Firewall-INPUT -d $VIP1_e -p tcp -m state --state NEW -m tcp=
 --dport 80 -j ACCEPT
$IPTABLES -A Firewall-INPUT -d $VIP1_e -p tcp -m state --state NEW -m tcp=
 --dport 443 -j ACCEPT
$IPTABLES -A Firewall-INPUT -m limit --limit $LOGLIMIT --limit-burst $LOG=
LIMITBURST -j LOG --log-level debug --log-prefix "drop: "
$IPTABLES -A Firewall-INPUT -j DROP

And in the log I get lots this for each user session:=20
Jan 24 16:46:11 10.0.1.107 kernel: drop: IN=3Deth0 OUT=3D MAC=3D00:15:c5:=
ee:48:a7:00:04:de:18:18:00:08:00 SRC=3D<CLIENTIP> DST=3D<$VIP1_e> LEN=3D5=
2 TOS=3D0x00 PREC=3D0x00 TTL=3D49 ID=3D28407 PROTO=3DTCP SPT=3D48404 DPT=3D=
443 WINDOW=3D65535 RES=3D0x00 ACK FIN URGP=3D0

Why? Is there something about the connection tracking I'm not understandi=
ng?
If I do a 'cat /proc/net/ip_conntrack' on the director/fw, shouldn't I se=
e connections between my external VIP and the clients IP? All I see there=
 are connections between the director/fw and my webservers.

Any help is would be much appreciated.

Regards,
Patrik

Om du =E4r singel och vill tr=E4ffa n=E5gon, bes=F6k d=E5 Spray Date! P=E5=
 Spray Date finns det 500 000 glada singlar som bara l=E4ngtar efter att =
tr=E4ffa n=E5gon alldeles speciell. http://spraydate.spray.se/
--=_NextPart_Lycos_117841634614335_ID--



