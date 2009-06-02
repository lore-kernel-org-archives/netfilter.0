From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset nethash with cidr 32
Date: Tue, 2 Jun 2009 10:44:32 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0906021042280.11925@blackhole.kfki.hu>
References: <4A2362FE.7040905@vitek.tomsk.ru>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A2362FE.7040905@vitek.tomsk.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Victor Safronov <vitek@vitek.tomsk.ru>
Cc: netfilter@vger.kernel.org

On Mon, 1 Jun 2009, Victor Safronov wrote:

> What type of set should I use in ipset if i want to store in set both ip
> addresses and networks (with different prefixes)?
> nethash could be useful for me, but there are no possibility to add /32
> network (single ip).

There's no such a set type. But you can maintain one set for the network 
addresses, one for the IP addresses and create a setlist type of 
set with both "subsets" as members.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
