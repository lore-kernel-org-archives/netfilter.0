From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset nethash with cidr 32
Date: Fri, 10 Jul 2009 10:49:53 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.0907101040280.25581@blackhole.kfki.hu>
References: <4A2362FE.7040905@vitek.tomsk.ru> <alpine.DEB.2.00.0906021042280.11925@blackhole.kfki.hu> <4A562A32.1050006@vitek.tomsk.ru>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A562A32.1050006@vitek.tomsk.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Victor A. Safronov" <vitek@vitek.tomsk.ru>
Cc: netfilter@vger.kernel.org

On Fri, 10 Jul 2009, Victor A. Safronov wrote:

> Jozsef Kadlecsik wrote:
> > You can maintain one set for the network addresses, one for the IP addresses
> > and create a setlist type of set with both "subsets" as members.
> Now I have a trouble with 'setlist'.
> For example:
> [root@tomgate /]# ipset -N pool1 ipmap --network 192.168.0.0/24
> [root@tomgate /]# ipset -A pool1 192.168.0.1
> [root@tomgate /]# ipset -N myset setlist
> [root@tomgate /]# ipset -A myset pool1
> [root@tomgate /]# ipset -T pool1 192.168.0.1
> 192.168.0.1 is in set pool1.
> [root@tomgate /]# ipset -T pool1 192.168.0.2
> 192.168.0.2 is NOT in set pool1.
> [root@tomgate /]# ipset -T myset 192.168.0.1
> 192.168.0.1 is in set myset.
> [root@tomgate /]# ipset -T myset 192.168.0.2
> 192.168.0.2 is in set myset.
> [root@tomgate /]# ipset -T myset stupidgarbage
> stupidgarbage is in set myset.
> 
> When testing my setlist I always get "is in set".
> I suppose that is not normal.

Good catch: the error code returned by the kernel is incorrect and 
misinterpreted by 'ipset'.

But I have to add that it is not possible to test the elements of a subset 
by 'ipset' currently: you can test the sets, but not the elements of the 
sets. I.e. one can issue

ipset -T setlist0 setname-from-setlist0

but 

ipset -T setlist0 element-from-setname-from-setlist0

won't work. The current syntax and protocol of ipset does not make 
possible such "fine-grained" testing from userspace.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
