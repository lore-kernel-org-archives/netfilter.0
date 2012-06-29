From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: ip options fitering with iptables
Date: Fri, 29 Jun 2012 23:40:53 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1206292340330.6785@frira.zrqbmnf.qr>
References: <CAE1WnGcvRLbgcGXcLH-5JPXKb6VnceBzHv3RTinKRgNc8VCLrA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAE1WnGcvRLbgcGXcLH-5JPXKb6VnceBzHv3RTinKRgNc8VCLrA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rahul shrivastava <shrivastavaone@gmail.com>
Cc: netfilter <netfilter@vger.kernel.org>

On Friday 2012-06-29 09:00, rahul shrivastava wrote:

>i am using iptables version 1.4.9.1
>this version does not have ipv4options filtering support
>
>
>iptables -A INPUT -i eth1 -m ipv4options --ssrr -j DROP
>iptables v1.4.9: Couldn't load match
>`ipv4options':/lib/xtables/libipt_ipv4options.so: cannot open shared
>object file: No such file or directory
>
>and i am not able to find any patch to support ipv4option filtering.

http://xtables-addons.sf.net/
