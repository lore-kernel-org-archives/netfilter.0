From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Implications of a permissive FORWARD chain
Date: Sun, 23 Feb 2014 00:02:08 +0100
Message-ID: <53092C70.1060204@plouf.fr.eu.org>
References: <loom.20140218T183628-993@post.gmane.org> <201402181710.01163.neal.p.murphy@alum.wpi.edu> <loom.20140219T022735-831@post.gmane.org> <201402182152.38155.neal.p.murphy@alum.wpi.edu> <loom.20140219T152148-367@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <loom.20140219T152148-367@post.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Mark Fox <mark.fox@gmail.com>
Cc: netfilter@vger.kernel.org

Mark Fox a =E9crit :
> Neal Murphy <neal.p.murphy <at> alum.wpi.edu> writes:
>=20
>> If you're talking about VMs on a single Linux host talking through a=
 bridge=20
>> (virtual LAN) on that Linux host, then you can probably use ebtables=
 to=20
>> control the bridge because, again, the Linux host will not see IP tr=
affic=20
>> between VMs.

This is of course wrong. The host does the job of passing packets to an=
d
from VMs, so it has to see the traffic.

> My understanding was that a bridge was a layer 2 device and netfilter=
 would
> be completely out of the loop on traffic travelling across the bridge=
=2E

Not if the kernel has BRIDGE_NETFILTER=3Dy. Then the various
net.bridge.bridge-nf-* sysctls control which kind of traffic is passed
to conntrack, iptables, ip6tables or arptables. By default all is passe=
d.

> So I
> disabled all forwarding on the container host, but was surprised when=
 that
> cut the containers off.

What do you mean exactly by "I disabled all forwarding" ?
Setting net.ipv4.ip_forward=3D0 or net.ipv4.conf.*.forwarding=3D0 shoul=
d
have no effect on bridged traffic. However iptables' DROP or REJECT may
have an effect on IPv4 bridged packets when
net.bridge.bridge-nf-call-iptables=3D1.

> I don't get the impression that this is specific to containers.

It is not. It is specific to Linux bridge.

> There is documentation
> saying that one should do a 'iptables -I FORWARD -m physdev
> --physdev-is-bridged -j ACCEPT' to allow traffic between a host and a=
ny KVM
> guests.

It is simpler and more efficient to disable passing bridged IPv4 packet=
s
to iptables with net.bridge.bridge-nf-call-iptables=3D0.
