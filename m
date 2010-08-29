From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ebtables and anti-spoofing rules not working 100%?
Date: Sun, 29 Aug 2010 17:28:55 +0200
Message-ID: <4C7A7CB7.9020701@plouf.fr.eu.org>
References: <4C7A67B3.4070505@wpkg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C7A67B3.4070505@wpkg.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Tomasz Chmielewski a =E9crit :
> I have a kvm host and two kvm guests running on it.
>=20
> kvm1 is assigned 1.2.3.4 IP with 11:22:33:44:55:66 MAC; uses vmtab107=
i0 bridged tap interface.
> kvm2 is assigned 1.2.3.22 IP with AA:BB:CC:DD:EE:FF MAC.
>=20
> To prevent spoofing, I created these ebtables rules:
>=20
> # create a chain for kvm1
> ebtables -N vm107
>=20
> # drop everything, unless it's accepted later
> ebtables -P vm107 DROP
>=20
> # guest communication with the gateway
> ebtables -A INPUT -i vmtab107i0 -j vm107
> ebtables -A OUTPUT -o vmtab107i0 -j vm107

Do you need to prevent spoofing by the host itself ?

> # guest communication with the world
> ebtables -A FORWARD -o vmtab107i0 -j vm107
>=20
> # allow 1st IP with this MAC
> ebtables -A vm107 -p IPv4 -s 11:22:33:44:55:66 --ip-src 1.2.3.4 -j AC=
CEPT=20

I don't see how this rule would match anything in the OUTPUT chain.

> ebtables -A vm107 -p IPv4 -d 11:22:33:44:55:66 --ip-dst 1.2.3.4 -j AC=
CEPT=20
>=20
> # allow broadcast traffic
> ebtables -A vm107 -p IPv4 --ip-dst 1.2.3.64 -j ACCEPT=20

Spoofing protection is about the source, not the destination, so these
two rules are pointless.

[...]
> What anti-spoofing rules I need to have to prevent some kvm guests
> pretending to be other kvm guests (or, even pretending to be "gateway=
s")?

Just create rules called from INPUT and FORWARD which match the input
interface (bridge port) and the MAC and IP source address.

ebtables -A INPUT -i vmtab107i0 -j vm107
ebtables -A FORWARD -i vmtab107i0 -j vm107

ebtables -A vm107 -p IPv4 -s 11:22:33:44:55:66 --ip-src 1.2.3.4 \
  -j ACCEPT
ebtables -A vm107 -p ARP -s 11:22:33:44:55:66 \
  --arp-mac-src 11:22:33:44:55:66 --arp-ip-src 1.2.3.4 -j ACCEPT
