From: "former03 | Baltasar Cevc" <baltasar.cevc@former03.de>
Subject: Re: no ssh on eth0
Date: Mon, 31 Jul 2006 23:54:12 +0200
Message-ID: <87a8d723fe564ad69ae1fdfaf6593094@former03.de>
References: <1154239260.5429.2.camel@nirvana.aurokruti.in>	<87fygje700.fsf@newton.gmurray.org.uk>	<Pine.LNX.4.61.0607301343450.23827@yvahk01.tjqt.qr>	<44CCA802.2090403@plouf.fr.eu.org>	<facccfbd353e38901017e6dee5a54a99@former03.de>	<44CCE712.4070907@plouf.fr.eu.org>	<98ab1181f512c188a486f7e3667bb2c4@former03.de>	<44CD10E0.501@plouf.fr.eu.org>	<f5cb25e84f751fd22816a75d4e6ba77b@former03.de>	<44CE0921.7050103@plouf.fr.eu.org>
	<a74803cb862d9adbddb9a6ea3ca6eeea@former03.de>
	<44CE7878.2020007@rtij.nl>
Mime-Version: 1.0 (Apple Message framework v624)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44CE7878.2020007@rtij.nl>
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
Content-Type: text/plain; charset="macroman"; format="flowed"
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@lists.netfilter.org, Pascal Hambourg <pascal.mail@plouf.fr.eu.org>


On 31.07.2006, at 23:39, Martijn Lievaart wrote:

> former03 | Baltasar Cevc wrote:
>
>>
>> On 31.07.2006, at 15:44, Pascal Hambourg wrote:
>>
>>> I just don't see how it is different whether you have NAT/MASQUERADE=20=

>>> or not. To me filtering and NAT in iptables are fundamentally=20
>>> independent.
>>
>> Sure, they are. However, if I nat, I can make the following=20
>> assumption:
>> there are no (valid) packet addressed to internal addresses on eth0.
>> Which is something I can't assume when I don't have NOT. WIthout that=20=

>> assumption, I cannot prohibit as much as I can when I assume that.
>>
>
> A very dangerous assumption. We're talking about NAT for outgoing=20
> connections. Incomming connections are still possible if someone=20
> controls the routing up to your box. I would NEVER base my secority on=20=

> that assumption where security matters (so for a home setup it's fine,=20=

> but otherwise not).
Aparently we misundestood each other. I did not talk about the=20
assumption that such packets never come there, on the contrary, I make=20=

the assumption that these packets are bad, so I should filter them out.

However, one thing I 'relied on': in case the packet filter fails (we=20
should always consider failure, although at least the software part -=20
netfilter - is really stable, no need to argue about the latter) for=20
whatever reason, it is better at least not to listen to the external IP=20=

so that in the case the provider does filter (which it should), it=20
would at least be impossible to connect from anywhere except the local=20=

part of the wan and the lan. Which will significantly reduce the=20
dangers.

Baltasar

--
Baltasar Cevc

_____ former 03 gmbh
_____ infanteriestra=DFe 19 haus 6 eg
_____ D-80797 muenchen

_____ http://www.former03.de


