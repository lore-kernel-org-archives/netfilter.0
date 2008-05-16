From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: logdrop rule does not work any more
Date: Fri, 16 May 2008 18:00:18 +0200
Message-ID: <482DAF92.3050703@freemail.hu>
References: <482DAAE9.80708@hellteam.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <482DAAE9.80708@hellteam.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: dandee@hellteam.net
Cc: netfilter@vger.kernel.org

Daniel Dvo=F8=E1k =EDrta:
> $ipt -P logdrop ACCEPT
Policy is not supported on non built-in chains...
>
> $ipt -F INPUT
> $ipt -F OUTPUT
See below..
> $ipt -F -t nat
> $ipt -F -t mangle
Okay...
> $ipt -F logdrop
>
Use this:
$ipt -F -t filter
$ipt -F -t raw

> $ipt -X logdrop
not needed...
> $ipt -N logdrop
> $ipt -A logdrop -j LOG --log-prefix "logdrop"
> $ipt -A logdrop -j DROP
> ...
> $ipt -t mangle -A POSTROUTING -p tcp --dport 25 -j logdrop ... for=20
> example
It is not a good idea to drop packets in other than the filter table...
But if you want to do that then declare the logdrop chain in the mangle=
=20
table !!!

$ipt -t mangle -N logdrop
$ipt -t mangle -A logdrop .....


Swifty


