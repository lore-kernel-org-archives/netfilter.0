From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack: how to handle child process's NETLINK_NETFILTER
Date: Sun, 08 May 2011 18:47:02 +0200
Message-ID: <4DC6C906.2070605@netfilter.org>
References: <87ei4azdfs.wl%chamas@h4.dion.ne.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <87ei4azdfs.wl%chamas@h4.dion.ne.jp>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ken-ichirou MATSUZAWA <chamas@h4.dion.ne.jp>
Cc: netfilter@vger.kernel.org

On 07/05/11 18:24, Ken-ichirou MATSUZAWA wrote:
> There is linux box which has two NICs. one for nomal usage, another is
> connected to mirrored port of network equipment (like L2/L3 switch).
> eth1 is connected to mirrored port.
[...]
> I think this let us implement netflow probe easy, without libpcap.

It should be hard to make a patch for the kernel to drop all the packets
after the last conntrack hook. Thus, the conntrack subsystem and ulogd2
can be used for flow-accounting in mirrored port configurations.

Let me know if this is what you want, it really took me a while to
understand what you want from your email.
