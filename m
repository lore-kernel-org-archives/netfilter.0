From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Re: iptables help
Date: Thu, 29 Jul 2004 22:20:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407292220.39022.Antony@Soft-Solutions.co.uk>
References: <Pine.LNX.4.44.0407291026030.2121-100000@ivanhoe.pcraft.com> <200407291928.48974.Antony@Soft-Solutions.co.uk> <410966F6.3020206@pcraft.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <410966F6.3020206@pcraft.com>
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

On Thursday 29 July 2004 10:07 pm, Ashley M. Kirchner wrote:

> Antony Stone wrote:
> >>>iptables -I FORWARD -s a.b.c.d -d w.x.y.z -p tcp --dport 80 -j REJECT
> >
> >"-I" will insert the rule at the top of the FORWARD chain, and therefore
> >guarantees that these packet will be REJECTed, no matter other rules
> > follow in your ruleset.
>
>     Thanks for the explanation.  So I'm testing this out now, and I
> inserted:
>
> iptables -I FORWARD -s 66.218.75.184 -d 192.168.1.253 -p tcp --dport 80
> -j REJECT
>
>     66.218.75.184 == mail.yahoo.com (or login.yahoo.akadns.net, or
> l1.login.vip.scd.yahoo.com according to iptables -L), however that
> machine (.253) can still reach that address just fine.  What am I missing?

You're missing the fact that 192.168.1.253 connects to 66.218.75.184 on 
destination port 80, not the other way round.

Try reversing the source & destination addresses in your rule and see if that 
does what you wanted.

Regards,

Antony.

-- 
If builders made buildings the way programmers write programs, then the first 
woodpecker to come along would destroy civilisation.

                                                     Please reply to the list;
                                                           please don't CC me.


