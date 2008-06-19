From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: iphash vs iptreemap
Date: Thu, 19 Jun 2008 11:30:27 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0806191119580.11904@blackhole.kfki.hu>
References: <002c01c8d1ea$7fd81840$7f8848c0$@com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <002c01c8d1ea$7fd81840$7f8848c0$@com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nishit Shah <nishit@elitecore.com>
Cc: netfilter@vger.kernel.org

Hi,

On Thu, 19 Jun 2008, Nishit Shah wrote:

> 	If I have list of only IP Addresses, which set type is better to use
> in terms of Matching speed and memory ? iphash or iptreemap ?

Good questions! I'd say iptree(map) is faster. But if the IP addresses are 
random, then iphash can use less memory than iptree(map), if the probes 
parameter of the hash is small.

> 	Does the decision depends of number of IP Addresses ?

Not really, the number of addresses are a neutral factor. But if you 
create an iphash with small hashsize (compared to the IP addresses 
planned to store), it can be slow when adding the IP addresses due to 
rehashing if it has to grow the hash. 

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
