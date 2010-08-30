From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ebtables and anti-spoofing rules not working 100%?
Date: Mon, 30 Aug 2010 20:14:21 +0200
Message-ID: <4C7BF4FD.6040601@plouf.fr.eu.org>
References: <4C7A67B3.4070505@wpkg.org> <4C7A7CB7.9020701@plouf.fr.eu.org> <4C7A8EED.9060203@wpkg.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C7A8EED.9060203@wpkg.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Tomasz Chmielewski <mangoo@wpkg.org>
Cc: netfilter@vger.kernel.org

Tomasz Chmielewski a =E9crit :
> On 29.08.2010 17:28, Pascal Hambourg wrote:
>=20
>>> # guest communication with the gateway
>>> ebtables -A INPUT -i vmtab107i0 -j vm107
>>> ebtables -A OUTPUT -o vmtab107i0 -j vm107
>> Do you need to prevent spoofing by the host itself ?
>=20
> Host is "trusted", so it doesn't need any additional measures.
> Guests, on the other hand, are to be "untrusted".

Then filtering in OUTPUT is unnecessary.

>>> What anti-spoofing rules I need to have to prevent some kvm guests
>>> pretending to be other kvm guests (or, even pretending to be "gatew=
ays")?
>>
>> Just create rules called from INPUT and FORWARD which match the inpu=
t
>> interface (bridge port) and the MAC and IP source address.
>>
>> ebtables -A INPUT -i vmtab107i0 -j vm107
>> ebtables -A FORWARD -i vmtab107i0 -j vm107
>>
>> ebtables -A vm107 -p IPv4 -s 11:22:33:44:55:66 --ip-src 1.2.3.4 \
>>    -j ACCEPT
>> ebtables -A vm107 -p ARP -s 11:22:33:44:55:66 \
>>    --arp-mac-src 11:22:33:44:55:66 --arp-ip-src 1.2.3.4 -j ACCEPT
>=20
> With these rules, I'm not able to communicate (i.e. ping) with other=20
> hosts in the same subnet, except the gateway (although this was the s=
ame=20
> with my previous rules, I think).

Of course these rules are just a part of the ruleset. Did you do the
same for all other bridge ports and hosts in the subnet ?
