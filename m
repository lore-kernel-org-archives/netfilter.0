From: Ben Skeggs <darktama@iinet.net.au>
Subject: IPv6 state match - possible bug.
Date: Mon, 13 Feb 2006 23:54:38 +1100
Message-ID: <1139835278.26079.7.camel@araqiel.keine.ath.cx>
Reply-To: darktama@iinet.net.au
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-Gr00GaDDwQGluMJ5aTMs"
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


--=-Gr00GaDDwQGluMJ5aTMs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

I'm not sure if this is a bug, or something I'm doing incorrectly.

With the (attached) ruleset, I am able to receive ICMPv6 echo replies
correctly but any other type of connection fails.  The SYN+ACK reply
appears to get dropped by netfilter.

IP6-IN: IN=eth0 OUT= MAC=00:0f:ea:70:eb:f9:00:50:8d:e3:b5:89:86:dd
SRC=2001:0200:0000:8002:0203:47ff:fea5:3085
DST=2001:0388:c17d:0000:020f:eaff:fe70:ebf9 LEN=80 TC=0 HOPLIMIT=56
FLOWLBL=1295 PROTO=TCP SPT=80 DPT=33215 WINDOW=57344 RES=0x00 ACK SYN
URGP=0

The above is from trying to "wget -6 www.kame.net".

araqiel ~ # gzcat /proc/config.gz | grep -E "NF_CO|STATE"
CONFIG_NF_CONNTRACK=y
# CONFIG_NF_CONNTRACK_MARK is not set
CONFIG_NF_CONNTRACK_EVENTS=y
CONFIG_NF_CONNTRACK_FTP=y
CONFIG_NETFILTER_XT_MATCH_STATE=y
CONFIG_NF_CONNTRACK_IPV4=y
# CONFIG_IP_NF_CONNTRACK is not set
CONFIG_NF_CONNTRACK_IPV6=y

Does the above config seem okay?

Thanks in advance,
Ben Skeggs.

--=-Gr00GaDDwQGluMJ5aTMs
Content-Description: 
Content-Disposition: inline; filename=ip6tables_rules.txt
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Chain INPUT (policy DROP 821 packets, 66160 bytes)
 pkts bytes target     prot opt in     out     source               destination         
   44  3648 ACCEPT     all      lo     any     anywhere             anywhere           
 195K   70M allow-in   all      any    any     anywhere             anywhere           
  850 68504 LOG        all      any    any     anywhere             anywhere           limit: avg 10/min burst 5 LOG level warning prefix `IP6-IN: ' 

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 LOG        all      any    any     anywhere             anywhere           limit: avg 10/min burst 5 LOG level warning prefix `IP6-FW: ' 

Chain OUTPUT (policy DROP 20 packets, 5116 bytes)
 pkts bytes target     prot opt in     out     source               destination         
   44  3648 ACCEPT     all      any    lo      anywhere             anywhere           
 181K   20M allow-out  all      any    any     anywhere             anywhere           
    0     0 LOG        all      any    any     anywhere             anywhere           limit: avg 10/min burst 5 LOG level warning prefix `IP6-OU: ' 

Chain allow-fwd (0 references)
 pkts bytes target     prot opt in     out     source               destination         

Chain allow-in (1 references)
 pkts bytes target     prot opt in     out     source               destination         
 190K   70M ACCEPT     all      eth0   any     2001:388:c17d::/64   anywhere           
   37  3992 ACCEPT     all      any    any     anywhere             anywhere           state RELATED,ESTABLISHED 
 3804  295K ACCEPT     all      any    any     fe80::/10            anywhere           

Chain allow-out (1 references)
 pkts bytes target     prot opt in     out     source               destination         
 181K   20M ACCEPT     all      any    any     anywhere             anywhere           

--=-Gr00GaDDwQGluMJ5aTMs--

