From: Philipp =?ISO-8859-1?Q?P=E4per?= <piepre@gmx.de>
Subject: nat of all local dns-request to my own server
Date: Sun, 10 Apr 2005 14:48:00 +0200
Message-ID: <1113137280.2857.20.camel@piepre-debian.klo>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

hello,
i am a networkadmin of a small dormitory in germany (FH-Suderburg).
Until now we had 1 server. this server was a
router,webserver,dns,firewall. now we have a second server. both server
are running under debian/sarge. the old server is now only router
+firewall. the problem is that i don't want to tell everyone, that
he/she has to change the dns-server. so i thought, that i can redirect
every dns-request to the new server. my nat-rules for external
connections (http, smtp) are working.

networkplan:

internet
 |
 |
router ---- server (DNS + HTTP + EMail)
 |=20
 |
intranet

router: intern: eth0 - 192.168.112.1, extern: eth1 - 193.x.x.251, dmz:
eth2 - 10.0.0.1
server: eth0: 10.0.0.2

here are the rule i tried the last time:

EXT=3Deht1
EXT_IP=3D193.x.x.251
EXT_NET=3D193.x.x.0/24
DMZ=3Deth2
DMZ_IP=3D10.0.0.1
DMZ_NET=3D10.0.0.1/30 =20
INT=3Deth0
INT_IP=3D192.168.112.1
INT_NET=3D192.168.112.0/24

SERVER_DMZ=3D10.0.0.2

iptables -t nat -A PREROUTING -i $INT -p tcp --dport 53 -j DNAT
--to-destination $SERVER_DMZ
iptables -t nat -A POSTROUTING -o $INT -s $SERVER_DMZ -p tcp --dport 53
-j SNAT --to-source $INT_IP
iptables -A FORWARD -i $INT -m state --state NEW -p tcp -d $SERVER_DMZ
--dport 53 -j ACCEPT
iptables -t nat -A PREROUTING -i $INT -p udp --dport 53 -j DNAT
--to-destination $SERVER_DMZ
iptables -t nat -A POSTROUTING -o $INT -s $SERVER_DMZ -p udp --dport 53
-j SNAT --to-source $INT_IP
iptables -A FORWARD -i $INT -m state --state NEW -p udp -d $SERVER_DMZ
--dport 53 -j ACCEPT

greets
 Philipp P=E4per


