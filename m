From: "Jee J.Z." <jz105@york.ac.uk>
Subject: Re: NF_DROP and NF_STOLEN
Date: Tue, 20 Apr 2004 13:27:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003f01c426d2$d0e40a90$68892090@grouse>
References: <OF50CBECB4.85BBAC0F-ON65256E7C.001EDCC8@hss.hns.com>
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

Hi,

> hi
>
> Though I am a netfilter newbee too, i feel there is some difference
between
> NF_DROP and NF_STOLEN ... if a NF_DROP is returned, its the responsibility
> of the kernel to drop the packet and free its sk_buff ... where as if a
> NF_STOLEN is returned then the registered module(the hook fn or whatever)
> takes the responsibility of the packet from there on, the kernel in this
> case does not free the sk_buff, its now the responsibility of the
> registered module to play with the packet and when done finally call
> free(sk_buff).

OK, thanks. So can I say from the userspace aspect, there's no difference
between setting NF_DROP and NF_STOLEN; but for the kernel aspect, there will
be more and more packets piled up in the skb buffer if we always set
NF_STOLEN from userspace. (?)

Jee

> Amit
>
>
>
>
> "Jee J.Z." <jz105@york.ac.uk>@lists.netfilter.org on 04/19/2004 11:39:25
PM
>
> Sent by:    netfilter-admin@lists.netfilter.org
>
>
> To:    <netfilter@lists.netfilter.org>
> cc:
>
> Subject:    NF_DROP and NF_STOLEN
>
>
> Hi all,
>
> Could anybody let me know what actual difference the targets NF_DROP and
> NF_STOLEN make to the kernel? As far as I know, both of them tell the
> kernel
> to forget the packet. In "Linux netfilter Hacking HOWTO", it says NF_DROP
> tells netfilter to drop the packet, and NF_STOLEN tells netfilter that the
> registered module has taken over the packet. I don't fully understand what
> the module can do to the packet by taking over it and how.
>
> Can anyone be kind enough to explain this or show me an example that a
> module takes over packets and does something to them?
>
> Thanks a lot in advance!
>
> Regards,
> Jee
>
>
>
>
>


