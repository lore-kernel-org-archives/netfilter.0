From: Andreas Herz <andi@geekosphere.org>
Subject: Re: [ANNOUNCE] ipset 6.16.1 released
Date: Wed, 9 Jan 2013 14:48:04 +0100
Message-ID: <20130109134804.GL31644@workstation>
References: <alpine.DEB.2.00.1211271510180.15929@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.00.1211271510180.15929@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On 27/11/12 at 15:16, Jozsef Kadlecsik wrote:
> I'm happy to announce ipset 6.16.1. The most important part is the patch 
> from Florian Westphal, which fixes netiface set name overflow in the 
> kernel. The RCU handling of the automating increase of the maximal sets 
> feature introduced in 6.15 is also fixed.

It works fine on new machines, but i got this compiler error with some
older system:

In file included from
/usr/src/redhat/BUILD/ipset-6.16.1/kernel/net/netfilter/ipset/ip_set_hash_ip.c:115:

/usr/src/redhat/BUILD/ipset-6.16.1/kernel/include/linux/netfilter/ipset/ip_set_ahash.h:
In function `hash_ip4_add':

/usr/src/redhat/BUILD/ipset-6.16.1/kernel/include/linux/netfilter/ipset/ip_set_ahash.h:448:
sorry, unimplemented: inlining failed in call to 'hash_ip4_data_next':
function body not available

/usr/src/redhat/BUILD/ipset-6.16.1/kernel/include/linux/netfilter/ipset/ip_set_ahash.h:489:
sorry, unimplemented: called from here

make[3]: ***
[/usr/src/redhat/BUILD/ipset-6.16.1/kernel/net/netfilter/ipset/ip_set_hash_ip.o]
Error 1

gcc version 3.4.5 20051201 (Red Hat 3.4.5-2)

Yes it's old and i know gcc update may fix this. But still, is there
another way to fix it? removing the "inline" in front of
type_pf_data_next resolves it somehow as it's compiling through and
seems to work just fine. It "just" results in this warning:

/usr/src/redhat/BUILD/ipset-6.16.1/kernel/include/linux/netfilter/ipset/ip_set_ahash.h:448:
warning: 'hash_ip4_data_next' declared inline after being called

/usr/src/redhat/BUILD/ipset-6.16.1/kernel/include/linux/netfilter/ipset/ip_set_ahash.h:448:
warning: previous declaration of 'hash_ip4_data_next' was here

thanks so far.

-- 
Andreas Herz
