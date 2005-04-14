From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: help with fast nat
Date: Wed, 13 Apr 2005 19:25:26 -0500
Message-ID: <425DB876.2050903@riverviewtech.net>
References: <Pine.GSO.4.58.0504131520420.25950@mcnet.marietta.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.GSO.4.58.0504131520420.25950@mcnet.marietta.edu>
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
To: Stephen Beck <becks@marietta.edu>
Cc: netfilter@lists.netfilter.org

What system is doing the pinging (IP / subnet) and what is it pining (IP / subnet)?

> [root@dorm-test ~]# ip route add 10.0.31.5/32 via 10.0.30.5

If you were pinging 10.0.31.5 passing through this router where 10.0.31.x/24 was on a different subnet and you told this router that 10.0.31.5 was accessible via 10.0.30.5 (the system doing the ping) you just told the router to loop the traffic back on the system doing the pinging.

> [root@dorm-test ~]# ip rule add from 10.0.30.5 nat 10.0.31.5

I'm not sure what you are hoping to accomplish by doing this.  This will make any traffic coming from 10.0.30.5 (the system doing the pinging?) appear as if it is coming from 10.0.31.5 which would cause the router to send the traffic back to the 10.0.31.x/24 network.

I have a feeling what you might have done (if I understand what you have written here correctly) is effectively do a double loop back as in the 10.0.30.5 system's traffic loops back on it's self at the router as does the 10.0.31.5 system's traffic loop back on it's self at the router too.

There really is not enough information to try to help you, but based on what I have seen this is what I deduce.  I hope that will help you in some way.



Grant. . . .

