From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset & iptables
Date: Wed, 1 Feb 2012 19:52:05 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1202011948160.24072@blackhole.kfki.hu>
References: <1328113968.13053.18.camel@ns014530.dcyb.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1328113968.13053.18.camel@ns014530.dcyb.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Cc: netfilter@vger.kernel.org

On Wed, 1 Feb 2012, Rob Sterenborg (lists) wrote:

> I have problems matching an ipset set using iptables. My configuration
> is as follows:
> 
> # uname -r
> 2.6.39.1
> 
> # iptables -V
> iptables v1.4.12.2
> 
> # ipset -V
> ipset v6.11, protocol version: 6
> 
> The following 3 commands are executed immediately after each other:
> 
> # ipset create TEST hash:ip
> # ipset add TEST 127.0.0.5
> # iptables -A INPUT -m set --match-set TEST src
> iptables: No chain/target/match by that name.
> 
> # lsmod|grep set
> ip_set_hash_net        15884  3 
> ip_set_hash_ip         13584  2 
> ip_set                 19151  2 ip_set_hash_net,ip_set_hash_ip
> nfnetlink               3191  2 nf_conntrack_netlink,ip_set

You haven't got the "set" match kernel module, I guess

grep CONFIG_NETFILTER_XT_SET /boot/config-2.6.39.1

returns

# CONFIG_NETFILTER_XT_SET is not set

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
