From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Not forwarding?
Date: Tue, 30 Mar 2004 08:48:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403300848.16537.Antony@Soft-Solutions.co.uk>
References: <20040328155231.32b07799@darna.vectec.net> <200403292242.16217.Antony@Soft-Solutions.co.uk> <20040329185640.3c8c3da9@darna.vectec.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040329185640.3c8c3da9@darna.vectec.net>
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

On Monday 29 March 2004 11:56 pm, Cody Harris wrote:

> On Mon, 29 Mar 2004 22:42:16 +0100, Antony Stone wrote:
>
> > You need a PREROUTING nat rule if you want the firewall to change the
> > destination address where the packets are going to.
>
> Oh, i get it. But if i didn't re-route the packet it would just go to this
> computer like it was? So i needed to preroute the packets to the correct
> box, right?
>
> > You need a FORWARD filter rule to allow the packets through the firewall
> > (whether it's changed the destination address or not).
>
> So the forward rule filters the packets that are forwarded. It's not the
> part that makes the routing decision, like pre and postrouting are?

I think you've got it now.

The only thing I would comment on what you said above is the phrase "routing 
decision":

Netfilter does not make routing desicions - the Linux kernel does that, even 
when you're not running netfilter.   Netfilter simply adds the ability to 
drop some packets *instead* of routing them on (in the filter tables), or to 
change where they're addressed to (in the nat table), although note in the 
latter case it's still the kernel routing mechanism which decides how they 
get to their (new) destination.

I sometimes tell people "a firewall is a router which can say No".

Regards,

Antony.

-- 
How I want a drink, alcoholic of course, after the heavy chapters involving 
quantum mechanics.

 - 3.14159265358979

                                                     Please reply to the list;
                                                           please don't CC me.


