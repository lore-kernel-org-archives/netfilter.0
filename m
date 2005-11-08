From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: iptables on DLink DSL-502T Modem/Router (nfcan: addressed to
	exclusive sender for this address)
Date: Tue, 8 Nov 2005 15:58:23 -0500
Message-ID: <20051108205823.GA16294@salty>
References: <cc8f3f150511071747m64e3841ava98596bfe776fcf3@mail.gmail.com>
	<200511072031.46307.rob0@gmx.co.uk>
	<cc8f3f150511081239x4bd4d8favd7e2807f0748711c@mail.gmail.com>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <cc8f3f150511081239x4bd4d8favd7e2807f0748711c@mail.gmail.com>
	(from
	+nfcan+jimlaur+bda7da8e47.pgudge#gmail.com@spamgourmet.com on
	Tue, Nov 08, 2005 at 15:39:52 -0500)
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2005.11.08 15:39, Paul Goodyear - pgudge@gmail.com wrote:
> Thanks for the reply, that would explain a few things. I did try the
> rule in both INPUT and FORWARD chains, but neither worked, I took a
> guess that it would be INPUT to use so I posted with that chain.
> 
> Order, when I do a iptables -L -n I can see my rule, but it is always
> at the bottom of the pile, so this might be the whole issue. How do I
> know what <ruleid> the other rules are so I can add above them?
> 
> I have read the -A param is "to add a rule at the end of the chain"
> how do I add at the begining of the chain?

 -I instead of -A

> 
> Thanks again.
>
.........
-- 
Jim Laurino
nfcan.x.jimlaur@dfgh.net
Please reply to the list.
Only mail from the listserver reaches this address.

