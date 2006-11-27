From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: This is possible?
Date: Mon, 27 Nov 2006 09:35:00 -0600
Message-ID: <456B05A4.8080501@riverviewtech.net>
References: <c576e5da0611270416v2baae792v786457639970f83@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c576e5da0611270416v2baae792v786457639970f83@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

Mike S. Matsumoto wrote:

<snip>

> Guys, this is possible?

Yes.

> I have two connections with Internet. And I need that DMZ use
> Connection 1 and Internal NET use Connection 2 for access Internet.
> 
> So, i will have one default gw for connection 1 and another for 
> connection 2.
> 
> How this work? Any tutorial or link for help me?

If you have different subnets on your DMZ LAN from that of your internal LAN
this can easily be accomplished with IP Route 2 rules.  Namely set up one
(named / numbered) routing table for each connection and then set up some
"ip rule"s to decide which routing table to use based on source IP subnet.

If you do not have different subnets on your DMZ LAN from that of your
internal LAN, you can do something very similar based on firewall marking.
I'll presume that your DMZ LAN is on a different interface than your
internal LAN.  In this case, mark one of the LAN interfaces via IPTables and
then use an "ip rule" to match the fwmark to decide which routing table to use.



Grant. . . .


