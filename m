From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Ipset counters question
Date: Wed, 30 Mar 2011 22:17:30 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1103302215160.12949@blackhole.kfki.hu>
References: <4D91B511.3040005@univ-nantes.fr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D91B511.3040005@univ-nantes.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean-Philippe Menil <jean-philippe.menil@univ-nantes.fr>
Cc: netfilter@vger.kernel.org

On Tue, 29 Mar 2011, Jean-Philippe Menil wrote:

> basiclly, i'm working on a captive portal, who add some rules in
> PRE/POSTROUTING mangle table when a user is fully authenticated.
> $IPTABLES -t mangle -N OUT-AUTH
> $IPTABLES -t mangle -A PREROUTING -j OUT-AUTH
> $IPTABLES -t mangle -N IN-AUTH
> $IPTABLES -t mangle -A POSTROUTING -j IN-AUTH
> 
> and the following rules are append when an user is authenticate:
> $IPTABLES -t mangle -A OUT-AUTH -s $IP -m mac --mac-source $IP -j MARK
> --set-mark 10
> $IPTABLES -t mangle -A IN-AUTH -d $IP -j ACCEPT
> 
> I dicovered ipset, and begin to play with it.
> If my understand of is correct, i can add:
> 
> ipset -N TEST macipmap --network 192.168.100.0/24
> $IPTABLES -t mangle -A IN-AUTH -m set --set TEST src,dst -j ACCEPT
> $IPTABLES -t mangle -A OUT-AUTH -m set --set TEST src,dst -j MARK --set-mark
> 10

The set match for the bitmap:ip,mac (macipmap) type can check the *source* 
MAC address only. It is documented in the manpage.
 
Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
