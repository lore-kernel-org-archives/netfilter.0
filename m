From: Glen Huang <heyhgl@gmail.com>
Subject: Re: Possible to check if ip daddr belongs to an interface in the
 prerouting chain?
Date: Sun, 30 Apr 2023 19:54:22 +0800
Message-ID: <259EB616-F421-469C-89E1-12496603999F@gmail.com>
References: <D797AC4D-8B12-4F80-8C82-1591C3658D0B@gmail.com>
 <37bf019b-6c6e-4e97-a121-91a38270d845@at.encryp.ch>
 <9C3F0DD4-E1F2-4B21-AAF4-5779F0D9655E@gmail.com>
 <0f7066ff-d885-4726-80e8-31df1465a274@at.encryp.ch>
 <4F769A3B-272B-44A2-81A0-4B9AF437FA80@gmail.com>
 <388bf505-89e7-a4c8-29c9-af7b784a3dd1@at.encryp.ch>
 <A7DA2776-4665-48DD-979D-41B4DCB31D7E@gmail.com>
 <20230429092606.b243cfb662aefccebae2d0e2@plushkava.net>
 <459668A7-0536-41CE-990C-2B3E535A5595@gmail.com>
 <20230429095714.c7bb680249a95c1ace3707e2@plushkava.net>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682855666; x=1685447666;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:sender:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q5YPWKBXHZXYxPM6uppk6UOV8p+6I5suAEFxndMTW1M=;
        b=RRbRSOkEdqDX5PfRXfjmzEaGMHf6CW3H/lBlqbko5/rWK/jMY84HKE2rOiCPMyACyM
         c/M3dselZtsI1bvWL2o4sUZcAm8GjrWKN/v5LU5jrBx9WmXLNE/lsUNixNqn8so7ThpO
         uhQpM3JViVQMxKgrXxekJfUyCW9QktQivoj1ml2LbyH7jUYC0Djx+9YikcF76RLu5R9j
         5KxCekfhlCFPV1BEIZPpfOcTKd/P9PMYn0NI2WGydhfHIGQtm+REyJGv83XIUFLBFN4/
         OJD66X7X1O3qR4xETpKU2IJzsHkOWXCaw/sxY8eC3Y/kMvpYyaePl8AwcqCWLTtJyJ2I
         Z7+A==
Sender: Glen Huang <hey.hgl@gmail.com>
In-Reply-To: <20230429095714.c7bb680249a95c1ace3707e2@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Kerin Millar <kfm@plushkava.net>
Cc: Serg <seentr@at.encryp.ch>, netfilter@vger.kernel.org

Hey Kerin,

Do you mind if I ask a follow up question?

I gave the two rules you listed some more thoughts, and I still puzzle =
over a small detail:

It seems the tuple can change the meaning of the type value? For =
example, "fib daddr type local=E2=80=9D, matches packets destine to any =
local interfaces, so =E2=80=9Clocal=E2=80=9D means local to the host, =
whereas "daddr . iif type local=E2=80=9D matches packets destine to the =
interface they arrive, so =E2=80=9Clocal=E2=80=9D means local to the =
iif. I thought the type value=E2=80=99s meaning was absolute?

I also checked man ip route, and it described local route type as=20

> the destinations are assigned to this host. The packets are looped =
back and delivered locally.

So it seems "daddr . iif=E2=80=9D now changes it to "the destinations =
are assigned to the incoming interface=E2=80=9D. Are there other values =
that can have different meanings for different tuples?

> On Apr 29, 2023, at 4:57 PM, Kerin Millar <kfm@plushkava.net> wrote:
>=20
> On Sat, 29 Apr 2023 16:49:48 +0800
> Glen Huang <heyhgl@gmail.com> wrote:
>=20
>>> that are also assigned to the interface at which any given packet =
arrives.
>>=20
>> This solved my issue. Thank you so much Kerin!
>>=20
>> I actually never understood the meaning of daddr . iif, but thanks to =
your detailed explanation, it now clicked.
>>=20
>> (Previous mail somehow got rejected, resending it)
>=20
> It seems that they both arrived. In any case, I'm glad that it helped.
>=20
> --=20
> Kerin Millar

