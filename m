From: Wakko Warner <wakko@animx.eu.org>
Subject: Re: recent match and DNAT.
Date: Thu, 19 Oct 2006 06:48:09 -0400
Message-ID: <20061019104809.GA18016@animx.eu.org>
References: <20061019021140.GA16667@animx.eu.org>
	<4536E82E.8040207@rlworkman.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4536E82E.8040207@rlworkman.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robby Workman <netfilter@rlworkman.net>
Cc: netfilter@lists.netfilter.org

Robby Workman wrote:
> Wakko Warner wrote:
> >Is it possible to use the recent match and dnat to dynamically forward
> >incoming packets destined for a specific port (ident in this case) to the
> >machine that initiated the connection?  Or is anything like this possible 
> >at
> >all?
> 
> There may very well be a way to do it, but if there is, I can't 
> seem to find it, and I know of at least one other person who's 
> messed with it.  Best I can tell, midentd on the gateway is going 
> to be your best option.
> You might find this useful as well - I wrote it up quite some 
> time ago, but coupled with midentd, I think you'll have a 
> workable solution.
> http://howtos.rlworkman.net/irc-identd

I was looking for a pure netfilter way of doing it.  But it's no big deal
really, I have ident forwarded to one machine which is most likely to be the
source of the outgoing packets anyway.

-- 
 Lab tests show that use of micro$oft causes cancer in lab animals
 Got Gas???

