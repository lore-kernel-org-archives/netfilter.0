From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Output Chain Problem...
Date: Fri, 18 Jun 2004 15:49:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406181549.50911.Antony@Soft-Solutions.co.uk>
References: <005d01c45531$f6f4bfd0$800101df@lvl.digidyne.ca> <200406181402.51862.Antony@Soft-Solutions.co.uk> <009b01c45538$1ab69780$800101df@lvl.digidyne.ca>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <009b01c45538$1ab69780$800101df@lvl.digidyne.ca>
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

On Friday 18 June 2004 2:28 pm, Eric Poulin wrote:

> > > iptables -A OUTPUT -p ALL -s 127.0.0.1 -j ACCEPT
> > > iptables -A OUTPUT -p ALL -s 192.168.0.0/24 -j ACCEPT
> > > iptables -A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
> >
> > That second rule suggests to me that you are slightly mistaken about what
> > packets go through the OUTPUT chain - you have allowed all packets
> > sourced from an entire Class C, so I suspect you think that all packets
> > from your local network, which pass through the Firewall, are traversing
> > the OUTPUT chain?
>
> Not really, I got several virtual IP on my NIC facing the internal Network,
> so some packet will sent from my firewall(like those coming from it while
> i'm doing ssh in it), and I have decided to set the entire subnet. Remember
> this is a test, I'm doing large rule to make it works first...

Okay, I understand.

> The problem can be simplify as the following. Everything is fine now,
> because my Default Policy is set to ACCEPT. Following "Best Practices", I
> would prefer to set it to "DROP" and only allow what I need. The problem is
> that I have rules that ACCEPT my ssh response packet form the firewall
> perfectly. PLease check the counters:

I think the counter you need to focus on is the one right at the top: "policy 
ACCEPT 19 packets, 2060 bytes" - that means 19 packets went out by means of 
the default policy, instead of any of the specified rules...

> Chain OUTPUT (policy ACCEPT 19 packets, 2060 bytes)
>     pkts      bytes target     prot opt in     out     source
> destination
>        0        0 ACCEPT     all  --  *      *       127.0.0.1
> 0.0.0.0/0
>     3543   625244 ACCEPT     all  --  *      *       192.168.0.0/24
> 0.0.0.0/0
>       36     3240 ACCEPT     all  --  *      *       66.11.160.119
> 0.0.0.0/0
>        6     1948 ACCEPT     all  --  *      *       0.0.0.0/0
> 0.0.0.0/0          state NEW,RELATED,ESTABLISHED
>        0        0 ACCEPT     all  --  *      *       0.0.0.0/0
> 0.0.0.0/0
>        0        0 LOG        all  --  *      *       0.0.0.0/0
> 0.0.0.0/0          LOG flags 0 level 4 prefix `Output:'
>
>
> If I put back the default output policy to ACCEPT, everything is fine... I
> don't know if you understand my point, or if I'm wrong...

Yes, I understand your point, and no, you're not wrong (at least, not wrong to 
be puzzled by what's going on, anyway).   I similarly cannot understand why 
you have 19 packets hitting the default policy, which do not get logged by a 
LOG rule put at the end of the chain.

Can anyone else here see something we're both obviously missing?

Antony.

-- 
The lottery is a tax for people who can't do maths.

                                                     Please reply to the list;
                                                           please don't CC me.


