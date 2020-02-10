From: Glen Huang <heyhgl@gmail.com>
Subject: Compiling nftables with stack-protector-strong fails checksec's
 canary check
Date: Mon, 10 Feb 2020 23:10:28 +0800
Message-ID: <6A09ABFE-49AF-4629-BC3F-382FA8E895FE@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:content-transfer-encoding:mime-version:subject
         :message-id:date:to;
        bh=AaW3Zboy801bjG95A5Q8T0SZvhIySgc9w1nvLFlwzQ0=;
        b=o0rYnNqgaNWo4MZ6JrXIBlSoES+CySZnteEimiY4L09AOr14pLfA7q4cHI8Whaj+gN
         C3AkD2bNQgta+Vjv1b8x9mxlthr4yQ6+l2w0WdTx0EWd4YghrueZaosqAVHAe5mFQck2
         hkyW6PtGTI4Afhcgq28zwuQF5+q3yxqUiwlQJJU5t6i4UeRMY/kQCIedGezsKfJG1/W1
         qnM0vFdGvlXEc1+X8UqLmrhHfsVSMc34BcS6+o8KH/gFujR6/5hvjjssAux+x/bXSo/3
         nzuJe//zzFfp4yZO0ECZWZ0z0zilHPeAjI0tJlrzN77by9bygdpuEprhPKS+MfQ1linu
         lc/w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi,

I=E2=80=99m trying to compile nftables with hardening applied by using =
these commands in Debian buster:

export CFLAGS=3D'-g -O2 -fdebug-prefix-map=3D/tmp/nftables=3D. =
-fstack-protector-strong -Wformat -Werror=3Dformat-security' \
&& export LDFLAGS=3D'-Wl,-z,relro -Wl,-z,now' \
&& ./configure \
    --prefix=3D/usr \
    --sysconfdir=3D/etc \
    --disable-debug \
    --disable-man-doc \
    --without-cli
&& make install

Everything is fine, except that /usr/sbin/nft fails checksec.sh=E2=80=99s =
stack canary check where it says =E2=80=9CNo canary found=E2=80=9D in =
the STACK CANARY column

That test is simply done with readelf -s /usr/sbin/nft 2>/dev/null | =
grep -Eq '__stack_chk_fail|__intel_security_cookie=E2=80=99

I wonder why this check fails? Is there any flags I should add to pass =
it?

If I change -fstack-protector-strong to -fstack-protector-all, then the =
test passes, but I=E2=80=99d like to stick with fstack-protector-strong =
if that=E2=80=99s possible.

Gcc version is "gcc (Debian 8.3.0-6) 8.3.0=E2=80=9D and I take the =
hardening flags from Debian=E2=80=99s "dpkg-buildflags --get CPPFLAGS=E2=80=
=9D and friends.

Regards.=
