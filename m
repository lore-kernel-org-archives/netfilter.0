From: Christophe SUIRE <christophe.suire@adelux.fr>
Subject: Re: NAT performance
Date: Fri, 13 May 2005 12:18:07 +0200
Message-ID: <AAA1F3C4-D982-42D7-BB0B-6203702BD122@adelux.fr>
References: <80E06785-6636-4481-ABD1-6C6C28D52629@adelux.fr>
	<4283EEB7.7010207@riverviewtech.net>
	<02A7CEB4-AD81-4D92-BD1A-A2A5EB00AFF9@adelux.fr>
	<Pine.LNX.4.60.0505130423320.5558@darkstar.sysinfo.com>
	<A1364254-5C3D-48E2-A68C-2445EBA486D1@adelux.fr>
	<Pine.LNX.4.58.0505131038510.2119@blackhole.kfki.hu>
	<924E28FB-3288-4CBD-8A0B-40A8884C41FF@adelux.fr>
	<Pine.LNX.4.58.0505131156160.2119@blackhole.kfki.hu>
Mime-Version: 1.0 (Apple Message framework v728)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0505131156160.2119@blackhole.kfki.hu>
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
Content-Type: text/plain; charset="iso-8859-1"; delsp="yes"; format="flowed"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

No i don't change the value : 65528
But my test is to receive 50Mo of data, so the conntrack is =20
established only one time for each client .. so i should have only =20
100 conntracking entries

Thx.
--=20
Christophe Suire

Le 13 mai 05 =E0 11:57, Jozsef Kadlecsik a =E9crit :

> On Fri, 13 May 2005, Christophe SUIRE wrote:
>
>
>> A great paper !
>> But i have done some bandwidth tests which is quiet different ..
>> I know that NAT *is* expensive .. but i'm surprise that there no
>> bandwidth difference between 20 client and 100 client.
>> So i would like to understand why this limit ?
>>
>
> Sorry, but I have to ask: don't you hit the limit of ip_conntrack_max?
>
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary
>
>


