From: vitry <vitry.es@gmail.com>
Subject: Re: REG: ROUTE Target
Date: Fri, 12 Jun 2009 03:19:17 +0200
Message-ID: <4A31AD15.8000001@gmail.com>
References: <1417.117.193.164.97.1244738965.squirrel@mail.benchmarkgroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=KSkHpf/eaGOv1FbD54aOmKK/Kq1z4cznoP5ba83PiQ0=;
        b=Y6xrHli1vQjRMJmUZzrmfkCwymjn97HHewTPOoWaBEQ8j4JQ5Pdc0Ru4MWglvRhdGt
         +krUQK2CRcjpaXypOUNX0u6nsT5twCjRmhfUPicEpKIlUMVQHyYpehona9gZtCew3Zn2
         v8vMn/jNBTQ1T9U2N+zU1NVRh40vES0oqRkXA=
In-Reply-To: <1417.117.193.164.97.1244738965.squirrel@mail.benchmarkgroup.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: geethanjali.ns@benchmarkgroup.com
Cc: netfilter@vger.kernel.org

Hi geethanjali,

geethanjali.ns@benchmarkgroup.com escribi=C3=B3:
> Dear All
>
> I want to use ROUTE target of iptables. I need to use the tee option =
to
> copy the traffic from one interface to another.
> My kernel version is 2.6.28.9 and iptables version is 1.4.3.
> In recent patch-o-matic-ng repository the ROUTE target is removed.
>  =20
Not is removed. In new version of path-of-matic for use extra targets
you have to download it from path-o-matic source directory run:

#./runme =E2=80=93download
Successfully downloaded external patch geoip
Successfully downloaded external patch condition
Successfully downloaded external patch IPMARK
Successfully downloaded external patch ROUTE
=2E..
> What is the steps or how to compile this target in to recent kernel f=
rom
> some old patches.
Very bad Idea.
>  I am trying this option for the past 15 days, but i am
> not success in this. Please some one help me to complete  this one.
> Thank you in advance
> regards
> geethanjali
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>  =20
lucky,
vitry
