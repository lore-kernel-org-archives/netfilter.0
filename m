From: "Jee J.Z." <jz105@york.ac.uk>
Subject: Re: ipq_read and NF_ACCEPT
Date: Tue, 1 Jun 2004 14:31:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002501c447dc$c0b9dd40$68892090@grouse>
References: <OF05930183.BCDDA269-ON65256EA6.0044B86F@hss.hns.com>
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
To: aksingh@hss.hns.com
Cc: netfilter@lists.netfilter.org

Hi Amit,

Sounds strange, and seems similar to one of my previous problems: packets
caught by libipq, modified, and reinjected by libnet, bypass the POST
ROUTING hook. (I suppose your modified dst address is not of the local
machine, otherwise the routing process will pass the packets back to the
LOCAL IN hook without going to POST ROUTING I think.) And are you sure these
modified packets are sent to the wire?

Jee

>
>
> hi,
>
>    i have made an application that reads using libipq functions, and a
> kernel module which delivers packet to it. I catch packets originating
from
> the local machine, and in my user space libipq application i change the
> packet (that i get using ipq_read), set its mark field, change src/dest
and
> then finally return a return code of NF_ACCEPT,
>    so this changed packet should go back to the kernel right ?, (this
>    packet i had caught in local_out hook).
>    Once i inject this packet, i expect the same apcket(with changed ip and
>    all) to hit post routing, so in my post routing hook function i wait
for
>    a packet with skb->nfmark==some value, but this packet doesnt seem to
be
>    getting caught at post_routing ??
>
> any clues ?
>
> thanks
> Amit
>
>


