From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: IPSet Interface Matching
Date: Thu, 5 Jul 2012 23:30:00 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1207052328500.13360@blackhole.kfki.hu>
References: <20120705161958.aa3403ffc39ac5c4e041fa1d@nolatency.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120705161958.aa3403ffc39ac5c4e041fa1d@nolatency.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Vallaly <netfilter@nolatency.com>
Cc: netfilter@vger.kernel.org

On Thu, 5 Jul 2012, Michael Vallaly wrote:

> Not sure if this is a known issue/feature request for ipset and/or
> iptables not: 
> 
> Using ipset + iptables as follows:
> 
> <snip>
> ipset create newset hash:net,iface
> ipset add newset 192.168.0.0/24,eth+
>  
> ipset -L newset
> 
> Name: newset
> Type: hash:net,iface
> Header: family inet hashsize 1024 maxelem 65536 
> Size in memory: 17360
> References: 1
> Members:
> 192.168.0.0/24,eth+
> 
> iptables -I INPUT -m set --match-set newset dst,src -j ACCEPT
> 
> </snip>
> 
> I was expecting the above set match line to to be equivalent to:
> 
> "iptables -I INPUT -i eth+ -d 192.168.0.0/24 -j ACCEPT"
> 
> The rule set doesn't seem to match the interface names as I would
> expect (trying to match multiple eth adapters). 
> 
> Iptables docs seems to indicate 'If the interface name ends in a "+",
> then any interface which begins with this name will match.'
> 
> Is this expected behavior? 

ipset does not support interface pattern matching.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
