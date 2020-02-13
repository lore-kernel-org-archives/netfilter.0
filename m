From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nfnetlink: This library is not meant as a public API for
 application developers.
Date: Thu, 13 Feb 2020 14:55:04 +0100
Message-ID: <20200213135504.srhuuph4sd7pd7ne@salvia>
References: <bcff17cd-1457-7454-e00f-22d798afd7e5@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bcff17cd-1457-7454-e00f-22d798afd7e5@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Alessandro Vesely <vesely@tana.it>
Cc: netfilter@vger.kernel.org

Hi,

On Thu, Feb 13, 2020 at 12:27:41PM +0100, Alessandro Vesely wrote:
> Has that disclaimer always been in libnfnetlink home page[*]?
>=20
> It is the first time I see it.
>
> I have a userspace filter[=E2=80=A0] working with it, and it currently wo=
rks well.
>=20
> If I remove -lnfnetlink from the link command, I get just one undefined
> reference to symbol 'nfnl_rcvbufsiz'.  It is used only if there is a comm=
and
> line option to set the buffer size to a given size, to avoid enobufs.  Fo=
r the
> rest, the daemon uses libnetfilter_queue.
>=20
> Should I rewrite that?  How?

Probably, we should rewrite that sentence to: "For new software,
please consider using libmnl instead." which is actually the
intention.

libnetfilter_queue also provides an API that combines well with
libmnl.

There is no plans to remove libnfnetlink anytime soon, it's still
being used by netfilter userspace software.
