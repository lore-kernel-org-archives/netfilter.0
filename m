From: Moritz Gartenmeister <moritz@uplink-verein.ch>
Subject: l7 -> drop & ip_conntrack entries
Date: Sat, 11 Sep 2004 14:02:16 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4142E948.8080300@uplink-verein.ch>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

hi

i finally get my firewall running. everything looks fine except some
entries in /proc/net/ip_conntrack.

i drop traffic with the layer7-module, this really works (as good as the
patterns are), but i would like to have a explanation for the following
entries:

tcp      6 360854 ESTABLISHED src=172.17.1.228 dst=172.190.199.166
sport=3286 dport=6883 src=172.190.199.166 dst=172.17.1.228 sport=6883
dport=3286 [ASSURED] use=1 l7proto=bittorrent
tcp      6 360929 ESTABLISHED src=172.17.4.145 dst=80.57.81.246
sport=3394 dport=9349 src=80.57.81.246 dst=172.17.4.145 sport=9349
dport=3394 [ASSURED] use=1 l7proto=bittorrent
tcp      6 452 ESTABLISHED src=172.17.1.86 dst=82.209.161.244 sport=1031
dport=6881 src=82.209.161.244 dst=172.17.1.86 sport=6881 dport=1031
[ASSURED] use=1 l7proto=bittorrent
tcp      6 83 ESTABLISHED src=172.17.1.248 dst=209.89.224.41 sport=1098
dport=6881 src=209.89.224.41 dst=172.17.1.248 sport=6881 dport=1098
[ASSURED] use=1 l7proto=bittorrent
tcp      6 154 ESTABLISHED src=172.17.1.86 dst=80.172.12.253 sport=4588
dport=6881 src=80.172.12.253 dst=172.17.1.86 sport=6881 dport=4588
[ASSURED] use=1 l7proto=bittorrent
udp      17 32 src=172.17.0.4 dst=172.17.1.4 sport=3524 dport=161
src=172.17.1.4 dst=172.17.0.4 sport=161 dport=3524 [ASSURED] use=1
tcp      6 112 SYN_SENT src=172.17.4.145 dst=61.10.249.13 sport=1697
dport=6881 [UNREPLIED] src=61.10.249.13 dst=172.17.4.145 sport=6881
dport=1697 use=1
tcp      6 561 ESTABLISHED src=172.17.9.135 dst=68.144.176.36 sport=4945
dport=3610 src=68.144.176.36 dst=172.17.9.135 sport=3610 dport=4945
[ASSURED] use=1
tcp      6 360 ESTABLISHED src=172.17.4.145 dst=218.186.116.106
sport=1419 dport=6884 src=218.186.116.106 dst=172.17.4.145 sport=6884
dport=1419 [ASSURED] use=1 l7proto=bittorrent
tcp      6 106 SYN_SENT src=172.17.1.121 dst=172.188.203.238 sport=3024
dport=2020 [UNREPLIED] src=172.188.203.238 dst=172.17.1.121 sport=2020
dport=3024 use=1
tcp      6 583 ESTABLISHED src=172.17.4.145 dst=84.97.64.38 sport=1620
dport=6882 src=84.97.64.38 dst=172.17.4.145 sport=6882 dport=1620
[ASSURED] use=1 l7proto=bittorrent
tcp      6 4 CLOSE_WAIT src=172.17.1.86 dst=63.227.245.174 sport=1082
dport=6881 src=63.227.245.174 dst=172.17.1.86 sport=6881 dport=1082
[ASSURED] use=1 l7proto=bittorrent

Why are there still connections tracked, although i drop the packets
with iptables in prerouting mangle?
iptables recognizes this connections as bittorrent, why are they not
droped? Why do they get a ASSURED and ESTABLISHED connection?
And BTW: does this mean, that there is actually bittorrent traffic?
And i rebooted my system, checked the /proc/net/ip_conntrack (didn't
exist), set up the bridge, set up iptables, pluged in the ethernetcables.

thanks for some light...
moritz



