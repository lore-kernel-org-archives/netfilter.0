From: "Nishit Shah" <nishit@elitecore.com>
Subject: RE: iphash vs iptreemap
Date: Thu, 19 Jun 2008 15:55:25 +0530
Message-ID: <000f01c8d1f6$c98a1950$5c9e4bf0$@com>
References: <002c01c8d1ea$7fd81840$7f8848c0$@com> <Pine.LNX.4.64.0806191119580.11904@blackhole.kfki.hu> <000a01c8d1f0$a48d2990$eda77cb0$@com> <Pine.LNX.4.64.0806191144130.11904@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0806191144130.11904@blackhole.kfki.hu>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Jozsef Kadlecsik' <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

Hi,
	Can you suggest me guidelines for doing the same (i.e which things
to look out while tests are running or type of tests)? 
      can /proc/slabinfo help to identify the memory usage ?

	Also, what is significant of --gc parameter in iptreemap ?
	Does it make difference in testing ? 

Rgds,
Nishit Shah

-----Original Message-----
From: Jozsef Kadlecsik [mailto:kadlec@blackhole.kfki.hu] 
Sent: Thursday, June 19, 2008 3:27 PM
To: Nishit Shah
Cc: netfilter@vger.kernel.org
Subject: RE: iphash vs iptreemap

On Thu, 19 Jun 2008, Nishit Shah wrote:

> 		Is it a way to find memory usage by both of them ?
> 		How much difference in terms of memory do we have ?

Both could be figured out by testing only, which as far as I know hasn't 
been done by anyone.

This reminds me to add statistics parameters to the next version of ipset 
in order to get the required data easily...

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

