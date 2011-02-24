From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: Squid with three isp
Date: Thu, 24 Feb 2011 02:50:13 +0200
Message-ID: <AANLkTim8yobv-CRVxyDB-=C5mH4f1o8ADO-UgiO3S8c5@mail.gmail.com>
References: <4D6496F8.9070303@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=M7AL1RE5zrBlMJGgR/EqKK5oAhgeenoLh9GfPoWObL8=;
        b=LTdygNMils67y2Lq0AQ7mk/YJE/cMKBv7rkz5Ai7iZ2Ob6lhmR6LMrdy5bQle8LzJV
         SbnwS646vGeIS17ApWkSPOg0mduzXvyYjyBmyhRbXjoFHJkA7c+yiuMbkCSFCeU4MJRB
         ChmVvDe2z/CdBg3Sa2VVLOuFvhx21pB4NlLFU=
In-Reply-To: <4D6496F8.9070303@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org
Cc: Senthilkumar <senthilkumaar2021@gmail.com>

2011/2/23 Senthilkumar <senthilkumaar2021@gmail.com>:
> Hello All,
>
> We have a gateway machine which has three upstream isp and to make cl=
ients
> use the particular isp we use advance routing based on the source add=
ress.
> =A0When we run squid =A0on the same machine to log websites all traff=
ic passes
> through the single isp i.e. the isp which is set as default gateway. =
We need
> all the users to pass through squid and use different isp's as per so=
urce
> route.
> Please share your views to achieve it.
>
> Thanks
> Senthil.
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Hi Senthilkumar,

I suppose you should use multiple rt_tables facility based on
netfilter's marks for routing to different ISPs. And you also need
some scheme to disperse marks for squid's output connections like nth
option from iptables. Here is an example:
http://members.hellug.gr/vyruss/computing/load_balance.html



--=20
Best regards
Anatoly Muliarski
