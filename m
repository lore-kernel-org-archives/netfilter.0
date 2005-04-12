From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: TCP packets with RST flag set but **not** ACK flag OK??
Date: Mon, 11 Apr 2005 23:01:31 -0500
Message-ID: <425B481B.7070108@riverviewtech.net>
References: <1113247121.3544.118.camel@seberino.spawar.navy.mil>	<425AF2B7.2050402@riverviewtech.net>
	<1113266214.2111.46.camel@grendel>	<425B3354.2030807@riverviewtech.net>
	<1113278818.2151.87.camel@grendel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113278818.2151.87.camel@grendel>
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
To: Chris Brenton <cbrenton@chrisbrenton.org>
Cc: netfilter <netfilter@lists.netfilter.org>

> If I follow what you are saying here, the concern is the returning ICMP
> host unreachables may be used as part of a DoS. Is this correct? 

Yes, you are following me there.

> If so, the concern is pretty minimal. Packet size is small, only 56
> bytes in size, so bandwidth utilization is small. Unsolicited ICMP
> errors are going to be quickly discarded by the receiving system, so its
> not going to cause much of a CPU hit on the target. Unfortunately there
> are far too many other ways of performing a DoS that would be much more
> effective and efficient. 

*nod*  I'm not saying that it's one of the most efficient ways to DDoS someone, but I am saying that it is a way and some institutions politically decide that they would rather DROP packets than possibly participate in a DDoS against someone else.

> Ya, geek stuff is cool. :D

It has gotten me in to trouble too.  I tend to spend too much time working on geek stuff.  Oh, well I had fun doing it.



Grant. . . .

