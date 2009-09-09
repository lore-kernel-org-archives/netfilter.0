From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Windows/NetBIOS & SNAT
Date: Wed, 09 Sep 2009 16:16:48 +0200
Message-ID: <4AA7B8D0.8020202@plouf.fr.eu.org>
References: <651562.95010.qm@web33406.mail.mud.yahoo.com> <4AA62E6A.4030501@chello.at> <185948.38077.qm@web33403.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <185948.38077.qm@web33403.mail.mud.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Nicholas Couchman a =E9crit :
>=20
> Well, I think I've found part of the problem.  The
> nf_conntrack_netbios_ns module only operates on port 137, not on port
> 138.  I don't know exactly what the difference is, but it seems that =
all
> my WINS queries are attempting to go across on port 138.

Port 137 is NetBios Name Service.
Port 138 is NetBios Datagram Service.
WINS is supposed to be Microsoft's implementation of Netbios Name
Service, so I am a bit surprised that WINS queries are sent on port 138=
=2E

[...]
> As far as the nf_conntrack_nat_netbios_ns module goes, no, it doesn't
> exist in the kernel,

If it were to exist it would be named ip_nat_netbios_ns, not
nf_conntrack_nat_netbios_ns. But IIUC the nf_conntrack_netbios_ns helpe=
r
module was specifically designed to handle replies to broadcast NBNS
queries, as the generic UDP conntrack handles only unicast, not
broadcast (the unicast source address in the reply does not match the
broadcast destination address in the query). There would be no point in
a NAT helper module.

> but I don't see any nf_conntrack_nat* modules their, either,
> so I'm thinking that the standard nf_conntrack modules are supposed t=
o
> cover NAT

No, there are dedicated NAT helper modules. Search for nf_nat_* instead=
=2E

> in addition to standard routing.

s/standard routing/connection tracking/
