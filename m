From: Glen Huang <heyhgl@gmail.com>
Subject: Re: Compiling nftables with stack-protector-strong fails checksec's
 canary check
Date: Mon, 10 Feb 2020 23:18:19 +0800
Message-ID: <FFD29E75-A66D-4EAA-8D69-6A2CFC6FB376@gmail.com>
References: <6A09ABFE-49AF-4629-BC3F-382FA8E895FE@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:content-transfer-encoding:mime-version:subject:date
         :references:to:in-reply-to:message-id;
        bh=sbfpGBXZqa7cFniOE9eKhGf2OSPujVHJpKUCVRtmdOE=;
        b=AuRSEOp2jdSJK4uc8++n26jT0b9aKD4oOkGodP/yoyO8ZbmeKvjAuyk/r+cyED/W03
         czmCjBr35j9xRKWK/NYmgOgFANZ9EtLQAmJ+scen57YsKw/S8oqMsKQCzCeufJLbL8h6
         e5r1JJPx6TiKWfUaArPTC/Idb4Rpa87SqLNeVOJ5oEHXkkLltSO8Sh0RCHGLSNJy8SqV
         ggFUNmKgwkB0O8TjP2Zid5nDdGTQ8Ottgz99m/HaP49spk70O+u5oTUaYhTrppuncf/h
         CX6PqhKFB3dsEawqr9X6nc9806FWcLrZVBmCYXjR/J75KfGhEK4IXK2iRKSqeAEysXz9
         HJ1w==
In-Reply-To: <6A09ABFE-49AF-4629-BC3F-382FA8E895FE@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Forgot to mention, I=E2=80=99m trying to compile nftables-0.9.3

I also use export CPPFLAGS=3D'-Wdate-time -D_FORTIFY_SOURCE=3D2=E2=80=99
But I don=E2=80=99t think that really matters.

> On Feb 10, 2020, at 11:10 PM, Glen Huang <heyhgl@gmail.com> wrote:
>=20
> Hi,
>=20
> I=E2=80=99m trying to compile nftables with hardening applied by using =
these commands in Debian buster:
>=20
> export CFLAGS=3D'-g -O2 -fdebug-prefix-map=3D/tmp/nftables=3D. =
-fstack-protector-strong -Wformat -Werror=3Dformat-security' \
> && export LDFLAGS=3D'-Wl,-z,relro -Wl,-z,now' \
> && ./configure \
>    --prefix=3D/usr \
>    --sysconfdir=3D/etc \
>    --disable-debug \
>    --disable-man-doc \
>    --without-cli
> && make install
>=20
> Everything is fine, except that /usr/sbin/nft fails checksec.sh=E2=80=99=
s stack canary check where it says =E2=80=9CNo canary found=E2=80=9D in =
the STACK CANARY column
>=20
> That test is simply done with readelf -s /usr/sbin/nft 2>/dev/null | =
grep -Eq '__stack_chk_fail|__intel_security_cookie=E2=80=99
>=20
> I wonder why this check fails? Is there any flags I should add to pass =
it?
>=20
> If I change -fstack-protector-strong to -fstack-protector-all, then =
the test passes, but I=E2=80=99d like to stick with =
fstack-protector-strong if that=E2=80=99s possible.
>=20
> Gcc version is "gcc (Debian 8.3.0-6) 8.3.0=E2=80=9D and I take the =
hardening flags from Debian=E2=80=99s "dpkg-buildflags --get CPPFLAGS=E2=80=
=9D and friends.
>=20
> Regards.

