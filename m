From: Gary Renshaw <gary@trilunar.ca>
Subject: SNAT spoofing problem
Date: Wed, 07 May 2008 11:56:07 -0600
Message-ID: <4821ED37.3020201@trilunar.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Greetings,

I am trying to get a host to reject pings with an ICMP host-unreachable 
message so that it looks like the host doesn't exist.  This is easy and 
works nicely.

The problem is that I'd like to use SNAT to spoof the source address so 
that the ICMP looks like it is coming from the network's gateway, not 
the stealthy host.  This isn't working the way I expected.

I've set up a very simple test rig for this.

192.168.1.1 (GATEWAY) <-----> 192.168.1.2 (STEALTH)
                          |
                          \--> 192.168.1.3 (WORKSTATION)

The stealth host is running a very simple "firewall" whose only purpose 
is to block pings and respond with a host-unreachable alleging to be 
from the gateway:

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -F -t nat
iptables -F -t filter
iptables -X

iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

iptables -A OUTPUT -o eth0 -j ACCEPT

iptables -t nat -A POSTROUTING -o eth0 -p icmp --icmp-type \ 
host-unreachable -j SNAT --to 192.168.1.1

iptables -A INPUT -i eth0 -p icmp --icmp-type echo-request \
-j REJECT --reject-with icmp-host-unreachable

iptables -A INPUT -i eth0 -p all -j ACCEPT

 From STEALTH I can ping anywhere (good).  From WORKSTATION I can ping 
anywhere except STEALTH which returns "host unreachable" (good) BUT the 
message is reported as coming from 192.168.1.2 (bad).  I've looked at 
the packets in detail using wireshark and they really do say that they 
are coming from STEALTH instead of GATEWAY.

It looks like the SNAT is doing nothing at all.  What am I missing?

Thanks,
Gary
-- 
==============================================
Trilunar Consulting    http://www.trilunar.ca/
==============================================
