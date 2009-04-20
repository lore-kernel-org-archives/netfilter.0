From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: still can't route using fwmark
Date: Mon, 20 Apr 2009 09:38:13 -0600
Message-ID: <op.usoy1zlxx1lyi3@localhost>
References: <op.uskfabufx1lyi3@localhost>
 <20090418082314.GA12566@internet24.de> <op.usld3aqfx1lyi3@localhost>
 <20090418184809.GA15649@internet24.de> <op.uslkl80px1lyi3@localhost>
 <20090418205802.GA16790@internet24.de> <op.uslqwresx1lyi3@localhost>
 <20090419090016.GA19987@internet24.de> <op.usn740lix1lyi3@localhost>
 <1240225752.27336.25.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1240225752.27336.25.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@vger.kernel.org

On Mon, 20 Apr 2009 05:09:12 -0600, Thomas Jacob <jacob@internet24.de> wrote:

> Take a look at the packet traversal graph, outgoing packets from local
> processes do not pass thru PREROUTING, but incoming packets do, that's
> where your markings come from. But in your case, I'm sure you want to
> select a link when the outgoing connection is first established and then
> stay with that link. Selecting a different link with the second packet
> doesn't work with NATed connections, right?
> 
> So you if you want to load balance local packets correctly as well,
> you need to put some rules into OUTPUT. Possibly that's really your
> basic problem here, but I don't have time to think about that at the
> moment.

Thomas, somehow I had the erroneous idea that ALL packets, even those originating at the local machine, go through PREROUTING.  I finally understand now why I need the OUTPUT statements.  As soon as I added those, the load balancing started to work!

There's still one aspect that is not working.  Connections to the Internet initiated from the LAN, which go though PREROUTING (but not through OUTPUT) do not get a reply.  I suspect there is something wrong with the SNAT rules intended to masquerade LAN-connected machines onto the 2 interfaces, but I still have not had time to examine the logs to try to see what is going on.

Here's a copy of my (stripped) iptables script, now load balancing over ppp0 and ppp1 for local process only.

src0=`ip route show dev ppp0 | head -n1 | cut --delimiter=" " --fields=10`
src1=`ip route show dev ppp1 | head -n1 | cut --delimiter=" " --fields=10`
gw0=`ip route show dev ppp0 | head -n1 | cut --delimiter=" " --fields=1`
gw1=`ip route show dev ppp1 | head -n1 | cut --delimiter=" " --fields=1`

iptables -t mangle -N CONNMARK1
iptables -t mangle -A CONNMARK1 -j MARK --set-mark 1
iptables -t mangle -A CONNMARK1 -j CONNMARK --save-mark
iptables -t mangle -A CONNMARK1 -j LOG --log-prefix 'iptables-mark1: ' --log-level info

iptables -t mangle -N CONNMARK2
iptables -t mangle -A CONNMARK2 -j MARK --set-mark 2
iptables -t mangle -A CONNMARK2 -j CONNMARK --save-mark
iptables -t mangle -A CONNMARK2 -j LOG --log-prefix 'iptables-mark2: ' --log-level info

iptables -t mangle -N RESTOREMARK
iptables -t mangle -A RESTOREMARK -j CONNMARK --restore-mark
iptables -t mangle -A RESTOREMARK -j LOG --log-prefix 'restore-mark: ' --log-level info

iptables -t nat -N SNAT1
iptables -t nat -A SNAT1 -j LOG --log-prefix "SNAT $src0: " --log-level info
iptables -t nat -A SNAT1 -j SNAT --to-source $src0

iptables -t nat -N SNAT2
iptables -t nat -A SNAT2 -j LOG --log-prefix "SNAT $src1: " --log-level info
iptables -t nat -A SNAT2 -j SNAT --to-source $src1
#iptables -t nat -A SNAT2 -j LOG --log-prefix "$src1: " --log-level info

# restore the fwmark on packets that belong to an existing connection
# this prerouting stuff would only be for connections initiated on the LAN

iptables -A PREROUTING -i eth0  -t mangle -m state --state ESTABLISHED,RELATED -j RESTOREMARK
iptables -A PREROUTING -i eth0 -t mangle -m mark ! --mark 0 -j RETURN
iptables -A PREROUTING -t mangle -j CONNMARK1
iptables -A PREROUTING -t mangle -m statistic --mode nth --every 2 --packet 0 -j CONNMARK2

# for local process (this has to be a new connection)
iptables -A OUTPUT -t mangle -j CONNMARK1
iptables -A OUTPUT -t mangle -m statistic --mode nth --every 2 --packet 0 -j CONNMARK2

# fox source ip address on packets to match used interface
iptables -t nat -A POSTROUTING -o ppp0 -j SNAT1
iptables -t nat -A POSTROUTING -o ppp1 -j SNAT2
#iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

if ! cat /etc/iproute2/rt_tables | grep -q '^251'
then
	echo '251     rt_link1' >> /etc/iproute2/rt_tables
fi
if ! cat /etc/iproute2/rt_tables | grep -q '^252'
then
	echo '252     rt_link2' >> /etc/iproute2/rt_tables
fi

ip route flush table rt_link1 2>/dev/null
ip route add $gw0 dev ppp0 table rt_link1
ip route add default via $gw0 dev ppp0 table rt_link1

ip route flush table rt_link2 2>/dev/null
ip route add $gw1 dev ppp1 table rt_link2
ip route add default via $gw1 dev ppp1 table rt_link2

if ! ip rule show | grep -q 'rt_link2'
then
	ip rule add fwmark 1 table rt_link1
	ip rule add fwmark 2 table rt_link2
fi
ip route flush cache

Once this is working for LAN I want to try load balancing according the byte count of each interface, if that is possible.
