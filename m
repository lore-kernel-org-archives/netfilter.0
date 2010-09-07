From: vishesh kumar <linuxtovishesh@gmail.com>
Subject: Re: rate of traffic that much a rule
Date: Tue, 7 Sep 2010 10:26:42 +0530
Message-ID: <AANLkTi=jfFQ1chMPhAo1s8TPUJXWiFQo8e7v+EZWCNN+@mail.gmail.com>
References: <AANLkTimSaMMtDxUjQhOcMtoJN-xyioiUxMK3GvUJJ_au@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=QzodQmftQPk2tblpYZ8+aA37NlZk7jFX1fZsDUY+ie8=;
        b=L+5WDiy+dRoCQeXvCMuyEGscstKxJp+Kvl4WrMbFtVPDsY7OHMCgATBp/k3pBfbEGZ
         1laxDjGyZpf4Z1ar9LtEhIxdCblVFPnZx5VXefgF/JVTSk/grEsmYsUCquxGGvtdMb43
         EO8qJZ264xajS68cdJJnEMNBiJIbbHrHo5Qu8=
In-Reply-To: <AANLkTimSaMMtDxUjQhOcMtoJN-xyioiUxMK3GvUJJ_au@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Mamadou_Tour=E9?= <e2ia.ci@gmail.com>
Cc: netfilter@vger.kernel.org

what i know that we can check number of packets that matched a particul=
ar rule
by creating a custom chain . Then by passing rule output to custom chai=
n.

Thanks


On 9/2/10, Mamadou Tour=E9 <e2ia.ci@gmail.com> wrote:
> Hi all,
> is there a mean to know the rate of traffic that mutch a rule?
>
> for exemple i'd like to kow the rate of traffic that match the rule
> iptables -t mangle -A POSTROUTING -p TCP -dport 80 -j ACCEPT
>
> regards.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


--=20
http://linuxinterviews.blogspot.com
