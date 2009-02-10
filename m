From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: help with whitelist
Date: Tue, 10 Feb 2009 15:49:52 +0100
Message-ID: <49919410.9040906@freemail.hu>
References: <000001c98af5$d31f3c30$795db490$@net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000001c98af5$d31f3c30$795db490$@net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Joey <Joey@Web56.net>
Cc: IPTables <netfilter@vger.kernel.org>

Hi,

Am I blind or there is no DROP/REJECT target at all???

Swifty

Joey =EDrta:
> Hello All,
>
> =20
>
> Im having a problem with a whitelist I am trying to implement and app=
arently
> we still block IP's on the whitelist.
>
> =20
>
> First I execute the whitelist like so:
>
> =20
>
> :CIDR-WHITE-LIST - [0:0]
>
> :LOG_WHITE-LIST - [0:0]
>
> -A CIDR-WHITE-LIST -s 1.2.3.4 -j LOG_WHITE-LIST=20
>
> -A LOG_WHITE-LIST -j LOG --log-prefix "CIDR-WHITE-LIST"=20
>
> -A LOG_WHITE-LIST -j ACCEPT=20
>
> -A SMTP_TRAFFIC -j CIDR-WHITE-LIST
>
> =20
>
> Then the blacklist like so:
>
> :CIDR-ASIAN - [0:0]
>
> :LOG_ASIAN - [0:0]
>
> :SMTP_TRAFFIC - [0:0]
>
> -A INPUT -p tcp -m tcp --dport 25 -m state --state NEW -j SMTP_TRAFFI=
C
>
> -A CIDR-ASIAN -s 2.3.4.5 -j LOG_ASIAN=20
>
> -A LOG_ASIAN -j LOG --log-prefix "SPAM-BLOCK-CIDR-ASIAN"=20
>
> -A SMTP_TRAFFIC -j CIDR-ASIAN
>
> =20
>
> I am basically blocking port 25 traffic to blocked IP's.
>
> I must be missing something stupid, but cant see it.
>
> =20
>
> Any help is greatly appreciated!
>
> =20
>
> Thanks!
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>  =20

