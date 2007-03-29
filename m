From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ipset] Minor non-blocking "sleep" bugs
Date: Thu, 29 Mar 2007 20:03:36 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0703291957540.14898@blackhole.kfki.hu>
References: <513bde910703270005q2fe38dddp6ed5a4233a2c1c5d@mail.gmail.com>
	<513bde910703270656k3125b5bl1c20d063c622e45a@mail.gmail.com>
	<Pine.LNX.4.64.0703281855530.13447@blackhole.kfki.hu>
	<513bde910703290616t5f0b4b92m1caedb1da3dcddfc@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="110391808-216087664-1175191416=:14898"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <513bde910703290616t5f0b4b92m1caedb1da3dcddfc@mail.gmail.com>
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
To: =?ISO-8859-1?Q?Isma=EBl_BALLO?= <isma.ballo@gmail.com>
Cc: netfilter@lists.netfilter.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--110391808-216087664-1175191416=:14898
Content-Type: TEXT/PLAIN; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE

Hi,

On Thu, 29 Mar 2007, Isma=EBl BALLO wrote:

> The compilation fails unless you put
> u_int32_t  min_ip, max_ip; (instead of  __be32 )
> in  KERNEL_DIR/ include/linux/netfilter_ipv4/ipt_iprange.h

That's an independent problem, not related to ipset ;-).

> When I want to flush and delete all rules.
> (after ipset -U :all: :all: ; ipset -F ; ipset -X and iptables -D <on
> appropriate rules using sets >)
>
> Sometimes, references stays on some sets.

The order is important: you cannot destroy a set if you haven't=20
deleted previously the iptables rule referencing the set.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
           H-1525 Budapest 114, POB. 49, Hungary
--110391808-216087664-1175191416=:14898--

