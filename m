From: "pigi" <pigi@pigi.org>
Subject: Re: Can't DROP spoofed packet. Bug or feature ?
Date: Mon, 6 Oct 2003 16:31:26 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <53468.212.239.118.101.1065450686.squirrel@www.frumar.it>
References: <52208.212.239.118.101.1065447313.squirrel@www.frumar.it>
    <1065448509.815.56.camel@elendil.intranet.cartel-securite.net>
Reply-To: pigi@pigi.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1065448509.815.56.camel@elendil.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

>
> Do you have rp_filters activated ? If so, packet is dropped at first
> routing point for kernel checks reverse path. Activate martians logging
> to confirm this :
>
> 	echo 1 > /proc/sys/net/ipv4/conf/all/log_martians
Thx for the reply.
Anyway this is the workaround, but I would like to DROP it in my rules if
possible, so the packet cannot reach the routing point in kernel.
Is this possible ?

Pigi


