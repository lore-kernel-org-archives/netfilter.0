From: Glen Huang <heyhgl@gmail.com>
Subject: Re: Why inet table doesn't support nat prerouting chain?
Date: Fri, 6 Mar 2020 19:40:03 +0800
Message-ID: <4CE65002-0DBD-49F7-9652-F8AF4E966627@gmail.com>
References: <DF324CE0-08D5-4041-9761-D7F740979715@gmail.com>
 <20200306113734.GM979@breakpoint.cc>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=9XN6Dn6Fu5czA0KHc2pBNdufj07Eo40KnDtVsLXuLLc=;
        b=FDtx4gH/NmMMcxoeCkNot1cM4VPpq1B29JZX1nDXxop2P5cK/FPID7CyzGafhFBqZ4
         gBXikVBnY/Z62dYEKvAukZAeD9FZfqaoe7EEmwjXc8LatX7rPKGKOIuEbyxYVECsfmjn
         MqM4o65ji/NRM0n+C7Ol9ILiJZNbqNgtqW3TNIEeSPKrJr1qdYzG2Qq43MR7NXJeju2h
         dx6Nu6uoVBtLt2uFe+ZlYH8fTGlCxmJTxoH6m8jfrTh6LVsQtEqplMYvhEyo3YxUmvax
         qVWUnpn3Cd05/yY1PFXXy+IVDMYZWwRIJ4DoZADlF/STd29CP5G2FwhBd1QaexfdvWhJ
         7OVQ==
In-Reply-To: <20200306113734.GM979@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

Oh, that explains it. Debian 10.3 comes with 4.19.

Thanks, guess I have to create them separately for now.

> On Mar 6, 2020, at 7:37 PM, Florian Westphal <fw@strlen.de> wrote:
>=20
> Glen Huang <heyhgl@gmail.com> wrote:
>> Hi,
>>=20
>> It seems I can create a nat prerouting chain in either ip or ip6 =
table, but not inet, I wonder if that=E2=80=99s by design?
>=20
> Kernel too old? Should work as of 5.2.

