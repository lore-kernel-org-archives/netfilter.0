From: "DELORT Stephane" <Stephane.DELORT@murex.com>
Subject: state ESTABLISHED,RELATED ignored within a bridge
Date: Thu, 5 Jan 2006 17:02:39 +0100
Message-ID: <200601051604.k05G4ATB028462@zig.murex.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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


 Hello all,

 when I use a rule :
   $IPTABLES -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
   $IPTABLES -A INPUT -j DROP

 The server cannot ping or telnet any other host !=20
=20
 My interfaces config :
   ifconfig eth0 0.0.0.0 promisc
   ifconfig eth1 0.0.0.0 promisc
   brctl addbr br0
   brctl addif br0 eth0
   brctl addif br0 eth1
   ifconfig br0 10.0.0.8 netmask 255.255.240.0 up
=20
 Firewall rules :
   echo "1" > /proc/sys/net/ipv4/ip_forward
   IPTABLES=3D'/sbin/iptables'
   $IPTABLES -F
   $IPTABLES -X
   $IPTABLES -A INPUT -p tcp -d 10.0.0.8 --dport 22 -j ACCEPT
   $IPTABLES -A INPUT -d 10.0.0.8   -m state --state RELATED,ESTABLISHED =
-j ACCEPT
(1) $IPTABLES -A INPUT -d 10.0.0.8   -m state --state INVALID -j DROP=20
(2) $IPTABLES -A INPUT  -j DROP  =20

 This machine is to be a bridge shaping traffic.
 It does its job OK  but if I include the line (1) or (2) the machine =
cannot contact anyother !
=20
 I did :  $IPTABLES -A INPUT -i lo -j ACCEPT
 and even : $IPTABLES -A INPUT -s 10.0.0.8 -j ACCEPT
 But not to avail.
=20
 I guess something is going wrong with the DROP instruction.
=20
 My config is a Fedora Core 4 with kernel version 2.6.11-1.1369_FC4. =
Iptables version : 1.3.0
 This script used to work fine with an old redhat, kernel was 2.4.18.
=20
 Is there a patch to apply to the kernel ? Is this a known bug ?=20
 I saw some already have this knid of problem but I did not found any =
answer.
=20
=20
 Thanks in advance,
 St=E9phane



=20
=20

