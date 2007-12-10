From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Completely DROP for UDP packets.
Date: Mon, 10 Dec 2007 16:17:31 +0100
Message-ID: <475D588B.9040205@plouf.fr.eu.org>
References: <1368.121.163.60.159.1197142746.squirrel@211.111.194.2>        <475AFFEE.5010906@rtij.nl> <4988.211.111.195.128.1197265533.squirrel@211.111.194.2>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4988.211.111.195.128.1197265533.squirrel@211.111.194.2>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

msn a =E9crit :
>=20
> So, it is NOT possible to decreasing the CPU usage of the massive UDP
> handling in the linux kernel ? any comments would be nice to me.

You cannot decrease the packet processing load in the network interface=
=20
driver, unless you use a more "efficient" network card or driver. As=20
Martijn wrote, the best you can do at iptables level is drop the packet=
s=20
as soon as possible, in the PREROUTING chain of the 'raw' table even=20
though this is not the primary purpose of the 'raw' table. This will=20
save CPU usage for the traversal of subsequent iptables chains, the=20
connection tracking if it is enabled (as opposed to filtering in the=20
PREROUTING chain of the 'mangle' table), the input routing decision and=
=20
the fragment reassembly (as opposed to filtering in the INPUT chain of=20
any table).

The path is as follows :

interface -> raw/PREROUTING -> conntrack & fragment reassembly ->=20
mangle/PREROUTING -> nat/PREROUTING -> routing decision -> fragment=20
reassembly -> mangle/INPUT -> filter/INPUT -> local delivery
