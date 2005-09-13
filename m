From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Understanding rate limiting
Date: Tue, 13 Sep 2005 02:19:30 -0500
Message-ID: <200509130219.30616.rob0@gmx.co.uk>
References: <acf1defa0509122324c411c82@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <acf1defa0509122324c411c82@mail.gmail.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Tuesday 2005-September-13 01:24, venkata subramanian wrote:
> I am new to iptables and I find it hard to understand rate limiting.
> (-m limit)

Let's call it the "limit match extension". It does not really do rate 
limiting per se.

> 1) It is used for logging as well as not allowing a stream to exceed
> its packets/time quota?

Strictly speaking it can be used to limit anything, not just logging.

> 2) will all the packets that execeed the given rate be dropped?
> (assuming a DROP jump is given)

No, this is wrong. Packets beyond the --limit simply do not match that 
rule. An unmatched packet is evaluated by the next rule, as always, 
until reaching the chain's default policy.

> 3) is this a form of bandwidth management ... can i do this to limit
> the bandwidth used by members in my organization?

I doubt it. There is tc(8) and possibly other better tools for this.

> 4) how is dstlimit different?

dstlimit
       This  module  allows you to limit the packet per second (pps)
       rate on a per destination IP or per destination port base.
       As  opposed  to  the `limit'  match,  every  destination  ip /
       destination port has it's [sic] own limit.

Hey, this is what I should be using for my SSH attack limiting. Thanks!

The difference appear to be with --dstlimit-mode. dstlimit looks more 
complex and more controllable. I would think that by specifying a 
destination in a --limit rule you could accomplish most of what 
dstlimit does? But there too, it's only a limit per rule, whereas 
dstlimit maintains different limits (as per the mode) within the same 
rule.

> (and... quit naive... why is there no srclimit?)

Again, --dstlimit-mode srcip-dstip almost does this. As to why no 
srclimit, I don't know. Perhaps wasn't thought necessary?

> I searched hard... but i have failed to find proper answers for the
> above questions....

Everything I know about netfilter comes from 4 sources:
    1. Rusty's unreliable guides
    2. "man iptables"
    3. practice / experimentation
    4. this mailing list
What I know in particular about --limit came from 2 and 3.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

