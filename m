From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: where are my udp packets going?
Date: Mon, 17 Nov 2008 11:28:48 +0100
Message-ID: <49214760.1010006@plouf.fr.eu.org>
References: <gfndh9$n0s$1@ger.gmane.org> <gfnngg$gvn$1@ger.gmane.org> <492043E5.1080903@plouf.fr.eu.org> <gfq3f0$9ot$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <gfq3f0$9ot$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

sean darcy a =E9crit :
>
> I was able to shut down the 76. machine, reboot the server, and it wo=
rked.

Hmm, shut down or reboot was a bit overkill.

> My server does NOT generate 4569 packets, and iptables INPUT drops al=
l=20
> from eth0, except for ssh and ESTABLISHED. So how could there be a=20
> conntrack entry?

The DROP target prevents a packet from creating a new conntrack entry.=20
However I suppose there was a sort of race condition with incoming=20
packets, conntrack activation, default policy definition and rule creat=
ion.

If the conntrack module is loaded before a DROP rule is created in the=20
filter/INPUT chain or its policy is set to DROP, then an incoming packe=
t=20
  could create the bogus conntrack entry. The conntrack module can be=20
autoloaded by many ways including :
- loading a conntrack or NAT helper module,
- creating a rule using a match or target that requires conntrack=20
(state, conntrack, connmark, CONNMARK...)
- loading the nat table, which may be caused by creating a rule in one=20
of its chains, defining the default policy of one of its chains or just=
=20
flushing one of its chains.
So conntrack may be enabled sooner that you think.

Check the order in which the following operations happen at startup :
- load conntrack/NAT modules {ip,nf}_{conntrack,nat}*
- define iptables default policies in the nat and filter tables
- create or flush iptables rules in the nat and filter tables
- enable network interfaces

> Is there a way to DNAT traffic before it reaches the conntrack entry?=
=20

No, because NAT requires conntrack.

> Can I change the destination in raw/PREROUTING?

No. All you can do in raw/PREROUTING is DROP or mark packets in the=20
UNTRACKED state with the NOTRACK target so the conntrack won't see them=
=2E=20
By the way I guess that adding a temporary rule matching the IAX traffi=
c=20
from 76.x.x.x in this chain until the related conntrack entry expires=20
would have done the trick too, without having to put machines offline.

> Is there a way to flush the conntrack entry?

Yes, with the conntrack utility from the conntrack-tools package. If yo=
u=20
distro does not ship it, you can get it from the netfilter site.
<http://www.netfilter.org/projects/conntrack-tools/index.html>
