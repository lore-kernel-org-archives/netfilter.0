From: sean darcy <seandarcy2@gmail.com>
Subject: why can't I DNAT SIP?
Date: Wed, 07 May 2008 21:10:53 -0400
Message-ID: <fvtjuu$7i1$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On my outside box I trying to route sip ( port 5060 ) and iax ( 4659 ) 
packets to an internal asterisk server. I use DNAT, which works fine for 
  iax, but doesn't for SIP. I'm using identical DNAT statments.

The log shows the SIP packets coming in, but then going to the INPUT 
chain. Nothing shows up on the FORWARD chain.

iptables -L -n -v -t nat
Chain PREROUTING (policy ACCEPT 168K packets, 17M bytes)
  pkts bytes target     prot opt in     out     source 
destination
     0     0 DNAT       udp  --  external *       0.0.0.0/0 
0.0.0.0/0           udp dpt:4569 to:10.10.10.180:4569
     0     0 DNAT       udp  --  external *       0.0.0.0/0 
0.0.0.0/0           udp dpts:10000:10100 to:10.10.10.180
     0     0 DNAT       udp  --  external *       0.0.0.0/0 
0.0.0.0/0           udp dpt:5060 to:10.10.10.180:5060

Chain POSTROUTING (policy ACCEPT 3098 packets, 298K bytes)
  pkts bytes target     prot opt in     out     source 
destination
     0     0 LOG        udp  --  *      lan     0.0.0.0/0 
0.0.0.0/0           udp dpt:5060 LOG flags 0 level 4 prefix `SIP-POST: '
     5   268 SNAT       all  --  *      external  0.0.0.0/0 
0.0.0.0/0           to:xxx.yyy.zzz.ooo


IPT=/sbin/iptables

# first, flush all chains
/sbin/iptables  -F
/sbin/iptables -t nat -F
$IPT  -t raw -F
/sbin/iptables  -X

# log SIP packets

$IPT -t raw -A PREROUTING -p udp --dport 5060 -s ext-box -j LOG 
--log-prefix "GATEWAY:   "
$IPT  -A FORWARD -p udp --dport 5060 -s ext-box  -j LOG --log-prefix 
"SIP-FWD:    "
$IPT  -A INPUT -p udp --dport 5060 -s ext-box  -j LOG --log-prefix 
"SIP-INPUT:    "
$IPT -t nat -A POSTROUTING -s 76.248.148.160 -p udp --dport 5060  -j LOG 
--log-prefix "SIP-POST: "

##  DNAT iax packets

$IPT -t nat -A PREROUTING -i external -p udp --dport 4569 -j DNAT --to 
10.10.10.180:4569
$IPT -A FORWARD -p udp -m state --state NEW -d 10.10.10.180 --dport 4569 
-j ACCEPT

# this should do the same for sip

$IPT -t nat -A PREROUTING -s ext-box  -p udp --dport 5060 -j DNAT --to 
10.10.10.180:5060
$IPT -A FORWARD -p udp --dport 5060 -m state --state NEW -d 10.10.10.180 
-j ACCEPT

.............

The log shows SIP packets both at GATEWAY and SIP-INPUT.

Any help appreciated.

sean

