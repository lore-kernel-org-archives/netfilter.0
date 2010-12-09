From: fuzzy_4711 <fuzzy_4711@gmx.de>
Subject: Re: Need to translate source IP prior to routing for SNMP issue
Date: Thu, 09 Dec 2010 20:20:35 +0100
Message-ID: <4D012C03.3030102@gmx.de>
References: <AANLkTino0xLVHOjpYsgnsdzmztGiiWim6r-W6PkpVErE@mail.gmail.com>
Reply-To: fuzzy_4711@gmx.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTino0xLVHOjpYsgnsdzmztGiiWim6r-W6PkpVErE@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matty Sarro <msarro@gmail.com>
Cc: netfilter@vger.kernel.org

Not sure if that is what you want, but I'll give it a shot, try and pray :-)

I guess you can't change IP address before routing. NAT is allowed in
POSTROUTING first time for a local process, I think. Maybe you can do it
that way:

At the target machine, after the local process (application) has send a
packet, mark the packages before they are routed:

iptables -t mangle -A OUTPUT -o eth0 -p tcp -m tcp --dport
YOUR_SMNP_PORT -j MARK --set-mark snmp

You will be able to handle only these marked packages in a seperate
routing table (YOURTABLE).

edit /etc/iproute2/rt_tables
and add a new table with a lower number there.

Ater that, add a default route to the routing table you like to use:
ip route flush table YOURTABLE
# default route for this table only
ip route add table YOURTABLE default dev MANAGEMENTIF

# all those snmp packages use the new table.
ip rule add fwmark snmp table YOURTABLE
ip route flush cache


Now, all packets which are marked with "snmp" will be routed following
the instructions found in YOURTABLE and leaving via MANAGEMENTIF. If you
need it, you could do natting after that (-t nat -A POSTROUTING).


If you can't get through, you have to
# Disable reverse path filtering
net.ipv4.conf.all.rp_filter = 0
This is a sec feature to avoid ip spoofing.


Take a look here:
http://www.sysresccd.org/Sysresccd-Networking-EN-Destination-port-routing






> The reply
> packet is then routed out the service interface because of the source
> IP. I have numerous packet traces verifying that this is the behavior.
> 
