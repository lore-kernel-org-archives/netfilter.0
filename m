From: Guillaume <silencer@free-4ever.net>
Subject: Re: Help with IPtables and NAT
Date: Sat, 22 Jul 2006 13:18:05 +0200
Message-ID: <44C2096D.2050602@free-4ever.net>
References: <44C16109.20704@jemconsult.biz> <44C1E06F.1080803@free-4ever.net>
	<44C1FE22.70209@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44C1FE22.70209@plouf.fr.eu.org>
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

Pascal Hambourg a =E9crit :
> Guillaume a =E9crit :
>>
>> I think you 2 problems in your rules:
>>  - The chains in NAT table must not be set to drop. NO filtering in=20
>> nat table.
>>  - You forgot to add the rules to autorise traffic coming from eth0:0=20
>> to your internal host. After a DNAT rule, you need to explicitely=20
>> autorise the corresponding traffic.
>> Ab i think, I've don't read any rule related to that.
>>
>> For example, you set this rule:
>> iptables -t nat -A PREROUTING -d 172.10.10.2 -p tcp --dport 80 -j DNAT=
=20
>> --to-dest 192.168.0.2
>> You must set this rule:
>> iptables -t filter -A FORWARD -i eth0:0 -p tcp -d 192.168.0.2 --dport=20
>> 80 -j ACCEPT
>> And the same for all incoming traffics.
>=20
> This is correct except for one detail : the interface eth0:0 does not=20
> exist. It is only an alias and is not used by either the routing nor=20
> iptables. You muse use the real interface name, eth0.
>=20

hhhmmm
Ok :-)

I never use alias on interface... :-)

Thx for correcting me

Guillaume


--=20
Guillaume
E-mail: silencer_<at>_free-4ever_<dot>_net
Blog: http://guillaume.free-4ever.net
----
Site: http://www.free-4ever.net

