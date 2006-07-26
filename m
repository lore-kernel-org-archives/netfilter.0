From: Vincent Regnard <devel@regnard.org>
Subject: Re: multiport tolerance changes
Date: Wed, 26 Jul 2006 16:21:00 +0200
Message-ID: <44C77A4C.2080708@regnard.org>
References: <44C73691.1080302@regnard.org> <44C7537C.7070509@plouf.fr.eu.org>
Reply-To: devel@regnard.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44C7537C.7070509@plouf.fr.eu.org>
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
> Hello,
>=20
> Vincent Regnard a =E9crit :
>>
>> With iptables 1.2.7 I had some rules where I could write some=20
>> multiport (port lists or ranges) both for source and destination=20
>> ports, like this:
>>
>> /sbin/iptables -A fw2net_eth3 -p tcp -m multiport -s 82.67.103.87=20
>> --sport 1024:65535 -d 0.0.0.0/0 --dports 80,8080,81,8000,1755 -j ACCEPT
>>
>> iptables was coping well with this and expanded the port matrix into=20
>> appropriate single rules
>=20
> What do you mean ? Could you give an example of such expansion ?

The expansion in that case becomes:

     0     0 ACCEPT     tcp  --  *      *       82.67.103.87
0.0.0.0/0          tcp spts:1024:65535 dpt:8080
     0     0 ACCEPT     tcp  --  *      *       82.67.103.87
0.0.0.0/0          tcp spts:1024:65535 dpt:81
     0     0 ACCEPT     tcp  --  *      *       82.67.103.87
0.0.0.0/0          tcp spts:1024:65535 dpt:8000
     0     0 ACCEPT     tcp  --  *      *       82.67.103.87
0.0.0.0/0          tcp spts:1024:65535 dpt:1755

>=20
>> But iptables 1.3.5 refuses to have multiport for both source and=20
>> destination ports and objects:
>>
>> iptables v1.3.5: multiport can only have one option
>=20
> Well, it seems that my old iptables 1.2.6a already had the same=20
> limitation. I submitted your rule to it and got an error too.
>=20
>> So I have to re-write my firewall rules.
>=20
> How did you rewrite the above rule ?

I suppressed the SOURCE port range and the rule becomes more permissive
(but works):

/sbin/iptables -A fw2net_eth3 -p tcp -m multiport -s 82.67.103.87 -d
0.0.0.0/0 --dports 80,8080,81,8000,1755 -j ACCEPT

> If I reorder the options, so that the --sport parameter appears to=20
> belong to the implicit "-m tcp" match created by "-p tcp", the rule is=20
> accepted by my iptables 1.2.6a :
>=20
> /sbin/iptables -A fw2net_eth3 -s 82.67.103.87 -d 0.0.0.0/0 \
>   -p tcp --sport 1024:65535 -m multiport --dports 80,8080,81,8000,1755 \
>   -j ACCEPT
>=20

I confirm that when writing it that way (reordering properly) I also
have no more error. But for some protocol, I would like to be able to
write some source port range and also some destination port range. A
rule like this:

/sbin/iptables -A fw2net_eth3 -p tcp -m multiport -s 82.67.103.87
--sports 10000,10001,10002 -d 0.0.0.0/0 --dports 80,8080,81,8000,1755 -j
ACCEPT

And such a rule actually does not work.

> As a general rule it seems to me that it is more logical and readable to =

> put the parameters of a match right behind the match.

You're right, but I have some constraints that does not permit this
right now.

>=20
> PS: what's the use of "-d 0.0.0.0/0" ?
>=20
>=20

0.0.0.0 is here just because I use shell script variable for my rules
and sometimes it gets replaced with a "proper" IP bloc or address
I have some general scripts that generate config for many routeurs, the
config are then uploaded onto the routers for iptables treatment. A kind
of general firewall configuration generator based on per router DB
variables.


