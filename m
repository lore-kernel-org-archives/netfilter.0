From: KOVACS Krisztian <hidden@balabit.hu>
Subject: Re: dnat to multiple destination
Date: Wed, 26 Oct 2005 16:19:29 +0200
Message-ID: <200510261619.30003@nienna>
References: <20051026140258.79270.qmail@web53313.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051026140258.79270.qmail@web53313.mail.yahoo.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org


  Hi,

On Wednesday 26 October 2005 16.02, =B0=B0 =FE=E3=FE=E3 =DF=EAr=FB=E2=F1g=
 =B0=B0 wrote:
> recently i read iptables man page,
> in the DNAT part :
> You  can  add  several --to-destination options.  If
> you specify more than
> one destination address, either via an address range
> or multiple --to-des=AD
> tination  options,  a simple round-robin (one after
> another in cycle) load
> balancing takes place between these adresses.
>
> in my mind, it sounds like:
> iptables -A PREROUTING -s xxx.xxx.xxx.xxx -p tcp
> --dport 80 -j DNAT --to-destination aaa.aaa.aaa.aaa
> --to-destination bbb.bbb.bbb.bbb
>
> but it says invalid arguments.
> which part was wrong ?

  Unfortunately that possibility was removed when restructuring the=20
Linux NAT for the 2.6.11 Linux release. Should work with older kernels,=20
or you can work it around by using two DNAT rules and the 'random'=20
match from patch-o-matic-ng. Ugly, but it should work that way.
=20
http://www.netfilter.org/documentation/HOWTO//netfilter-extensions-HOWTO-=
3.html#ss3.14

--=20
 Regards,
  Krisztian Kovacs

