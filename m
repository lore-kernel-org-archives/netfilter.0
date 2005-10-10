From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: NAT/POSTROUTING rules doesn't match packets (SOLVED?)
Date: Mon, 10 Oct 2005 20:42:51 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510102041400.17499@filer.marasystems.com>
References: <20051010105601.A3C9E3C65565@mailgate.informatik.haw-hamburg.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051010105601.A3C9E3C65565@mailgate.informatik.haw-hamburg.de>
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
To: bernin_a@informatik.haw-hamburg.de
Cc: netfilter@lists.netfilter.org

On Mon, 10 Oct 2005 bernin_a@informatik.haw-hamburg.de wrote:

> some connections (udp port 500) and i have the above problem. If i drop the
> initial packet of a connection, does it still get an entry in conntrack ?

It should not get into conntrack then.

> As an example, i want to snat the udp packets from 192.168.1.2 port 5444
> to come from 192.168.1.2 port 500. If i have a rule that blocks this connection,
> insert the nat rule first and allow the traffic afterwards, will this work ??

I think so.

Regards
Henrik

