From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: interfaces in /proc/net/ip_conntrack
Date: Tue, 11 Dec 2007 12:03:12 +0100
Message-ID: <475E6E70.2050304@plouf.fr.eu.org>
References: <26618.83.227.11.237.1197308966.squirrel@mh.linnea.com>    <475DCD66.5080102@rtij.nl> <29992.83.227.11.179.1197360181.squirrel@mh.linnea.com> <475E607C.2010101@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <475E607C.2010101@rtij.nl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter <netfilter@vger.kernel.org>

Martijn Lievaart a =E9crit :
> Oscar N wrote:
>=20
>> The whole idea was to create multiple firewalls of one linuxbox, not=
 only
>> 2 but 20 or something like that.
>>
>> One solution is ofcourse to don't run connection tracking at all, bu=
t it
>> would be nice to get it to work. Do anyone know if this would be way=
 to
>> much work to implement? Otherwise I might get some time over to play=
 with
>> this.
>=20
> Have a look at User Mode Linux (UML). It allows to run virtual machin=
es=20
> with the least overhead of all virtaul machine mechanisms I know. I h=
ave=20
> no idea how you have to do the plumbing to get the right packets to t=
he=20
> right VM, but I think it can be done.

If the plumbing involves the bridging of virtual ethernet TAP=20
interfaces, be aware that on a kernel with "Bridged IP/ARP packets=20
filtering" (CONFIG_BRIDGE_NETFILTER) enabled, by default the Netfilter=20
and conntrack of the host sees all the bridged IP traffic. See the=20
/proc/sys/net/bridge/bridge-nf-call-* sysctls to disable this.
