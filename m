From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables compatibility
Date: Wed, 3 Dec 2014 12:00:21 +0100
Message-ID: <20141203110021.GA3742@salvia>
References: <547E38AE.6000909@gmail.com>
 <1417558548.10146.7.camel@regit.org>
 <547EBC2C.1030503@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <547EBC2C.1030503@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jean-Philippe Menil <jpmenil@gmail.com>
Cc: Eric Leblond <eric@regit.org>, netfilter@vger.kernel.org

On Wed, Dec 03, 2014 at 08:30:52AM +0100, Jean-Philippe Menil wrote:
> Le 02/12/2014 23:15, Eric Leblond a =E9crit :
> > Hi,
> >=20
> > On Tue, 2014-12-02 at 23:09 +0100, Jean-Philippe Menil wrote:
> >> Hi,
> >>
> >> while playing with nftables, i observe that my iptables masqueradi=
ng do not
> >> work anymore:
> >>
> >> modprobe nft_nat
> >> modprobe nft_chain_nat_ipv4
> >> nft add table nat
> >> nft add chain nat postrouting { type nat hook postrouting priority=
 0 \; }

BTW, you will also have to add the prerouting nat chain so the NAT
engine can undo NAT for reply traffic, see:

http://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Add=
ress_Translation_%28NAT%29

> >> ^^ iptables nat stoped work here.
> >>
> >> I'm sure i read that nftables and iptables  where compatible.
> >>
> >> Can anyone point me what am i missing ?
> >>
> >> (I'm on 3.17.4)
> >=20
> > Sadly, masquerade is requiring 3.18. Only standard NAT is implement=
ed in
> > 3.17.x.
> >=20
> > BR,
> >=20
> Hi Eric,
>=20
> thanks for your response.
>=20
> I've see on the wiki that masquerading require a 3.18 kernel.
>=20
> But why juste adding the type nat hook with nftables, broke the iptab=
les
> masquerading?

Because the NAT engine attaches the nul-nat-binding (ie. this
conntrack has no nat at all) when the packet leaves the chain without
matching any rule.

If you run iptables and nf_tables for NAT at the same time, the first
chain will configure NAT for the conntrack, the second will just skip
the packet since NAT has been already set up.

> There's no problem at all, i will upgrade to 3.18 for my tests.

Thanks.
