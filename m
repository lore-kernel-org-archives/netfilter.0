From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Why does ipv6 enabled interfere with ipv4 SNAT?
Date: Wed, 26 Mar 2008 10:45:29 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0803261036220.3620@blackhole.kfki.hu>
References: <20080325012807.GA15637@transpect.com>
 <alpine.LNX.1.10.0803250254100.9368@fbirervta.pbzchgretzou.qr>
 <20080325024424.GA16089@transpect.com> <Pine.LNX.4.64.0803251156560.1535@blackhole.kfki.hu>
 <20080325142553.GA8783@transpect.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080325142553.GA8783@transpect.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Whit Blauvelt <whit@transpect.com>
Cc: Jan Engelhardt <jengelh@computergmbh.de>, netfilter@vger.kernel.org

On Tue, 25 Mar 2008, Whit Blauvelt wrote:

> > If you have got ethernet devices with MTU smaller than 1500, those won't 
> > support IPv6 and therefore don't show up in /proc/sys/net/ipv6/conf.
> 
> Interesting. But there is no difference between the MTU settings of eth2,
> eth3, eth4 and eth5 - in fact all four ports are on the same physical card.
> All the eth? devices are running at default of 1500. I've checked.

OK. That was a possibility which could have explained the difference in 
the interfaces.
 
> > Please check which modules are loaded in. Probably IPv4 NAT related 
> > modules are not auto-loaded. Also, is there any error message when you 
> > issue 'iptables -t nat ...' commands?
> 
> Josef, the set of iptables modules is precisely the same whether or not ipv6
> is enabled on the system (yes, I've looked). 

But which netfilter modules are loaded in? Again, there can be some 
auto-loading problem which we cannot figure out without the list of the 
modules. And as Patrick suggested: do you see the connections in 
/proc/net/nf_conntrack? Or you have got /proc/net/ip_conntrack instead?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
