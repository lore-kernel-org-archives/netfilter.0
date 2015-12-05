From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Packet disappears after DNAT?
Date: Sat, 05 Dec 2015 11:31:31 +0100
Message-ID: <5662BD03.60004@plouf.fr.eu.org>
References: <CAKmUPx5_sDgRSUQuZmXoCxPnuN3Z0q4df5XECvR7gzY6F3gpDA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKmUPx5_sDgRSUQuZmXoCxPnuN3Z0q4df5XECvR7gzY6F3gpDA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Scott Bronson <bronson@rinspin.com>
Cc: netfilter@vger.kernel.org

Scott Bronson a =E9crit :
> Is there any reason for a packet to just disappear when it gets
> DNATed?  (other than rp_filter, which is disabled)
>=20
> The VM creates the packet: src=3D192.168.122.10:23456 dst=3D173.233.6=
7.174:25
>=20
>   * it arrives on the host's raw:PREROUTING
>   * it moves to mangle:PREROUTING
>   * it then goes to nat:PREROUTING
>     * Rule 5 DNATs the destination to 192.168.122.10
>=20
> And that's it!  Nothing more happens, the packet is gone.
>=20
> Here's my research with tables and traces:
>   https://gist.github.com/bronson/c857a462edb0c6eeab2d

IIUC, you're looping back traffic on a bridge interface. Bridge-nf is
enabled by default and can cause weird behaviour with NAT. Try to
disable it :

echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables

Without that, after DNAT, the packet is not routed but bridged. But I
suspect that the bridge code won't forward it back to its original port
due to its source MAC address.
