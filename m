From: Jacky Lam <lamshuyin@gmail.com>
Subject: Re: Ebtables usage
Date: Wed, 16 Feb 2011 17:32:12 +0800
Message-ID: <4D5B999C.2050805@gmail.com>
References: <AANLkTikpZ+q-L7AcYPmZzED3QAtNF-mDx47E5kfo41CW@mail.gmail.com>	<AANLkTikBvMercRhMs-rpRBYurGUV4J3FHXigtBXBhdsc@mail.gmail.com>	<AANLkTimR2FQfmmnoy6YoYYGCAqs=j26KpvtLTYHHgMQN@mail.gmail.com>	<4D5A59D9.9040407@plouf.fr.eu.org> <AANLkTikarsE3D+pyj_xKtR1F-Dy32+BKCiKWRZo18HMC@mail.gmail.com> <4D5B8FF2.2000806@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=iByWqjODwxtydxODKtTEAR2xrJPv+Tj/Mpra3anbTzU=;
        b=NDh8uEWkmwStDEqoeVxtYsgKWSEjtGCQCr44krntXcE2uQR1rYuTXmGpLnPw+o/GTv
         w/4d9mZkg0uH1CmDQUaMYcnVAurQqvgTwTGxT2yJRGzNWIPzID9MI9KN2bkb+DRKAhGb
         lqxMvevS2ocZMjJfY7Lbehj8IHNBhIjZazFXo=
In-Reply-To: <4D5B8FF2.2000806@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

On 2/16/2011 4:50 PM, Pascal Hambourg wrote:
> Jacky Lam a =E9crit :
>> I want to share a network service by two computers but I don't have
>> any extra router or switch, but one computer has 2 ethernet cards an=
d
>> running Linux. But that computer is old and slow. So I want to know =
if
>> I can set up that computer as a ethernet level switch/bridge.
> What kind of network service ? Is that service running on the old com=
puter ?
> You can set up a computer as an ethernet bridge, but that old compute=
r
> may not be fast enough to handle gigabit traffic.
>
I mean the internet service. Yes, the old computer is very slow. That's=
=20
why I want to lower the overhead while being a switch.
>> That means I am done right (except the two rules at the beginning) t=
o
>> setup a ethernet switch? I don't need to setup any rules by iptables
>> or ebtables?
> You need iptables and ebtables rules for IP and ethernet packet
> filtering and mangling. You don't need them if the box does only plai=
n
> routing or bridging.
>
Thanks.
