From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: iptables support in 2.2 kernel
Date: Wed, 26 Oct 2005 19:13:46 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510261911160.27341@filer.marasystems.com>
References: <BAY103-F404DA4544B76C919CE72A8B2690@phx.gbl>
	<435F511A.8030204@india.tejasnetworks.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <435F511A.8030204@india.tejasnetworks.com>
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
To: Aseem Rastogi <aseem@india.tejasnetworks.com>
Cc: Netfilter Users <netfilter@lists.netfilter.org>

On Wed, 26 Oct 2005, Aseem Rastogi wrote:

> Is iptables supported on 2.2 kernel? I have a requirement to use NAT rules on 
> 2.2 kernel. Is it possible thorugh ipchains?

NAT in Linux-2.2 ipchains is somewhat limited.. but you have Masquerading, 
Redirection for transparent proxying and Port-forwarding.

All described in the ipchains documentation, which I no longer have around 
anywhere close and no intention at looking into again.

Regards
Henrik

