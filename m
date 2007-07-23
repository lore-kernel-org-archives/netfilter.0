From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: ipset and kernel 2.6.22
Date: Mon, 23 Jul 2007 15:03:36 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0707231502340.30647@blackhole.kfki.hu>
References: <20070723102420.GA5224@safeTpin.homeunix.org>
	<op.tvw0mjt6343eys@comnetlap2.biuro.lan>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="110391808-1639165841-1185195816=:30647"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <op.tvw0mjt6343eys@comnetlap2.biuro.lan>
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

--110391808-1639165841-1185195816=:30647
Content-Type: TEXT/PLAIN; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 23 Jul 2007, =A3ukasz Nierych=B3o wrote:

> In my opninion ipset iptree still does not work as it should be.
> My test:
>
> []# ipset -N viruses iptree --timeout 100
> []# ipset -A viruses 172.16.14.12
>
> Test1:
> []# ipset -T viruses 172.16.14.12
> 172.16.14.12 is in set viruses
> Test2:
> []# ipset -T viruses 172.16.14.111
> 172.16.14.111 is in set viruses
> Test3:
> []# ipset -T viruses 172.16.140.111
> 172.16.140.111 is NOT in set viruses
>
> ...
>
> Test2 172.16.14.111 shoud NOT be in set viruses, every IP from example su=
bnet=20
> 172.16.14.0/24
> is reported as "in set", (look at test2).
>
> Everything is ok after IPTRE_GC_TIME 5*60  (line 33 in ip_set_iptree.c)
> When I changed this label to 60 this module iptree worked ok after 60s.
>
> To test again you have to unload ipset module. Something is wrong few min=
utes
> after module is loaded...

That looks like a real bug. Which kernel and pom-ng version are you using?

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
           H-1525 Budapest 114, POB. 49, Hungary
--110391808-1639165841-1185195816=:30647--

