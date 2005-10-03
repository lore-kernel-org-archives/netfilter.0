From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: Iptables and vlan interfaces
Date: Mon, 3 Oct 2005 09:44:44 +0200
Message-ID: <20051003074444.GA27873@torres.l21.ma.zugschlus.de>
References: <20050930112129.19898.qmail@focomunicatii.ro>
	<Pine.LNX.4.61.0509301440560.19019@filer.marasystems.com>
	<20050930125427.28160.qmail@focomunicatii.ro>
	<200509300839.15330.rob0@gmx.co.uk>
	<Pine.LNX.4.61.0509301706580.24680@filer.marasystems.com>
	<4340D42B.2070106@india.tejasnetworks.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <4340D42B.2070106@india.tejasnetworks.com>
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

On Mon, Oct 03, 2005 at 12:18:11PM +0530, Aseem Rastogi wrote:
> i have been following this post rather keenly. it now seems to have died 
> down. but still i am not able to understand what is a vlan interface. 
> can somebody please give me some pointer where i can read about this. 
> vlan i thought is a l2 concept and should have nothing to do with l3.

http://en.wikipedia.org/wiki/Vlan might be a good start.

While VLANs are basically a layer 2 concept, you somehow need to reach
them from upper layers. This is accomplished by having "virtual
interfaces" which are "connected" to the VLAN and feel just like a
physical interface on a physical LAN from the software side.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
Nordisch by Nature |  How to make an American Quilt | Fax: *49 621 72739835

