From: "Peter Boughton" <boughtonp@gmail.com>
Subject: Re: simple connection bridging
Date: Mon, 14 Apr 2008 23:26:03 +0100
Message-ID: <5d97c170804141526m27dd597cw8d2cdb2d8656bb00@mail.gmail.com>
References: <5d97c170804121439m44ef9243r466dc7e106f0d947@mail.gmail.com>
	 <4801622E.1060407@bofhland.org>
	 <5d97c170804130410p400d523bs118b8885b5c1548a@mail.gmail.com>
	 <alpine.LNX.1.10.0804132100520.9651@fbirervta.pbzchgretzou.qr>
	 <48030D4B.1040204@bofhland.org>
	 <alpine.LNX.1.10.0804141244260.9651@fbirervta.pbzchgretzou.qr>
	 <48033984.9060206@bofhland.org>
	 <5d97c170804141239t1ea0a2c0j6a7f865b508fccb2@mail.gmail.com>
	 <4803B81B.5010201@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=IsXhSlbbNA5wiJwbQOvUuxAPv6MOzAfjoKd1gKD/jWM=;
        b=oHB7CISIwneJWi/585pgVnsZET/1Gm4/bFX9yHiPfPdKzU+IChUl7728AnLr10lEUcaVT6Zl4tQ6tWXE7/TAIVYn+CSWoGAtXcer/Xel2L85KNQrxP//zF0FXlKC9B8k2o/KGbDtADCZZvM4aTgKgI7x4v0A9ECKUibiK9kyyQg=
In-Reply-To: <4803B81B.5010201@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>, Mail List - Netfilter <netfilter@vger.kernel.org>

Thanks Grant.


>  Ugh?  How big of a role is Internet Connection Sharing (a.k.a. ICS) playing
> in this network?  Are you aware of the problems that ICS will introduce in
> to this mix?

As little as I can get away with - I know it's a problematic entity,
but (afaik) it's the only way to share the connection. (It's a 3G
connection, and appears as dialup)


>  I'm guessing by this statement that you are not overly familiar with
> subneting and routing.

Yeah, I have a vague grasp of concepts, but with lots of holes, and
not much practical knowedge.

Your explanations are helping me to make sense of it though, so thanks. :)


>  So I'm guessing your set up is something like this:
>
>                (I Net)
>                   |
>  +---+   +---+   +-+-+
>  | M +---+ L +---+ I |
>  +---+   +---+   +---+

Yep, that's correct.
I've got an image that shows the same with pretty pictures here:
http://hybridchill.com/misc/network_setup_small.png




>  Now, word to the wise about Internet Connection Sharing (a.k.a. ICS). ICS
> runs on the system that shares its (usually internet) connection. This
> system has to be fully functional and in charge of the networks that it is
> sharing its connection to.
>
>  Any system that is a client of ICS will very likely have to be configured
> as a DHCP client, or ICS *MAY* not share its connection to it properly.

So far it appears that I've got it working with static IPs. Someone
has said DHCP is possibly a better way on the Puppy Linux forum, but
given that it's working at the moment I'm okay with leaving it on
static, unless there's any specific advantages to doing otherwise?


Thanks,

Peter
