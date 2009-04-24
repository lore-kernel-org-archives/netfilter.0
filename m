From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: How to use mark and connmark in one rule
Date: Fri, 24 Apr 2009 15:55:42 +0200
Message-ID: <49F1C4DE.2070006@freemail.hu>
References: <20090424133235.GA14156@tkeitel002.bln.innominate.local> <49F1C165.60907@freemail.hu> <20090424134920.GA16262@tkeitel002.bln.innominate.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090424134920.GA16262@tkeitel002.bln.innominate.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Tino Keitel <tkeitel@innominate.com>
Cc: netfilter@vger.kernel.org

Tino Keitel =EDrta:
>> If you want then rename one of the options...
>> The problem is that both connmark and mark have a --mark option...
>>    =20
>
> Yes, that's why I renamed the connmark parameter to --conmark to make
> it work. But I want to be sure that I don't break something (except f=
or
> all scripts that use -m connmark --mark), or if there is a way to eve=
n
> make this work without patching.
>
>  =20
I think that you won't break anything... just those scripts...
>> But you may check the manual... :D --save-mark may be your friend...
>>    =20
>
> Not in this case.
>
>  =20
Why not?

Swifty

