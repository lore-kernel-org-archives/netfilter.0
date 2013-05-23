From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset and hash:net,port,net set
Date: Thu, 23 May 2013 22:55:26 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1305232253250.4176@blackhole.kfki.hu>
References: <C662177C398FC342AAE60CBE7593707D107DC4A7@ICTS-S-MBX3.luna.kuleuven.be>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <C662177C398FC342AAE60CBE7593707D107DC4A7@ICTS-S-MBX3.luna.kuleuven.be>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wim Vandersmissen <Wim.Vandersmissen@kuleuven.be>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Thu, 23 May 2013, Wim Vandersmissen wrote:

> I?m redesigning our firewall to use as much as ipset as possible 
> instead. (great tool) But we have rules that allow a specific source 
> range to some ports for a specific destination range. So the one type of 
> set I?m missing at the moment is hash:net,port,net Of course I could put 
> this in hash:ip,port,net but the hash would get rather big when using 
> /16?s

That'd need a new lookup/storage method: the current hash type is not 
appropriate for such lookups, would be too slow.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
