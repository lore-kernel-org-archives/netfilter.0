From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: NAT/POSTROUTING rules doesn't match packets
Date: Thu, 6 Oct 2005 18:47:08 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510061846210.31577@filer.marasystems.com>
References: <20051004070925.7E2783C65565@mailgate.informatik.haw-hamburg.de>
	<200510041237.57236.marek.zachara@conexe.pl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510041237.57236.marek.zachara@conexe.pl>
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
To: Marek Zachara <marek.zachara@conexe.pl>
Cc: netfilter@lists.netfilter.org

On Tue, 4 Oct 2005, Marek Zachara wrote:

> Just to make sure, i have compiled kernel 2.4.31 and also switched back to
> 1.2.11 iptables. But nothing changed. Still the packets don't get SNAT-ed and
> there has been no hit on SNAT rule for about an hour (packets are sent every
> ten seconds or so). This only applies to UDP packets.

Any more details on these UDP packets, combined with what matching 
sessions you have in /proc/net/ip_conntrack?

Regards
Henrik

