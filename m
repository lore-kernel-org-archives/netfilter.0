From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Basic Routing
Date: Mon, 03 Nov 2008 11:54:49 +0100
Message-ID: <490ED879.2060101@plouf.fr.eu.org>
References: <490DD23F.7060406@amfes.com> <013f01c93d0c$f4a47410$dded5c30$@info> <490DFA21.3050906@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490DFA21.3050906@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hello,

Grant Taylor a =E9crit :
>=20
> You have to have some form of NAT for the aforementioned reason. Howe=
ver=20
> it is possible to do this on a layer 2 device via EBTables / IPTables=
=20
> with bridged netfilter traffic enabled.

Ebtables, are you sure ? AFAIK ebtables does only layer 2 MAC address=20
translation, not IP address translation. Don't you mean bridge-nf aka=20
bridge-netfilter instead of ebtables ?

> In essence from L2 you watch for any traffic coming from the L3 IP=20
> address space in question and then NAT the L3 addresses with (on L2) =
to=20
> be the actual L3 address you want to appear as.  The same thing happe=
ns=20
> in reverse and you tend to have what appears to be a L3 ""router, but=
 in=20
> actuality it's purely an L2 device pretending to be / doing the funct=
ion=20
> of an L3 router.

It's far from being that simple. Doing stateful IP address translation=20
at layer 2 requires other operations such as fragment reassembly becaus=
e=20
stateful NAT operates at the datagram level, not at the packet level,=20
and rerouting and ARP lookup when the destination IP and MAC addresses=20
change. IMO these are definitely not layer 2 operations.

> IPTables uses what is considered /stateful/ NAT.  Remember when IPTab=
les=20
> introduced connection tracking and the state match extension in 2.4=20
> years ago?  Previously IPChains did not have such state.

Ipchains did not have a state match extension, but it had some=20
connection tracking for its NAT features (masquerading and port forward=
ing).

> The (older ?)=20
> installs of the IP (ip) command could do /stateless/ NAT.  I say olde=
r=20
> because I'm not sure that the stateless NAT provided by IP exists any=
=20
> more. ... (checking) ...  According to the IP man page, stateless NAT=
 is=20
> no longer supported:  "Warning: Route NAT is no longer supported in=20
> Linux 2.6."

Actually the IP_ROUTE_NAT option enabling the old stateless NAT aka=20
"fast NAT" or "route NAT" support in the kernel has been removed since=20
kernel 2.6.9 only. But a new stateless NAT was added in kernel 2.6.24.=20
See option NET_ACT_NAT in the "QoS and/or fair queueing" menu (yeah, I=20
guess the location may seem misleading). I have not dug into it, but I=20
think it can be set up with the "tc" tool from the iproute package. It=20
requires iproute2-2.6.24-rc7 at least.

