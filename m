From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPSec Transport Mode
Date: Wed, 7 Jul 2004 21:54:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407072154.52923.Antony@Soft-Solutions.co.uk>
References: <1089207305.788.14.camel@PCA-ARNSTR.ee-consultants.de> <200407071453.49223.Antony@Soft-Solutions.co.uk> <1089210110.788.27.camel@PCA-ARNSTR.ee-consultants.de>
Reply-To: NetFilter Mailling List <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1089210110.788.27.camel@PCA-ARNSTR.ee-consultants.de>
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
To: NetFilter Mailling List <netfilter@lists.netfilter.org>

On Wednesday 07 July 2004 3:21 pm, Arnst, Rainer wrote:

> Hello,
>
> thank you Antony for your quick and very helpful answer!!
>
> On Mi, 2004-07-07 at 15:53, Antony Stone wrote:
> > > With this Setup, is there anything that can be done with IPTables to
> > > make the transport mode work w/o NAT-T?
> >
> > I can think of two ways:
> > 1. Put a genuine public IP address on the destination Security Gateway
> > machine, routed through the firewall without nat.
>
> This sounds really good. How do I tell iptables not to perform NAT for
> IPSec?
>
> Currently the firewall is a Test-Setup with IPCop. Since the
> IpCop-Interface does not support ESP I added these iptables rules to the
> zillions of rules put in place by ipcop to make it work, probably a bit
> to open anyway :-) :
>
> iptables -A INPUT -p 50 -j ACCEPT
> iptables -A OUTPUT -p 50 -j ACCEPT
> iptables -A FORWARD -p 50 -j ACCEPT
>
> How would I modify these to pass on the packets without NAT?

My first observation on seeing this is: why are you talking about ESP all of a 
sudden?

ESP is for tunnel mode, and works fine through NAT.

Transport mode uses AH (protocol 51), and that's the one which breaks through 
NAT.

Anyway, you don't need to FORWARD the IPsec packets - they only come into and 
out of the security gateway machine - it's the unencrypted packets which get 
FORWARDed.

And, to answer your question about how to avoid NATting certain types of 
packets, the answer is to put an ACCEPT rule in your PREROUTING or 
POSTROUTING chain, before the SNAT or DNAT rule which would otherwise nat 
them.

For example:

iptables -A PREROUTING -t nat -p 50 -j ACCEPT
iptables -A PREROUTING -t nat -d a.b.c.d -j DNAT --to w.x.y.z

These rules will DNAT all packets originally addressed to a.b.c.d and send 
them to w.x.y.z instead, *unless* they are protocol 50, in which case they 
won't get NATted.

Hope that helps,

Antony.

-- 
The first fifty percent of an engineering project takes ninety percent of the 
time, and the remaining fifty percent takes another ninety percent of the 
time.

                                                     Please reply to the list;
                                                           please don't CC me.


