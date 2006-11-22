From: Andy Furniss <lists@andyfurniss.entadsl.com>
Subject: Re: Multicast route table
Date: Wed, 22 Nov 2006 18:25:09 +0000
Message-ID: <45649605.3040905@andyfurniss.entadsl.com>
References: <018d01c7097c$0ee67f10$4401a8c0@Gileno>
Reply-To: lists@andyfurniss.entadsl.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <018d01c7097c$0ee67f10$4401a8c0@Gileno>
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
To: Marcos Gileno <gileno@digilab.com.br>
Cc: netfilter@lists.netfilter.org

Marcos Gileno wrote:
> Hi there people!
>=20
> I have a linux box as a multi-homed host, 3 interfaces, and I want to=20
> route a multicast traffic that comes in one of the interface to another=
,=20
> let=B4s say, eth0 receveis the multicast and I want eth1 to forward it.

I guess you need a daemon like smcroute

www.cschill.de/smcroute/ was OK on 2.6s last time I tried.

I only ever did enough with multicast routing to get what I wanted=20
working, so don't know all the ins and outs, but for locally generated=20
traffic it seems that the interface with the mcast route will get it.

Maybe it's because I was comparing pppX and ethX rather than eths, but=20
by default local generated mcast would go out on ppp0(default route=20
created by pppd) which was not what I wanted, doing -

ip ro add dev br0 224.0.0.0/4

stopped it going out on ppp0 - Maybe what you see is because tcpdump=20
puts ethX into promisc or something.

Andy.



