From: "Nishit Shah" <nishit@elitecore.com>
Subject: RE: iphash vs iptreemap
Date: Thu, 19 Jun 2008 15:11:26 +0530
Message-ID: <000a01c8d1f0$a48d2990$eda77cb0$@com>
References: <002c01c8d1ea$7fd81840$7f8848c0$@com> <Pine.LNX.4.64.0806191119580.11904@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0806191119580.11904@blackhole.kfki.hu>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Jozsef Kadlecsik' <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org


Thanks Sir,

		Is it a way to find memory usage by both of them ?
		How much difference in terms of memory do we have ?

Rgds,
Nishit Shah.	

-----Original Message-----
From: Jozsef Kadlecsik [mailto:kadlec@blackhole.kfki.hu] 
Sent: Thursday, June 19, 2008 3:00 PM
To: Nishit Shah
Cc: netfilter@vger.kernel.org
Subject: Re: iphash vs iptreemap

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

