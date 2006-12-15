From: Mike Williams <mike@v6.gaima.co.uk>
Subject: Re: problem with (incorrectly?) INVALID packets
Date: Fri, 15 Dec 2006 11:34:35 +0000
Message-ID: <200612151134.35827.mike@v6.gaima.co.uk>
References: <200612121942.19276.mike@v6.gaima.co.uk>
	<200612131239.35043.mike@v6.gaima.co.uk>
	<45808C72.7060404@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45808C72.7060404@riverviewtech.net>
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
To: netfilter@lists.netfilter.org

On Wednesday 13 December 2006 23:27, Grant Taylor wrote:
> How can a system on the 90.1 network use a default gateway on the 81.1
> network?  IMHO the two can not communicate with out some intermediary
> gateway.

You are indeed right, LFW which has only 90.1 IPs cannot talk to the SDSL 
router at 81...49, this is the purpose of the machine called "bridge" it is 
the intermediary, and why br2 on bridge has a 90 and 81 IP address, so it can 
route to both networks.

> So, br2 on bridge has multiple IPs assigned to it, 81.1 and 90.1?

Yep. It is the place the SDSL router routes 90.../27 to, it's also the default 
gateway for anything purely on 90.../27, as they can't reach the SDSL router 
directly.
It's not pretty, but it works kinda, and it's only a temporary thing to get 
this new system tested before rollout.

> Likewise, br0 on LFW has multiple 90.1 IPs assigned to it?

Yep. LFW is the hardware our production systems will be behind. It's purpose 
is to NAT things from public IPs to the private IPs the servers have behind 
it (lots of SSL webserving).
(LFW is also a HA failover pair, each with their own unique 90.1 address)

> > I'd love some suggestions on how to make it right :)
>
> Think basic routing.  Put a route to your 90.1 network via the 81.1.7.59
> router on your 81.1.7.49 router.  This will allow simple packets pass
> back and forth presuming that there is no firewalling in the way.

The SDSL router has that.

> If you don't want to put a route, you will need to NAT your 90.1 network
> to appear to be from an 81.1 IP address.

Unfortunantly if it were that simple, I'd just put all this new kit on our 
0.0/24 internal network.

> Ok...  Is the "... from here to there ..." that you are speaking about
> based on interface, or IP address, or both interface and IP address?

IP addresses only.

> > Hmm, which suggests they aren't being tracked properly... And after some
> > investigation traffic going to any of the VPN networks from 136.0/24
> > aren't being conntrack'd, whereas on the other firewalls I run they are
> > (i.e. the VPN between 0.0/24 and 30.0/24). Is there any peculiar about
> > conntrack'ing packets over/out a bridge?
>
> Not per say if you are using the bridge virtual interface as a network
> interface.  If you are using the bridge as a bridge and passing the
> packets through it, you may have something in place that will block it.
>   See my post with a subject of "A word about bridging to the wise...".

It was being used as a network interface, traffic was being routed out of it. 
Traffic to the internet got SNATd, traffic to other VPN networks allowed to 
pass without modification.

Routing table now:
# route -n 
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
90.1...1.64    0.0.0.0         255.255.255.224 U     0      0        0 bond0
192.168.131.0   0.0.0.0         255.255.255.0   U     0      0        0 bond1
192.168.22.0    90.1...1.69    255.255.255.0   UG    0      0        0 bond0
192.168.128.0   0.0.0.0         255.255.255.0   U     0      0        0 bond3
192.168.0.0     90.1...1.69    255.255.255.0   UG    0      0        0 bond0
192.168.30.0    90.1...1.69    255.255.255.0   UG    0      0        0 bond0
192.168.136.0   0.0.0.0         255.255.255.0   U     0      0        0 bond2
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 lo
0.0.0.0         90.1...1.69    0.0.0.0         UG    0      0        0 bond0

Routing table previously:
# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
90.1...1.64    0.0.0.0         255.255.255.224 U     0      0        0 br0
192.168.131.0   0.0.0.0         255.255.255.0   U     0      0        0 bond1
192.168.22.0    90.1...1.69    255.255.255.0   UG    0      0        0 br0
192.168.128.0   0.0.0.0         255.255.255.0   U     0      0        0 bond3
192.168.0.0     90.1...1.69    255.255.255.0   UG    0      0        0 br0
192.168.30.0    90.1...1.69    255.255.255.0   UG    0      0        0 br0
192.168.136.0   0.0.0.0         255.255.255.0   U     0      0        0 bond2
127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 lo
0.0.0.0         90.1...1.69    0.0.0.0         UG    1000   0        0 br0

# uname -r
2.6.17-hardened-r1
# zgrep BRIDGE_NETFILTER /proc/config.gz
CONFIG_BRIDGE_NETFILTER=y

-- 
Mike Williams

