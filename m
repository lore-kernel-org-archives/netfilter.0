From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: IP set and match skiping
Date: Sun, 3 Oct 2010 21:19:08 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1010032115110.26617@blackhole.kfki.hu>
References: <87bp7beioq.fsf@hati.baby-gnu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <87bp7beioq.fsf@hati.baby-gnu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Dehennin <daniel.dehennin@baby-gnu.org>
Cc: netfilter@vger.kernel.org

On Sun, 3 Oct 2010, Daniel Dehennin wrote:

> I want to avoid duplication, I have one ipporthash for my DMZ services
> (behind a NAT) and would like to be able to skip some tests or fix one
> argument:
> 
> ipset -N dmz-services ipporthash --network 10.1.1.0/24
> ipset -A dmz-services 10.1.1.2,www
> ipset -A dmz-services 10.1.1.2,smtp
> ipset -A dmz-services 10.1.1.2,ssh
> 
> # DNAT by server
> # Match only ports 
> iptables -t nat -A PREROUTING -i internet -m set --match-set dmz-services skip,dst -j DNAT 10.1.1.2
> 
> Another this if several dmz servers hosts different services:
> 
> # Add a new service for a new host
> ipset -A dmz-services 10.1.1.3,kerberos
> 
> # Match services hosted on 10.1.1.2
> iptables -t nat -A PREROUTING -i internet -m set --match-set dmz-services 10.1.1.2,dst -j DNAT 10.1.1.2
> # Match services hosted on 10.1.1.3
> iptables -t nat -A PREROUTING -i internet -m set --match-set dmz-services 10.1.1.3,dst -j DNAT 10.1.1.3
> 
> Is it a possible-to-add feature?

No, that's not possible. The internal lookup methods do not support such 
wildcards.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
