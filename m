Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DB81F5825
	for <netfilter@vger.kernel.org>; Thu,  3 Apr 2025 18:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743704153; cv=none; b=Z6w71XLFUQeoUt3tk/Y9YetDzMvkT/kEOa3v3gsDIKnUAf7LeQX0XOeoe8/YYRrYblf866LuT3nKA4k9Oe9JT3cyeRiMn2gW6/D5BJywUE2hj8lvBN14S+aJr/QioH4vBYqV6dUcTdarpX3/LVWBiuvfP74fOEWAqP/9ep7sLAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743704153; c=relaxed/simple;
	bh=PQjA1NWwZiqYBszWZlx/FXNeRq8fjT8JevAhL6R9ziQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dL1/DmlU0zu/9sbcDZfWQXcJClsngtXvLzyOvOO9ZCUVSiC4g50Ky918oGspLhUahr7vRx+kKmHR4qE1IIYTMv3C/A6FlukRwjuOJFfko/FXohJ/dNsQCk/4bELQ/nZIIQazwLYydJvaJMXX1JqV5jZ+Xr18aGLqAPSzufOpIGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mcxcIHzX; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mcxcIHzX"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-549b116321aso1375710e87.3
        for <netfilter@vger.kernel.org>; Thu, 03 Apr 2025 11:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743704149; x=1744308949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=edQhjGSw2+ga+VBC0oWj/w1TrKAFmd7Z6Mxa/M7jSmA=;
        b=mcxcIHzXQ7LkpddxDZqmGudNFwiXYw6Y97ne0/4VdUaaJdpSFHL+sgU4K+/qkOyXrG
         JAosYlOsWv1zOEQ4l/GIBrfWUnh5j6u6REO5E4apJfZj6DvSS8sQvo6bWscn/A5CRG5q
         9mtb+qMIic11m1jUNPSnd5LrokQWXlw9J4ZmxCLp7bmrlEwMH2eL4yzltIovO0yxTiV0
         csxaeSoMmi2dfHgQ/x/HbJTr5dJyZIAGT/2lVSz/qScaCUwaGMw8+lMrfr5F1a/PZIjy
         vaLa9Js6+k5PRJD81JWUBjM9DkJsvukC/WE4LyWe6brg1bVKVWbMyf1IKB7P0iQhn7F7
         /A9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743704149; x=1744308949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=edQhjGSw2+ga+VBC0oWj/w1TrKAFmd7Z6Mxa/M7jSmA=;
        b=QXMtbf5TzSq5xsq/YfRHHmpG1v3JhqnUr20nr6QgQalaDyaCkJeZdrXnIL1siRAi1w
         yPm3CZMZ4BB0xU5E4sGjo2sRQLaZXIJ6z1QMPHCC/eIdwQkxsPTBWihPJKtl1IhO/D9e
         3r84oq5eF/pcJ9yYMz8u9woFwb1zkFme9HM5IhPHB2tnrCA9O2m5ivrjCWn30BMqEptB
         ni3gHdvqjFvda+FJ32/Bbsr2KGCIttBeTXacygNJmoiVtLjFHYd8xHJ6TG0bwOlth2Kb
         lEU/s/walFPMrhwTFY0/hYefDK+CAzcRDTeaI6WkcMVlBHjG00DPjNZGsZ7BQnv5tXGG
         dQnQ==
X-Gm-Message-State: AOJu0YxYc6AuL5T23P3HO/Q1AQlPZzPCGO/Z7wwedOQLoBzPmEKg67h/
	MsUTr+KiOiKumJuxX3OxznJJCGeoNgi0+sYIGJjhmdJoRBlXStpj/8jh4GCy3aI2yMvUDaMXPrH
	bSg8ThB9lgsk4umCwmp4FMNvmdQLNG2Yhrzc=
X-Gm-Gg: ASbGncs/Bo6/CinI0mvTc6dk/f/eGFqaeDRH1ngreF7Gb7tjm8FRTzbcqGWu3yS78Vy
	UfGE3f8GvaOgLq2MdqxMQYIapEix4i5RWJFqljxeqUuS1E8hQeJNrkjrkizfj96pzyOoh7IUOMz
	B9Cf72ceeA82N2d8vrbXpj5WaUotSY2711E6GTP/hozFOYaKlODw28BfMlaQ==
