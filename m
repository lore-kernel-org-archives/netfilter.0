From: Evan Borgstrom <evan@unixpimps.org>
Subject: Re: Strange setup
Date: 23 Jan 2003 21:50:02 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043376601.1583.65.camel@venom.int.unixpimps.org>
References: <1648.10.35.120.83.1043012159.squirrel@mail.unixpimps.org>
	 <1043015513.24583.16.camel@wizardslair>
	 <1084.10.35.120.83.1043023502.squirrel@mail.unixpimps.org>
	 <1043049030.24581.76.camel@wizardslair>
	 <1043074151.1391.39.camel@venom.int.unixpimps.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1043074151.1391.39.camel@venom.int.unixpimps.org>
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
To: Netfiler E-Mail List <netfilter@lists.netfilter.org>

Ok, I've come across how cisco implements exactly what I'm looking to
do. I realize that this is not a cisco, but possibly from reading this
someone will further understand what I'm trying to accomplish and think
of a way to do so with netfilter.

http://www.cisco.com/univercd/cc/td/doc/product/software/ios113ed/113ed_cr/secur_c/scprt3/screflex.htm

Basically, Reflexive access lists (explained in that URL) allow you to
use a 'reflect' target when you are creating an access list, this
reflect target then ensures that traffic will leave the interface the
session began on. For instance, if I have eth1 and gre1 both possible
interfaces for inbound traffic to the DMZ, when traffic enters eth1 I
need a mechanism to ensure it leaves eth1 as well even if a more
specific route exists pointing to gre1.

Anyone got any ideas?

-Evan

On Mon, 2003-01-20 at 09:49, Evan Borgstrom wrote:
> Thanks for the reply Peter,
> 
> That's the sortta setup I was playing with yesterday. Kindda kludgey but
> it would work.
> 
> What would be nice is if connection tracking would log the source
> interface of the last packet. That way in the PREROUTING table I could
> check that and change the mark on the packet so that it would pick a
> different routing table. Perhaps I should look at implementing that on
> my setup to see how it works...
> 
> The only other way I thought of doing it was using TOS bits inside the
> network (say give an 8 to anything coming over the WAN and a 16 to
> anything coming over the WLAN), but I can't find a way to make my sun
> boxes set the same TOS for related pakets...
> 
> If anyone else has ideas, comments, etc... on this I'm always up to
> listen.
> 
> -Evan
> 
> On Mon, 2003-01-20 at 02:50, Peter Johnson wrote:
> > Ok, gotcha now...
> > 
> > Still do 
> > ip rule add from $WAN_IP table $WAN_TABLE
> > ip rule add from $WLAN_IP table $WLAN_TABLE
> > and 
> > ip route add default via $WAN_PEER_IP dev $WAN_IF table $WAN_TABLE
> > ip route add default via $WLAN_PEER_IP dev $WAN_IF table $WLAN_TABLE
> > 
> > Add iptables rules approximately as follows:
> > 
> > $IPTABLES -t nat -A PREROUTING -i $WAN_IF -j DNAT $DMZ_IP_0-16
> > $IPTABLES -t nat -A PREROUTING -i $WLAN_IF -j DNAT $DMZ_IP_17-32
> > 
> > $IPTABLES -t nat -A POSTROUTING -o $WAN_IF -j SNAT $WAN_IP
> > $IPTABLES -t nat -A POSTROUTING -o $WLAN_IF -j SNAT $WLAN_IP
> > 
> > $IPTABLES -t filter -A FORWARD -i $WAN_IF -o $DMZ_IF -j ACCEPT
> > $IPTABLES -t filter -A FORWARD -i $WLAN_IF -o $DMZ_IF -j ACCEPT
> > 
> > That takes care of the initial connection i.e. SYN packets. The IPTables
> > nat table is only used on the initial packet on each connection.
> > 
> > For the actual routing, the only thing that I can think of is assigning
> > two IPs (aliases) to each server in the DMZ say .0-16 for WAN and 17-32
> > for WLAN then using
> > 
> > $IPTABLES -t mangle -A PREROUTING -s $DMZ_IP_0-16 -j MARK --set-mark 1
> > and
> > $IPTABLES -t mangle -A PREROUTING -s $DMZ_IP_17-32 -j MARK --set-mark 2
> > 
> > then add
> > 
> > ip rule add fwmark 1 table $WAN_TABLE
> > and
> > ip rule add fwmark 2 table $WLAN_TABLE
> > 
> > 
> > Sorry but that is all I can come up with at the moment.
> > 
> > PJ
-- 
Evan Borgstrom <evan@unixpimps.org>
http://www.unixpimps.org
http://www.ragga-jungle.com


