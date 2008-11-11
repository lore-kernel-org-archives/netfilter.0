From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset, when to use iptree?
Date: Tue, 11 Nov 2008 11:51:29 +0100 (CET)
Message-ID: <alpine.DEB.2.00.0811111127050.6034@blackhole.kfki.hu>
References: <7259d7020811100857h45ae4116o714723e5282c4e6@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7259d7020811100857h45ae4116o714723e5282c4e6@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JC Janos <jcjanos245@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, 10 Nov 2008, JC Janos wrote:

> What's the basis for choosing between ipset's iphash and iptree set types?
> 
> I'm guessing it's performance, but I'm not understanding the
> difference from the man page.

The iptree type gives you the ability to add elements to the set together 
with a timeout value. That's all :-). It's very hard to compare iphash to 
iptree: the performance and the memory usage depend on the hash parameters 
and the input data as well.

If you use a set to catch attackers, in theory, iptree can be weaker than 
iphash: by properly generated IP addresses the attacker can make te tree 
wide and sparse (every branch has got a single sub-branch and that has got 
a single leaf). The iphash type is robust against such attacks, but in a 
hash collisions always happen so iphash will have got holes as well.

> When to use which?

I can give you only generic guidelines: if you want entries to be timed 
out automatically, without using any external book-keeping, then go with 
iptree. If you have got a static IP address collection which consists of 
several (full/not full) different subnets and possibly some other 
addresses from here and there, then go with iptree again. Otherwise use 
iphash.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