X-Google-Smtp-Source: AGHT+IEz496M3X2zxGlSAnR+gTpgfwzHFesOdDzGOpGECMSFX3l/Jr23XHPMxjSQadVXcr07dASuYHJrq16xeqkewFg=
X-Received: by 2002:a05:6512:3ca0:b0:549:8809:ee32 with SMTP id
 2adb3069b0e04-54c22778719mr63117e87.22.1743704148611; Thu, 03 Apr 2025
 11:15:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANgxkqwxitLiMHvtDmaa0c-KaGKwj0GyLvCa+wai3LZSwnQZKw@mail.gmail.com>
 <CAPrh4R6V=4W6VnCowJevFgJTMoT2fWVV1X2eKASKmhD38n_5tA@mail.gmail.com>
In-Reply-To: <CAPrh4R6V=4W6VnCowJevFgJTMoT2fWVV1X2eKASKmhD38n_5tA@mail.gmail.com>
From: sontu mazumdar <sontu21@gmail.com>
Date: Thu, 3 Apr 2025 23:45:35 +0530
X-Gm-Features: ATxdqUG5puyg9TP4pTE6zPFK0d7i7uBBGhF8uugQGGE-Cwd5GndwdTJRpIhiNbg
Message-ID: <CANgxkqwR0V3LvEECApmg-d=xZKN35j663VqsUoCZj9JgQ=UKbQ@mail.gmail.com>
Subject: Re: Nftables v6 address not matched properly in nftable set
To: Bradley Hook <bhook@kansasdeaf.gov>
Cc: netfilter@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Bradley for your response.
I don't think the ipv6 addressing format is the issue here.

I just tried to put a rule on the destination address (I am using
google v6 address "2607:f8b0:400a:804::200e").

Below are the rules I configured in nftable:
nft add set inet filter_table set1 "{ type inet_proto . ipv6_addr;
flags interval ; counter; }"
nft add element inet filter_table set1 "{ tcp . 2607:f8b0:4000:804::200e/12=
8}"
nft add rule inet filter_table ip6_filter meta l4proto . ip6 daddr
@set1 jump accept_actions

        set set1 {
                type inet_proto . ipv6_addr
                flags interval
                counter
                elements =3D { tcp . 2607:f8b0:4000:804::200e counter
packets 1 bytes 80 }
        }

When I do curl requests on the destination IP it is working (curl -6
-vvv https://[2607:f8b0:400a:804::200e]/ -k)
Although I put a strict 2607:f8b0:4000:804::200e/128 check, the 3rd
hextet 4000 is not matched against destination 400a, but surprisingly
it is matching the rule.

When I change the rule, removing the inet_proto option from the rule,
the traffic to 2607:f8b0:400a:804::200e is not passed, it is doing an
exact match in this case.

nft add set inet filter_table set1 "{ type ipv6_addr; flags interval ;
counter; }"
nft add element inet filter_table set1 "{ 2607:f8b0:4000:804::200e/128}"
nft add rule inet filter_table ip6_filter ip6 daddr @set1 jump accept_actio=
ns

Hence I feel somewhere the logic in nftable/netfilter is incorrect and
it looks like a bug.

Regards,
Sontu

On Thu, Apr 3, 2025 at 10:59=E2=80=AFPM Bradley Hook <bhook@kansasdeaf.gov>=
 wrote:
>
> I'd first try using address ranges that are appropriate. It looks like
> you are trying to adapt RFC1918 addresses (for IPv4) into IPv6
> addresses. For RFC1918 equivalent addresses in IPv6, you probably want
> RFC4193 addresses. You can use something like
> https://unique-local-ipv6.com/ to generate your own prefix, that way
> you are using address space that won't get unusual treatment by the IP
> stack itself.
>
> Second, when using intervals, I always specify an explicit mask. In
> v6, that means a /128 mask for a single host. I tend to not use
> intervals unless they fall on a CIDR boundary. That might not work for
> your needs, but it makes the rules easier, and there's so much address
> space available in IPv6 that you can usually use CIDR boundaries
> without issue.
>
> I don't know that either of these would change the behavior of your
> examples, but they might make it easier to identify the problem.
>
> Also, be careful about trying to apply IPv4 logic to IPv6 addresses.
> One is in decimal, the other is in hex.
>
> Respectfully,
> ~Bradley Hook, J.D.
> Director, Information Systems
> Google Certified Project Manager
> Kansas State Schools for the Deaf and the Blind
> bhook@kansasdeaf.gov
> Mobile: 913-275-9982
>
> --
> *Kansas State Schools for the Deaf and the Blind Confidentiality Notice**=
:*
>
> The information contained in this e-mail transmission is confidential and
> legally protected.  It is intended for the sole use of the individual(s)
> entity named in the message header.  If you are not the intended recipien=
t,
> you are hereby notified that any dissemination or copying of this
> information is strictly prohibited.  If you received this message in erro=
r,
> please notify the sender of the error and delete this message and any
> attachments.
