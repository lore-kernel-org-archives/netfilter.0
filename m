Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0E43D0C6
	for <netfilter@vger.kernel.org>; Thu,  7 Mar 2024 23:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709853104; cv=none; b=bPV7G4+o+8oohPlwGfc60z8aw8I5Sr613GTqTLmaRQt/Cm8fhp9fBuGVC4DYjNXLyPr4esucnPlH+/gas8Z9rxD5iXLBNYYQzmVcDY3kDaYqrFcMv4XdTZEibJ5EVa4S8YDu0xtnk9pBkwqo1lqYJjTzqF9jMzoaRemr662aFGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709853104; c=relaxed/simple;
	bh=o61pihFcOAM1Ml8gKWD7z2UmZi03RaQhINfoDJq1ozw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=nXHPznu4iAd9kdahKRRAicNBTZhEmsn6Z0xpBWEWGKi1Z9GzCiI+mY5TfRZ9CrH9KJ5KTxZygmNaSlk3/Ro+/GOttnRO56DjFKADubPxAsqqxBEYtvQHMLuRFoOzuCj3yYgza1JlEq+gD7vaA5ECP5TSEUycOLJcNP9i6XzFca4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fz6wpw5m; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fz6wpw5m"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56682b85220so248519a12.1
        for <netfilter@vger.kernel.org>; Thu, 07 Mar 2024 15:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709853101; x=1710457901; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zj5tWpnvnsjjN7vCQx6bd/LXn05pEc4OyuL32fJ7DVc=;
        b=fz6wpw5mcxh1LNOtU8LfZGpuDNLOjtsewbsPLco414U9/TzlCU8c0eOA25tcuhWsRh
         rzVF+c2SBGImdDDqDxOik/D5lErWTGkT7gJeLANGLk2MDNj0kamW+96eeIrJwNStbFmC
         gvJil2AbJ+H5Aou+1EF1v0LOxYIx7EJ3LJ2MW1mH/NvcvSzy1R5K4cMmQdk9UEUmpEpo
         VAyrkMoNIYMHgYEfsFCcsfwWx7cfSAadE+z3pRJsiYQfNgBcHRPnGMudKWCTvTxJXsc/
         hOxjcD5iYLFd0K4Ee4lPo9SxgB+dN6mRXpVeKQw8xPT8SRmjM2xb9wv4ggQcrQWMbPmO
         kIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709853101; x=1710457901;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zj5tWpnvnsjjN7vCQx6bd/LXn05pEc4OyuL32fJ7DVc=;
        b=qBaAVUNK0dgtcVVR1G8vBPyMTgA+2UvG3HXDN+vfDCCccKlCKzohhvOMQmmG1S5uiu
         hzGkQPR1bNdEDy6JK1fxS2G97RllSb9SnyPwKLOgX45Wwe3qHzHS//FfiimTqH48qpyV
         QwMz/3R5Y2xmElCagcGTfhT1vcRC+WRkUFMETiCi1rfX15CK9FtA7wSYbu2/hX+eq4zo
         K4ZXMeFPgivDJQCbQwv1V5dLZQ7tA/5VWyBMATOcF0+qe3iva4AqVD2Yr4pD0uOHgy4a
         hSnuCmzNMwkGV0dCNdGO27JgAgfU/rpAI82+syuof3MBG0iDZptEc6j1qrQjChbzzBjR
         Pwgw==
X-Forwarded-Encrypted: i=1; AJvYcCUHv14tDDU8gvFV6HKT31fO4oSWXAMEhqAyq58YaLS3FB06AWEU5TwdY2HIKPe7whi06xCGX3XEt1uUaX0bZbgrxxN5qDo7EHaQ
X-Gm-Message-State: AOJu0YxzYj1OZDPObSaHXn9niynBPDxdoLxCwhZXkg4XYAQKskbJyqrm
	Jcnj7i8A3lqqgB5vhQA+ogGtBtGyEDtIF/FpWBiUj7VD19tLe0E/mcK9nBybR8StXefye0gOVGi
	JY0oSlZEMSOds9rcfoMEavv74k1dYDYElAV/JTQ==
X-Google-Smtp-Source: AGHT+IFa3cABkh/Slokffg73XowBX8gvkAjq+m++Y6V0IOFzfPe/KKdecVeX5LoxURC19DYG8JfGrCO2b7UR0CKmm5Y=
X-Received: by 2002:a50:cd43:0:b0:566:5dcc:1c27 with SMTP id
 d3-20020a50cd43000000b005665dcc1c27mr734078edj.41.1709853100495; Thu, 07 Mar
 2024 15:11:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANvpR2BQ6--KT+aqTNXKO59VOVR9Bq_=JmXEaAL31ra1u_DZaA@mail.gmail.com>
 <20240306223923.a908a0e0cbfce4a77556ed34@plushkava.net> <CANvpR2CH-xmJ05dEou7h1PeBm498qwD0YfiDh_8u_2eQeQKL2g@mail.gmail.com>
 <c684a0b5-9e36-4d90-aa1e-af4dc99503fc@app.fastmail.com> <CANvpR2B4NtYKUyEo29SbVNdGoKrRxBgzCVPhNdfmxgviZeZKrQ@mail.gmail.com>
