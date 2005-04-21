From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: logging of successful tcp connections
Date: Thu, 21 Apr 2005 18:55:01 -0500
Message-ID: <42683D55.1060305@riverviewtech.net>
References: <F97948CF897D7B46802A18845A8B9BFD471BB9@us-rich-m01.global.tektronix.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <F97948CF897D7B46802A18845A8B9BFD471BB9@us-rich-m01.global.tektronix.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: christopher.f.ulherr@exgate.tek.com
Cc: netfilter@lists.netfilter.org

> Hrmm... I've looked over the recent patch, but I'm not certain how to
> implement this 'and' logic "if it's in list A, but not in list B".. etc.

If you wanted to see if a packet was transitioning from NEW to ESTABLISHED I think it would be as simple as something like the following:

iptables -t filter -A FORWARD -i $INet -o $LAN -d $INet_IP -m recent --rcheck --name recent_NEW -m recent ! --rcheck --name recent_ESTABLISHED -j Transition_to_ESTABLISHED

I'm not sure about the placement of the "!" on the line, you might have to play with it a bit to make sure that the syntax is correct.  Anyone have any input here?

> There must be some place in the connection tracking code where a simple
> log can be placed. I'm not that familiar with the internals, but it
> would seem that just before updating the state, you could just printk a
> log. Am I way off here?

I'm sure there is a place in the kernel code that this could be put, though I don't know as if many people would want such a thing.  It might be able to be there and something that is off by default and then turned on via /proc.



Grant. . . .

