From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: iptable rate limit challenge.. help please..!
Date: Fri, 8 Jun 2012 00:38:07 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1206080025540.5045@frira.zrqbmnf.qr>
References: <20120607154038.bz3m3vzcqowsos4g@correo.co.cr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120607154038.bz3m3vzcqowsos4g@correo.co.cr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?Q?Jos=C3=A9_Pablo_P=C3=A9rez?= <josepablo@correo.co.cr>
Cc: netfilter@vger.kernel.org

On Thursday 2012-06-07 23:40, Jos=C3=A9 Pablo P=C3=A9rez wrote:

> I have CentOS and iptables with GeoIP module enabled,
>
> So far I have this rule working which works perfect:
>
> iptables -I INPUT -m geoip --src-cc GB -j DROP;
>
> But i need to make it more complex:
>
> Before dropping traffic I need to:
>
>1. allow up to a connection limit of 50 for the entire country.
>2. allow up to 30 requests/second to the entire country.
>3. drop the particular IPs with -m recent and a timeout of 3800 for th=
ose IPs from
> that country that violated that limit.
>4. And finally log whatever has been dropped with excessive logging pr=
otection.
>5. A plus.. if I can get to DROP the entire class C (/24) of the offen=
ding IP that
> violated the limits instead of just the /32

-A INPUT -m recent --recent-name offenders --rcheck --seconds 3800
	-j DROP # you don't want to log these, it would be just noise
-A INPUT -m geoip --src-cc GB -j gb
-A gb -m connlimit --connlimit-upto 50 -m limit --limit 30/s -j RETURN
-A gb -m recent --recent-name offenders --set -j LOG ...
-A gb -j DROP

To 2. you have to define what a request is, otherwise it'll bite you.
To 5. not really available.

And your requirements have a fundamental flaw: a single address can mak=
e the
country to go over the limit, and everybody will end up in the blacklis=
t.