In-Reply-To: <CANvpR2B4NtYKUyEo29SbVNdGoKrRxBgzCVPhNdfmxgviZeZKrQ@mail.gmail.com>
From: Sreedhar M <sreemtech@gmail.com>
Date: Thu, 7 Mar 2024 23:11:04 +0000
Message-ID: <CANvpR2AJoOx7t3x5TQNBSqBeTxnXzzFgjU+RH0Q4rktPOt4mCg@mail.gmail.com>
Subject: Re: nftables rate limiting per multiple seconds
To: Kerin Millar <kfm@plushkava.net>, netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have also tested another use case

Iptables version :  say if user connects 1 per second. ip table allows
continuously - this is perfect
iptables -A INPUT -p tcp --dport 7880 -m state --state NEW -m recent --set
iptables -A INPUT -p tcp --dport 7880 -m state --state NEW -m recent
--update --seconds 10 --hitcount 15 -j DROP

but the below never satisfy the above condition : means if user sends
1 per second once it reaches 15 seconds , it waits for 15 seconds and
then accepts 1 per second after 15 seconds

table ip filter {
    set ratelimit {
         type ipv4_addr
         flags dynamic
         timeout 15s
    }

chain INPUT {
        type filter hook input priority filter; policy accept;
        tcp dport 8000 ct state new update @ratelimit { ip saddr limit
rate over 1/day burst 15 packets} drop
}

On Thu, Mar 7, 2024 at 5:10=E2=80=AFPM Sreedhar M <sreemtech@gmail.com> wro=
te:
>
> Thanks Kerin for the Info.
>
> The workaround is not fulfilling . The use case for me is multiple
> seconds combination.
> I Wanted to keep new connections, at given every 10 seconds period I
> don't won't to allow more than 15 connections
>
> Let me explain , as I Wanted to accept new connections, at given every
> 10 seconds period I don't won't to allow more than 15 connections .
>
> With the below rule, ex: say on a src client  If I run 15 connections
> in one second because of 15 packets burst the rule will accept, from
> 2nd second onwards it accepts 1 each second until it reaches 10
> seconds. basically the rule shouldn't accept any more until it reaches
> 10 seconds. this the problem with all two work around I said earlier.
>
> The goal is at given every 10 seconds period I don't won't to allow
> more than 15 connections. With burst say If accept 15 connections at
> 1st second, then the next connection shall be accepted only at 16th
> second. This is where I am struck please.
>
>
> table ip filter {
>     set ratelimit {
>          type ipv4_addr
>          flags dynamic
>          timeout 15s
>     }
>
> chain INPUT {
>         type filter hook input priority filter; policy accept;
>         tcp dport 8000 ct state new update @ratelimit { ip saddr limit
> rate over 1/second burst 15 packets} drop
> }
>
> Thanks
> Sreedhar
>
> On Thu, Mar 7, 2024 at 12:30=E2=80=AFPM Kerin Millar <kfm@plushkava.net> =
wrote:
> >
> > On Thu, 7 Mar 2024, at 10:08 AM, Sreedhar M wrote:
> > > This is really inconvenient that we cant rate limit the packets for
> > > multiple seconds , we have only the close enough but not 100% right i=
n
> > > edge cases.
> > > "1/second burst 10 packets" should be close enough. The bucket will b=
e
> > > initialised with 10 tokens and refilled at a rate of 1 per second.
> >
> > I understand that it it is not precisely what you are asking for and am=
 definitely not opposed to the idea of supporting more flexible intervals. =
At the same time, I don't see what renders the suggested rule so very incon=
venient. Should the bucket be drained through flooding, it will achieve the=
 overall aim of allowing for no more than 10 packets to pass over 10 second=
s.
> >
> > Regardless, it is possible to implement more powerful rate limiting sch=
emes through the use of dynamic sets, as should become clear momentarily.
> >
> > >
> > > I really cant have an alternative for below please
> > > iptables-translate  -A rms0  -p tcp --dport 8000 -m state --state NEW
> > > -m recent --update --seconds 10 --hitcount 15 -j DROP
> > > nft # -A rms0 -p tcp --dport 8000 -m state --state NEW -m recent
> > > --update --seconds 10 --hitcount 15 -j DROP
> >
> > Since this is a different problem to the one that you initially describ=
ed, it would be premature to infer that you can't have an alternative. Fort=
unately, you can. Below is a small ruleset, demonstrating how it can be imp=
lemented.
> >
> > table ip filter {
> >     set ratelimit {
> >         type ipv4_addr . inet_service
> >         flags timeout
> >     }
> >
> >     chain INPUT {
> >         type filter hook input priority filter; policy accept;
> >         tcp dport 8000 ct state new update @ratelimit { ip saddr . th d=
port timeout 10s limit rate over 1/hour burst 15 packets } drop
> >     }
> > }
> >
> > It works by creating a dynamic, named set and leveraging the ability of=
 ntables to update sets from the packet path. Each time the rule is matched=
, it adds or updates the set with an element consisting of both the source =
address and destination port. Newly added elements bear the given rate limi=
ting policy, along with a timeout of 10 seconds, thereby matching your --se=
conds parameter. The capacity of the bucket is set to 15 tokens, thereby ma=
tching your --hitcount parameter. The buckets of elements that continue to =
survive the timeout will be credited with a single token every hour - a del=
iberately long interval (you may lengthen it further if you wish).
> >
> > I would suggest taking a look at the SET STATEMENT section of the nft(8=
) man page:
> >
> > LESS+=3D'+/SET STATEMENT' man nft
> >
> > There is also some information in the wiki:
> >
> > https://wiki.nftables.org/wiki-nftables/index.php/Meters
> >
> > --
> > Kerin Millar
>
>
>
> --
> Best Regards
> Sreedhar



--=20
Best Regards
Sreedhar
