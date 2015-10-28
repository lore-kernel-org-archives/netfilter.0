From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Masquerading with selectively open ports -- nftables
Date: Thu, 29 Oct 2015 00:15:33 +0100
Message-ID: <20151028231533.GA2371@salvia>
References: <E3A2E5F1-41EB-41BA-A45D-7FEF5680DC15@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <E3A2E5F1-41EB-41BA-A45D-7FEF5680DC15@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Johannes Ernst <johannes.ernst@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, Oct 28, 2015 at 10:14:35AM -0700, Johannes Ernst wrote:
> My box has two interfaces (enp2s0, upstream to ISP with DHCP) and
> (enp3s0, LAN, static IP assignment). Using nftables, I'm attempting
> to set it up as a router with NAT, and selective port openings:
> enp2s0 is supposed to have the ssh port open, while enp3s0 also gets
> to have http, https, dhcp and dns open so I can run Apache and
> dnsmasq on it for users on the LAN.
>=20
> Ideally I'm looking for a full example that will work if I execute
> 'nft -f' with it. (Pretty much all related nftables examples I find
> seem to leave out crucial bits.)

You can probably contribute these examples to the wiki. Or I'd be
happy to get more or less generic scripts as examples that we can
place in the wiki.

Otherwise, I'll try to find time to add this myself.

> Now I=E2=80=99m attempting to add masquerading, and I=E2=80=99m faili=
ng:
> > nft add table nat
> > nft add chain nat prerouting { type nat hook prerouting priority 0 =
\; }
> > nft add chain nat postrouting { type nat hook postrouting priority =
0 \; }
> > nft add rule nat postrouting masquerade
> <cmdline>:1:1-35: Error: Could not process rule: No such file or dire=
ctory
> add rule nat postrouting masquerade
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>=20
> 1. This is copied straight from the wiki [1]. What am I doing wrong?

The lines above work fine here.

Masquerading was added in 3.18, what kernel version are you using?

http://wiki.nftables.org/wiki-nftables/index.php/List_of_updates_since_=
Linux_kernel_3.13

Moreover, make sure you also compiled masquerading support for nf_table=
s:

CONFIG_NFT_MASQ=3Dm
