From: Jason Opperisano <opie@817west.com>
Subject: Re: DNAT/SNAT question
Date: Thu, 14 Apr 2005 18:59:04 -0400
Message-ID: <20050414225904.GA3295@bender.817west.com>
References: <27594E8BA9D5CA458F5EF87D88B6B48F019A8E@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <27594E8BA9D5CA458F5EF87D88B6B48F019A8E@pxtvjoexd01.pxt.primeexalia.com>
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
To: netfilter@lists.netfilter.org

On Thu, Apr 14, 2005 at 03:50:17PM -0700, Gary W. Smith wrote:
> You caught another typo, it should have been .3-7.  Also, the prefix
> changes will also help.
> 
> But I'm still concerned / confused about the OUTPUT chain.  We currently
> use the OUTPUT chain for the 1:1 nat.  That seems to work fine on all
> other configurations where we do nat'ing. 
> 
> Our rule is currently "[0:0] -A POSTROUTING -s 10.20.30.8 -j DNAT --to
> 88.44.55.8" which works fine.  But can we also consolidate this using
> the NETMAP like the pre/post route? 

yes.

-j

--
"Peter: Hey, Brian. If cops are pigs, does that make you a Snausage?
 Brian: Clever, Peter. Did you stay up all night writing that?
 Peter: No, I got to bed around two, two-thirty."
        --Family Guy

