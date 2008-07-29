From: "David Boulding" <davidboulding@gmail.com>
Subject: Re: your mail
Date: Tue, 29 Jul 2008 16:09:29 -0400
Message-ID: <5226fb870807291309q42b4c226q971aa487bd3703eb@mail.gmail.com>
References: <009301c8ef85$a7389050$f5a9b0f0$@com>
	 <20080728141409.GC27519@khasse.inl.fr>
	 <5226fb870807280721kaa95f6esc6955cc87da42c18@mail.gmail.com>
	 <20080728144341.GD27519@khasse.inl.fr>
	 <5226fb870807280833x5eccb178jf8fc16740396b33b@mail.gmail.com>
	 <20080729071130.GA5383@bayen.regit.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=mlRbgKMOsu7mjxkiZ4iwMkfaaeoTKlgLfDH4l16XbZE=;
        b=XJjbyjLuWYVjJk9DUWosUXEBxxqUaQ4KUKcXEQtadT3GWq67hqF5mCTiH1M5ZTRjZd
         dWwX0CjfkO9ZqwgXyVnnSc0m1ivEch/qEQ5vdw20OYJGa36umIgxyc8+ptEdTXFwlPfI
         93Umk6Yj3oprfz18xNmmj4ALVhUFPxWsetBM0=
In-Reply-To: <20080729071130.GA5383@bayen.regit.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@inl.fr>, David Boulding <davidboulding@gmail.com>, netfilter@vger.kernel.org

Thanks for the help!

Dave

On Tue, Jul 29, 2008 at 3:11 AM, Eric Leblond <eric@inl.fr> wrote:
> Hello,
>
> On Monday, 2008 July 28 at 11:33:24 -0400, David Boulding wrote:
>> I've never heard of NFLOG or ULOG, is there any documentation under
>> netfilter on how to use it? How would I get the data that I want (to
>> sniff) using NFLOG/ULOG?
>
> For ULOG, you can have a look at ulogd or ulogd2 code.
>        http://git.netfilter.org/cgi-bin/gitweb.cgi?p=ulogd2.git;a=blob;f=input/packet/ulogd_inppkt_ULOG.c;h=c00d9bf8a965be7f961738892e19191efcf8f691;hb=0b789ea9bf810497845456e9b83bff8c5ae5ca23
> By the way, as ulogd2 uses a plugin mechanism, you may be able to build
> what you want by coding an ulogd2 plugin. It can provide you a way to
> code something independant from low level (NFLOG or ULOG can be used as
> input without changing your plugin).
>
> A mini doc about ulogd2 hacking is available here:
>        http://home.regit.org/?page_id=90
>
> For NFLOG, you need to use latest git for kernel and libnetfilter_log.
>
> The following functions are available:
>
> - nflog_get_hwtype: to fetch hardware type (and thus give the parser to
>  use)
> - nflog_get_msg_packet_hwhdrlen: to get hardware header len
> - nflog_get_msg_packet_hwhdr: get hardware datas
>
> BR,
> --
> Eric Leblond
> INL: http://www.inl.fr/
> NuFW: http://www.nufw.org/
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.6 (GNU/Linux)
>
> iD8DBQFIjsKinxA7CdMWjzIRAofmAJ9mi4P5SRkPugu8wADwtmB2LlHmigCfWjNn
> E77TPzKV3LStdfYgpFCobVA=
> =ruvK
> -----END PGP SIGNATURE-----
>
>
