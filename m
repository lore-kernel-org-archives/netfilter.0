From: Tino Keitel <tkeitel@innominate.com>
Subject: Re: How to use mark and connmark in one rule
Date: Fri, 24 Apr 2009 15:49:20 +0200
Message-ID: <20090424134920.GA16262@tkeitel002.bln.innominate.local>
References: <20090424133235.GA14156@tkeitel002.bln.innominate.local> <49F1C165.60907@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <49F1C165.60907@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On Fri, Apr 24, 2009 at 15:40:53 +0200, G=E1sp=E1r Lajos wrote:
> Hi!
>
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

Yes, that's why I renamed the connmark parameter to --conmark to make
it work. But I want to be sure that I don't break something (except for
all scripts that use -m connmark --mark), or if there is a way to even
make this work without patching.

> But you may check the manual... :D --save-mark may be your friend...

Not in this case.

Regards,
Tino
