From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: "No Route: Rusty's brain broke" ??????
Date: Fri, 3 Sep 2004 10:35:24 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409031035.25051.Alistair@nerdnet.ca>
References: <200409031401.i83E1R53004651@webmail2.magma.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409031401.i83E1R53004651@webmail2.magma.ca>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On September 3, 2004 10:01 am, dravya wrote:
> Hi all,
>
> I have two ppp connections setup and I want access the internet via these
> links.... However, I get the error message "kernel: No Route: Rusty's brain
> broke".
>
> Is there a patch associated with this.... or can you suggest any fixes...
>
> Why would something like this happen??? Is this a problem with the
> ipt_MASQUERADE.c code???
>
> any tips or suggestions are much appreciated.
>
> Thanks
>
	I think you need to look at your routing setup ...:
	I believe this is a ROUTING error.  Not sure what caused it:


	 if (ip_route_output_key(&rt, &fl) != 0) {
                        /* Funky routing can do this. */
                        if (net_ratelimit())
                                printk("MASQUERADE:"
                                       " No route: Rusty's brain broke!\n");
                        return NF_DROP;
                }


	Looks like ipt_MASQUERADE.c can't find a logical route for your packet.

	I take it you are trying to bind the two ppp connections into one?

	Someone else on the list will be better able to advise you on how to do 
that... but it DOES require some work beyond the scope of iptables.


	Alistair Tonner

	


> Dravya

