From: Raul Martinez <mraul@qti.qualcomm.com>
Subject: Possible nftables U32 equivalent to read packet's data contents
Date: Wed, 30 Aug 2017 21:59:26 +0000
Message-ID: <f337fb23f03b4a60ae45f24a49dd7696@nalasexr02h.na.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
  s=qcdkim; t=1504130368; x=1535666368;
  h=from:to:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=d0cuxuuzCXY0AgJUdCTZr7P+Vkxt4dsVEneP/7mfq1w=;
  b=uY7Cc2PYq5Nk04+2NCXtrUcdk82sRqaYfywHbeItRP57NPpfr0PDUkZF
   NBUA5hHG+sAQJVUUD5IJKZjhKpLd8UJ/qenwO5JRbS8O9DvRB/FqPCRV/
   gqn/LNmPZbPYxJ0SLYDydRJOMaHW+CXdq+IPBfM7mEsTjL8kLhU//PaZL
   0=;
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi all,

Looking for a way to implement an expression that can read the first few by=
tes of an packet's data contents.
It seems this is only possible using raw expressions such as @ll and @nh=A0=
 with an offset that goes past the header length and into the packet's data=
.
Is there another keyword that supports u32 behavior that I am missing? Will=
 this approach fail because of some internal check to prevent out of bounds=
 reads?

Another question is if raw expressions have been fixed or is there a kernel=
 change required to enable raw expressions?
I still get the below error when I try to use 2017 nftables.=20

Re: nftables: Example involving payload_raw_expr

On Mon, Nov 30, 2015 at 02:28:38PM +0100, Stefan Berghofer wrote:
> > Hi all,
> >
> > I just tried out the example file tests/payload-ll distributed with nft=
ables,
> >=A0 which makes use of payload raw expressions of the form "@..,..,..". =
While the first
> > two declarations in the file, i.e.
> >
> >=A0 nft add table ip filter
> > nft add chain ip filter input \{ type filter hook input priority 0\; \}
> >
> >work as expected, the third declaration
> >
> >=A0 nft add rule ip filter input @ll,48,48 00:15:e9:f0:10:f8 counter
> >
> > is rejected with the error message
> >=20
> >=A0=A0 Error: protocol specification is invalid for this family

> It seems this got broken at some stage of the development, so it would
> be good to get this back working and add tests to our regression test
> infrastructure so we make sure this doesn't break again.

Thanks,
Raul

