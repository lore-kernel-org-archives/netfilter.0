From: Mattia Martinello <liste@mattiamartinello.com>
Subject: Re: Transparent gateway
Date: Thu, 18 Nov 2004 14:56:29 +0100
Message-ID: <419CAA0D.8090400@mattiamartinello.com>
References: <419C7FE2.8060002@mattiamartinello.com>
	<1100785310.3848.20.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1100785310.3848.20.camel@hubcap.ljm.dom>
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
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

> why?

Beacuse I want to call from my LAN the server using its public IP address.

> because you told it to...

Can't I solve this problem?

> don't NAT traffic from your LAN to your DMZ.  if clients inside the LAN
> are requesting the public IP of the DMZ server and not it's actual DMZ
> IP, you'll need something along the lines of:

See above... I always want to call the server using its public IP address.

> other than that--you haven't provided near enough information to answer
> your questions (hint:  post your rules [1])

This is my simple script:


#!/bin/sh

modprobe iptable_nat
echo 1 > /proc/sys/net/ipv4/ip_forward
echo 0 > /proc/sys/net/ipv4/conf/all/rp_filter

iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD
iptables -t nat -F POSTROUTING
iptables -t nat -F PREROUTING
iptables -t nat -F OUTPUT

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -t nat -P POSTROUTING ACCEPT
iptables -t nat -P PREROUTING ACCEPT
iptables -t nat -P OUTPUT ACCEPT

iptables -t nat -A POSTROUTING -s 192.168.1.0/255.255.255.0 -o ppp0 -j 
MASQUERADE
iptables -t nat -A POSTROUTING -s 192.168.1.0/255.255.255.0 -o eth0 -j 
MASQUERADE
iptables -t nat -A POSTROUTING -s 192.168.1.0/255.255.255.0 -o eth2 -j 
MASQUERADE
iptables -t nat -A POSTROUTING -s 192.168.2.0/255.255.255.0 -o ppp0 -j 
MASQUERADE

iptables -t nat -A PREROUTING -s 0.0.0.0/0 -d $EXTERNAL_IP -j DNAT --to 
192.168.2.99



So all trafic to the external server IP seems to come from 
192.168.2.254. How I can avoid this?

Thank you very much!
Bye
Mattia.


