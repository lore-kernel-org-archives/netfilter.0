From: "Juan Santamaria" <juansh28@hotmail.com>
Subject: =?iso-8859-1?q?Using_default_policy_drop_in_FORWARD_chain=B4s?=
Date: Tue, 21 Mar 2006 14:59:55 +0000
Message-ID: <BAY116-F11578E646F01D1A39B8C4DCED80@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hello Guys

Nowdays, I =B4ve been working  in a firewall configuration. I want use defa=
ult=20
policy DROP, for the INPUT,FORWARD,OUTPUT chain=B4s.  I using the redwall=20
firewall, it has support for l7-protocols. I need to block msn, but when I =

apply the ruler to the forward chain it isn=B4t block.

But when y change de default policy in Forward chain=B4s  to ACCEPT, tha sa=
me=20
ruler block the msn traffic.

I appreciate some advices

Cheerio!

IPTABLES=3D/sbin/iptables

$IPTABLES -F
$IPTABLES -t nat -F
$IPTABLES -X
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP


$IPTABLES  -A FORWARD -p tcp -m tcp -m layer7 --l7proto msnmessenger
-j DROP




$IPTABLES -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type destination-unreachable -j ACCEPT
$IPTABLES -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
$IPTABLES -A OUTPUT -p icmp --icmp-type echo-reply -j ACCEPT
$IPTABLES -A OUTPUT -p icmp --icmp-type destination-unreachable -j ACCEPT
$IPTABLES -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT

#$IPTABLES -A FORWARD -s 10.0.109.20 -j DROP

$IPTABLES -A INPUT   -i eth2 -p tcp -m tcp --dport 22 -j ACCEPT
$IPTABLES -A OUTPUT  -o eth2 -p tcp -m tcp --sport 22 -m state --state=20
RELATED,ESTABLISHED -j ACCEPT



$IPTABLES -A FORWARD -p tcp -m tcp --sport 80 -j ACCEPT
$IPTABLES -A FORWARD -p tcp -m tcp --dport 80 -j ACCEPT

$IPTABLES -A FORWARD -p tcp -m tcp --sport 80 -m layer7 --l7proto=20
msnmessenger -j DROP
$IPTABLES -A FORWARD -p tcp -m tcp --dport 80 -m layer7 --l7proto=20
msnmessenger -j DROP
$IPTABLES -A FORWARD -p tcp -m tcp --sport 443 -j ACCEPT
$IPTABLES -A FORWARD -p tcp -m tcp --dport 443 -j ACCEPT

$IPTABLES -A FORWARD -p udp -m udp --sport 53 -j ACCEPT
$IPTABLES -A FORWARD -p udp -m udp --dport 53 -j ACCEPT



