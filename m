From: "Marcos Gileno" <gileno@digilab.com.br>
Subject: Re: Multicast route table
Date: Wed, 22 Nov 2006 18:08:01 -0200
Message-ID: <008501c70e71$f30f54b0$4401a8c0@Gileno>
References: <018d01c7097c$0ee67f10$4401a8c0@Gileno>
	<45649605.3040905@andyfurniss.entadsl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"; reply-type="response"
To: lists@andyfurniss.entadsl.com
Cc: netfilter@lists.netfilter.org

Ok andy !

I already solved my problem. Actually I did not need to forward the=20
multicast traffic with only one interface anymore. The system worked fine=20
with the multicast coming from all the interfaces. But I really appreciated=
=20
your atention.

Best regards

Marcos Gileno.

----- Original Message -----=20
From: "Andy Furniss" <lists@andyfurniss.entadsl.com>
To: "Marcos Gileno" <gileno@digilab.com.br>
Cc: <netfilter@lists.netfilter.org>
Sent: Wednesday, November 22, 2006 4:25 PM
Subject: Re: Multicast route table


> Marcos Gileno wrote:
>> Hi there people!
>>
>> I have a linux box as a multi-homed host, 3 interfaces, and I want to=20
>> route a multicast traffic that comes in one of the interface to another,=
=20
>> let=B4s say, eth0 receveis the multicast and I want eth1 to forward it.
>
> I guess you need a daemon like smcroute
>
> www.cschill.de/smcroute/ was OK on 2.6s last time I tried.
>
> I only ever did enough with multicast routing to get what I wanted=20
> working, so don't know all the ins and outs, but for locally generated=20
> traffic it seems that the interface with the mcast route will get it.
>
> Maybe it's because I was comparing pppX and ethX rather than eths, but by=
=20
> default local generated mcast would go out on ppp0(default route created =

> by pppd) which was not what I wanted, doing -
>
> ip ro add dev br0 224.0.0.0/4
>
> stopped it going out on ppp0 - Maybe what you see is because tcpdump puts=
=20
> ethX into promisc or something.
>
> Andy.
>
>
>
>
> --=20
> No virus found in this incoming message.
> Checked by AVG Free Edition.
> Version: 7.5.430 / Virus Database: 268.14.13/546 - Release Date:=20
> 22/11/2006 09:01
>
>=20


