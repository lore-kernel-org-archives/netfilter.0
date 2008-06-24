From: Francois Goudal <fg@satcom1.com>
Subject: Re: NAT issue on a machine with both routing and bridging.
Date: Tue, 24 Jun 2008 10:41:13 +0200
Message-ID: <4860B329.7070000@satcom1.com>
References: <485FB19D.9080908@satcom1.com> <485FBB02.9090901@riverviewtech.net> <485FC07D.6060306@satcom1.com> <485FC5B4.8060608@riverviewtech.net> <485FC8B9.1010804@satcom1.com> <485FD267.2070604@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <485FD267.2070604@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Grant Taylor <gtaylor@riverviewtech.net>, Mail List - Netfilter <netfilter@vger.kernel.org>

Grant Taylor a =E9crit :
> On 06/23/08 11:00, Francois Goudal wrote:
>> Actually this might be the case. I'm running a standard debian etch=20
>> kernel for the moment. I can consider building my own kernel, if=20
>> necessary. What is the kernel option I shouldn't enable ?
>=20
> The option that I'm referring to is "CONFIG_BRIDGE_NETFILTER".  This=20
> option sets whether or not IPTables (layer 3 and above) sees bridged=20
> (layer 2) traffic or not.
>=20

Ok, I checked this, and it appears that in the standard Debian kernel I=
=20
use, this is enabled. But still, my iptables are almost empty, there's=20
just one single rule, for the masqueading, and I don't think this can=20
have an impact on bridged packets, can it ?

>=20
> I don't see any thing that (in theory) should not work.  The only thi=
ng=20
> that comes to mind is to temporarily remove Host B (DomU) from the mi=
x=20
> and bridge br1 directly to eth1 and try your MASQUERADing between two=
=20
> bridge interfaces.
>=20

Okay, I did a quick test, by just removing eth1 from br0 and putting it=
=20
in br1, but keeping the DomU, still.
So now, it looks like this :

=2E...............                                     ................
=2E    HOST A    .                                     .    HOST D    .
=2E 10.168.254.1 .                                     . 172.16.33.10 .
=2E...............                                     ................
   |                                                               |
   |                                                               |
   |                                                               |
   | eth1                                                     eth0 |
=2E....................................................................
=2E |0.0.0.0                                                0.0.0.0 | .
=2E |_____________________________________________  ________________| .
=2E                                               ||                  .
=2E...........................          _ br0     ||                  .
=2E                     eth0 . vif1.0  |  0.0.0.0 ||                  .
=2E XEN VM          _________._________|          ||                  .
=2E HOST B         | 0.0.0.0 . 0.0.0.0       _____||                  .
=2E                |         .              |      |_ br2             .
=2E           br0 _|         .              |      |  172.16.33.200   .
=2E 10.168.254.51  |    eth1 . vif1.1       |      |        ^         .
=2E                |_________._________ ____|               |         .
=2E                  0.0.0.0 . 0.0.0.0 |                    | Routing .
=2E...........................         |_ br1               | + DNAT  .
=2E                                    |  10.168.254.250 <--'         .
=2E                                    |                              .
=2E        HOST C                                                     .
=2E....................................................................

The VM is still here, but all the traffic from/to eth1 is not going=20
through it, but reaches directly br1.
And actually, in this configuration, the packets from Host A to Host D=20
are correctly masqueraded by Host C. Packets from Host B to Host D are=20
still correctly masqueraded as well.

If I remove the VM completely, it works, also, but the previous test=20
shows that the problem does not come from the presence of the VM, but=20
the way all this is "connected".

> The only other thing that comes to mind is that you may be trying to =
nat=20
> existing connections, which can not be done because only the first=20
> packet in the connection passes through the NAT table.  But I don't=20
> think this is likely.
>=20

I'm doing my tests with ICMP Echo messages, for the moment, this is not=
=20
something that has connection states, it must work, the tests with TCP=20
traffic comes later, once this basic stuff will work.

Regards,

--=20
=46rancois Goudal
Satcom1

