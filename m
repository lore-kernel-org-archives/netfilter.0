From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: [SOLVED] Re: Native support of counting rules?
Date: Thu, 3 Jan 2013 17:05:17 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1301031704440.32551@nerf07.vanv.qr>
References: <20130102134421.GA17997@devnull> <50E43D07.50009@ngtech.co.il> <CAJZVxRkyDyZyWUBbhP+H5gv2Dk1_Jj=v4QRAheHKWEnSKTdrhg@mail.gmail.com> <50E59C32.5090003@jvales.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <50E59C32.5090003@jvales.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Vales <jan@jvales.net>
Cc: Aaron Lewis <the.warl0ck.1989@gmail.com>, netfilter mailing list <netfilter@vger.kernel.org>

On Thursday 2013-01-03 15:56, Jan Vales wrote:

>Hi,
>
>why dont you use ...
>iptables-save | grep "\-A" | wc -l

grep ^-A

But the foremost question is: how is the rule count alone going to be 
useful?
