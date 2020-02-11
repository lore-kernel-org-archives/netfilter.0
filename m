From: =?UTF-8?B?7JaR7Jyg7ISd?= <ileixe@gmail.com>
Subject: Re: Does anybody experience kernel crush when 'ebtable -t nat -L'
Date: Tue, 11 Feb 2020 23:00:00 +0900
Message-ID: <CAFAx9aZR_HU4ZDAGP4VT1LkyRtk9fL2jAiD9dP80gb3CvF+BSg@mail.gmail.com>
References: <CAFAx9aaiv4dK6Om0kkaGfzxiOY9CDGbzXtube5LLVBiA3pbMxw@mail.gmail.com>
 <alpine.DEB.2.20.2002111201530.6759@tornado.local.jubileegroup.co.uk>
 <CAFAx9aZd6vA0Se_6eEsRCr4AkRgGj3Eb=7SDXrRZPSpxMCN2vg@mail.gmail.com> <alpine.DEB.2.20.2002111243370.6759@tornado.local.jubileegroup.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NYfgqNk3G1KZQAh2BKYeE3wYsPgIdLUH90pDhSUoel0=;
        b=hv2rkvC6X6eUHc+CXByDx500b2oxi8sSa2qVvtCEySAKfiWK4yyCtIuRg0uh2EzQGg
         Hd5cRQvhMiZUJj5pikaqgfQPbLfcdRl6dyzY78BL3URVNxs7B2WC65UIr5PwwGVDtUlh
         ucO8vCn6hs6tEhWYegRdIzKpazeiILVPkd9YX+S8aQhytw7X8Hpnh9pnmad5VcAyyS4A
         iaSjfh2BbnZQuCSrzI7Gcpk20VC1jjC2dFzuehb9ctsMsKPsK1KipEd6YTZFnVVb0Gj9
         h6m0PWgGsS1jYw1lztaEpDDs4XmLge1OGALbHQ18JuNZ5R63AEDKtTp6acI8ofZsVpUn
         MO+g==
In-Reply-To: <alpine.DEB.2.20.2002111243370.6759@tornado.local.jubileegroup.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "G.W. Haywood" <ged@jubileegroup.co.uk>
Cc: netfilter@vger.kernel.org

Oh, I did not realize difference between network and disc. It's
reasonable so surely worth to try. Thanks.
Also, where is Mr.Millar's suggestion? I could not receive his e-mail.
(Sadly G-mail also keep preventing me to send mail..)

Regards,


2020=EB=85=84 2=EC=9B=94 11=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 9:47, G=
.W. Haywood <ged@jubileegroup.co.uk>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Hi there,
>
> On Tue, 11 Feb 2020, =EC=96=91=EC=9C=A0=EC=84=9D wrote:
>
> > Do you mean the remote logging like rsyslog?
>
> Yes.
>
> > We did not try since syslog does not emit at all. Is it worth to try
> > though?
>
> Like you I have occasionally seen strings of NULL bytes in the logs.
> It has appeared to me that something has tried to write a message but
> failed to get it to the disc because of kernel disc write caching,
> which can be many seconds of data.  If the messages go out over the
> network, to a server which does not crash, they can have a better
> chance of reaching some permanent storage.  There are other tricks,
> Mr. Millar's suggestion is good too.
>
> --
>
> 73,
> Ged.
