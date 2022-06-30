From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Creating a map with libnftnl
Date: Thu, 30 Jun 2022 16:54:09 +0100
Message-ID: <20220630165409.7c3d0d1920ba9163ab057386@plushkava.net>
References: <fbaccc73-c98c-4a21-bc12-0c89b041ae32@vt.edu>
        <20220630160303.ed722cd8c3a70facdf133f14@plushkava.net>
        <20220630160628.f7bd5dd1f234d834be19aed6@plushkava.net>
        <a751cf13-8ca9-7d9d-e1d7-6f4242ae8860@vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1656604451; x=
        1656690851; bh=qoyPHvx0s9r2C0JaanbDqqaHaPbCtnOlNIaL7z4oJ/4=; b=u
        0G5GJhFLCzOwQEaNhqBNJz5gSZ9CEDzEL1TtUvnwkjyIodVuk3+IjqUA4JJ+icUV
        3IJO3mUuE0lEjEm7AuI5g7TQ+joqMGI508+/np7hVgCH5Xk+zL01DSbCnEuSuio+
        aG4v+q7gVMOnuXY3WvQL6zHX78bf3AQeiAbXT2VDKTgI+er9BafOvk3WVBs9IKiA
        5lEhD5tEZyLFGFzg/U6k1I2iyvGAS4JBZgMl45lvsW/ABFmNKJZNIwP/zgVXWcHN
        ZKSvUgwRXdcCvpRkbYowkhfh4SXloWjoDYuF+8YmulTEgt+mSGF+yXu/RNQjZEOE
        8NS1nuGXGHUpboUN7KE9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1656604451; x=
        1656690851; bh=qoyPHvx0s9r2C0JaanbDqqaHaPbCtnOlNIaL7z4oJ/4=; b=F
        N35+bwwrjIFg6SiaZ6VNXhk4sGlMPhqk5fpiAhEPvsGNM6lNmL2KMtSH5krjRNWp
        3UYoOX9iluvfQLmhPyISUN6c/2aO5KzEQKua9ukIf6TVq5llJVSN76kyxGX01Enr
        NG7xfOlG5kn2LcXlZ4GzUHzaMxOSuIJ+sdOul4Zlxjzt27z7GbpGnpDEy1X+0No2
        LW3HgNDx14eTPGzgP7+Jjca9cT5o3WoC9BN3o50uiN+EYOlrIIlkeLL52t9/eg0V
        WzPPVDxNuNb6dGrZH6bm3s0x0PGhSksByihK9X88kqhnVf8MyFkjAutVgLhaRC7R
        oIP7xXtXwkvROKdbd4xJg==
In-Reply-To: <a751cf13-8ca9-7d9d-e1d7-6f4242ae8860@vt.edu>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Kiernan George <kbg98@vt.edu>
Cc: netfilter@vger.kernel.org

On Thu, 30 Jun 2022 15:18:54 +0000
Kiernan George <kbg98@vt.edu> wrote:

> Hi Kerin,
>=20
> My current ruleset is:
>=20
> table netdev testtable {
>  =A0=A0=A0=A0=A0=A0=A0 map testmap {
>  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 type ipv4_addr . inet_serv=
ice : inet_service
>  =A0=A0=A0=A0=A0=A0=A0 }
>=20
> }
>=20
> I created this through libnftnl. I tested it out by adding an element=20
> with the following command through the cmd line:
>=20
> nft add element netdev testtable testmap {1.1.1.1 . 20 : 2.2.2.2}

The type declaration should be as follows.

type ipv4_addr . inet_service : ipv4_addr

--=20
Kerin Millar
