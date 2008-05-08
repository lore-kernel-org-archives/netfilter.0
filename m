From: Geoff Crompton <geoffc@trinity.unimelb.edu.au>
Subject: ip rule fwmarks letting me down
Date: Thu, 08 May 2008 15:58:22 +1000
Message-ID: <4822967E.8030407@trinity.unimelb.edu.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I'm having problems using fwmarks in my routing policy database, and I'm
not sure why they are not working. We've got two internet uplinks, and
we like to use our internode (our ISP) link for some of our traffic. So
I've got an ip rule output like this:

$ ip rule list
0:      from all lookup 255
32765:  from all fwmark 0x2 lookup internode
32766:  from all lookup main
32767:  from all lookup default

$ ip route list table internode
default via 203.28.240.92 dev vlan9
$ ip route list table main | grep default
default via 203.28.240.91 dev vlan9

To isolate and test this bug, I have done:
# iptables -t mangle -N test-marks
# iptables -t mangle -A test-marks -j MARK --set-mark 0x02
# iptables -t mangle -I PREROUTING 1 -d 192.231.203.132 -j test-marks

Of course if I wanted to affect routing for -d 192.231.203.132 it would
be much easier to do that as a normal routing command. But I need to get
fwmark working, because we use it for other types of traffic.

So when I ping from a machine behind this firewall, it should be routed
via 203.28.240.92, but it isn't. I've been running tcpdump on both
203.28.240.92 and 203.28.240.91, and the packets are definately being
routed via 203.28.240.91.

I'm sure the packets are getting marked. After doing some pinging from a
PC behind the firewall:
# iptables-save -c | grep test-marks
:test-marks - [0:0]
[4:336] -A PREROUTING -d 192.231.203.132 -j test-marks
[4:336] -A test-marks -j MARK --set-mark 0x2

Can anyone please suggest what I've done wrong, or gotchas to watch out
for that I could go and check?

-- 
+-Geoff Crompton
+--Debian System Administrator
+---Trinity College
