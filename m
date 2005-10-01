From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Destination_IP Field in packets coming from QUEUE
Date: Sat, 1 Oct 2005 03:21:00 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510010319260.4320@filer.marasystems.com>
References: <20050930223801.3269.qmail@web52810.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050930223801.3269.qmail@web52810.mail.yahoo.com>
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
To: Lore <skizzo82@yahoo.com>
Cc: netfilter@lists.netfilter.org

On Sat, 1 Oct 2005, Lore wrote:

> I'm facing the problem to understand the destination
> of an OUTGOING tcp packet caught by the chain
> iptables -t filter -A OUTPUT -j QUEUE
>
> The destination address field in the ip header has my
> ip while the real destination is another.

Are you sure you look at the destination IP and not the source IP?

If unsure send a hex dump of the packet for us to ponder at.

Regards
Henrik

