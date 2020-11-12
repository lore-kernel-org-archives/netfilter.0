From: Kyle Rose <krose@krose.org>
Subject: vmap declaration style
Date: Thu, 12 Nov 2020 11:33:04 -0500
Message-ID: <CAJU8_nUA1npZFdxp=tqxUeWWbDJr7CLj9pf9JLTGMm26XHkJeA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=krose.org; s=google;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=yAkanrIyNMq+7iC+i1A7jDqpJDxL3j/mmkwOjiU6vC4=;
        b=blc6CuRgXwGYvYecbshqYMTeATYsyMIFBljebyVtj/XI7rwMjSlWC+XvIwU3MqP9sY
         aPpL49VCX9++XFIQgMZEgxezA7Qk79/cuBTD8fhqFfhH4d6H8jz4/4Hu42Mr1qQrpiPo
         G8ioPHc+4+f7Zz+kS2U/6Cli6Few9y2VHDhS0=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

If I declare a vmap and reference it this way:

table inet filter {
    map dispatch { type ifname : verdict; elements =3D { lo : accept } }

    chain input {
        type filter hook input priority filter; policy drop;
        iifname vmap @dispatch

I can then add elements at the end of the input file imperatively:

add element inet filter dispatch { tun0 : jump guest_in }

and the expected thing happens:

$ nft list ruleset
table inet filter {
        map dispatch {
                type ifname : verdict
                elements =3D { "lo" : accept,
                             "tun0" : jump guest_in }
        }

Great. But I would like to have a site-specific include with some
defines. So, I try to pre-declare the vmap, include the site file, and
then define the remaining rules:

add table inet filter
add map inet filter dispatch { type ifname : verdict; elements =3D { lo
: accept } }

include "/etc/network/site.nft"

table inet filter {
    chain input {
        type filter hook input priority filter; policy drop;
        iifname vmap @dispatch

But this produces the following error on load:

/etc/network/nftables.conf:16:22-30: Error: No such file or directory;
did you mean map =E2=80=98dispatch=E2=80=99 in table inet =E2=80=98filter=
=E2=80=99?
        iifname vmap @dispatch
                     ^^^^^^^^^

Yet if I remove the reference to eliminate the error, I get the following:

$ nft list ruleset
table inet filter {
        map dispatch {
                type ifname : verdict
                elements =3D { "lo" : accept,
                             "tun0" : jump guest_in }
        }

I cannot see any difference. Any ideas what is going on here?

Thanks,
Kyle
