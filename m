From: Jason Opperisano <opie@817west.com>
Subject: RE: Access to two identical subnets
Date: Wed, 01 Sep 2004 15:44:51 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094067891.1824.77.camel@wolfpack.ljm.dom>
References: <9F6B4CE6934BDF4BB50BCF2491C9F69001A4F7@CSMAIL.client.no>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9F6B4CE6934BDF4BB50BCF2491C9F69001A4F7@CSMAIL.client.no>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 2004-09-01 at 02:53, Andreas Granheim wrote:
> Hello, sorry for the spaghetti ASCII, here you maybe have a better
> overview.
> 
>   _____________________________192.168.1.0
>     |                       |
>     |----------------------FW
>     |                       |
>  10.50.50.0             10.100.50.0
>     |                       |
>  ROUTER                 IPTables FW
>     |                       |
>     |                   10.50.50.0
>     |                       |
>  10.50.50.0                VPN1
>                             |  
>                            VPN2
>                             |------------- 10.50.50.0
> 
> 
> When I ping from the IPTables FW I get reply. This means that the packet
> makes it way from the 10.100.6.3 and back. 

are you positive you're getting a reply from the 10.50.50.x machine you
think you're getting a response from?

> It's just the IPTables FW and the VPN1 box that stands on the 10.100.6.0
> net.
> 
> On the other NIC, on the IPTables FW, the IP is 10.100.7.3, who is a
> VLAN bone on the FW, the box have a default GW to 10.100.7.1, who is the
> main FW, who connects it with the 192.168.1.0 subnet.
> 
> ETH1 is on the 10.100.7.3 side
> ETH0 is on the 10.100.6.3 side.
> 
> Networks involved:
> 
> 192.168.1.0\25 - Our main network, using 10.50.50.14 to SSH to Subnet A,
> and use 10.100.50.5 to SSH to 10.50.50.5 on Subnet B
> 
> When trying from the 192.168.1.35, its mangles right, looks fine in the
> VPN1 log. 
> 
> Where 10.100.50.5 is mangled to 10.50.50.5, then the VPN1 routes this
> through the VPN tunnel, to VPN2, who routes to the machine, then the
> 10.50.50.5 tries to answer 192.168.1.35, goes back, through the vpn
> tunnel. Think it stops at the VPN1 box or the IPTables FW.

my suggestion would be to tcpdump on every interface involved until you
find where it breaks.  starting at the inside of VPN2, then moving to
the outside of VPN2, inside of VPN1, outside of VPN1, inside of
IPtables, outside of IPTables...  it's the only way to be sure what's
going on in an environment this complicated...

> How could I log incoming 10.50.50.5 trafic on the IPTables box? Iptables
> -A INPUT -j LOG --log-level 3?
> Cant se anything in the syslog, or either log.

any traffic involved in this scenario will probably be FORWARD-ed
through the IPTables box; not destined for the IPTables box itself--try:

iptables -I FORWARD -s 10.50.50.5 -j LOG --log-prefix "SRC 10.50.50.5: "
iptables -I FORWARD -d 10.50.50.5 -j LOG --log-prefix "DST 10.50.50.5: "

> Do you think the packet from 192.168.1.35 reaches the computer on the
> 10.50.50.0 net?, and that tries to answer, but when it comes to the
> VPN1, it don't know where to go?

your problem is almost certainly a failure in routing somewhere along
the line--the trick is to figure out where.  without providing the
complete routing table of every machine involved--we can't figure it out
for you.

> Should I see an echo reply already then? Before it has come back to
> 192.168.1.35 that is the goal for that packet?
> Or will the VPN1 log display echo reply when the packet has reached back
> to 192.168.1.35.?

depends on the logging configured on VPN1 (if this is a check point
VPN-1 machine, the answer is no--CP only logs requests, not replies). 
again--tcpdump doesn't lie...

> Or even, it makes back to the 10.100.6.3 box, but it there doesn't know
> where to go... should the one DNAT rule mangle 10.50.50.5 back to
> 10.100.50.5 by itself? Or do I need another rule that does that? 

once you NAT a request packet--the reply packet(s) of that connection
are automatically un-NAT-ed by the connection tracking code of
netfilter.

-j

-- 
Jason Opperisano <opie@817west.com>


