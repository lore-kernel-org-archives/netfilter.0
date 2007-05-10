From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Filter a TCP stream based on a text appearing in the initial
 IP packet of the stream
Date: Thu, 10 May 2007 21:51:40 +0200
Message-ID: <464377CC.7000502@plouf.fr.eu.org>
References: <22b256140705100551q3a67e680nb184c23f4966cb1d@mail.gmail.com>
	<Pine.LNX.4.61.0705101611360.32349@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0705101611360.32349@yvahk01.tjqt.qr>
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

Hello,

Jan Engelhardt a =E9crit :
> On May 10 2007 14:51, Michael Ransburg wrote:
>>
>>let's say someone is downloading a website using http/tcp/ip. This
>>website is very large, i.e., there will be many IP packets in this TCP
>>stream.

There may even be many different TCP connections.

>>I know that there is a certain phrase at the top of the
>>website, let's say "foobar", which will therefore be part of the first
>>IP packet of this TCP stream.

Do you mean the page title enclosed in the <title> tag, which most=20
browsers conveniently display in the title bar ?
No, it is not part of the first IP packet. The first packets in a TCP=20
stream are SYN packets used for synchronisation, which contain no TCP dat=
a.

> The first return packet is not guaranteed to carry the first byte of th=
e HTML
> page.

Don't you mean "the first return packet *is* guaranteed *not to* carry=20
the first byte of the HTML page", or "the first return TCP *segment* is=20
not guaranteed to carry the first byte of the HTML page" ? ;-)

> If the HTTP header is "big enough"

And/or the HTML header contents before the <title> tag is big enough.

> and the MTU is "small enough",
> then it is likely that the packet is split before foobar.
[...]
>>So what I want to say in a rule is:
>>If the first (or simply "a") IP packet of a TCP stream contains a
>>given phrase, then please filter (match) all IP packets which belong
>>to this TCP stream.
>>
>>Can this be done using iptables / netfilter?
>=20
> -m string --string foobar -j CONNMARK --set-mark 1
> -m connmark --mark 1 -j DROP/REJECT/whatever.

Does this work if the string is split in two consecutive segments ?

