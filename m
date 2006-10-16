From: Brent Clark <bclark@eccotours.co.za>
Subject: trying different TCP flags for extra protections (probally false
 sense of security)
Date: Mon, 16 Oct 2006 17:29:28 +0200
Message-ID: <4533A558.9090701@eccotours.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hey all

I have added some extra checking for my ruleset. Would anyone care to please overlook them.
The INPUT, FORWARD and OUTPUT is all set to DROP

Ive been googling for examples and reading Oskar Andreasson iptables document, but im still worried that im doing something wrong.

# Limit 12 connections per second (burst to 24)
$IPT -N syn-flood
$IPT -A syn-flood -m limit --limit 12/s --limit-burst 24 -j RETURN
$IPT -A syn-flood -j LOG --log-level info --log-prefix '#### Syn Flood ####'
$IPT -A syn-flood -j DROP

$IPT -N bad_tcp_packets
$IPT -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG --log-prefix "New not syn:"
$IPT -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP
$IPT -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 5/m -j LOG --log-level info --log-prefix '#### Stealth Scan ####'
$IPT -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK,FIN,RST RST -j DROP
$IPT -A bad_tcp_packets -p tcp --tcp-flags ALL FIN,URG,PSH -m limit --limit 5/m -j LOG --log-level info --log-prefix '#### XMAS Scan ####'
$IPT -A bad_tcp_packets -p tcp --tcp-flags ALL FIN,URG,PSH -j DROP
$IPT -A bad_tcp_packets -p tcp --tcp-flags ALL NONE -m limit --limit 5/m -j LOG --log-level info --log-prefix '#### NULL Scan ####'
$IPT -A bad_tcp_packets -p tcp --tcp-flags ALL NONE -j DROP
$IPT -A bad_tcp_packets -p tcp --tcp-flags SYN,RST SYN,RST -m limit --limit 5/m -j LOG --log-level info --log-prefix '#### SYN/RST Scan ####'
$IPT -A bad_tcp_packets -p tcp --tcp-flags SYN,RST SYN,RST -j DROP
$IPT -A bad_tcp_packets -p tcp --tcp-flags SYN,FIN SYN,FIN -m limit --limit 5/m -j LOG --log-level info --log-prefix '#### SYN/FIN Scan ####'
$IPT -A bad_tcp_packets -p tcp --tcp-flags SYN,FIN SYN,FIN -j DROP
$IPT -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK SYN,ACK -m state --state NEW -m limit --limit 5/m -j LOG --log-level info --log-prefix '#### SYN/ACK Scan ####'
$IPT -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK SYN,ACK -m state --state NEW -j REJECT --reject-with tcp-reset

$IPT -t filter -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

# Checking for naughty packets
$IPT -A FORWARD -p tcp --syn -j syn-flood
$IPT -A FORWARD -p tcp -j bad_tcp_packets

$IPT -t filter -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

# Checking for naughty packets
$IPT -A INPUT -p tcp --syn -j syn-flood
$IPT -A INPUT -p tcp -j bad_tcp_packets

Thank you in advance.

Kind Regarda
Brent Clark


