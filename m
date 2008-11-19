From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: When is ipset's "resize 0" used?
Date: Wed, 19 Nov 2008 09:48:10 +0100 (CET)
Message-ID: <alpine.DEB.2.00.0811190940320.22082@blackhole.kfki.hu>
References: <7259d7020811182034m16f47786rcb0e0805767b05ca@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <7259d7020811182034m16f47786rcb0e0805767b05ca@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JC Janos <jcjanos245@gmail.com>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Tue, 18 Nov 2008, JC Janos wrote:

> >From the ipset "tips & examples" ,
> 
>   If you want a fixed size iphash type of set, then define it with
> zero valued resize parameter:
>   ipset -N foo iphash --resize 0
> 
> Would this be used for a constant/unchanging ipset, e.g. containing 25
> IPs that won't be addded to or changed dynamically?  Similar to
> OpenBSD's pf "const" table construct,
> 
>   table <XXX> const { ip1, ip2, ..., ipN }

No, of course not: you are free to add or delete entries from a fixed size 
hash anytime.
 
> Also, Does hashsize literally correspond to # of entries?  So, 25
> entries would need only hashsize=25?

No, not at all. It can easily happen that in spite of having free slots in 
the hash those cannot be used: the hash value computed from the elemet to 
be stored points to a hash slot already occupied. So if you want to store 
exactly 25 elements in a fixed size hash, do not set hashsize to 25 but 
something larger, say 30. Experiment! :-)

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
