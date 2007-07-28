From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: problem with  postrouting chain
Date: Sat, 28 Jul 2007 12:36:50 +0200
Message-ID: <46AB1C42.50106@plouf.fr.eu.org>
References: <46A9C574.70701@baibrama.cult.cu>
	<op.tv4stinlrtqp7s@hagumi.dsl.inet.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <op.tv4stinlrtqp7s@hagumi.dsl.inet.fi>
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

Hello

Eljas Alakulppi a =E9crit :
> jose a. z=FA=F1iga <zuniga@baibrama.cult.cu> kirjoitti Fri, 27 Jul 2007=
 =20
> 13:14:12 +0300:
>>
>> When I try to run this rules:
>>
>> /sbin/iptables -A POSTROUTING -s 192.168.1.0/24 -d XXX.XXX.XXX.XXX -o=3D=
20
>> YYY.YYY.YYY.YYY -p tcp -m tcp --dport 110 -j SNAT --to-source=3D20
>> YYY.YYY.YYY.YYY

I suppose that the =3D20 are not really part of the rule but probably the=
=20
trace of some quoted-printable encoding.

>> I get this error.
>>
>> iptables: No chain/target/match by that name
>>
> Add "-t nat" before -A POSTROUTING

Also, the -o option takes an interface name (eth0, ppp0...), not an IP=20
address. However iptables does not check that the specified interface=20
name actually exists. So this rule is not likely to match anything.

