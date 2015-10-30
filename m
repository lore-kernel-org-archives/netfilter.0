From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: kernel modules: was Re: Masquerading with selectively open ports
 -- nftables
Date: Fri, 30 Oct 2015 12:16:20 +0100
Message-ID: <20151030111620.GB1408@salvia>
References: <E3A2E5F1-41EB-41BA-A45D-7FEF5680DC15@gmail.com>
 <20151028231533.GA2371@salvia>
 <17D2CE38-D4D5-4838-9749-B1FBC907E239@gmail.com>
 <CAOkSjBiQ3uGZW9-mUXqGp8xFbfjwHnGd0T=S_1-Qhm0q+cq-cQ@mail.gmail.com>
 <F2A0EC37-BBAD-4B1F-9771-1461054F208B@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <F2A0EC37-BBAD-4B1F-9771-1461054F208B@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Johannes Ernst <johannes.ernst@gmail.com>
Cc: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

On Thu, Oct 29, 2015 at 04:48:52PM -0700, Johannes Ernst wrote:
> On 29 October 2015 at 05:51, Johannes Ernst <johannes.ernst@gmail.com=
> wrote:
> >>>>> nft add rule nat postrouting masquerade
> >>>> <cmdline>:1:1-35: Error: Could not process rule: No such file or=
 directory
> >>>> add rule nat postrouting masquerade
> >>>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >>>>=20
> >>>> 1. This is copied straight from the wiki [1]. What am I doing wr=
ong?
>=20
> I fixed it. Apparently kernel module nft_masq_ipv4 (and some
> dependencies) hadn=E2=80=99t been loaded. (I don=E2=80=99t know why.)
>=20
> Q: What do I have to do about kernel module loading? Is that
> automatic, or do I need to do something manually? (e.g. with
> /etc/modules-load.d/) This [1] seems to imply I have to do it
> manually.

It should be automatic, other than that it's a bug that it would be
good to report.

Thanks.
