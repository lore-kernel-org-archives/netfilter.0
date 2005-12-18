From: Dwayne Hottinger <dhottinger@harrisonburg.k12.va.us>
Subject: blocking ipaddresses
Date: Sun, 18 Dec 2005 08:50:19 -0500
Message-ID: <1134913819.99ab56762176f@webmail.harrisonburg.k12.va.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Sirs,
I have the following in my firewall script:
#!/bin/sh
#########################################
# Script created using EasyTables v0.6
# by Roi Dayan
#########################################
printf "."
IPC=/sbin/iptables

SERVERS=eth1
L3=eth2
IF=eth3

SNAT_ADDRESS=some public ip
SNAT_PM=some public ip
PROXY_IP=some public ip

# Networks:

TEN_NET=10.0.0.0/8
CO_NET=another public ip/24

## Set up routing table
ip route add 10.40.0.0/16       via 10.10.220.2
ip route add 10.140.0.0/16      via 10.10.220.2
ip route add 10.41.0.0/16       via 10.10.220.2
ip route add 10.43.0.0/16       via 10.10.220.2
ip route add 10.44.0.0/16       via 10.10.220.2
ip route add 10.45.0.0/16       via 10.10.220.2
ip route add 10.46.0.0/16       via 10.10.220.2
ip route add 10.47.0.0/16       via 10.10.220.2
ip route add 10.10.221.0/24    via 10.10.220.2
ip route add 10.10.230.0/24     via 10.10.220.2
ip route add another public ip/24    via 10.10.220.2
ip route add some public ip/27  via 10.10.220.2
ip route add internal public ip/27  via 10.10.220.2
###load balancing for 2nd t1
ip rule del from public ip table portmaster
ip rule add from public ip table portmaster
ip route add default via public ip dev eth4 table portmaster

A bunch of rules for custom chains

###blocking proxify.com##############################
$IPC -t nat -A PREROUTING -p tcp -d 67.15.77.223 -j DROP
$IPC -t nat -A PREROUTING -p tcp -d 67.15.77.221 -j DROP
$IPC -t nat -A PREROUTING -p tcp -d 67.15.77.222 -j DROP
$IPC -t nat -A PREROUTING -p tcp -d 67.15.77.224 -j DROP
$IPC -t nat -A PREROUTING -p tcp -d 70.84.56.168 -j DROP
$IPC -t nat -A PREROUTING -p tcp -d 70.84.56.186 -j DROP
$IPC -t nat -A PREROUTING -p tcp -d 70.85.195.224 -j DROP
$IPC -t nat -A PREROUTING -p tcp -d 70.85.195.236 -j DROP
$IPC -t nat -A PREROUTING -p tcp -d 66.98.130.231 -j DROP
$IPC -t nat -A PREROUTING -p tcp -d 66.98.130.235 -j DROP
$IPC -t nat -A PREROUTING -p tcp -d 66.98.131.102 -j DROP
$IPC -t nat -A PREROUTING -p tcp -d 66.98.131.103 -j DROP

My question is, is there a better way to block the proxify.com addresses I would
like to block them completely.  I also have quite a few spyware sites listed
like the proxify.  Using iptables V1.2.9 with custom kernel.  Box has 4
ethernet interfaces.


thanks,
ddh


--
Dwayne Hottinger
Network Administrator
Harrisonburg City Public Schools

