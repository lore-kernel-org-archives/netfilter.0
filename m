From: Darius <dram@mailbox.org>
Subject: Re: Metering is not working with dynamic sets on nft v0.9.2
Date: Fri, 7 Feb 2020 12:00:53 +0100 (CET)
Message-ID: <89800836.90200.1581073253643@office.mailbox.org>
References: <8665bae3-ba91-2699-15ea-27d256d9bcd2@mailbox.org>
 <4d26b387-5466-d57d-6191-dcbe8926ec01@gmx.net>
 <20200207101740.GC6466@breakpoint.cc>
Reply-To: Darius <dram@mailbox.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-transfer-encoding:content-type:content-type:mime-version
        :subject:subject:references:in-reply-to:message-id:reply-to:from
        :from:date:date:received; s=mail20150812; t=1581073253; bh=7uyAQ
        yQLD2q8a2mcT1faVK/c+4Qr71pDP3RAR1BAHOQ=; b=V+vjI8fA2hcGZDYTUzpeU
        U+sdhK0BFvY+ueHfbI53NOWU5a8Ou4bjYZfkSTI2kqYJec0QZzUW17brvyLAv1+N
        QPFxBaaJqOL1LqGBEjwcqfkyozW9eqSGoSBfHB0lNMHMRxJ98lzjKZGQ61ZDi3aE
        pxqYH/+y77nvzWnQy5fIb+1CU9zh0lkDo/iNg9NxrleULu9Rym+F2p6fB0mv/ylO
        U6WB7c2qdFsr3JS34Vme0lyd848hC1rF27W82T8hjLNqt8jPJot4BVHjob4oiPqQ
        dXS+XiYzg95zeG0CviMU3F9xaxeHIgWBNiRHsM9bGeEN4BdgwFnGDhVISREtWTEg
        A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1581073255; h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yA4ZdsgeujkgGevsWI/5DUJ/lzqc2lHwtC6zXdtHNAw=;
        b=IRjd7OJ0TThOkn9GsxTHESvaJF9WF9UfMBF2fZsxEUd/cNuCyPVOejjyO0sYkv2cx4LWyX
        hrDgtzYtMiGoq2Fpo7VH5YHoiSrPr/Aaerkq5IhWP6mWOSGT2RvTieY+jf/NIYwscPDQea
        CKXUbO5je/lRqqi9woL4muq3kcPaQSVX8wnyq3MkZdldPBISeZTnRVixbfqRStIC3aLfPS
        h6QHCWOVw0JQ9P9gSogJpGyE7GKtyyRZhdCunBvNI9wke8NaI+c96PSppl/5zRSeEVLvAn
        FWmy8RxXrHoCuSuLbIias3AsB1PIjEgY6+ffjq8H9yNuEa9VcB6tUgg1o4OABQ==
In-Reply-To: <20200207101740.GC6466@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Florian Westphal <fw@strlen.de>, =?UTF-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Ok, I'll keep using 'meter' keywork. Sets are working just perfectly, all s=
ets instructions works as well.

But do you know if it is only 4.14 kernel affected? Is there any bug report=
 and patch available for this issue for kernel 4.14?

Regards

> On February 7, 2020 11:17 AM Florian Westphal <fw@strlen.de> wrote:
>=20
> =20
> =D1=BD=D2=89=E1=B6=AC=E1=B8=B3=E2=84=A0 <vtol@gmx.net> wrote:
> > On 06/02/2020 22:42, darius wrote:
> > > Hello,
> > > I was using meters by using 'meter' keyword, but apparently it is now
> > > obsolete.
>=20
> Not really, it will continue to work.
>=20
> > If not mistaken the intention is to replace meter with native set / map
> > syntax but meter not yet being depreciated/retired.
>=20
> Yes.
>=20
> > > root@HOMEROUTER:/etc/config# /etc/init.d/firewall reload
> > > /etc/config/ruleset.nft:416:9-187: Error: Could not process rule: Not
> > > supported
> > >          ct state new add @mymeter { ip saddr timeout 30s limit rate =
over
> > > 50/second burst 50 packets } counter drop
> > >=20
> > > I'm running OpenWRT, kernel v4.14.167, nft v.0.9.2
> > > Could anyone help to find out what I'm doing wrong? It seems that I d=
id
> > > it according to wiki.
>=20
> Its a kernel bug.  The kernel picks the wrong set backend on 4.14, so
> when it sees the rule (which requires a set that supports updates) it
> will fail.
>=20
> Contine to use mter syntax if that works for you.
