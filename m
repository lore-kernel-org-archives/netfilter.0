From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: How does iptables NAT handle IPsec ESP with NAT-T UDP header ?
Date: Sun, 24 Jul 2016 13:48:42 +0200
Message-ID: <f5e03ced-5f06-7b21-16c3-cd68212f7e2a@plouf.fr.eu.org>
References: <AM4PR0301MB227595822291E80D8CFB861A910A0@AM4PR0301MB2275.eurprd03.prod.outlook.com>
 <fa1bc371-408e-6508-4cf3-e0ee438fc55a@plouf.fr.eu.org>
 <AM4PR0301MB2275F18931456F441AEBA7B3910B0@AM4PR0301MB2275.eurprd03.prod.outlook.com>
 <4a1e6811-4d44-3b08-98af-95ecaad66dfb@plouf.fr.eu.org>
 <AM4PR0301MB22751A4F0B3DDAB0B41EF46C910C0@AM4PR0301MB2275.eurprd03.prod.outlook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AM4PR0301MB22751A4F0B3DDAB0B41EF46C910C0@AM4PR0301MB2275.eurprd03.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Guy German <guy_g@rad.com>
Cc: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

Le 24/07/2016 =C3=A0 12:19, Guy German a =C3=A9crit :
> OK, I think I got it now  :-)
> For each session the destination IP address is kept as part of the se=
ssion identifier key as well ?

Yes.

> So, for my example, there are 2 unique entries in the NAT table, with=
out the need for UDP src port change.

Yes, except it is not only a NAT table but a conntrack table, which=20
keeps track of all connections even without NAT.

> However, if 2.1.1.1 will send a packet to 10.0.0.2,
> a 3rd entry will be created, this time with the src UDP 4500 changed =
to some "new-port" in order
> to distinguish from the 2nd entry (in which destination address is sa=
me 10.0.0.2) ?
> While the 2nd entry will continue to handle packets 10.0.0.2/4500->10=
=2E0.0.101/4500,
> the 3rd entry will handle packets 10.0.0.2/4500->10.0.0.101/"new-port=
".
> Am I right ?

Yes.
