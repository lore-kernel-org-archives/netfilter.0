From: Curby <curby@cur.by>
Subject: Port Knocking with default hooks/modules
Date: Sun, 16 May 2010 18:09:38 -0600
Message-ID: <AANLkTikI4u4ZXG6jxCGYj-Ig5HLc47mF7Mey9sHh9tNu@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello, I want to implement port knocking on a dual-homed router.
After the router receives the correct knocking sequence, it will allow
SSH connections to be forwarded into the internal SSH server.  While I
can see the knocking sequence work, the actual SSH attempt never goes
through.  Below are the relevant rules from iptables-save complete
with counters showing that everything works besides the last step,
which doesn't match.  Can you see what's wrong?

*filter
:PortKnock - [0:0]
:PortKnock-1 - [0:0]
:PortKnock-2 - [0:0]
[3:180] -A INPUT -p tcp -j PortKnock
[0:0] -A FORWARD -i eth0 -o eth1 -p tcp -m tcp --dport 2141 -m recent
--rcheck --seconds 5 --name OpenDoor --rsource -m hashlimit
--hashlimit-upto 1/min --hashlimit-burst 1 --hashlimit-mode srcip
--hashlimit-name ssh2 --hashlimit-htable-gcinterval
6000--hashlimit-htable-expire 60000 -j ACCEPT
[6:360] -A FORWARD -i eth0 -o eth1 -p tcp -m multiport --dports 2141
-m limit --limit 6/min --limit-burst 20 -j LOG
[6:360] -A FORWARD -i eth0 -o eth1 -p tcp -m multiport --dports 2141 -j DROP
[1:60] -A PortKnock -m recent --rcheck --seconds 2 --name Knock2
--rsource -j PortKnock-2
[1:60] -A PortKnock -m recent --rcheck --seconds 2 --name Knock1
--rsource -j PortKnock-1
[1:60] -A PortKnock -p tcp -m tcp --dport 1001 -m recent --set --name
Knock1 --rsource
[1:60] -A PortKnock-1 -m recent --remove --name Knock1 --rsource
[1:60] -A PortKnock-1 -p tcp -m tcp --dport 2002 -m recent --set
--name Knock2 --rsource
[1:60] -A PortKnock-2 -m recent --remove --name Knock2 --rsource
[1:60] -A PortKnock-2 -p tcp -m tcp --dport 3003 -m recent --set
--name OpenDoor --rsource

*nat
[6:360] -A PREROUTING -i eth0 -p tcp -m tcp --dport 2141 -j DNAT
--to-destination 192.168.0.10

I could post the full ruleset if it would help, but hopefully there's
enough here to debug.  The PREROUTING/FORWARD rules show that
connection attempts are coming in and getting NAT-ed, but they aren't
matching the ACCEPT rule.  Any ideas?  Thanks!

I find it interesting that searching the archives for port knocking
doesn't bring up anything more recent than 2008.  Going mildly off
topic, is port knocking now considered an ill-advised solution for
obscuring an oft-attacked service from view?  If so, why?

--Mike
