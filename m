From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Packet disappears after DNAT?
Date: Mon, 07 Dec 2015 09:01:16 +0100
Message-ID: <56653CCC.6020603@plouf.fr.eu.org>
References: <CAKmUPx5_sDgRSUQuZmXoCxPnuN3Z0q4df5XECvR7gzY6F3gpDA@mail.gmail.com>	<5662BD03.60004@plouf.fr.eu.org> <CAKmUPx40SPPjAjQa2LyKMwQu=Qrd+Cfi1FjmQR5Oap8hQPL8Vg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKmUPx40SPPjAjQa2LyKMwQu=Qrd+Cfi1FjmQR5Oap8hQPL8Vg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Scott Bronson <bronson@rinspin.com>
Cc: netfilter <netfilter@vger.kernel.org>

Scott Bronson a =E9crit :
> On Sat, Dec 5, 2015 at 2:31 AM, Pascal Hambourg <pascal@plouf.fr.eu.o=
rg> wrote:
>> IIUC, you're looping back traffic on a bridge interface.
>=20
> That sounds right.  The packet arrives on virbr0, and I want to send =
it
> right back where it came from.
>=20
>> Bridge-nf is
>> enabled by default and can cause weird behaviour with NAT. Try to
>> disable it :
>>
>> echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables
>>
>> Without that, after DNAT, the packet is not routed but bridged. But =
I
>> suspect that the bridge code won't forward it back to its original p=
ort
>> due to its source MAC address.
>=20
> It still times out.

You must also MASQUERADE or SNAT these packets, otherwise the reply
packets won't be sent back to the host and be de-NATed properly. AFAICS=
,
your current ruleset avoids doing it :

> -A POSTROUTING -s 192.168.122.0/24 ! -d 192.168.122.0/24 -p tcp -j MA=
SQUERADE --to-ports 1024-65535
> -A POSTROUTING -s 192.168.122.0/24 ! -d 192.168.122.0/24 -p udp -j MA=
SQUERADE --to-ports 1024-65535
> -A POSTROUTING -s 192.168.122.0/24 ! -d 192.168.122.0/24 -j MASQUERAD=
E

> Is it worth installing the logging to see if the
> packet is still disappearing at the DNAT step?

Sure. Or at least do a packet capture on the interface.

> Maybe I can DNAT the source MAC too?  :)

I guess you may SNAT the source MAC address. It might do the trick
