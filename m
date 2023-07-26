From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: ct state module issue
Date: Wed, 26 Jul 2023 09:19:10 -0700
Message-ID: <CAADnVQ+PHXbeGjm6ty6f7KbGZGinvng1SG_BdDh85T=1tvHoXQ@mail.gmail.com>
References: <CAOLfK3WzBo=dPJ0WEvpO4wFPnSp1uEkBXRWpxRSz7Guou3z7kw@mail.gmail.com>
 <20230725193346.GA5720@breakpoint.cc> <CAADnVQJ+bQ=2XJgY815TfAK-K8BgDAD6n9pLXBHbwBZhsxnUtA@mail.gmail.com>
 <ZMDNywzqUqjmdhOO@calendula>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690388362; x=1690993162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CfaC9K7AqxGN6MEogR0sLkTz3CLcnEyvD5fFKZave0o=;
        b=OHc15JB4eCNfL01BE/0pcgcCKs/JsOn9sIzlzgOHzgpSveViDn7GBZvfjgMl90NnJe
         UJwfnMw61noay5LQGtp6FAFFYwFYBz2Ybq3Owx0sQ+787H8QNq3Ya6/M1WMwttG5OzFo
         vl5mW12olIDPt2nTgqjCTk4qNyxs034tKGuIsKmyFYiQ1sJj098h2F9384BUhLEH9FWz
         7cQvFEHgYZcfB61/muC3A9t6NrAzZGHRGUdd0SyuGOpdmkuqZWWtclbIbAgkUOZBB6Nn
         4FxNxvj1FPHkzGaRypO0hMNhYfWh+/RPG4yTfzmwp8VckL4ieojNlX4dqb43OfdSJDnw
         IfnQ==
In-Reply-To: <ZMDNywzqUqjmdhOO@calendula>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>, Matt Zagrabelny <mzagrabe@d.umn.edu>, netfilter <netfilter@vger.kernel.org>, bpf <bpf@vger.kernel.org>

On Wed, Jul 26, 2023 at 12:40=E2=80=AFAM Pablo Neira Ayuso <pablo@netfilter=
.org> wrote:
>
> Hi Alexei,
>
> On Tue, Jul 25, 2023 at 12:57:13PM -0700, Alexei Starovoitov wrote:
> > On Tue, Jul 25, 2023 at 12:33=E2=80=AFPM Florian Westphal <fw@strlen.de=
> wrote:
> > >
> > > Matt Zagrabelny <mzagrabe@d.umn.edu> wrote:
> > >
> > > [ CCing bpf/btf experts ]
> > >
> > > > I'm running kernel: 6.1.0-10-amd64
> > > > and
> > > > nftables v1.0.6 (Lester Gooch #5)
> > > >
> > > > I have a set of nftables rules that have served me well for Debian =
11
> > > > - thanks in large part to the netfilter mailing list, so...thank yo=
u!
> > > > nftables on Debian 11 is: 0.9.8-3.1+deb11u1
> > > >
> > > > I have recently installed Debian 12 and tried my nftables rules and
> > > > have hit a snag with the connection tracking and a verdict map.
> > > > nftables on Debian 12 is: 1.0.6-2+deb12u1
> > > >
> > > > When I run the offending snippet:
> > > >
> > > > # nft -f /etc/nftables.conf.d/300-common.d/200-connection-tracking.=
nft
> > > > /etc/nftables.conf.d/300-common.d/200-connection-tracking.nft:4:9-1=
6:
> > > > Error: Could not process rule: No such file or directory
> > > >         ct state vmap {
> > >
> > > [..]
> > >         ^^^^^^^^
> > > > When I watch the kernel logs (journalctl), I see:
> > > >
> > > > Jul 25 13:44:04 localhost kernel: BPF: [99725] STRUCT
> > > > Jul 25 13:44:04 localhost kernel: BPF: size=3D104 vlen=3D12
> > > > Jul 25 13:44:04 localhost kernel: BPF:
> > > > Jul 25 13:44:04 localhost kernel: BPF: Invalid name
> > > > Jul 25 13:44:04 localhost kernel: BPF:
> > > > Jul 25 13:44:04 localhost kernel: failed to validate module
> > > > [nf_conntrack] BTF: -22
> > > > Jul 25 13:44:04 localhost kernel: missing module BTF, cannot regist=
er kfuncs
> > >
> > > So nf_conntrack.ko fails to load because of a btf issue.
> > >
> > > My question to bpf folks is:
> > >
> > > Should we make register_nf_conntrack_bpf() return 'void'?
> > >
> > > This way normal conntrack would still work.  bpf programs using
> > > conntrack kfuncs would fail, but above dmesg splat already gives
> > > a clue as to why conntrack kfuncs aren't there.
> > >
> > > No idea about the actual problem or how to debug that, but bpf
> > > people should know.
> >
> > The pr_err() was changed to pr_warn() in
> > commit 3de4d22cc9ac ("bpf, btf: Warn but return no error for NULL btf
> > from __register_btf_kfunc_id_set()").
>
> OK, no ENOENT anymore, hence no bail out.
>
> > Please upgrade the kernel and ignore the warn if you don't need bpf/btf=
/kfuncs.
> >
> > Three links in that commit provide more details.
>
> Jul 25 13:44:04 localhost kernel: BPF: [99725] STRUCT
> Jul 25 13:44:04 localhost kernel: BPF: size=3D104 vlen=3D12
> Jul 25 13:44:04 localhost kernel: BPF:
> Jul 25 13:44:04 localhost kernel: BPF: Invalid name
> Jul 25 13:44:04 localhost kernel: BPF:
>
> Are these debugging logs above still displayed? Maybe remove them too
> or only display them when all required things are in place and users
> opt-in to use this new infrastructure?

Kernel doesn't print them to console. These messages go to BTF verifier log
supplied by user space. It's not clear what process sends them to journalct=
l.
