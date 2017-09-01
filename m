From: Raul Martinez <mraul@qti.qualcomm.com>
Subject: RE: Possible nftables U32 equivalent to read packet's data contents
Date: Fri, 1 Sep 2017 16:39:35 +0000
Message-ID: <c57ba9690f0d4ec680ce16599e8b15da@nalasexr02h.na.qualcomm.com>
References: <f337fb23f03b4a60ae45f24a49dd7696@nalasexr02h.na.qualcomm.com>
 <20170901103004.GA16773@salvia>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
  s=qcdkim; t=1504283977; x=1535819977;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=psf7KI9WVdw1lpj16IpDFabvzNyhqW4W8KS7DFtP36U=;
  b=zUhSoxMnKtU0J1LqfXUfwyPi6vDZGNsC0v65SN1Hf4nn1x1xxmd/X2XE
   PU801au/Zm3UGib9atzRSMJlSKB60GT9idLyXIwZqx6sBzlng4k02iH7p
   Rwfp99ENb/aFJljU6/p0wN5hBLrD9Nfam07saAw6ryVoC+m9BJdXQMetc
   s=;
In-Reply-To: <20170901103004.GA16773@salvia>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi Pablo,

Ultimately my use would be to read the first byte of a ESP IP=20
packet's data payload. So IP layer is where I would want the=20
expression to work in.

The packets I am working with are identical and need to be=20
routed to one of two interfaces based on if the first byte of=20
the data contents is non-zero.=20

Regards,
Raul



-----Original Message-----
From: Pablo Neira Ayuso [mailto:pablo@netfilter.org]=20
Sent: Friday, September 1, 2017 3:30 AM
To: Raul Martinez <mraul@qti.qualcomm.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Possible nftables U32 equivalent to read packet's data content=
s

Hi Raul,

On Wed, Aug 30, 2017 at 09:59:26PM +0000, Raul Martinez wrote:
> Hi all,
>=20
> Looking for a way to implement an expression that can read the first=20
> few bytes of an packet's data contents.  It seems this is only=20
> possible using raw expressions such as @ll and @nh=A0 with an offset=20
> that goes past the header length and into the packet's data.  Is there=20
> another keyword that supports u32 behavior that I am missing?
> Will this approach fail because of some internal check to prevent out=20
> of bounds reads?
>=20
> Another question is if raw expressions have been fixed or is there a=20
> kernel change required to enable raw expressions?  I still get the=20
> below error when I try to use 2017 nftables.

If not much asking, what application layer patterns would you like to match=
?
