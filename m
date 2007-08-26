From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: IPSET iptree problem
Date: Sun, 26 Aug 2007 15:12:12 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0708261505170.5050@blackhole.kfki.hu>
References: <C9039844-4303-4FD1-9704-41366AFF5884@stanford.edu>
	<op.txij6pdb343eys@comnetlap2.biuro.lan>
	<Pine.LNX.4.64.0708231523370.1184@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64.0708231523370.1184@blackhole.kfki.hu>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: =?iso-8859-2?B?o3VrYXN6IE5pZXJ5Y2izbw==?= <nofast@welnowiec.net>
Cc: netfilter@lists.netfilter.org

Hi,

On Thu, 23 Aug 2007, Jozsef Kadlecsik wrote:

>> After IPTREE_GC_TIME all is ok for some unknown period of
>> time, but finally this malfunction comes again.
>
> Thank you the reports, on the weekend I'll be able to debug it.
> Please stay tuned.

Hm, I'm unable to reproduce it. There *was* an endian-related bug in 
the iptree type, but even that could not cause such behaviour.

Please give a try to the upcoming release, which you can get
as http://ipset.netfilter.org/ipset-2.6.23-rc3.patch.

If you still see the bug, please do the following:

- recompile ipset in the kernel with debugging enabled, i.e. change

#if 0
#define IP_SET_DEBUG
#endif

   to

#if 1
#define IP_SET_DEBUG
#endif

   in <kernel-src>/include/linux/netfilter_ipv4/ip_set.h

- then after recompiling issue the following commands and report the
   resulted kernel logs:

# ipset -N viruses iptree --timeout 100
# ipset -A viruses 172.16.14.12
# ipset -T viruses 172.16.14.12
# ipset -T viruses 172.16.14.111
# ipset -n -L viruses

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
           H-1525 Budapest 114, POB. 49, Hungary

