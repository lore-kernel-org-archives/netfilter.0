From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ct state module issue
Date: Wed, 26 Jul 2023 09:39:55 +0200
Message-ID: <ZMDNywzqUqjmdhOO@calendula>
References: <CAOLfK3WzBo=dPJ0WEvpO4wFPnSp1uEkBXRWpxRSz7Guou3z7kw@mail.gmail.com>
 <20230725193346.GA5720@breakpoint.cc>
 <CAADnVQJ+bQ=2XJgY815TfAK-K8BgDAD6n9pLXBHbwBZhsxnUtA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <bpf+bounces-5917-glkb-bpf=m.gmane-mx.org@vger.kernel.org>
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:bpf+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:bpf+unsubscribe@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAADnVQJ+bQ=2XJgY815TfAK-K8BgDAD6n9pLXBHbwBZhsxnUtA@mail.gmail.com>
Content-Type: text/plain; charset="windows-1252"
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, Matt Zagrabelny <mzagrabe@d.umn.edu>, netfilter <netfilter@vger.kernel.org>, bpf <bpf@vger.kernel.org>

Hi Alexei,

On Tue, Jul 25, 2023 at 12:57:13PM -0700, Alexei Starovoitov wrote:
> On Tue, Jul 25, 2023 at 12:33=E2=80=AFPM Florian Westphal <fw@strlen.de> =
wrote:
> >
> > Matt Zagrabelny <mzagrabe@d.umn.edu> wrote:
> >
> > [ CCing bpf/btf experts ]
> >
> > > I'm running kernel: 6.1.0-10-amd64
> > > and
> > > nftables v1.0.6 (Lester Gooch #5)
> > >
> > > I have a set of nftables rules that have served me well for Debian 11
> > > - thanks in large part to the netfilter mailing list, so...thank you!
> > > nftables on Debian 11 is: 0.9.8-3.1+deb11u1
> > >
> > > I have recently installed Debian 12 and tried my nftables rules and
> > > have hit a snag with the connection tracking and a verdict map.
> > > nftables on Debian 12 is: 1.0.6-2+deb12u1
> > >
> > > When I run the offending snippet:
> > >
> > > # nft -f /etc/nftables.conf.d/300-common.d/200-connection-tracking.nft
> > > /etc/nftables.conf.d/300-common.d/200-connection-tracking.nft:4:9-16:
> > > Error: Could not process rule: No such file or directory
> > >         ct state vmap {
> >
> > [..]
> >         ^^^^^^^^
> > > When I watch the kernel logs (journalctl), I see:
> > >
> > > Jul 25 13:44:04 localhost kernel: BPF: [99725] STRUCT
> > > Jul 25 13:44:04 localhost kernel: BPF: size=3D104 vlen=3D12
> > > Jul 25 13:44:04 localhost kernel: BPF:
> > > Jul 25 13:44:04 localhost kernel: BPF: Invalid name
> > > Jul 25 13:44:04 localhost kernel: BPF:
> > > Jul 25 13:44:04 localhost kernel: failed to validate module
> > > [nf_conntrack] BTF: -22
> > > Jul 25 13:44:04 localhost kernel: missing module BTF, cannot register=
 kfuncs
> >
> > So nf_conntrack.ko fails to load because of a btf issue.
> >
> > My question to bpf folks is:
> >
> > Should we make register_nf_conntrack_bpf() return 'void'?
> >
> > This way normal conntrack would still work.  bpf programs using
> > conntrack kfuncs would fail, but above dmesg splat already gives
> > a clue as to why conntrack kfuncs aren't there.
> >
> > No idea about the actual problem or how to debug that, but bpf
> > people should know.
>=20
> The pr_err() was changed to pr_warn() in
> commit 3de4d22cc9ac ("bpf, btf: Warn but return no error for NULL btf
> from __register_btf_kfunc_id_set()").

OK, no ENOENT anymore, hence no bail out.

> Please upgrade the kernel and ignore the warn if you don't need bpf/btf/k=
funcs.
>=20
> Three links in that commit provide more details.

Jul 25 13:44:04 localhost kernel: BPF: [99725] STRUCT
Jul 25 13:44:04 localhost kernel: BPF: size=3D104 vlen=3D12
Jul 25 13:44:04 localhost kernel: BPF:
Jul 25 13:44:04 localhost kernel: BPF: Invalid name
Jul 25 13:44:04 localhost kernel: BPF:

Are these debugging logs above still displayed? Maybe remove them too
or only display them when all required things are in place and users
opt-in to use this new infrastructure?

Thanks.

