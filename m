From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Redirect mirrored traffic to userspace app. [RESOLVED]
Date: Thu, 21 Oct 2010 19:41:53 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010211941210.22599@obet.zrqbmnf.qr>
References: <AANLkTikQLQ4J0+8-Ao5viwjQ4b4YCUDvuez3mKcf2EF7@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikQLQ4J0+8-Ao5viwjQ4b4YCUDvuez3mKcf2EF7@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mateus Caruccio <mateus@caruccio.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Thursday 2010-10-21 18:42, Mateus Caruccio wrote:

>In the end, we came with a very simple solution (no iptables/ip needed):
>
>>From DEVEL_SRV we ran:
>
># ifconfig eth1 PROD_SRV_IP netmask PROD_SRV_NETMASK promisc -arp hw
>ether PROD_SRV_HWADDR up
>
>That is it !
>
>All traffic targeted to PROD_SRV_IP is now being accepted by our
>mirrored eth1. Since this is an interface aimed to tests only, no
>matter what's being accepted.

It still looks wrong though. When using TEE, no expensive promiscous 
mode is required, nor are static ARP entries.
