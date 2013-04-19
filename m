From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: Remote IP in packet sent from WAN to LAN
Date: Fri, 19 Apr 2013 07:07:49 -0400
Message-ID: <CACuyg24o=7QG8SpT4r1HYZYUcL85T38P0VGx2x_ZeQXgVieHnw@mail.gmail.com>
References: <47E0AF00D6313049B892E93D60AACDCA45C7193D@AMSPRD0410MB361.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:content-type:content-transfer-encoding;
        bh=gRjQd9lR/fuWm+me3nkSPLgHuuEJrmi2D2RGgRfuIJ0=;
        b=d5VVyV4YCGByr/pPSc7LvHnjfcHVd6US798zggICiBCzIC/yoiSuGv4QCeHB7a+LNv
         6tQQ5/mSw5e+9SMSLWpOYx1JAO6CTprgmOySImq7yY1x00JXW2fQ+wXSg1sfXDIner7o
         gjyfEaEH0YCjKQ++qlqywpJ/LQ/RukCud/dlD3bamZ8jsit/s+I/xeLL4ry0k+pdtS5d
         TMwHPq1Uvfw8fD1Zq2nmI+T8QIzDWwtpnPDwhCPJar0Ye3x4xx2zvHyeCL1621t22sEA
         cU53SGa4UwvL3RmxliJKN5L/kQkKZez4rzUF17HmMzdMRgRddbrZn0A7lNoH39SgIEGi
         u/7A==
In-Reply-To: <47E0AF00D6313049B892E93D60AACDCA45C7193D@AMSPRD0410MB361.eurprd04.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?ISO-8859-2?Q?Piotr_Paw=B3owski?= <piotr.pawlowski@goyello.com>, netfilter@vger.kernel.org

As I understand it, your problem is the internal NAT.

Configure your firewall without doing SNAT or MASQUERADE for packets
destined to the internal server - you can use RETURN rules to do this,
for example.

But, If you can not avoid this ...
Try something like this:
http://engi.neir.org/tips-tricks/fix-apache-proxy-logging/

2013/4/19 Piotr Paw=C5=82owski <piotr.pawlowski@goyello.com>:
> Hi All,
>
> I have iptables-based router which provides access to the Internet fo=
r servers in LAN.
> Question is: is it possible to somehow 'forward' remote IP address th=
rough this router? I have WWW server inside LAN and would like to have =
reliable access logs. However, right now the only IP address visible in=
 those logs is router one.
>
> Thank you in advance for information.
>
> Best Regards
> ---
> Piotr Paw=C5=82owski
>
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
