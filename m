From: Cody Harris <hchs@ns.sympatico.ca>
Subject: Re: Not forwarding?
Date: Tue, 30 Mar 2004 07:33:47 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040330073347.65b31438@darna.vectec.net>
References: <20040328155231.32b07799@darna.vectec.net>
	<200403292242.16217.Antony@Soft-Solutions.co.uk>
	<20040329185640.3c8c3da9@darna.vectec.net>
	<200403300848.16537.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403300848.16537.Antony@Soft-Solutions.co.uk>
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

On Tue, 30 Mar 2004 08:48:16 +0100,
Someone named Antony Stone <Antony@Soft-Solutions.co.uk> wrote:

> On Monday 29 March 2004 11:56 pm, Cody Harris wrote:
> 
> I think you've got it now.

Great!

> 
> The only thing I would comment on what you said above is the phrase "routing 
> decision":
> 
> Netfilter does not make routing desicions - the Linux kernel does that, even 
> when you're not running netfilter.   Netfilter simply adds the ability to 
> drop some packets *instead* of routing them on (in the filter tables), or to 
> change where they're addressed to (in the nat table), although note in the 
> latter case it's still the kernel routing mechanism which decides how they 
> get to their (new) destination.

So instead of changing the decision, it changes the packet to change the routing decision? If we've covered the NAT table, what's the mangle table?

> 
> I sometimes tell people "a firewall is a router which can say No".
> 
> Regards,
> 
> Antony.
> 
> -- 
> How I want a drink, alcoholic of course, after the heavy chapters involving 
> quantum mechanics.
> 
>  - 3.14159265358979
> 
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 
> 


-- 
+------------------+-----------------------------+
| Cody Harris      | --------------------------- |
| ---------------- | --------------------------- |
+------------------+-------+---------------------+---+
| *Sigh*. No key.                                    |
+----------------------------------------------------+

