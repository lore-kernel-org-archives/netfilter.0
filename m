From: "Jet" <yenjet.chan@eglobal.com.my>
Subject: Re: How to nat a full subnet ?
Date: Mon, 12 May 2003 21:44:04 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005701c3188c$8dc87ac0$1cc8c80a@dolphin>
References: <1052642696.17942.14.camel@charlebourg-2-81-57-105-138.fbx.proxad.net> <1052650980.699.4.camel@laurent.luyckx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Laurent Luyckx <lololuy@tiscali.be>, Francois LE BOURDELLES <flebourdelles@free.fr>
Cc: netfilter@lists.netfilter.org

Do I've to create any ARP entry for the external IP address range for this
to work?

- Jet

Laurent Luyckx <lololuy@tiscali.be> wrote:
> Have look a the NETMAP patch from p-o-m.
> It creates a static 1:1 mapping of the network address.
>
> (http://www.netfilter.org/documentation/pomlist/pom-combined.html#NETMAP)
>
> Cheers.
>


