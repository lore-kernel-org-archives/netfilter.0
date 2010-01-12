From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: REJECT as a default policy
Date: Tue, 12 Jan 2010 15:54:46 +0100
Message-ID: <4B4C8D36.4030000@chello.at>
References: <4B4B1339.1040502@gmail.com>	 <034DEBCAE934A74991E6E76B8DA72D141884A1922E@HSSBS.holdstead.local> <56378e321001111408mbeef328j62261c7a0215e122@mail.gmail.com> <4B4C5B41.7000500@gmail.com> <4B4C7242.9070403@freemail.hu> <4B4C79B3.5020508@gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B4C79B3.5020508@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On 12.01.2010 14:31, Lars Nooden wrote:
> G=E1sp=E1r Lajos wrote:
>> IMHO:
>> I do not like to waste resources.
>> An "unwanted/unallowed" incoming packet is already wasting time/band=
width.
>> A reply (ICMP or whatever else) to this makes you waste your preciou=
s
>> resources.
>> (Think about the ASYMMETRIC DSL)
>=20
> Don't misunderstand the request.  It is not a request to prohibit the
> possibility of using DROP as the default policy for chain, but one of
> *also* allowing use of REJECT as a default policy for a chain.  It is
> simply easiest, from a configuration standpoint, to set default with
> a "-P"
>=20
> There are times and conditions when DROP will be the appropriate
> default, there are times and conditions when REJECT is the appropriat=
e
> default.  Currently REJECT can be done by adding it to the end of a
> chain, effectively making it default.
>=20
> Regards
> /Lars

well, if you write a new policy handler, i've got some feature requests=
 :)

1: allow to set policies on custom (user created) chains (iptables -N
chain -P ACCEPT/DROP/REJECT).

2: for REJECT give ways to limit/hashlimit/recent match, with fallback
to DROP.
i.e. iptables -N foo -P REJECT --reject-with ... -m hashlimit ... -m
recent ... --policy-fallback DROP/DELUDE/TARPIT

oops, i've added DELUDE and TARPIT to the policy wishlist ;)
how about:
iptabes -N foo -P TARPIT -m hashlimit ... -m recent ...
--policy-fallback DROP



thanks a lot :))

regards

Mart
