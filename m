From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How to use mark and connmark in one rule
Date: Fri, 24 Apr 2009 16:46:06 +0200
Message-ID: <49F1D0AE.1030606@plouf.fr.eu.org>
References: <20090424133235.GA14156@tkeitel002.bln.innominate.local> <49F1C165.60907@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49F1C165.60907@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-15?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: netfilter@vger.kernel.org

Hello,

G=E1sp=E1r Lajos a =E9crit :
>=20
> Tino Keitel =EDrta:
>> $ iptables -A INPUT -m mark --mark 1 -m connmark --mark 2
>> iptables v1.4.2: mark: "--mark" option may only be specified once
>>
>> Is this intended? If not, is there a way to make this work with a st=
ock
>> iptables, or do I have to patch the source and rename one of the
>> options?
>>  =20
> If you want then rename one of the options...
> The problem is that both connmark and mark have a --mark option...

I just wonder why a match looks for options beyond the next -m which=20
starts a new match.
