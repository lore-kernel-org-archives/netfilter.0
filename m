From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: routing
Date: Thu, 22 Jan 2004 19:09:47 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1097.12.76.44.225.1074816587.squirrel@nmibwkrf1.nexusmgmt.com>
References: <810BC538117E9F4E9BB152E0C100DF1F0A4F3F@farmer.vikus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <810BC538117E9F4E9BB152E0C100DF1F0A4F3F@farmer.vikus.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Patrick Ahler <pmahler@vikus.com>
Cc: netfilter@lists.netfilter.org


> I have a router setup to forward 192.168.1.x (private/internal)
> addresses to A.B.C.x (public) addresses and public to private. The x
> variable remains the same.
>
> 192.168.1.x <-- --> eth0 (router/iptables) eth1 <-- --> A.B.C.x
>
> Using the following configuration I have had no luck getting anything to
> forward. (yes I've enabled ip_forward and correctly compiled the
> kernel). If I run a traceroute from a machine outside our network it
> will find the router, but if I traceroute a machine behind the firewall
> (A.B.C.x), the trace will hang just before it gets to my router and then
> won't find my router.
>
> Route:
>
> Route add -net A.B.C.x netmask 255.255.255.255 dev eth1
>
> (also add default gateway and loopback interface)
>
> iptables:
>
> iptables -t nat -A PREROUTING -d A.B.C.x -I eth0 -j DNAT -to 192.168.1.x
>
> iptables -t nat -A POSTROUTING -s 192.168.1.x -I eth0 -j SNAT -to
> A.B.C.x
>
> Thanks,
>
> Patrick A.
>
>
I am a little unclear about what you are doing.  Is the 192.168.1.x
network and indirect route and that is why you are adding the explicit
route entry? If it is directly connected, you do not need the route
statement at all.  If it is indirectly connected, i.e., through another
router, I would suggest routing the entire network rather than the host.

I would also suggest using the NETMAP patch to create a one-to-one mapping
from the private to the public address for a network rather than a series
of individual SNAT/DNAT rules.

Finally, your syntax for the DNAT/SNAT rules seems incorrect unless they
are just typos.  I'm not at a Linux station to check but don't you want:

iptables -t nat -A PREROUTING -d A.B.C.x -i eth1 -j DNAT --to-destination
192.168.1.x

iptables -t nat -A POSTROUTING -s 192.168.1.x -o eth1 -j SNAT --to-source
A.B.C.x

-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


