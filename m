From: Marcin Giedz <marcin.giedz@eulerhermes.pl>
Subject: Re: GRE problem
Date: Thu, 13 Jan 2005 22:20:43 +0100
Message-ID: <41E6E62B.4010400@eulerhermes.pl>
References: <200501131013.17416.marcin.giedz@eulerhermes.pl>
	<1105626751.917.21.camel@les-home.futuresource.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1105626751.917.21.camel@les-home.futuresource.com>
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
Cc: netfilter@lists.netfilter.org

U=BFytkownik Les Mikesell napisa=B3:

>On Thu, 2005-01-13 at 03:13, Marcin Giedz wrote:
>
> =20
>
>>When first client is trying to connect to VPN server out side our office =
all
>>packets are sent through "linux router". When he finishes the connection
>>and second client wants to make a new connection no GRE packets are sent
>>through router. If I down and up interfaces on "linux router" everything
>>works OK as earlier - GRE packets are transmitted through router. If I
>>don't down and up interfaces but wait eg. for next day everything also
>>works OK. It seems for me that some "timeout" variable is set on my linux
>>router but I didn't set anything.=20
>>   =20
>>
>
>Is NAT involved here? =20
>
Yes it is

>I have a similar problem where a GRE
>connection goes out the wrong interface as the gateway starts
>up, getting a NAT association in ip_conntrack and the NAT
>never goes away after the correct interface and route come
>up. =20
>
Seems similar ;)

>I think you need to get rid of the /proc/net/ip_conntrack
>entry but there is no mechanism to do this.
>
> =20
>
So how this is removed from ip_conntrack after some period of time?. As
I said before, on a next day all GRE packets are transimited through
router, thence it seems that there is some "TTL" on "these" packets.

BR,
Marcin


