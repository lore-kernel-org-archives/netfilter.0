From: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [ANNOUNCE] ipset 6.2 released
Date: Tue, 29 Mar 2011 23:44:07 +0400
Message-ID: <4D923687.6030003@msgid.tls.msk.ru>
References: <alpine.DEB.2.00.1103272124170.3535@blackhole.kfki.hu> <4D91E7D7.3070000@msgid.tls.msk.ru> <alpine.DEB.2.00.1103292123001.8329@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1103292123001.8329@blackhole.kfki.hu>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

29.03.2011 23:23, Jozsef Kadlecsik wrote:
> On Tue, 29 Mar 2011, Michael Tokarev wrote:
> 
>> ipset-6.2/kernel/net/netfilter/ipset/Kconfig file
>> appears to be some net/netfilter/Kconfig file from
>> linux source tree (from one directory level up),
>> patched with NETFILTER_XT_SET.  It gets included
>> into itself recursively.
> 
> Yes, you are right, I fixed it in the ipset git tree. Thanks!

Actually I'm not sure at all this file is needed.

With current Kbuild file, it builds everything as
modules, the only CONFIG_FOO in use is IP_SET_MAX
which can be specfied in the upper-level Kconfig
(in net/netfilter/Kconfig).

Besides, what's the intention of CONFIG_IP_SET
vs CONFIG_NETFILTER_XT_SET?

Thanks!

/mjt
