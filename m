From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: IPSET iptree problem
Date: Thu, 23 Aug 2007 15:24:37 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0708231523370.1184@blackhole.kfki.hu>
References: <C9039844-4303-4FD1-9704-41366AFF5884@stanford.edu>
	<op.txij6pdb343eys@comnetlap2.biuro.lan>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="110391808-70373215-1187875477=:1184"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <op.txij6pdb343eys@comnetlap2.biuro.lan>
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
To: =?iso-8859-2?B?o3VrYXN6IE5pZXJ5Y2izbw==?= <nofast@welnowiec.net>
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--110391808-70373215-1187875477=:1184
Content-Type: TEXT/PLAIN; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 23 Aug 2007, =A3ukasz Nierych=B3o wrote:

> I think it is something with garbage colector because if
> you modify line 32 in file:
> /usr/src/linux/net/ipv4/netfilter/ip_set_iptree.c
> #define IPTREE_GC_TIME 5*60
>
> to:
> #define IPTREE_GC_TIME 1*60
>
> (and recompile kernel modules)
>
> this funny feature is available for one minute instead of 5
> ( after modules ip_set and ip_set_iptree are loaded
> into memory )
>
> After IPTREE_GC_TIME all is ok for some unknown period of
> time, but finally this malfunction comes again.

Thank you the reports, on the weekend I'll be able to debug it.
Please stay tuned.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
           H-1525 Budapest 114, POB. 49, Hungary
--110391808-70373215-1187875477=:1184--

