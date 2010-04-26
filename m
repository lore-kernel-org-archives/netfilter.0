From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Blocking all APNIC addresses vs. per-country list
Date: Mon, 26 Apr 2010 17:54:50 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004261753510.29160@obet.zrqbmnf.qr>
References: <0414A4FA-32F4-4D94-92E0-FC5CC9B4D646@zconsulting.net> <1272293218.3750.15.camel@casper.meteor.dp.ua>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1272293218.3750.15.camel@casper.meteor.dp.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?B?0J/QvtC60L7RgtC40LvQtdC90LrQviDQmtC+0YHRgtC40Lo=?= <casper@meteor.dp.ua>
Cc: Peter Zieseniss <peter@zconsulting.net>, netfilter@vger.kernel.org


On Monday 2010-04-26 16:46, =D0=9F=D0=BE=D0=BA=D0=BE=D1=82=D0=B8=D0=BB=D0=
=B5=D0=BD=D0=BA=D0=BE =D0=9A=D0=BE=D1=81=D1=82=D0=B8=D0=BA wrote:
>=D0=92 =D0=9F=D0=BD=D0=B4, 26/04/2010 =D0=B2 16:09 +0200, Peter Ziesen=
iss =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> Hello All,
>>=20
>> This is my first time posting; i am rather new to iptables, so pleas=
e excuse the ignorance in my question.
>>=20
>> My personal CentOS-based webhost is under constant ssh attack from a=
n interminable list of different IP addresses (just to give you an idea=
, my latsb data file grows by ~100MB every week!!).
>> i've noticed that they all seem to come from East-Asia (mainly China=
, Taiwan, Malaysia, Korea--both).
>>=20
>> i found this website which provides a list of IP addresses on a per-=
country basis:
>> http://ipinfodb.com/ip_country_block_iptables.php\

Easier to use xt_geoip from xtables-addons. It's also just one rule;
though not a hashmap, it's a bisecting search, which is reasonably
fast (13 compare-steps for the IP-heaviest country like USA).
