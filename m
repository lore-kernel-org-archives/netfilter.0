From: V Kurien <kurien.varugis@gmail.com>
Subject: Re: Year missing from ulogd2 timestamp
Date: Tue, 14 Mar 2017 13:19:36 -0700
Message-ID: <CACmTqUnzYy7jiLOahrEnGV_snXUjt6f3aaw4dn5U5UneZ8vNUg@mail.gmail.com>
References: <CAAzdDtMV=OaFftNs8A_AF9-TXCvn-pxmVDqdDHCBD_2HTu3t3g@mail.gmail.com>
 <alpine.DEB.2.20.1703142043320.22524@aurora.sdinet.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=dxxxQtFpMP1dn+sEpnY+8r1g8vK0xknYSruEd15mWkY=;
        b=Ndo3CI5L695Ws2wA5KVxfNwOg57TXzWWbC/HwwDBgWxHpylWkz9tCMn+Mh6ZFDxCDr
         ugpZwI62nu+UC25QavqZ9/ccVgG/RWh9BTQndBehgVWNvz2N3bAtt165nVRq8sTei+sB
         jGMccJi5XSlZvuN1TwsPTN8Ivzs5/oge6FLq/JA36adH3dK46wnghktO9IKWQb9cBvfN
         7n1PACJflBRy0i2OT/jiTN9Yg5BYr6UXczzOshrB2LEHO6THbskzxXgVNlBxLbsnGJ+a
         UIx7ZLblAOI57NfxP8pfPRRvP45Ge36tD4MlHx0PNObVp+76r8H/CCoYiQRa4MWQRzmJ
         iwJg==
In-Reply-To: <alpine.DEB.2.20.1703142043320.22524@aurora.sdinet.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sven-Haegar Koch <haegar@sdinet.de>
Cc: Muhammad Faisal <faisalusuf@gmail.com>, netfilter@vger.kernel.org

Hmm. Not sure that is accurate.

This is an example where I log to local syslog:
==
<174>0 2017-03-14T19:04:31.891156+00:00 ulogd log_flowlog_log
[DESTROY] ORIG: SRC=10.0.202.196 DST=10.0.202.201 PROTO=TCP SPT=52094
DPT=5001 PKTS=12060 BYTES=699112736 , REPLY: SRC=10.0.202.201
DST=10.0.202.196 PROTO=TCP SPT=5001 DPT=52094 PKTS=8972 BYTES=466636

On Tue, Mar 14, 2017 at 12:47 PM, Sven-Haegar Koch <haegar@sdinet.de> wrote:
> On Tue, 14 Mar 2017, Muhammad Faisal wrote:
>
>> I would like to understand is this a feature or a possible bug that
>> Year info is missing from the ulogd2 output.
>>
>>
>> Mar 11 15:55:59 wc01 ulogd[14289]: [NEW] ORIG: SRC=5.55.22.172
>> DST=192.168.1.3 PROTO=TCP SPT=2083 DPT=5158 PKTS=0 BYTES=0 , REPLY:
>> SRC=192.168.1.3 DST=5.55.22.172 PROTO=TCP SPT=5158 DPT=2083 PKTS=0
>> BYTES=0
>
> That is because historically the syslog output format does not contain
> the year. Perhaps in the dark unix ages noone thought that you could
> keep logs longer...
>
> c'ya
> sven-haegar
>
> --
> Three may keep a secret, if two of them are dead.
> - Ben F.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
