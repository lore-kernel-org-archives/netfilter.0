From: "Martijn Lievaart" <m@rtij.nl>
Subject: Re: Question about using "nat" table
Date: Wed, 9 Aug 2006 13:43:15 +0200 (CEST)
Message-ID: <49675.3625608564$1155123831@news.gmane.org>
References: <20060807144159.34783.qmail@web30606.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060807144159.34783.qmail@web30606.mail.mud.yahoo.com>
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
To: Constantine Filin <constfilin@yahoo.com>
Cc: netfilter@lists.netfilter.org

<citaat van="Constantine Filin">
> Now if I delete the conntract entry again, NAT table packet counter will
> increment
> again but I need to setup iptables so that *all* packets from
> 85.141.210.22:9000
> are NATed, not only the first one opening the conntrack entry.
>
> Is there a way to do this with iptables? If not then what is the purpose
> of NAT table?
> What is the right way to use it?

A NAT rule is hit once, to set up a NAT mapping. With this mapping, all
packets belonging to this connection are NATted. So the right way is just
to create one nat rule, like you did.

M4


