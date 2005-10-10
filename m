From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: NAT/POSTROUTING rules doesn't match packets
Date: Mon, 10 Oct 2005 22:52:35 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510102249310.21057@filer.marasystems.com>
References: <20051004070925.7E2783C65565@mailgate.informatik.haw-hamburg.de>
	<200510072133.37280.marek.zachara@conexe.pl>
	<Pine.LNX.4.61.0510092357070.30581@filer.marasystems.com>
	<200510101442.13454.marek.zachara@conexe.pl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510101442.13454.marek.zachara@conexe.pl>
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

On Mon, 10 Oct 2005, Marek Zachara wrote:

> I did try. However even adding blocking (-p udp -j DROP) at PREROUTING and
> keeping such rule for 5 min doesn't clean the conntrack - somehow the entry
> is 'sustained' with the incoming packets even if they are being dropped early
> in the chain.

If the conntrack entry already exists then a DROP rule will probably not 
help if the traffic is frequent.

However, if there is not yet an entry then DROP should prevent the 
conntrack entry from being set up (yes, technically there still is a 
conntrack created, but never confirmed or registered as the packet is 
dropped).

Regards
Henrik

