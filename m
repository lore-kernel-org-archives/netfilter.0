From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: Re: ct state module issue
Date: Tue, 25 Jul 2023 12:57:13 -0700
Message-ID: <CAADnVQJ+bQ=2XJgY815TfAK-K8BgDAD6n9pLXBHbwBZhsxnUtA@mail.gmail.com>
References: <CAOLfK3WzBo=dPJ0WEvpO4wFPnSp1uEkBXRWpxRSz7Guou3z7kw@mail.gmail.com>
 <20230725193346.GA5720@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690315045; x=1690919845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yen3PpUnvgoQ4DZ/oMdMMFtdUkFHQ/IxYq1HMzpRxs=;
        b=P5Bn65AOjBhU+zzBiOPQ4y1un78QFAoHlGvedaa9IfI1JQCwoe87ROcWWlolypIL8v
         LGdTSQs4BCyPMqyUOX7Zh95oqVy4wTlwpleyNwCwphn/jQoIr2MHclRdyQkfL9n5TR98
         IxtsWCt51XJ3rhUwlH+rq2szYLp0ZhvwlM8C2muHDEd1JH0T4itXEdrQYqMiAv4Tq/ip
         HdQ5l5VQ5cLzauBrn2l7KGmbpxmlX/i1YEScpxp2oHcS4gtJP56cn9/HxWomzaaBqV51
         Ed2guzCLqMhPHfr4baC/c/kFyES2KH1clhrd/w62rrgKf7TlGf2TqRnKwLT9In8aLYAI
         MdyQ==
In-Reply-To: <20230725193346.GA5720@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Florian Westphal <fw@strlen.de>
Cc: Matt Zagrabelny <mzagrabe@d.umn.edu>, netfilter <netfilter@vger.kernel.org>, bpf <bpf@vger.kernel.org>

On Tue, Jul 25, 2023 at 12:33=E2=80=AFPM Florian Westphal <fw@strlen.de> wr=
ote:
>
> Matt Zagrabelny <mzagrabe@d.umn.edu> wrote:
>
> [ CCing bpf/btf experts ]
>
> > I'm running kernel: 6.1.0-10-amd64
> > and
> > nftables v1.0.6 (Lester Gooch #5)
> >
> > I have a set of nftables rules that have served me well for Debian 11
> > - thanks in large part to the netfilter mailing list, so...thank you!
> > nftables on Debian 11 is: 0.9.8-3.1+deb11u1
> >
> > I have recently installed Debian 12 and tried my nftables rules and
> > have hit a snag with the connection tracking and a verdict map.
> > nftables on Debian 12 is: 1.0.6-2+deb12u1
> >
> > When I run the offending snippet:
> >
> > # nft -f /etc/nftables.conf.d/300-common.d/200-connection-tracking.nft
> > /etc/nftables.conf.d/300-common.d/200-connection-tracking.nft:4:9-16:
> > Error: Could not process rule: No such file or directory
> >         ct state vmap {
>
> [..]
>         ^^^^^^^^
> > When I watch the kernel logs (journalctl), I see:
> >
> > Jul 25 13:44:04 localhost kernel: BPF: [99725] STRUCT
> > Jul 25 13:44:04 localhost kernel: BPF: size=3D104 vlen=3D12
> > Jul 25 13:44:04 localhost kernel: BPF:
> > Jul 25 13:44:04 localhost kernel: BPF: Invalid name
> > Jul 25 13:44:04 localhost kernel: BPF:
> > Jul 25 13:44:04 localhost kernel: failed to validate module
> > [nf_conntrack] BTF: -22
> > Jul 25 13:44:04 localhost kernel: missing module BTF, cannot register k=
funcs
>
> So nf_conntrack.ko fails to load because of a btf issue.
>
> My question to bpf folks is:
>
> Should we make register_nf_conntrack_bpf() return 'void'?
>
> This way normal conntrack would still work.  bpf programs using
> conntrack kfuncs would fail, but above dmesg splat already gives
> a clue as to why conntrack kfuncs aren't there.
>
> No idea about the actual problem or how to debug that, but bpf
> people should know.

The pr_err() was changed to pr_warn() in
commit 3de4d22cc9ac ("bpf, btf: Warn but return no error for NULL btf
from __register_btf_kfunc_id_set()").


Please upgrade the kernel and ignore the warn if you don't need bpf/btf/kfu=
ncs.

Three links in that commit provide more details.
