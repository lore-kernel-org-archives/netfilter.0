From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Range of IP's with Exclusions
Date: Wed, 12 Nov 2003 23:11:42 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200311122311.hACNBjj18873@agate.rockstone.co.uk>
References: <7A3B4AA360FDEF448F3390421FC8D731011316BC@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7A3B4AA360FDEF448F3390421FC8D731011316BC@coxhpexg.coxhp.com>
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

On Wednesday 12 November 2003 11:05 pm, bmcdowell@coxhealthplans.com wrote:

> Is there no reason to be wary of the 'ACCEPT' statement?  I did read this
> in the tutorial (I think), but isn't ACCEPT a terminating action?

Yes, in the sense that a packet matching this rule will not pass through any 
further rules, but what's the problem with that?

The only thing the PREROUTING nat table can do is DNAT.

So, either you want to DNAT a packet from 10.22.1.1, or you don't.

If you do want to DNAT it, put that as the target of the first rule.
If you don't want to DNAT it, use ACCEPT as the target of the first rule.

Nothing else is possible.

Antony.

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
> Sent: Wednesday, November 12, 2003 4:47 PM
> To: netfilter@lists.netfilter.org
> Subject: Re: Range of IP's with Exclusions
>
> On Wednesday 12 November 2003 10:31 pm, bmcdowell@coxhealthplans.com wrote:
> > iptables -t NAT -A PREROUTING -d 10.22.1.3 -j DNAT --to 10.22.2.2
> > iptables -t NAT -A PREROUTING -d 10.22.1.4 -j DNAT --to 10.22.2.2
> > iptables -t NAT -A PREROUTING -d 10.22.1.5 -j DNAT --to 10.22.2.2
> > iptables -t NAT -A PREROUTING -d 10.22.1.6 -j DNAT --to 10.22.2.2
> > (etc.)
> >
> > ...but that is a bit of a pain.
> >
> > I keep trying to type in something like:
> >
> > iptables -t NAT -A PREROUTING -d 10.22.1.0/24,! 10.22.1.1 -j DNAT
> > --to 10.22.2.2
> >
> > ...but iptables complains.
>
> Try these two rules, in this order:
>
> iptables -t NAT -A PREROUTING -d 10.22.1.1 -j ACCEPT
> iptables -t NAT -A PREROUTING -d 10.22.1.0/24 -j DNAT --to 10.22.2.2
>
> The first will match the address you don't want to DNAT, and only other
> addresses will match the second rule.
>
> Antony.

-- 

The idea that Bill Gates appeared like a knight in shining armour
to lead all customers out of a mire of technological chaos
neatly ignores the fact that it was he who, by peddling
second-rate technology, led them into it in the first place.

 - Douglas Adams in The Guardian, August 25, 1995
                                                     Please reply to the list;
                                                           please don't CC me.

