From: Patrick McHardy <kaber@trash.net>
Subject: Re: iptables and ip_conntrack_tuple.h compile fix
Date: Tue, 01 Feb 2005 14:18:50 +0100
Message-ID: <41FF81BA.5020208@trash.net>
References: <Pine.LNX.4.58.0502011255020.24684@cj.onrc.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.58.0502011255020.24684@cj.onrc.ro>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tompa Septimius Paul <subzero@cj.onrc.ro>
Cc: linux-kernel@vger.kernel.org, netfilter@lists.netfilter.org

Tompa Septimius Paul wrote:

>Hi,
>
>I try to recompile iptables iptables-1.2.11 with kernel 2.6.11-rc2
>(and mm2) running and I don't succeed. It complains about
>/usr/src/linux/include/linux/netfilter_ipv4/ip_conntrack_tuple.h
>after this small changes iptables is compiling again.
>  
>
I just added a similar patch from Pablo Neira to my tree.

Regards
Patrick
