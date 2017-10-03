From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Possible nftables U32 equivalent to read packet's data contents
Date: Tue, 3 Oct 2017 15:34:44 +0200
Message-ID: <20171003133444.GA2000@salvia>
References: <f337fb23f03b4a60ae45f24a49dd7696@nalasexr02h.na.qualcomm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f337fb23f03b4a60ae45f24a49dd7696@nalasexr02h.na.qualcomm.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Raul Martinez <mraul@qti.qualcomm.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi Raul,=20

On Wed, Aug 30, 2017 at 09:59:26PM +0000, Raul Martinez wrote:
> Hi all,
>=20
> Looking for a way to implement an expression that can read the first few =
bytes of an packet's data contents.
> It seems this is only possible using raw expressions such as @ll and @nh=
=A0 with an offset that goes past the header length and into the packet's d=
ata.
> Is there another keyword that supports u32 behavior that I am missing? Wi=
ll this approach fail because of some internal check to prevent out of boun=
ds reads?
>=20
> Another question is if raw expressions have been fixed or is there a kern=
el change required to enable raw expressions?
> I still get the below error when I try to use 2017 nftables.=20

Would you follow up on this patch to address my comments?

http://patchwork.ozlabs.org/patch/778719/

And send a new version?

Thanks.
