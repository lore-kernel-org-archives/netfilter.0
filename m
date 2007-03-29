From: "=?ISO-8859-1?Q?Isma=EBl_BALLO?=" <isma.ballo@gmail.com>
Subject: Re: [ipset] Minor non-blocking "sleep" bugs
Date: Thu, 29 Mar 2007 15:16:02 +0200
Message-ID: <513bde910703290616t5f0b4b92m1caedb1da3dcddfc@mail.gmail.com>
References: <513bde910703270005q2fe38dddp6ed5a4233a2c1c5d@mail.gmail.com>
	<513bde910703270656k3125b5bl1c20d063c622e45a@mail.gmail.com>
	<Pine.LNX.4.64.0703281855530.13447@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=hqUAy5WAGqenIaSf0G80pBlKZ9kqfDArGffwBeFJVUijKetr8L4G9qUN1MO5eNjheJaP41FmTzj21t82AXsfEgxFF07oSbfEZCNbve0zVNszJr32GNm71Cp9/VENIXb5DWctrO8f1zszjqStNJdsutNoJarTWW/Yc+LTOxDeKI4=
In-Reply-To: <Pine.LNX.4.64.0703281855530.13447@blackhole.kfki.hu>
Content-Disposition: inline
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,
Thanks for the reply Jozsef.

The compilation fails unless you put
u_int32_t  min_ip, max_ip; (instead of  __be32 )
in  KERNEL_DIR/ include/linux/netfilter_ipv4/ipt_iprange.h

But I have an other pb.
When I want to flush and delete all rules.
(after ipset -U :all: :all: ; ipset -F ; ipset -X and iptables -D <on
appropriate rules using sets >)

Sometimes, references stays on some sets.

How can I really destroy them ?

Thanks in advance

2007/3/28, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>:

> On Tue, 27 Mar 2007, Isma=EBl BALLO wrote:
>
> > I use ipset 2.2.9a on kernel 2.6.19.7 compiled (from kernel.org) with
> > these options
> > (iptables 1.3.6)
> > I have a minor bug (non blocking) when I load ipsets ( it seems it
> > happens when I have a large numbers of bindings)
> >
> > Mar 23 14:45:10 fwa01 kernel: BUG: sleeping function called from
> > invalid context at mm/slab.c:3007
> > Mar 23 14:45:10 fwa01 kernel: in_atomic():1, irqs_disabled():0
> > Mar 23 14:45:10 fwa01 kernel:  [<c0158e6c>] kmem_cache_alloc+0x1b/0x55
> > Mar 23 14:45:10 fwa01 kernel:  [<f89a77b8>] ip_set_hash_add+0xe7/0x142
> > [ip_set]
>
> That's due to a stupid bug of mine in the flag of kmalloc. The fixed
> kernel source can be downloaded from the svn repository or as the
> patch-o-matic-ng-20070328.tar.bz2 snapshot from the ipset webpage. Thank
> you for the bugreport.
>
> > and other : What can we chose best parameters for hashsize, probes, res=
ize ?
>
> There is no golden path: either you pay by memory for speed (i.e. large
> hashsize, small probes, large resize percentage) or reversed. The default=
s
> of the iphash and nethash types are towards the other end, i.e. spare wit=
h
> the memory requirement and loose thus speed.
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>            H-1525 Budapest 114, POB. 49, Hungary

