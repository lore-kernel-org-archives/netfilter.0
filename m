From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: How does iptables NAT handle IPsec ESP with NAT-T UDP header ?
Date: Sat, 23 Jul 2016 23:56:15 +0200
Message-ID: <4a1e6811-4d44-3b08-98af-95ecaad66dfb@plouf.fr.eu.org>
References: <AM4PR0301MB227595822291E80D8CFB861A910A0@AM4PR0301MB2275.eurprd03.prod.outlook.com>
 <fa1bc371-408e-6508-4cf3-e0ee438fc55a@plouf.fr.eu.org>
 <AM4PR0301MB2275F18931456F441AEBA7B3910B0@AM4PR0301MB2275.eurprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AM4PR0301MB2275F18931456F441AEBA7B3910B0@AM4PR0301MB2275.eurprd03.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Guy German <guy_g@rad.com>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

Le 23/07/2016 =C3=A0 20:55, Guy German a =C3=A9crit :
> I will try to clarify the problem with a specific example. I will use=
 2 flows but there are 4 actually.
> The device public IP in this example is 10.0.0.101 so the setup is li=
ke the following:
>
> Private domain                         Public domain
>
> 2.1.1.1---+                                                          =
+----------- 10.0.0.1
>                  +-------NAT--> 10.0.0.101 ----------+
> 2.1.2.1---+                                                          =
+----------- 10.0.0.2
>
> Incoming flow1 (from private network, before NAT) has following heade=
r:
> Src-IP: 2.1.1.1 (private)
> Dst IP: 10.0.0.1 (public)
> UDP src port: 4500
> UDP dst port: 4500
> ESP SPI: 33F5A570
>
> Incoming flow2 (from private network, before NAT) has following heade=
r:
> Src-IP: 2.1.2.1 (private)
> Dst IP: 10.0.0.2 (public)
> UDP src port: 4500
> UDP dst port: 4500
> ESP SPI: 9B417632
>
> Now, the SNAT is performed (I'm currently not sure what is used exact=
ly as src identifier), so both packets go out with (public) IP 10.0.0.1=
01.
> However, after NAT, both UDP ports (drc & dst) remain 4500.

As expected. No need to alter source ports in this situation.

> The incoming packets from opposite direction (from public nodes towar=
ds NAT device) is as follows (as outgoing packets had both UDP ports 45=
00, so are the packets in opposite direction):
>
> Incoming flow1 (from public network) has following header:
> Src-IP: 10.0.0.1 (public)
> Dst IP: 10.0.0.101 (public)
> UDP src port: 4500
> UDP dst port: 4500
> ESP SPI: 33F5A570
>
> Incoming flow2 (from public network) has following header:
> Src-IP: 10.0.0.2 (public)
> Dst IP: 10.0.0.101 (public)
> UDP src port: 4500
> UDP dst port: 4500
> ESP SPI: 9B417632
>
> The thing is, that the iptables performs (somehow) the DNAT correctly=
 and the tunnels do work (we can ping from side to side).

Of course it does work. Why wouldn't it ?

> So internally after NAT, the packets are as follows:
> Incoming flow1 (from public network, after NAT) has following header:
> Src-IP: 10.0.0.1 (public)
> Dst IP: 2.1.1.1 (private)
> UDP src port: 4500
> UDP dst port: 4500
> ESP SPI: 33F5A570
>
> Incoming flow2 (from public network, after NAT) has following header:
> Src-IP: 10.0.0.2 (public)
> Dst IP: 2.1.2.1 (private)
> UDP src port: 4500
> UDP dst port: 4500
> ESP SPI: 9B417632
>
> If both UDP ports are 4500, how did iptables distinguish between the =
packets and knew which private IP to assign to each packet ?

The connection tracking records original and reply source and=20
destination addresses and ports in order to be able to match packets=20
with registered flows. See my previous reply to display what is recorde=
d=20
about each registered flow.

In your example, the destination address of each flow is different. Whe=
n=20
a reply packet comes from 10.0.0.1, conntrack knows it must be forwarde=
d=20
to 2.1.1.1.
When a reply packet comes from 10.0.0.2, conntrack knows it must be=20
forwarded to 2.1.2.1.
