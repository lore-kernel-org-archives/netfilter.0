From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Forward packets from one interface to another?
Date: Wed, 04 Feb 2009 12:18:43 +0100
Message-ID: <49897993.8000105@plouf.fr.eu.org>
References: <200902031753.59283.Karlis.Repsons@gmail.com>	<200902031940.09273.Karlis.Repsons@gmail.com>	<49889fd0.1c078e0a.6cc4.ffff9618@mx.google.com>	<200902032004.44533.Karlis.Repsons@gmail.com> <Pine.LNX.4.58.0902031205200.13208@bolt.sonic.net> <4988B92D.8040201@hp.com> <4988C198.2030802@mailinator.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4988C198.2030802@mailinator.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: 'netfilter' <netfilter@vger.kernel.org>

Hello,

Mike Wright a =E9crit :
> Rick Jones wrote:
>>
>> If instead, you further subnettted 192.168.1 with a /25 on the PCs=20
>> (but still a /24 on the router), the Router/Firewall wouldn't have t=
o=20
>> know about the other subnet.  It could just blythly ass-u-me that th=
e=20
>> end-PC was on the same network segment as the middle PC.  So long as=
=20
>> the middle PC was configured with a static, public ARP entry for the=
=20
>> IP of the end PC, and had ip_forwarding enabled, it would "front" fo=
r=20
>> the end PC.
>=20
> How does the middle PC setup the static, public ARP entry?

By enabling proxy ARP on the interface connected to net A in your=20
diagram (/proc/sys/net/ipv4/<interface>/proxy_arp).

However you might have trouble if your applications rely on broadcast=20
packets which cannot be forwarded by routers.

