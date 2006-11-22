From: "lubasi" <lubasi@zamnet.zm>
Subject: RE: Someone is using too much bandwidth???
Date: Wed, 22 Nov 2006 07:57:17 +0200
Message-ID: <380-220061132255717968@zamnet.zm>
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
Content-Type: text/plain; charset="us-ascii"
To: pablo@blueoakdb.com, netfilter@lists.netfilter.org

Okey thanks for tcpdump=2E

But got a problem=2E I cant seem to realy figure out what those lines
mean=3F say these four (4) lines:

08:01:42=2E131982 IP 192=2E168=2E0=2E71=2E1054 > mail=2Eparliament=2Egov=2E=
zm=2Esquid:
=2E ack 6755 win 65535
08:01:42=2E225114 IP 213=2E155=2E151=2E150=2Ehttp > 192=2E168=2E0=2E183=2E=
3011: P
1:334(333) ack 170 win 5840
08:01:42=2E229863 IP 192=2E168=2E0=2E183=2E3011 > 213=2E155=2E151=2E150=2E=
http: F
170:170(0) ack 334 win 63907
08:01:42=2E229968 IP 213=2E155=2E151=2E150=2Ehttp > 192=2E168=2E0=2E183=2E=
3011: F
334:334(0) ack 171 win 5840


Okey seen the date part, the IP address then looks like the port on
which the connection is listening on is appended to the requesting IP
address then the greater than=3F=3F=3F=3F confused from that point=2E

Anything i can use to graph this information=3F=3F=3F=3F

Teddy L=2E
>
>
>
>---- Original Message ----
>From: pablo@blueoakdb=2Ecom
>To: netfilter@lists=2Enetfilter=2Eorg
>Subject: RE: Someone is using too much bandwidth=3F=3F=3F
>Date: Tue, 21 Nov 2006 13:13:12 -0500
>
>>=20
>>
>>> -----Original Message-----
>>> From: netfilter-bounces@lists=2Enetfilter=2Eorg=20
>>> [mailto:netfilter-bounces@lists=2Enetfilter=2Eorg] On Behalf Of lubasi=

>>> Sent: Tuesday, November 21, 2006 12:22 PM
>>> To: netfilter@lists=2Enetfilter=2Eorg
>>> Subject: RE: Someone is using too much bandwidth=3F=3F=3F
>>>=20
>>> Hello,
>>>=20
>>> Indeed its true, and i dont know what machine it is=2E=20
>>
>>You could setup an iptables rule to log all traffic or do what I
>believe may
>>be simpler:  use tcpdump
>>
>>Let's say you have two NIC's on your machine:
>>
>>
>>=09// Internet // - [eth0] - [gateway] - [eth1] - // Internal Network
>>//
>>
>>You can run tcpdump on your Internet Network:
>>
>>=09tcpdump -i eth1
>>
>>If you've ssh'd to your gateway machine from your Internal Network,
>your
>>host and ssh information will also be spewed=2E  Probably not what you
>want=2E
>>
>>A simple tweak will handle it:
>>
>>=09tcpdump -i eth1 not host your=2EIP=2Eaddress=2Ehere
>>
>>The above should give you some quick answers=2E
>>
>>Cheers,
>>---
>>Pablo Sanchez - Blueoak Database Engineering, Inc
>>Ph:    819=2E459=2E1926          Toll free:  888=2E459=2E1926
>>Cell:  819=2E918=2E9731                Pgr:  pablo=5Fp@blueoakdb=2Ecom
>>Fax:   603=2E720=2E7723 (US)

------------------------------------------------------
Teddy L=2E Nyambe
Open Source Zambia
www=2Eopensource=2Eorg=2Ezm

+260 97 760473

* Know that today is yesterday's future Be the change you want to see
in the world
* To Err is Human, but to really mess things up, you need a PC


