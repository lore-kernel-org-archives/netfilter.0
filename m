From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NATting again
Date: Fri, 16 Jul 2004 19:27:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407161927.55940.Antony@Soft-Solutions.co.uk>
References: <f51b72bc04071608505bc1da93@mail.gmail.com> <200407161703.42973.Antony@Soft-Solutions.co.uk> <f51b72bc0407161049d9edfa7@mail.gmail.com>
Reply-To: netfilter <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <f51b72bc0407161049d9edfa7@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Friday 16 July 2004 6:49 pm, Payal Rathod wrote:

> Hi,
>
> On Fri, 16 Jul 2004 17:03:42 +0100, Antony Stone
>
> > iptables -A PREROUTING -t nat -d a.b.c.d -p tcp --dport 21 -j DNAT --to
> > w.x.y.z
> > iptables -A FORWARD -d w.x.y.z -p tcp --dport 21 -j ACCEPT
>
> Why is the FORWARD rule needed here?

Because without it, the DNAT rule will change the destination address of the 
packets, and then they won't be allowed through the next chain in sequence 
(PREROUTING --> FORWARD --> POSTROUTING).

If you *didn't* have a DNAT rule, you would need a FORWARD rule, so I think it 
would seem strange if you didn't need a FORWARD rule just because you'd 
changed the destination address.   (For example, what would happen if you 
used a DNAT rule which "changed" the address to the same as it already was?   
Or maybe two DNAT rules in a row - one changes it, and the next changes it 
back again?)

> Doesn't the PREROUTING rule handle the same

No, the PREROUTING rule does exactly what it says it does - it DNATs the 
packet.   Nothing more.

> or rather the rule in ESTABLISHED and RELATED in FORWARD chain handle it?

That rule will handle ESTABLISHED and RELATED packets, but we're talking about 
the first packet in the connection here, which is a NEW one.

> Why do we need a seperate FORWARD rule?

I hope I've explained that above.

Regards,

Antony.

-- 
Bill Gates has personally assured the Spanish Academy that he will never allow 
the upside-down question mark to disappear from Microsoft word-processing 
programs, which must be reassuring for millions of Spanish-speaking people, 
though just a piddling afterthought as far as he's concerned.

 - Lynne Truss, "Eats, Shoots and Leaves"

                                                     Please reply to the list;
                                                           please don't CC me.


