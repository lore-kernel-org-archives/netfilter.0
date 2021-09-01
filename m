From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Fwd: IP daddr filtering not working for non-routable address
Date: Wed, 1 Sep 2021 12:24:46 +0100
Message-ID: <20210901122446.ff7367368ead217fd01996f0@plushkava.net>
References: <CADjU3LmddfsRShNVx-hArmivM=iUGvEFg28Gd90qyg7VRGqvbw@mail.gmail.com>
        <CADjU3LkCskd4XSEWKX_WzWbwMmhd6hPhLT+zqGDE_-Ubch4V2Q@mail.gmail.com>
        <20210901110659.9cd84a2f7aa484bfe76a9a62@plushkava.net>
        <CADjU3LnN_uLqZ1LKJcjBCotv+OVJiL7v8xdsdt89_nxHOqHJjw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=date:from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        3r9rp4yNTRGZIJ5irYJtflr/DiLpfVGHbZtmbithbvs=; b=GB8hpDaJWinWkUys
        blTEyMjKxqVzEMkvAfGzdf2YB0LzNOKH3+nSYDve/rcXfVsmeV9abjUTMAGl/bAz
        FangOm6TAjPQU3xYd4SES26ZU+dGrvAL+34Rkyds+dQvGEcFDtRv5xHBfHyaZMTp
        pfmgUU3l7s8nHDXcLezI0l5OX1w6sG2X6SSVA1MYlItUfEm5ho4QCekRVwszaeKC
        PZW4X82JbJafYga0fYYR4SkMQwdvX6H9P6nLKe8NDYnMvv6UFb40NvEJX9Q6Gmap
        Xr3zRZ+kT+/LyjFOSwNBte3tjyFN3BodDYgvTsyIZkYMSXY8LG0meqAF+vmgEuEQ
        F5Astg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=3r9rp4yNTRGZIJ5irYJtflr/DiLpfVGHbZtmbithb
        vs=; b=lsg685PvMp0e7QFgwwOFW1FUJ+gVgNBuO7QYFPAwVj19UkWbXnyI+tdeZ
        qKFD6Pgm4cuK/5CNA4NfFFfqQXHW0DQE/c6DyEjUudkWpAMC0BNkYKXIPJeqWpkA
        8ZDdWoigy1dsP5yxr7sCc4I9Ne5bQ/sx7QVe+DV4QasXQ9hqEKv+1R4KyP17OUi9
        HoIIG7NThmvKi48meOONOAIbxYDt7tXM6SGnFC1hmdznPVi+fjnPWvJGxtyqHypv
        xf2SZX5XwOGFYwbK3H7aJjnppDwDRi97xx22eiVrc69WcX7Nehwby//a0JePJr7r
        ppDQ0dVTTs3YCDoUgAMnmfz6+9/pA==
In-Reply-To: <CADjU3LnN_uLqZ1LKJcjBCotv+OVJiL7v8xdsdt89_nxHOqHJjw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Niko =?ISO-8859-1?Q?Kortstr=F6m?= <niko.kortstrom@gmail.com>
Cc: netfilter@vger.kernel.org

On Wed, 1 Sep 2021 13:54:51 +0300
Niko Kortstr=F6m <niko.kortstrom@gmail.com> wrote:

> Hi
>=20
> Sorry on we're making some changes and changing the names, on target
> ip-filtering has been changed to ecpri-ip-filtering. How do the packets
> filtered not increase counters past the accept rule if they are not
> accepted by it?

One possibility is that the packet is being considered as a martian as a co=
nsequence of reverse path filtering (RFC 3704). In that case, the packet wo=
uld not be processed by Netfilter at all. You can check the status of the f=
ilter(s) by running sysctl -a | grep '\.rp_filter'.

--=20
Kerin Millar
