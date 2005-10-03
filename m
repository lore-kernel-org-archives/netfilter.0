From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Masquerade and dhcp lease renewal - what happens?
Date: Mon, 3 Oct 2005 20:00:22 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510031833350.31068@filer.marasystems.com>
References: <FBE2D879EA1A434D94659001D0C3647A045037@kbh1.hkkf>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <FBE2D879EA1A434D94659001D0C3647A045037@kbh1.hkkf>
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
To: Henning Riis Rasmussen <hrr@hkkf.dk>
Cc: netfilter@lists.netfilter.org

On Mon, 3 Oct 2005, Henning Riis Rasmussen wrote:

> My ISP (Telia, Sweden) uses a DHCP lease time of 10 minutes leading to
> constant renewal of the lease.
>
> If I use "-j masquerade" instead of "-j snat" I cannot have any
> longlived connections (they all die with "new not syn" or "invalid").

Seems your DHCP server is resetting interface (down/up) on each renewal 
then.

Does "tcpdump -i eth0" surive a renewal? If not you should defeintely look 
into using another DHCP client.

> What is supposed to happen to the masquerade nat entries when a dhcp
> renewal happens, particularly one that doesn't actually change the IP
> address to a new one?

In 2.6.13 the connections is cleared from conntrack if the IP address is 
deleted or if the interface is brought down.

Regards
Henrik

