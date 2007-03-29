From: =?ISO-8859-2?Q?Isma=EBl_BALLO?= <isma.ballo@gmail.com>
Subject: Re: [ipset] Minor non-blocking "sleep" bugs
Date: Thu, 29 Mar 2007 22:01:36 +0200
Message-ID: <460C1B20.1060107@gmail.com>
References: <513bde910703270005q2fe38dddp6ed5a4233a2c1c5d@mail.gmail.com>
	<513bde910703270656k3125b5bl1c20d063c622e45a@mail.gmail.com>
	<Pine.LNX.4.64.0703281855530.13447@blackhole.kfki.hu>
	<513bde910703290616t5f0b4b92m1caedb1da3dcddfc@mail.gmail.com>
	<Pine.LNX.4.64.0703291957540.14898@blackhole.kfki.hu>
Reply-To: isma.ballo@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64.0703291957540.14898@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

Jozsef Kadlecsik a =E9crit :
> Hi,
>
> On Thu, 29 Mar 2007, Isma=EBl BALLO wrote:
>
>> The compilation fails unless you put
>> u_int32_t  min_ip, max_ip; (instead of  __be32 )
>> in  KERNEL_DIR/ include/linux/netfilter_ipv4/ipt_iprange.h
>
> That's an independent problem, not related to ipset ;-).
Ok.
>
>> When I want to flush and delete all rules.
>> (after ipset -U :all: :all: ; ipset -F ; ipset -X and iptables -D <on
>> appropriate rules using sets >)
>>
>> Sometimes, references stays on some sets.
>
> The order is important: you cannot destroy a set if you haven't=20
> deleted previously the iptables rule referencing the set.
>
Sorru,  you're right.( I've written too quick ..)
But the problem is still there

 1 - iptables -D <on all appropriate rules using sets > ...
 2 - ipset -U :all: :all: ; ipset -F ; ipset -X

Sometimes, there still exists references.
How can we see them ?Is there a way to flush them ?
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary



