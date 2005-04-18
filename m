From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Cleanest way to deal with loopback interface?
Date: Mon, 18 Apr 2005 15:42:08 -0500
Message-ID: <42641BA0.9000509@riverviewtech.net>
References: <1113425449.3544.177.camel@seberino.spawar.navy.mil>	
	<20050413211349.GA31336@bender.817west.com>	
	<425DC2DA.7010608@riverviewtech.net>
	<1113854945.3544.219.camel@seberino.spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113854945.3544.219.camel@seberino.spawar.navy.mil>
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
To: Christian Seberino <seberino@spawar.navy.mil>
Cc: netfilter@lists.netfilter.org

> I tried to understand this attack but it was over my head.
> The message is simply that
> I should only allow loopback traffic whose source
> and destination addresses are 127.0.0.0/8 right??
> 
> e.g.
> 
> $IPTABLES -t filter -A INPUT  -i $LOOPBACK_INTERFACE
>               -s 127.0.0.0/8 -d 127.0.0.0/8 -j ACCEPT
> $IPTABLES -t filter -A OUTPUT -o $LOOPBACK_INTERFACE
>               -s 127.0.0.0/8 -d 127.0.0.0/8 -j ACCEPT
> 
> This is safe Right?

Yes that is correct.  I might be tempted to add a couple of rules in your FILTER chain too.

$IPTABLES -t filter -A FORWARD -s 127.0.0.0/8 -j DROP
$IPTABLES -t filter -A FORWARD -d 127.0.0.0/8 -j DROP

This will catch any traffic that comes in to any interface, via the FORWARD chain rule with out an interface binding, that would go out any other interface.  In other words any traffic that should be passing through your FORWARD chain should not be destined or from any 127.0.0.0/8 IP addresses, this will trap and DROP any such traffic.



Grant. . . .

