From: Fabien LE BLEVEC <fleblevec@nerim.net>
Subject: Re: Limiting Concurent conection from same host
Date: Fri, 02 Jan 2004 16:58:08 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FF59510.3040205@nerim.net>
References: <3FF28575.4060907@nospam>
Reply-To: fleblevec@nerim.net
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FF28575.4060907@nospam>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Cc: netfilter@lists.netfilter.org

You can see here :
The module iplimit will do that you want :

    =20
http://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO-3=
.html#ss3.5

Best Regards

Fabien


Tom a =E9crit :

> Hi
>
> First of all, sorry for my english.
>
> I'd like to limit the numbers of concurrent esthabilished connections =20
> from my local LAN per host  to internet.
> Avoid to "advantage" of  accelerated or segmented downloading.
>
> The --limit match is not exactly good for me, because it is matching=20
> only number of connection per time base.  And so, the concurrent =20
> conections can be grow endless.
>
> Thanks for you help,
>    Best regards
>
>          Tom
>
>
>



