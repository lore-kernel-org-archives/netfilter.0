From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: How to use mark and connmark in one rule
Date: Fri, 24 Apr 2009 15:40:53 +0200
Message-ID: <49F1C165.60907@freemail.hu>
References: <20090424133235.GA14156@tkeitel002.bln.innominate.local>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090424133235.GA14156@tkeitel002.bln.innominate.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Tino Keitel <tkeitel@innominate.com>
Cc: netfilter@vger.kernel.org

Hi!

Tino Keitel =EDrta:
> $ iptables -A INPUT -m mark --mark 1 -m connmark --mark 2
> iptables v1.4.2: mark: "--mark" option may only be specified once
>
> Is this intended? If not, is there a way to make this work with a sto=
ck
> iptables, or do I have to patch the source and rename one of the
> options?
>  =20
If you want then rename one of the options...
The problem is that both connmark and mark have a --mark option...
But you may check the manual... :D --save-mark may be your friend...

Swifty

