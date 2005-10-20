From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: mark value as routing key
Date: Thu, 20 Oct 2005 13:12:49 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510201309450.22892@filer.marasystems.com>
References: <BAY103-F12CBD5D305A6953CA1C2EEB2730@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY103-F12CBD5D305A6953CA1C2EEB2730@phx.gbl>
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
To: Marco Berizzi <pupilla@hotmail.com>
Cc: Netfilter Users <netfilter@lists.netfilter.org>

On Thu, 20 Oct 2005, Marco Berizzi wrote:

> Locally generated packet with destination port 80
> are going through the adsl table but the packet
> source ip is 1.1.1.254. Why source ip packet is
> 1.1.1.254? Should't it be 10.10.10.6?

Because source address assignment takes place very early, before there 
even is a packet to be seen by iptables, by using a very special routing 
lookup.

To get around this you can SNAT the traffic before it leaves the box, or 
configure the application to specifically use the correct source address.


Regards
Henrik

