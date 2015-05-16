From: Yan Seiner <yan@seiner.com>
Subject: iptables + tc help
Date: Sat, 16 May 2015 07:49:24 -0700
Message-ID: <555758F4.7010507@seiner.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I've been trying to get a fairly simple setup working with inbound 
throtting, and I am failing miserably.

I've followed various HOWTOs and tried a bunch of things and none of 
them result in throttling on the inbound interface.

I have 3 internal networks, auth, tenant, and guest.  I have 3 classes, 
one for each of my networks.  I want to limit the incoming bandwidth 
based on the originating subnet.

The commands below result in traffic through the ifb0 interface, but 
apparently my iptables commands aren't marking the packets correctly.

tc shows no traffic through the classes:

root@AP1:/# tc -s class show dev ifb0
class htb 3:3 root rate 200Kbit ceil 200Kbit burst 1600b cburst 1600b
  Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
  rate 0bit 0pps backlog 0b 0p requeues 0
  lended: 0 borrowed: 0 giants: 0
  tokens: 1000000 ctokens: 1000000

class htb 3:36 parent 3:3 prio 0 rate 30Kbit ceil 30Kbit burst 1599b 
cburst 1599b
  Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
  rate 0bit 0pps backlog 0b 0p requeues 0
  lended: 0 borrowed: 0 giants: 0
  tokens: 6666656 ctokens: 6666656

class htb 3:35 parent 3:3 prio 0 rate 40Kbit ceil 40Kbit burst 1600b 
cburst 1600b
  Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
  rate 0bit 0pps backlog 0b 0p requeues 0
  lended: 0 borrowed: 0 giants: 0
  tokens: 5000000 ctokens: 5000000

class htb 3:34 parent 3:3 prio 0 rate 150Kbit ceil 150Kbit burst 1599b 
cburst 1599b
  Sent 0 bytes 0 pkt (dropped 0, overlimits 0 requeues 0)
  rate 0bit 0pps backlog 0b 0p requeues 0
  lended: 0 borrowed: 0 giants: 0
  tokens: 1333328 ctokens: 1333328

But it shows traffic through the ifb0 interface

root@AP1:/# tc -s qdisc show dev ifb0
qdisc htb 3: root refcnt 2 r2q 10 default 30 direct_packets_stat 10168 
direct_qlen 32
  Sent 13785454 bytes 11825 pkt (dropped 0, overlimits 0 requeues 0)
  backlog 0b 0p requeues 0


Here's my latest attempt:

iptables -A INPUT -i lo -j ACCEPT

# general rules

# HTB classes on IFB with rate limiting
tc qdisc add dev ifb0 root handle 3: htb default 30
tc class add dev ifb0 parent 3: classid 3:3 htb rate 200kbit
tc class add dev ifb0 parent 3:3 classid 3:34 htb rate 150kbit
tc class add dev ifb0 parent 3:3 classid 3:35 htb rate 40kbit
tc class add dev ifb0 parent 3:3 classid 3:36 htb rate 30kbit

tc filter add dev ifb0 parent 3:0 protocol ip handle 4 fw flowid 3:34
tc filter add dev ifb0 parent 3:0 protocol ip handle 5 fw flowid 3:35
tc filter add dev ifb0 parent 3:0 protocol ip handle 6 fw flowid 3:36

iptables -t mangle -A FORWARD -j QOS
iptables -t mangle -A QOS -j CONNMARK --restore-mark
iptables -A QOS -s $auth -t mangle -j MARK --set-mark 4
iptables -A QOS -s $guest -t mangle -j MARK --set-mark 5
iptables -A QOS -s $tenant -t mangle -j MARK --set-mark 6
iptables -t mangle -A QOS -j CONNMARK --save-mark

tc qdisc add dev ${outside_if} ingress handle ffff:
tc filter add dev ${outside_if} parent ffff: protocol ip u32 match u32 0 
0 action mirred egress redirect dev ifb0 flowid ffff:1

iptables -t nat -A POSTROUTING -o $outside_if -j MASQUERADE
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

iptables -A FORWARD -i $outside_if -o $auth_if -m state --state 
ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $outside_if -o $tenant_if -m state --state 
ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $auth_if -o $outside_if -j ACCEPT
iptables -A FORWARD -i $tenant_if -o $outside_if -j ACCEPT
