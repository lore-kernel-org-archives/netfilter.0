From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Iptables and vlan interfaces
Date: Mon, 3 Oct 2005 14:18:10 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510031416260.24889@filer.marasystems.com>
References: <20050930112129.19898.qmail@focomunicatii.ro>
	<Pine.LNX.4.61.0509301440560.19019@filer.marasystems.com>
	<20050930125427.28160.qmail@focomunicatii.ro>
	<200509300839.15330.rob0@gmx.co.uk>
	<Pine.LNX.4.61.0509301706580.24680@filer.marasystems.com>
	<4340D42B.2070106@india.tejasnetworks.com>
	<Pine.LNX.4.61.0510031035150.22605@filer.marasystems.com>
	<43410257.1090200@india.tejasnetworks.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43410257.1090200@india.tejasnetworks.com>
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
Cc: netfilter@lists.netfilter.org

On Mon, 3 Oct 2005, Aseem Rastogi wrote:

> Does it mean that if I connect my machine ethernet port to another 
> machine and configure a vlan interface with that port as physical port 
> and then add route to another machine through that vlan interface (I 
> need to do this to use vlan interface right ? ), then all packets sent 
> out of it will be tagged by whatever tag i mention in vconfig?

Yes.

Any packets sent out on that virtual interface will be sent tagged with 
the vlan tag. This is done in L2 and not protocol dependent in any manner.

Regards
Henrik

