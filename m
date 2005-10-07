From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: ipt_owner on SMP
Date: Fri, 7 Oct 2005 20:19:02 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510072016480.17798@filer.marasystems.com>
References: <20051007124243.GM16309@scavenger.homeip.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051007124243.GM16309@scavenger.homeip.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Benjamin Schieder <blindcoder@scavenger.homeip.net>
Cc: netfilter@lists.netfilter.org

On Fri, 7 Oct 2005, Benjamin Schieder wrote:

> I'm currently writing an application that makes heavy use of the ipt_owner
> module and the owner-socketlookup patch from patch-o-matic.
> Now I'm at a point where using --pid-owner becomes necessary.
> My machine is a dual P3 800 SMP machine, which results in:
>
> ipt_owner: pid, sid and command matching is broken on SMP.

Yes. The owner match need to violate too many layers of the Linux 
networking, making assumptions which is not true in an SMP system.

> Is there any way to fix this so I can use this feature or do I have
> to work around this brokenness somehow with ipt_comment?

No good approach on how to even attempt to fix the owner match for SMP is 
known at this date. The networking stack is simply not designed with this 
in mind.

Regards
Henrik

