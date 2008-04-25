From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: ipt_iplimit.so
Date: Sat, 26 Apr 2008 00:16:31 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804260014000.20150@fbirervta.pbzchgretzou.qr>
References: <48123B41.1060901@hostgator.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48123B41.1060901@hostgator.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zachary Eadie <zeadie@hostgator.com>
Cc: netfilter@vger.kernel.org

On Friday 2008-04-25 22:12, Zachary Eadie wrote:

> I am trying to establish a hard limit per ip without doing state 
> checking, just for development.  I did a Google search for an old 
> module in the ippersonality plugin found on koders.com, I was 
> wondering, is there a more current module, or patch, or will this 
> still even work, or is there something not too dissimilar from it to 
> where we can set a hard limit for the maximum concurrent connections 
> per-ip without using the -m limit/recent module, or would anyone just 
> recommend the syn-limit?

-m connlimit

> Here are the links for reference:
> http://www.koders.com/c/fid7BBD5FF5365A02D2561437989CBCD88C5C65C0B3.aspx
> http://www.koders.com/c/fidC587D36BBA65E9C1A59D097A153CB42360D81CFB.aspx

it was iirc the predecessor to ipt_connlimit which was the predecessor
to xt_connlimit.
