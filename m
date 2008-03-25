From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Why does ipv6 enabled interfere with ipv4 SNAT?
Date: Tue, 25 Mar 2008 12:03:58 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0803251156560.1535@blackhole.kfki.hu>
References: <20080325012807.GA15637@transpect.com>
 <alpine.LNX.1.10.0803250254100.9368@fbirervta.pbzchgretzou.qr>
 <20080325024424.GA16089@transpect.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080325024424.GA16089@transpect.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Whit Blauvelt <whit@transpect.com>
Cc: Jan Engelhardt <jengelh@computergmbh.de>, netfilter@vger.kernel.org

On Mon, 24 Mar 2008, Whit Blauvelt wrote:

> I was mentioning where the mismatch was. Yeah the other stuff's there.
> 
> /proc/sys/net/ipv6/conf ends up with only:
> 
>    all default eth0 eth1 eth2 eth3 lo
> 
> while /proc/sys/net/ipv4/conf ends up (correctly) with:
> 
>    all default eth0 eth1 eth2 eth3 eth4 eth5 lo

If you have got ethernet devices with MTU smaller than 1500, those won't 
support IPv6 and therefore don't show up in /proc/sys/net/ipv6/conf.

> Not sure what you're thinking there. My problem wasn't with there being too
> many devices, but with two of the devices I actually have not being
> represented - and with Netfilter not doing _ipv4_ SNAT on account of
> something with _ipv6_. Why should Netfilter ipv4 code even _care_ about
> what's right or not with ipv6? Do you have any knowledge about
> interdependency there? 
> 
> > It still works with opensuse plus 2.6.23. Well, I suggest you
> > try a stock kernel.
> 
> It is a stock kernel, if by that you mean a stock distro kernel -
> Ubuntu's latest, 2.6.22-14-server. 

Please check which modules are loaded in. Probably IPv4 NAT related 
modules are not auto-loaded. Also, is there any error message when you 
issue 'iptables -t nat ...' commands?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
