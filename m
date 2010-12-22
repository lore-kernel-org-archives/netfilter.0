From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset 5: bug in parser for ipv6 when restoring
Date: Wed, 22 Dec 2010 12:28:56 +0100 (CET)
Message-ID: <alpine.DEB.2.00.1012221227200.3482@blackhole.kfki.hu>
References: <vmime.4d10d227.18e9.441b13464d8e58aa@raven.cosanostra.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <vmime.4d10d227.18e9.441b13464d8e58aa@raven.cosanostra.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Elie Rosenblum <fnord@cosanostra.net>
Cc: netfilter@vger.kernel.org

On Tue, 21 Dec 2010, Elie Rosenblum wrote:

> Entries added via ipset command line for ipv6 seem to work fine:
> ---example---
> blinky:/etc/ipsets# ipset create localnets-v6 hash:net family inet6
> blinky:/etc/ipsets# ipset add localnets-v6 fe80::/7
> blinky:/etc/ipsets# ipset list localnets-v6
> Name: localnets-v6
> Type: hash:net
> Header: family inet6 hashsize 1024 maxelem 65536
> Size in memory: 9348
> References: 0
> Members:
> fe00::/7
> ---end---
> 
> The problem occurs with restores:
> ---example---
> blinky:/etc/ipsets# ipset save localnets-v6 > tmpset
> blinky:/etc/ipsets# cat tmpset
> create localnets-v6 hash:net family inet6 hashsize 1024 maxelem 65536
> add localnets-v6 fe00::/7
> blinky:/etc/ipsets# ipset destroy localnets-v6
> blinky:/etc/ipsets# ipset restore < tmpset
> ipset v5.0: Error in line 1: Syntax error: cannot parse fe00::: resolving to IPv4 address failed
> ---end---

Thanks for the bugreport: it affected all IPv6 related restore operation 
and it's fixed in ipset 5.1.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
