From: Born Without <blackhole@airpost.net>
Subject: Re: osf match, --ttl & --log options missing in iptables[-save] [-[L|S]]
Date: Thu, 27 Dec 2012 19:19:38 +0100
Message-ID: <50DC913A.1080409@airpost.net>
References: <50DBE9C9.8090500@airpost.net>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=mesmtp;
	 bh=uFq5Y57Go9lL4pHDonfk1x0MP3M=; b=ECDXEmuM63ML/Rg9siTQtZ5FIRqa
	WjuTujdKEOXfxkYuo+8q98qupaTxQzzvOvEzgTVS4zh/Go9TLOxsNbF1eWA3xcJv
	tGLTzBjy5QcvDc3qkq6K/Vb1dNIlHzPXCc/OKzugqf7oIIhnJFJ7VVAhRgnQsabN
	cQpgZ6HvHlh7I4I=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding; s=smtpout; bh=uFq5Y57Go9lL4pHDonfk1x
	0MP3M=; b=X7vdIPXI4+yuc/Yxs6hKExpRy48QCnqLatYCo9QVKMGcQFhOlt1tPp
	VI5lA0P4i5m68bmt5XwTjVeY3tBb+No6ZuCS7S3JHKGNBUUMHW9bN0JBO0riK5jc
	IIxVQAYXTpicOmj5UeBy8xcIT6gU9hjES0W35a2n/mAbi6a5+w+SA=
In-Reply-To: <50DBE9C9.8090500@airpost.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 27.12.2012 07:25, Born Without wrote:
> Hello list!
>
>
> # $IPTABLES -N FOO
> # $IPTABLES -A FOO -p tcp --dport 445 -m osf --genre Windows --ttl 1
> --log 1
> # $IPTABLES -S FOO
> -N FOO
> -A FOO -p tcp -m tcp --dport 445 -m osf --genre Windows
>
> kernel: 3.2.35
> iptables: 1.4.16.3
>
>
> iptables -[L|S] and iptables-save seem to miss the --ttl and --log options.
> Therefore on restore, those settings get omitted.
> Looks like a bug to me!? If so, should I report it to some bug-tracker
> or so?
>

Another thing I noticed is, that if negation (!) is used on the --genre 
option, iptables -S or iptables-save position the negation wrong i.e:

-A PROBERS -p tcp -m osf --genre ! Windows -j SET --add-set 
other_probers src


