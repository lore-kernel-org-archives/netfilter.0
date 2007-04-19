From: Lars =?UTF-8?Q?T=C3=A4uber?= <taeuber@bbaw.de>
Subject: Re: Valid packets blocked as invalid?
Date: Thu, 19 Apr 2007 08:33:48 +0200
Message-ID: <20070419083348.364c873e.taeuber@bbaw.de>
References: <20070418151941.c689b07c.taeuber@bbaw.de>
	<web-69045730@bk1.webmaillogin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-69045730@bk1.webmaillogin.com>
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

Hallo Jorge!

> I'm guessing a routing problem here. If you see the log you can see that the 
> packet marked as invalid have the same incoming/outgoing interface.

Yes, it's the same interface but that is intention.

 
> Your diagram, as you said is:
> 
> eth2
> |
> |
> +--- gtw 194.95.188.25 --- LAN 194.95.188.192/26
> |
> |
> LAN 194.95.188.0/26

You'r right that's the situation.

We know the problem could be solved by setting appropriate routes to the gateways in all servers in the 194.95.188.0/26 network. But we don't like that.
Is the routing the reason for the kernel to mark this packet as invalid?

The firewall is our default gateway and also a gateway to some more networks. We don't want to put detailed routes in all servers in the 194.95.188.0/26 network. They all only know the default gateway (and firewall) 194.95.188.7. They all get the information about the better next hop by the fireall via icmp redirects automatically we think.

But why is the packet invalid?

Regards
Lars

