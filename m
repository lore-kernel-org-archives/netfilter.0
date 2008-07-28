From: "David Boulding" <davidboulding@gmail.com>
Subject: Re: your mail
Date: Mon, 28 Jul 2008 11:33:24 -0400
Message-ID: <5226fb870807280833x5eccb178jf8fc16740396b33b@mail.gmail.com>
References: <009301c8ef85$a7389050$f5a9b0f0$@com>
	 <20080728141409.GC27519@khasse.inl.fr>
	 <5226fb870807280721kaa95f6esc6955cc87da42c18@mail.gmail.com>
	 <20080728144341.GD27519@khasse.inl.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=yXcCvKq8IFJo+PCOcAvbqdChdfsDOSqHAAb4nU4rm90=;
        b=s+qWA641F3Ra6gtrATWXqMoPBWy2sY2siTlKJVG8JUi1tZQ02iXoEJFO2SpmbqOPuF
         SSqK+SUC18htnzqq6MCeToVIsc1qL/0Rvq7OWtb0C5PoUudY6pCUGNGPw3T/iH0lmslL
         XzRjWjYCjLOdb0tLD8KpoC9rvbaIOBiuE2F1c=
In-Reply-To: <20080728144341.GD27519@khasse.inl.fr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@inl.fr>, David Boulding <davidboulding@gmail.com>, netfilter@vger.kernel.org

I've never heard of NFLOG or ULOG, is there any documentation under
netfilter on how to use it? How would I get the data that I want (to
sniff) using NFLOG/ULOG?

Dave

On Mon, Jul 28, 2008 at 10:43 AM, Eric Leblond <eric@inl.fr> wrote:
> Hello,
>
> On Monday, 2008 July 28 at 10:21:43 -0400, David Boulding wrote:
>> Thanks for the reply.
>> I knew of nfq_get_packet_hw(), but I'm looking for a way to get the raw byte
>> > >
>> > > I'm developing with libnetfilter_queue, using "iptables -A FORWARD ." to
>> > > capture packets of interest on a bridge for analysis (firewall).
>
> As you said "analysis", you may only want to "sniff" packet. In that case,
> you can use NFLOG (latest git) or ULOG.
>
> NFQUEUE moudle uses the dev_parse_header() function which only return the
> source hardware address. You will not be able to retrieve the wanted
> information without patching the kernel.
>
> BR,
> --
> Eric Leblond
> INL: http://www.inl.fr/
> NuFW: http://www.nufw.org/
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.9 (GNU/Linux)
>
> iEYEARECAAYFAkiN2x0ACgkQnxA7CdMWjzJSmQCdHBt2ro5Tx7m5GbWhl7uGZz7l
> 5H8Anjc9CaBwO/tOVaywfm+WwzeeBayE
> =felb
> -----END PGP SIGNATURE-----
>
>
