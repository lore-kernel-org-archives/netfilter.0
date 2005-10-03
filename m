From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: Iptables and vlan interfaces
Date: Mon, 3 Oct 2005 12:02:58 +0200
Message-ID: <20051003100258.GJ27873@torres.l21.ma.zugschlus.de>
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
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, Oct 03, 2005 at 03:35:11PM +0530, Aseem Rastogi wrote:
> Does it mean that if I connect my machine ethernet port to another 
> machine and configure a vlan interface with that port as physical port 
> and then add route to another machine through that vlan interface (I 
> need to do this to use vlan interface right ? ), then all packets sent 
> out of it will be tagged by whatever tag i mention in vconfig?

Yes, with the conclusion that other machines not configured for that
vlan do not see the packets.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
Nordisch by Nature |  How to make an American Quilt | Fax: *49 621 72739835

