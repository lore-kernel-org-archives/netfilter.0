From: Jason Opperisano <opie@817west.com>
Subject: Re: iptables and TOS 15
Date: Fri, 12 Nov 2004 11:50:38 -0500
Message-ID: <20041112165038.GA27216@bender.817west.com>
References: <419551d1.7be0.0@australia.edu>
	<1100272993.3377.9.camel@hubcap.ljm.dom>
	<4194EAB3.5040409@lopsch.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4194EAB3.5040409@lopsch.com>
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

On Fri, Nov 12, 2004 at 05:54:11PM +0100, Lopsch wrote:
> Concerning to 
> http://www.lartc.org/howto/lartc.qdisc.classless.html#AEN659 the value 
> 15 is a combination of all possible TOS values. What would be logical 
> because with a 4bit field you are able to get the max decimal value of 
> 15. In my opinion marking with 15 or not marking have the same effect. 
> Also using the TOS values only makes sense when using for example the 
> pfifo_fast queueing discipline to schedule pakets.

ah...thanks for the clarification.

-j

-- 
Jason Opperisano <opie@817west.com>

