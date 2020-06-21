From: =?UTF-8?Q?Marek_Gre=C5=A1ko?= <mgresko8@gmail.com>
Subject: Re: nftables and connection tracking
Date: Sun, 21 Jun 2020 13:33:55 +0200
Message-ID: <CAChjPdSnqd3p60gRLPNEexi_ABsJAfVgWTZZo3jvYw6wyiUUow@mail.gmail.com>
References: <CAChjPdRd1xePA2fesrj8imCo9gfP_B5bko95MEGEwsAWVX6fjw@mail.gmail.com>
 <20200621080614.GK26990@breakpoint.cc> <CAChjPdQtKBGuUvdveCVc5kmhA+fgP4DUDNKhNd11KUVCKNUZLg@mail.gmail.com>
 <20200621090142.GL26990@breakpoint.cc> <CAChjPdT0xHfAy5+=Lf1ua6bSjiZxiH-=424Yb-GLHyrt5BL=Kw@mail.gmail.com>
 <20200621104516.GM26990@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ht+YDfBeHCwx4HKiTXmwow4/sPIbQSei/03fn2oMWho=;
        b=cxKJOIM63ojoz0dNLSRg8kyZVmpmSpWuZii/8PDW6lkvcWL6hYumSVmoxV94bE9sEz
         8gF3ZgKnlAFq0fyIS4yaBQyG6X8/coCHkTnyrx6IEzYuTCUSfu8HutkAfHolPERNefT8
         xkiQ1Fi6HozXVbKGjHHAuCc/brpceFoOCQ0usSlzfR5aYXmRuSQjaowHeBmseS1PiyZJ
         qD6NZGQw7WAu0EnEaQ5tLPY53QJyPBMUeXgS10vqKO0ND8y/RlVs3LEEH/yJOpHtYPzy
         /2TeRyMQmHK/pmsziZTvtxDLoMWZPSgkc9GhQJgeJulwTwCwvMfPI0sjmOq9LiFy9rf8
         2L0w==
In-Reply-To: <20200621104516.GM26990@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

Hello,

thanks for the sysctl tip. It is wokring.

The iptables-nft does not configure the nftables kernel in the same
way? Because I did not see the problem when using it.

Marek


2020-06-21 12:45 GMT+02:00, Florian Westphal <fw@strlen.de>:
> Marek Gre=C5=A1ko <mgresko8@gmail.com> wrote:
>> Hello,
>>
>> unfortunately the helper is not there:
>>
>> conntrack -L | grep sip                     -> no output
>>
>> It is strange, that if I use iptables-nft it is working. Some userspace
>> problem?
>
> No, looks more like a kernel bug to me, I will have a look on
> Monday.
>
> In mean time, you can work around this bug by removing the entire "ip
> raw" / "ct set" stuff.
>
> and then use:
> sysctl net.netfilter.nf_conntrack_helper=3D1
>
> to re-enable the old auto-assign behaviour.
>
