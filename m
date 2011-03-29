From: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [ANNOUNCE] ipset 6.2 released
Date: Tue, 29 Mar 2011 18:08:23 +0400
Message-ID: <4D91E7D7.3070000@msgid.tls.msk.ru>
References: <alpine.DEB.2.00.1103272124170.3535@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1103272124170.3535@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

27.03.2011 23:30, Jozsef Kadlecsik wrote:
> Hi,
> 
> I'm happy to announce ipset 6.2.

ipset-6.2/kernel/net/netfilter/ipset/Kconfig file
appears to be some net/netfilter/Kconfig file from
linux source tree (from one directory level up),
patched with NETFILTER_XT_SET.  It gets included
into itself recursively.

Thanks!

/mjt
