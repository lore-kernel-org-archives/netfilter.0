From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: port 80 out new ISP
Date: Fri, 19 Aug 2005 17:55:16 +0200
Message-ID: <430600E4.3090004@eccotours.dyndns.org>
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
To: iptables <netfilter@lists.netfilter.org>

Hi all

For a few days now I have been struggling to get my HTTP traffic across my new ISP.

I currently have been reading the following doc.

http://linux-ip.net/html/adv-multi-internet.html

and have changed my scripts accordingly.

But for some reason, it still dont work

my setup is as so

firewall:
eth0 196.36.10.114    -> Routes traffic to old ISP
eth1 192.168.111.10    -> Private Lan
eth2 192.168.10.100    -> for ADSL

Adsl modem:
ipaddress: 192.168.10.200 (external ip dynamically assigned)


## Create the table
ip route flush table TELKOM  >>/dev/null
ip route show table main |grep -Ev ^default\
   | while read ROUTE ; do
     ip route add table TELKOM $ROUTE
  done

## Add the ADSL as route to route table 4

ip route add default via 192.168.10.200 dev eth2 table TELKOM >>/dev/null

## Add the route to table TELKOM

ip rule add fwmark 1 table TELKOM >> /dev/null
gate:~#


$IPT -t nat -A PREROUTING -i eth1 -t mangle -p tcp --dport 80 -j MARK --set-mark 1
$IPT -t nat -A PREROUTING -i eth1 -t mangle -p tcp --dport 443 -j MARK --set-mark 1

# SNAT the Private LAN
$IPT -t nat -A POSTROUTING -o eth0 -s 192.168.111.0/24 -j SNAT --to-source 196.36.10.114
#$IPT -t nat -A POSTROUTING -o eth2 -s 192.168.111.0/24 -j SNAT --to-source 192.168.10.200
$IPT -t nat -A POSTROUTING -o eth2 -s 192.168.111.0/24 -j MASQUERADE


