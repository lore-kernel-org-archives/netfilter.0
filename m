From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Strange behavior with ipset not matching on public range
Date: Mon, 27 May 2013 20:13:38 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1305272011390.13657@blackhole.kfki.hu>
References: <1369662135.4058.24.camel@BEWS005.euractiv.com>  <alpine.DEB.2.00.1305271548390.11760@blackhole.kfki.hu> <1369665896.4058.29.camel@BEWS005.euractiv.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1369665896.4058.29.camel@BEWS005.euractiv.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jimmy Thrasibule <thrasibule.jimmy@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, 27 May 2013, Jimmy Thrasibule wrote:

> > What is your ipset version? You should post iptables rules in 
> > iptables-save format...
> 
> # ipset -V
> ipset v6.12.1, protocol version: 6
> 
> And here are the rules corresponding to my previous iptables output:
> 
> -A FW_OUT -p icmp -j CTRLOUT
> -A FW_OUT -m set --match-set fw_iface_all src,dst  -j FW_OUT_common   # Match
> -A FW_OUT -m set --match-set fw_iface_pub src,dst  -j FW_OUT_pub      # No match
> -A FW_OUT -o eth1 -s 217.x.x.122/32 -d any/0 -j FW_OUT_pub            # Match
> -A FW_OUT -m set --match-set fw_iface_priv src,dst -j FW_OUT_priv     # Match
> -A FW_OUT -m comment --comment "EOF" -j DROP

I think you should upgrade: some drivers doesn't zero pad interface names 
and than can fool ipset up to 6.12.1. It was fixed in 6.13.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
