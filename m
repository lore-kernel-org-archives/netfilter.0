From: Alexey Sheshka <pulsar@bofh.homeunix.org>
Subject: pptp + iptables
Date: Fri, 13 Sep 2002 17:35:29 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020913173529.41af8435.pulsar@bofh.homeunix.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi !

I have folowing troble.
Then I'm connecting to pptp server (195.x.x.34)  from Windows2000 box (192.168.15.132) pptp connection dies 
with error message : "The specified port is not connected."
I think this is netfilter problem.

My NAT box has :
iptables v1.2.7a
stock 2.4.19 kernel from ftp.kernel.org with latest patch-o-matic
ip_conntrack_pptp ip_nat_pptp ip_conntrack_proto_gre iptable_nat    propertly loaded

My NAT script:

#!/bin/bash
echo 0 > /proc/sys/net/ipv4/ip_forward
ipt=/usr/local/sbin/iptables
$ipt -p tcp -A PREROUTING -t nat -s 192.168.15.0/24 -d 0/0 --dport 80 -j DNAT --to 212.x.x.170:3128
$ipt -p tcp -A POSTROUTING -t nat -s 192.168.15.0/24 -d 0/0 --dport ! 80 -j SNAT --to 212.x.x.170
echo 1 > /proc/sys/net/ipv4/ip_forward

