From: sean darcy <seandarcy2@gmail.com>
Subject: Re: where are my udp packets going?
Date: Mon, 17 Nov 2008 11:49:39 -0500
Message-ID: <gfs7b4$947$1@ger.gmane.org>
References: <gfndh9$n0s$1@ger.gmane.org> <gfnngg$gvn$1@ger.gmane.org> <492043E5.1080903@plouf.fr.eu.org> <gfq3f0$9ot$1@ger.gmane.org> <49214760.1010006@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49214760.1010006@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Pascal Hambourg wrote:
> sean darcy a =E9crit :
>>
>> I was able to shut down the 76. machine, reboot the server, and it=20
>> worked.
>=20
> Hmm, shut down or reboot was a bit overkill.
>=20
>> My server does NOT generate 4569 packets, and iptables INPUT drops a=
ll=20
>> from eth0, except for ssh and ESTABLISHED. So how could there be a=20
>> conntrack entry?
>=20
> The DROP target prevents a packet from creating a new conntrack entry=
=2E=20
> However I suppose there was a sort of race condition with incoming=20
> packets, conntrack activation, default policy definition and rule cre=
ation.
>=20
> If the conntrack module is loaded before a DROP rule is created in th=
e=20
> filter/INPUT chain or its policy is set to DROP, then an incoming pac=
ket=20
>  could create the bogus conntrack entry. The conntrack module can be=20
> autoloaded by many ways including :
> - loading a conntrack or NAT helper module,
> - creating a rule using a match or target that requires conntrack=20
> (state, conntrack, connmark, CONNMARK...)
> - loading the nat table, which may be caused by creating a rule in on=
e=20
> of its chains, defining the default policy of one of its chains or ju=
st=20
> flushing one of its chains.
> So conntrack may be enabled sooner that you think.
>=20
> Check the order in which the following operations happen at startup :
> - load conntrack/NAT modules {ip,nf}_{conntrack,nat}*
> - define iptables default policies in the nat and filter tables
> - create or flush iptables rules in the nat and filter tables
> - enable network interfaces
>=20
>> Is there a way to DNAT traffic before it reaches the conntrack entry=
?=20
>=20
> No, because NAT requires conntrack.
>=20
>> Can I change the destination in raw/PREROUTING?
>=20
> No. All you can do in raw/PREROUTING is DROP or mark packets in the=20
> UNTRACKED state with the NOTRACK target so the conntrack won't see th=
em.=20
> By the way I guess that adding a temporary rule matching the IAX traf=
fic=20
> from 76.x.x.x in this chain until the related conntrack entry expires=
=20
> would have done the trick too, without having to put machines offline=
=2E
>=20
>> Is there a way to flush the conntrack entry?
>=20
> Yes, with the conntrack utility from the conntrack-tools package. If =
you=20
> distro does not ship it, you can get it from the netfilter site.
> <http://www.netfilter.org/projects/conntrack-tools/index.html>
>

Great. I've installed conntrack-tools from fedora.

Now I'm trying to figure out the correct command that flushes the=20
conntrack entry but allows it to start again. I started a new thread=20
since it's getting OT for this one.

Thanks for all your help. I never would've figured this out.

sean

