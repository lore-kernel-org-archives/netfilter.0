From: Richard Horton <arimus.uk@gmail.com>
Subject: Re: rate of traffic that mach a rule
Date: Thu, 2 Sep 2010 08:00:40 +0100
Message-ID: <AANLkTinRD2La00g6ywB8QggLsHPphagCDV1Vk0W4mOK5@mail.gmail.com>
References: <AANLkTikGf4SoTnkSW_0QtusAzr-D5xZXQ61UVxojiSPc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=TV2yq7zsjjD9/h+S/3p4+J5CGXGoRmv7mqUa4zdTlhg=;
        b=Sqg93rv2AKOk2QtIZSxI/8HauEcVZ/VlozPZj/6P/0SZmu9YT6Pna5BpdGO37fV+Pt
         y2Tf6U2g/hc533LcSyKMtP5h4D4L1Xn/7uPR15Gprl6/k4QkvnnwdzV0Xj28g3rFhZNE
         U/29LstRhugXxqc8AD0VWZPWxcT4yYrDdryNI=
In-Reply-To: <AANLkTikGf4SoTnkSW_0QtusAzr-D5xZXQ61UVxojiSPc@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Mamadou_Tour=E9?= <e2ia.ci@gmail.com>
Cc: netfilter@vger.kernel.org

2010/9/1 Mamadou Tour=E9 <e2ia.ci@gmail.com>:
> Hi all,
> is there a mean to know the rate of traffic that mutch a rule?
>
> for exemple i'd like to kow the rate of traffic that match the rule
> iptables -t mangle -A POSTROUTING -p TCP -dport 80 -j ACCEPT
>

As a thought create a htb queue:
One queue set to 100% of your line speed
One queue set to an arbitry value (say 50%) and allowed to borrow upto
100% (ceil parameter)

Mark traffic you want to rate monitor in iptables using -j MARK --set-m=
ark

Use a tc filter to direct that traffic into the second queue and
monitor the queue statistics...

--=20
Richard Horton
Users are like a virus: Each causing a thousand tiny crises until the
host finally dies.
http://www.pbase.com/arimus - My online photogallery
http://www.richardhorton.info
