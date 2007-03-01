From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Blocking direct private IP address
Date: Thu, 1 Mar 2007 04:52:48 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0703010449120.23355@yvahk01.tjqt.qr>
References: <BAY119-F26E778C8C143FF9F0EBA49D6800@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY119-F26E778C8C143FF9F0EBA49D6800@phx.gbl>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Kraslavsky <andykras@hotmail.com>
Cc: netfilter@lists.netfilter.org


On Feb 28 2007 19:12, Andrew Kraslavsky wrote:

[recap
> external 10.0.0.1/24
> internal 192.168.0.1/24
]

>
> Thanks for the pointer but the question here is about the destination IP
> address, not the source.
>
> When I create the DNAT rule, the private IP address to which I want my
> public address to map suddenly becomes directly accessible to hosts on
> the public network.

Then don't add a DNAT rule.

> I.e. I want hosts on the public network to _have_to_ send traffic to 
> the public IP of 10.0.0.1 but, after adding that rule, they can 
> actually send traffic to that address _AND_ also directly to the 
> private IP address of the Web server at 192.168.0.99.

Your DNAT rule is broken:

>iptables -t nat -A PREROUTING -d 10.0.0.1 -j DNAT --to-destination 
>192.168.0.99

You are forwarding _ALL_ traffic, _ALL_ ports. (And you can never reach 
the real 10.0.0.1 from the outside using 10.0.0.1.)


Jan
-- 

