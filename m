From: Elias Valea Peri <eliasvp@gmail.com>
Subject: Re: Doubts about netfilter + nftables and module
Date: Thu, 21 Nov 2019 17:09:17 +0100
Message-ID: <CAPar=umKhb57QNxSeC7285A1okF2OXKMwtqdTBVX5eNsXCWKhQ@mail.gmail.com>
References: <CAPar=unRE+rOGVEnvJfvgLKAz3hBa+azm-gb6kPsP-kUz5MLOw@mail.gmail.com>
 <ed81e7ad-708e-d3f1-0c1d-09329f0c3409@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Zf8WcFZdkJpO0zohnBES88jTnJr2//hkEXayaq6LEM4=;
        b=RqZrhYT+EotkPbSYp9qyid3xrXnILHBueGJfYO6lQkh6cg+ThudLhKoO5nkKBmuw3O
         I6Be/wssvG89oRhcEMPEQRidNGMX+SucFpwrSXziKrdB8kbumgy9VUNCFzL/4wsGt6iK
         9CtQzlfqXPYE1hA2YQnDHZ8bG4PLiKUrvVEdjiiQLM//ly2mNr8YQRFueg7aCiUe3e7C
         uz27w1uLzv1T5Vq4zCufv0bh2fiYlpmr9pD+FVczcyV11Ce/DqATicZVRuhn/PIvONzY
         T48XcsFlu88QwX2kYrMFPLUxorjhi+OPJx7jBhK9zSgaIc/5CSVGleuzIKu25T4k9X2A
         2wkQ==
In-Reply-To: <ed81e7ad-708e-d3f1-0c1d-09329f0c3409@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Arturo Borrero Gonzalez <arturo@netfilter.org>
Cc: netfilter@vger.kernel.org

Thanks a lot Arturo, I will follow your advice.

=C2=A1Muchas gracias!

El jue., 21 nov. 2019 a las 14:59, Arturo Borrero Gonzalez
(<arturo@netfilter.org>) escribi=C3=B3:
>
> On 11/20/19 1:29 PM, Elias Valea Peri wrote:
> > Hi to all, we=E2=80=99re migrating our systems from netfilter + iptable=
s to
> > netfilter + nftables.
> > We=E2=80=99re looking for information about which modules we want/need =
to load
> > for our needs and extensions we want to use.
> > Looking for documentation about, we aren't capable to find a
> > description of what does each module. For some modules, we see easily,
> > just by its filename, what does but for others it isn't easy.
> > We've downloaded our kernel sources, look for doc at netfilter.org,
> > www.kernel.org/doc, etc... without success.
> > Does anybody knows where we can find for each nf_*.ko, nfnetlink_*.ko,
> > nft_*.ko ... file the functionality/extension that implements each one
> > ????
>
> In general, you have some description of each module at Kconfig files, fo=
r example:
>
> https://elixir.bootlin.com/linux/latest/source/net/netfilter/Kconfig
>
> The nf_tables framework is a bit different from x_tables. In x_tables eac=
h
> target/match provided a very specific functionality that you may or may n=
ot find
> interesting for your use case (and you could disable if not)
>
> In nf_tables rules are composed of low level expressions each providing s=
ome
> kind of functionality. Mots likely you won't find a 1:1 correspondence be=
tween a
> given nft rule statement and a kernel module. Unless you know you are doi=
ng, I
> would advice to enable all of the nft_ modules, to make sure the ruleset =
you
> configure has the corresponding kernel support.
