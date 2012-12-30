From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Mirroring traffic with iptables TEE target
Date: Sun, 30 Dec 2012 13:19:45 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1212301319030.7798@nerf07.vanv.qr>
References: <20121230091048.GA4575@devnull.qunarservers.com> <alpine.LNX.2.01.1212301224240.30402@nerf07.vanv.qr> <CAJZVxRnvbPQfXJRQOLx8tjjP8ee8D6F8Mt=4U8GFBdN_iKCbjA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJZVxRnvbPQfXJRQOLx8tjjP8ee8D6F8Mt=4U8GFBdN_iKCbjA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aaron Lewis <the.warl0ck.1989@gmail.com>
Cc: netfilter mailing list <netfilter@vger.kernel.org>

On Sunday 2012-12-30 13:13, Aaron Lewis wrote:

>Hi Jan
>I tried to duplicate UDP packets and that works!
>
>So I guess you can't mirror TCP traffics, since it's connection oriented, am
>I right?

Mirroring does not discriminate against protocol. People successfully 
use it for logging, and I am sure they have TCP as well.
