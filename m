From: Wouter Vanwalleghem <wouter@belnet.be>
Subject: Re: Unable to stop tunnel from being "connection-tracked"
Date: 02 Oct 2003 21:35:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1065123318.29721.12.camel@xerxes.sketchingroom.home>
References: <1065093009.24289.193.camel@wouter.fw.belnet.be>
	 <20031002135201.GA16283@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031002135201.GA16283@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org

On Thu, 2003-10-02 at 15:52, Ramin Dousti wrote:
(snip)
>> Thing is that the tunnel "dies" as soon as the connection has
> > disappeared from the connection tracking table.
> 
> What do you mean by "the tunnel dies"? That you cannot send anything
> through it anymore after the conntrack entry has been cleared? How
> does the routing look like, how do you direct the traffic through
> the tunnel?
> 

What I mean is, that if I let the connection disappear from the
connection tracking table, immediately afterwards, I no longer get any
replies on my ping6's to the tunnelbroker PoP IPv6 address. A tcpdump on
my external interface (ppp0) only shows my echo-requests and no packets
whatsoever coming from the tunnelbroker PoP. I would at least expect to
see some or other packet, e.g. an icmp error message, coming from the
tunnelbroker PoP.

> I take that the tunnel endpoint on your side is the external interface (ppp0)
> if so, the MASQUERADE rule below can be simplified...

I suppose you mean by leaving out the source address specification? I
know, I just put it in in an attempt to stop the connection tracking
from happening, but alas...

> Ramin
> 
> > After some research I followed a suggestion to keep the tunnel from
> > being connection tracked.
> > However, the following iptables rules do not prevent the tunnel from
> > popping up in the connection tracking table:
> > 
> > 
> > #####------------ IPv6 tunnel to SixXS-----
> > iptables -A INPUT -p 41 -s tunnelserver.concepts-ict.net -j ACCEPT
> > iptables -A OUTPUT -p 41 -d tunnelserver.concepts-ict.net -j ACCEPT
> > iptables -A INPUT -p icmp --icmp-type echo-request -s
> > tunnelserver.concepts-ict.net -j ACCEPT
> > iptables -t nat -A POSTROUTING --protocol ! 41 -s 192.168.100.0/24 -o
> > ppp0 -j MASQUERADE
> > 
> > The ip6tables tables are all empty and all policies are set to ACCEPT.
> > I cannot do without the MASQUERADE'ing rule because I still want my LAN
> > to have connectivity.
> > 
> > Anybody have a clue?
> > 
> > TIA
> > 
> > kind regards,
> > 
> > Wouter


