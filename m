From: "Stuart J. Browne" <stuart@promed.com.au>
Subject: RE: Problem with FORWARD hook
Date: Wed, 12 Nov 2003 09:06:49 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <015701c3a8a0$1adada90$2288e7c0@promed.com.au>
References: <Pine.SOL.4.20.0311111655550.29271-100000@csa.bu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.SOL.4.20.0311111655550.29271-100000@csa.bu.edu>
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
To: 'Leonid Veytser' <veytser@cs.bu.edu>, netfilter@lists.netfilter.org


>-----Original Message-----
>From: netfilter-admin@lists.netfilter.org 
>[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
>Leonid Veytser
>Sent: Wednesday, 12 November 2003 07:59
>To: netfilter@lists.netfilter.org
>Subject: Problem with FORWARD hook
>
>
>When I dump the output of all the packets traveling thru my machine, I
>notice that none go thru FORWARD hook. So, I tried to make a 
>packet have
>to go thru the FORWARD hook (ie by changing the packet dest at 
>PREROUTING
>hook), but the packet never goes to the FORWARD hook, but disappears.
>
>Can there be some incorrect configuration on my machine that 
>would cause
>it not to be able to forward packets?


When you say "FORWARD hook", do you mean the FORWARD chain on the filter
table?

If so, you need to understand when packets would normally go throughte
FORWARD chain.

If the packet is sourced from another machine (physically, not
logically), and destined for another machine (once again, not
logically), it will go through the FORWARD chain.

If it comes from the local machine, or is destined for the local
machine, it will not touch the FORWARD chain.

I beleive this is detailed in the netfilter FAQ and HOWTO's.  They've
got some nice flow diagrams there too!

bkx


