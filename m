From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Process iptables hook functions at IP layer with 'bridge-nf-call-iptables"
 enabled
Date: Tue, 26 Oct 2010 12:40:57 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010261221010.18331@obet.zrqbmnf.qr>
References: <AANLkTimFED68sGH=3Uh801y_kdGuEX+2Sa-=XMSfnP=V@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimFED68sGH=3Uh801y_kdGuEX+2Sa-=XMSfnP=V@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Huang <daviseago@gmail.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2010-10-26 07:38, Wei Huang wrote:
>
>I'm writing a kernel module with a netfilter hook functions at
>NF_IP_PRE_ROUTING of PF_INET. This is supposed to be processed at IP
>layer. However, when using ebtables' bridge-nf and enable
>"/proc/sys/net/bridge/bridge-nf-call-iptables", my hook function will
>be processed at link layer.

Hook functions won't be processed "at a place". It does not matter
where from it is called; NFPROTO_{IPV4,IPV6,ARP} hooks are always
executed under the same condition - the bridge code replicates code
from ip_rcv to ensure this.

>The page http://ebtables.sourceforge.net/br_fw_ia/br_fw_ia.html#section3 says:
>"For IP packets that get into contact with the bridging code, the
>br-nf code will decide in which place in the network code the iptables
>chains will be traversed. Obviously, it is guaranteed that no chain is
>traversed twice by the same packet."
>Does this mean the iptables are handled at bridge-nf (NF_HOOK in
>br_nf_pre_routing()), and ignored at NF_HOOK in ip_rcv()?

No. All (prerouting, postrouting) hooks would basically be run
many times. If I counted right,

For the bridge tap:

1. br_netfilter.c:br_nf_pre_routing_ipv6 invoking
   NF_HOOK(NFPROTO_IPV6, NF_INET_PRE_ROUTING)

2. br_input.c:br_pass_frame_up invoking netif_receive_skb

For the ipv4 tap:

3. net/core/dev.c:netif_receive_skb

Which is why, for a bridge setup, the enslaved devices usually
do not have an address assigned so that (3) won't happen.

To skip (2), br_input.c uses ip_sabotage_in.

>If the IP pakcets will be passed up to IP layer anyway, will it be
>better for bridge-nf not to call iptable hook functions, but to let
>the packets be processed at IP layer?

If you had a packet that would only be bridged, iptables would never
be invoked at all, and people would lose functionality they currently
have.
