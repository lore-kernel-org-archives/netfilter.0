From: Tore Anderson <tore.anderson@redpill-linpro.com>
Subject: Re: Choices for virtual IP failover (was Re: Firewall in Load Balance
 - Active/Active)
Date: Mon, 25 May 2009 16:58:50 +0200
Message-ID: <4A1AB22A.60807@redpill-linpro.com>
References: <3e7107590905250446g2f3aa95dua9691dc63cc3dfec@mail.gmail.com>	 <4A1A9756.6040401@netfilter.org>	 <3e7107590905250635w5c3b78a6m59acf268b5d57a5@mail.gmail.com> <1243260797.11783.29.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1243260797.11783.29.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Jacob <jacob@internet24.de>
Cc: Eduardo Sachs <edu.sachs@gmail.com>, netfilter@vger.kernel.org

Hi,

* Thomas Jacob

> Keepalived does not have IPv6 support (yet, VRRP for IPv6 is fairly
> recent) but otherwise provides all the features and also can watch
> the link states of network devices. The major drawback is that it also
> has a IPVS module which is printing harmless error messages when the
> underlying kernel doesn't support IPVS but I suppose you could prevent
> that if you'd compile keepalived yourself.

I knowthat keepalived has a command line option to only start the VRRP
parts of the code (-P).  Perhaps that will silence the warnings?

The lack of IPv6 support is something I miss, too.  I plan to deal with
it by adding/removing the HA IPv6 addresses from shell scripts ithat
runs when the state changes (the settings notify_{master,backup,fault}).
I didn't try it yet but I see no reason why it wouldn't work.  You'll
need to piggy-back it on an IPv4 VIP though (just use dummy addresses
from 169.254.0.0/16 or RFC1918 space for single-stack IPv6 networks).

> Finally the problem with all these implementations is that they don't
> support virtual MAC addresses in the way VRRP is usually provides
> by router vendors and thus have to send gratuitous ARP requests
> to inform their networks about the new MAC address after a failover.

I think this is due to a limitation in the Linux kernel - it is simply
not possible to have a multiple unicast layer-2 addresses assigned to a
single network interface.  Go bug the people on netdev - I'm sure
keepalived will support VMAC immediately after the necessary kernel
changes have been made.

BR,
-- 
Tore Anderson
Redpill Linpro AS - http://www.redpill-linpro.com/
