From: =?UTF-8?Q?Marek_Gre=C5=A1ko?= <mgresko8@gmail.com>
Subject: Re: nftables and connection tracking
Date: Thu, 2 Jul 2020 21:33:41 +0200
Message-ID: <CAChjPdRFPLkKcj3eDiFrpaL2VEoueJxWrx=kwixprHkNUqf-+Q@mail.gmail.com>
References: <CAChjPdRd1xePA2fesrj8imCo9gfP_B5bko95MEGEwsAWVX6fjw@mail.gmail.com>
 <20200621080614.GK26990@breakpoint.cc> <CAChjPdQtKBGuUvdveCVc5kmhA+fgP4DUDNKhNd11KUVCKNUZLg@mail.gmail.com>
 <20200621090142.GL26990@breakpoint.cc> <CAChjPdT0xHfAy5+=Lf1ua6bSjiZxiH-=424Yb-GLHyrt5BL=Kw@mail.gmail.com>
 <20200621104516.GM26990@breakpoint.cc> <CAChjPdSFWc=XpxX_Nw40hBMyFpyWNyEvru1k1WJpKLZE-7CcfQ@mail.gmail.com>
 <20200701224820.GA29407@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kwBDiiSFHIVC+fWNrkaEOOvkujgXS5Sg0PTZs312PYs=;
        b=MSk8C6zbj5L4q4+Ct4RM0OSTbWifCeJ6YeRl88mK4U2jR3cRcwXv43Dsj2gr4ry/0W
         V8RkZ8fx+KGUvViO6baDbNsInt9zuGZIaCgDPSQDjjrJo0Mr294mHlXzAdnl+UwdNcDH
         tTiEBECM5e2yCDp2DgtGdS/rhaqmEent/Oer6f65oKzHxNSQBR6agROZvpHnjCvqwJRt
         ILswO37kGoMeYnB/vJHMCcg0RrbLUpAFPClA8G794vuR4JN3bmtxZ+iE9uqSWmPUVHnb
         xuE26If29btsieam8RhOI3hkgDbDk/UoqPsxkIVGeR0pirn7gsoMs/4MFKpDafJexDS1
         QpUg==
In-Reply-To: <20200701224820.GA29407@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

Great, thanks for explanation.

Now I have two chains OUTPUT with priority filter. One in the table
raw and second in the table filter (currently both of them with policy
accept). Is that correct? What is the order of evaluation? The order
it appears in config file? Should not one of the priorities be changed
to (filter + 1) or the rules moved to the filter table?

Thanks

Marek


2020-07-02 0:48 GMT+02:00, Florian Westphal <fw@strlen.de>:
> Marek Gre=C5=A1ko <mgresko8@gmail.com> wrote:
>> please is it a bug the rules did not work in the raw table or was it
>> my configuration error?
>
> Config error.
>
>> How is it possible that using iptables-nft the rules are added to the
>> raw table and it is working?
>
> iptables-nft and fntables are not the same.
> -j CT works with 'connection tracking templates',
> but the nft equivalent sets the helper directly.
>
> So, for iptables (and iptables-nft), the rule needs to be
> executed before conntrack lookup.  With nft it has to be done
> after conntrack lookup.
>
