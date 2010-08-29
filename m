From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: NDP and ebtables
Date: Sun, 29 Aug 2010 16:51:57 +0200
Message-ID: <4C7A740D.8010908@plouf.fr.eu.org>
References: <4C7A3C72.6070105@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C7A3C72.6070105@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Jonathan Tripathy a =E9crit :
>=20
> I'm just trailing out ipv6 on my network. Currently, all my bridge po=
rts=20
> are protected from MAC address spoofing by using ebtables:
>=20
> /usr/local/sbin/ebtables -I FORWARD -p ARP -o "$vif" -j ACCEPT
> /usr/local/sbin/ebtables -I FORWARD -i "$vif" -s "$mac" -j ACCEPT
> /usr/local/sbin/ebtables -I FORWARD -o "$vif" -d "$mac" -j ACCEPT
>=20
> As you can see above, I allow all ARP packets to flow to the host=20
> (who-has). This allows ARP resolution to work. Is-at works at the sou=
rce=20
> MAC address is set in the frame.
>=20
> However, adding IPv6 to the mix is a little trickier. As it turns out=
,=20
> IPv6 doesn't use ARP, but uses NDP.
>=20
> Is there any way to make NDP work with ebtables, but still preventing=
=20
> MAC address spoofing?

Sure : don't filter on the destination address, or at least accept
related multicast addresses (see "ip -f link maddr" on the host).

Spoofing is about the source, not the destination. If the bridge code
decides to forward a packet to some port even when the destination
address is not the address of a host connected to that port, it has som=
e
reason to do so :
- the destination is multicast of broadcast,
- the destination is unicast but unknown, thus treated as broadcast.

You can safely drop in the latter case, not in the former.

Note that your 3rd rule accepts packets from any source address, thus
not preventing spoofing.
