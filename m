From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: How to elegantly handle two ISPs on a single box?
Date: Wed, 6 Apr 2005 21:46:35 +0200
Message-ID: <20050406194635.GE12284@torres.l21.ma.zugschlus.de>
References: <20050406171730.GA12284@torres.l21.ma.zugschlus.de>
	<001b01c53adc$d8c7b530$f5001eac@riverview.office>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001b01c53adc$d8c7b530$f5001eac@riverview.office>
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

On Wed, Apr 06, 2005 at 02:14:24PM -0500, Taylor, Grant wrote:
> You might try Equal Cost Multi-Path (ECMP) routing.

That will have me send out packets with source A to ISP B and vice
versa which will have the packets killed by the ISPs reverse path
filters.


> Give this a shot and see what happens.

I don't need to try this, it will end up with pretty much exactly 50 %
packet loss.

> You will just need to make sure that you do something like the following in
> your nat / POSTROUTING chain:
> 
> iptables -t nat -A POSTROUTING -o <dev of ISP B> -j SNAT --to-source
> 172.16.0.129
> iptables -t nat -A POSTROUTING -o <dev of ISP A> -j SNAT --to-source
> 10.0.0.1

This will NAT the first, third, fifth packet of a TCP session to
172.16.0.129 and the second, fourth and sixth packet of the same
session to 10.0.0.1. I seriously doubt that the session will come up
at all.

I am either completely missing the poing or your suggestion is making
things worse.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
Nordisch by Nature |  How to make an American Quilt | Fax: *49 621 72739835

