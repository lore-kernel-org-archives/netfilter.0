From: Fabio Marcone <fabio.marcone@duet.it>
Subject: Re: postrouting and mac address
Date: Tue, 21 Jul 2009 15:24:51 +0200
Message-ID: <4A65C1A3.30902@duet.it>
References: <4A65AF17.70002@duet.it> <c7a3bdd5fcb7f7152ae1a453651aa9d1@localhost> <4A65BE5F.4090007@duet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A65BE5F.4090007@duet.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I tried to add this debug rule:
iptables -t mangle -A POSTROUTING -o eth0 -m mac --mac-source 
00:e0:7d:ec:96:1b -j LOG --log-prefix "POST_MAC "

but I got this error:
ip_tables: mac match: bad hook_mask 0x10/0x7

so I can't recognize packets by mac source in postrouting chain, isn't it?

Fabio


Fabio Marcone wrote:
> Hi!
> there was a misunderstanding: "filter" I mean "recognize". I don't 
> want to drop packets in postrouting, I know it is impossible, but I 
> need to recognize in postrouting packet of a certain source (by mac 
> address, not by ip).
>
> I don't know when packets source mac address is modified by router.
>
> Thanks,
> Fabio

