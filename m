From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: POSTROUTING
Date: Wed, 18 Feb 2004 23:31:24 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402182331.24802.Antony@Soft-Solutions.co.uk>
References: <BFEIJHPOPCCMOPEKHHMOAEEHCOAA.giovanni.costagliola@nexusat.it> <200402181825.35022.Antony@Soft-Solutions.co.uk> <20040219004520.18352b71.arnt@c2i.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040219004520.18352b71.arnt@c2i.net>
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
To: netfilter@lists.netfilter.org

On Wednesday 18 February 2004 11:45 pm, Arnt Karlsen wrote:

> On Wed, 18 Feb 2004 18:25:34 +0000,
> Antony Stone <Antony@Soft-Solutions.co.uk> wrote in message
>
> <200402181825.35022.Antony@Soft-Solutions.co.uk>:
> > On Wednesday 18 February 2004 6:26 pm, capsx wrote:
> > >
> > > I want as source to specify a chain
> > > not -s 10.0.0.0/27 but something like -s LOCAL_NET_CHAIN
> >
> > You can't do that.   -s takes an address or network range.   -i takes
> > an interface name.   You cannot specify anything else as the 'source'
> > of a packet.
>
> ..I suspect he means he wants " -s $LOCAL_NET " or somesuch, such
> variables needs first be defined like ' LOCAL_NET="10.0.0.0/27" ',
> for larger sites, it's possible to script these definitions, check the
> http://tldp.org/LDP/abs/html/ over at http://tldp.org/guides.html for
> ideas.

I guess you might be right - he may have a sufficiently complex set of 
internal network ranges that he's matching them in a user-defined chain, and 
then wants to perform later rules depending on whether that chain matched or 
not.

If that's the case, then I suggest to "capsx":

match the addresses in your local network and jump to a user-defined chain 
when a match occurs, then do what you want for local packets in the 
user-defined chain.

For example:

# create a user-defined chain for local packets
iptables -N LOCAL_NET
# match the three segments of our local network
iptables -A FORWARD -s 192.168.1.0/24 -j LOCAL_NET
iptables -A FORWARD -s 192.168.10.0/24 -j LOCAL_NET
iptables -A FORWARD -s 192.168.100.0/24 -j LOCAL_NET
# now process the packets which came from the local network/s
iptables -A LOCAL_NET -j LOG --log-prefix="Local packet: "
# packets which didn't come from the local network/s will never see
# the user-defined chain

Hope this gets the idea across?

Antony.

-- 
Christmas was an opportunity to upgrade to kernel 2.6 while no-one was around 
to notice the downtime.

                                                     Please reply to the list;
                                                           please don't CC me.


