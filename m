From: Denys Fedoryshchenko <denys@visp.net.lb>
Subject: Re: ipset, =?UTF-8?Q?IP=36=5FNF=5FIPTABLES?=
Date: Tue, 17 May 2011 19:55:25 +0300
Message-ID: <64614d657f8b9c38d783b2e2ecea1fc0@visp.net.lb>
References: <ffc7edfebc6396f9754b6327b0523d27@visp.net.lb>
 <alpine.DEB.2.00.1105171831430.1545@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1105171831430.1545@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

 On Tue, 17 May 2011 18:34:34 +0200 (CEST), Jozsef Kadlecsik wrote:
> On Tue, 17 May 2011, Denys Fedoryshchenko wrote:
>
>> I am using IPv4-only kernel, and getting
>> "The kernel build directory 
>> /lib/modules/2.6.39-rc7-git4-devel2/build is not
>> configured with IP6_NF_IPTABLES support"
>> while compiling latest ipset 6.5 (and previous version 6.4 too)
>> Is there any way to compile ipset without IPv6?
>
> Could you write down exactly what do you do, which results in the 
> message
> above?
>
> I disabled IPv6 in the kernel source tree (not exactly the same one 
> as
> yours) and running "make modules" in the ipset source tree ran 
> without any
> error message.
>
 libmnl-1.0.1 installed

 wget http://ipset.netfilter.org/ipset-6.5.tar.bz2
 tar jxf ipset-6.5.tar.bz2
 cd ipset-6.5
 ./autogen.sh
 ./configure
 checking build system type... i686-pc-linux-gnu
 checking host system type... i686-pc-linux-gnu
 checking for a BSD-compatible install... /usr/bin/install -c
 checking whether build environment is sane... yes
 checking for a thread-safe mkdir -p... /bin/mkdir -p
 checking for gawk... gawk
 checking whether make sets $(MAKE)... yes
 checking for grep that handles long lines and -e... /bin/grep
 configure: error: The kernel build directory 
 /lib/modules/2.6.39-rc7-git4-devel2/build is not configured with 
 IP6_NF_IPTABLES support (ip6tables)

 P.S. By the way, I don't need modules, i am using latest kernel where 
 ipset is embedded in kernel.

