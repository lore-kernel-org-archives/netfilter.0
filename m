From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: simple port translation on the localhost / local loopback
Date: Sat, 29 Mar 2008 16:27:30 +0100
Message-ID: <47EE5FE2.8070409@plouf.fr.eu.org>
References: <20080327211643.B37CA78C86@gam.mel.teaser.net>            <47ECC9EB.1000308@plouf.fr.eu.org> <20080328141541.6BD98B850@sem.mel.teaser.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080328141541.6BD98B850@sem.mel.teaser.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Noino a =E9crit :
> Pascal Hambourg wrote :
>=20
>> I confirm. On 2.6 kernels < 2.6.11 and 2.4 kernels < 2.4.29 this=20
>> option must be enabled in order to do local NAT on loopback.

Oops, dunno why I added "on loopback". Please ignore it.

> Merci, Pascal; that would explain why I had so little success...
> Stll, is there a way to achieve local port redirection without that=20
> option set, maybe by combining DNAT, SNAT, REDIRECT in some astute wa=
y ?

AFAIK, not with Netfilter NAT. SNAT won't work on return packets.
But this is possible with userland relay daemons such as stone or socat=
,=20
if the original port (i.e. UDP 53 here) is not used by another process.=
=20
The drawback of this method is that it hides the original client addres=
s=20
from the final server, but this is not an issue for loopback use.

> Does it make things easier if I arrange for Tor to listen on the IP=20
> associated with the ethernet adapter rather than localhost ? Or even=20
> listen on 0.0.0.0 ?

Not sure what you mean. Changing the address won't fix the UDP port=20
reverse-translation issue.
