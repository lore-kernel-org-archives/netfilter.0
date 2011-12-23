From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Stop logging mac address
Date: Sat, 24 Dec 2011 00:23:34 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1112240023210.26301@frira.zrqbmnf.qr>
References: <CA+Ry9rfuavxLjSMitb8KF51+s0o2WtBZssTig52jHKpmBzgg0w@mail.gmail.com>  <CA+Ry9rdUbjcssirTbtpw_SkcPwp87g8EF_fLREbQQ4cAfJcOjw@mail.gmail.com> <1324679096.27185.0.camel@steve-pc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1324679096.27185.0.camel@steve-pc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: Jeff Jensen <jjensen@unyalli.com>, netfilter@vger.kernel.org

On Friday 2011-12-23 23:24, Andrew Beverley wrote:

>On Fri, 2011-12-23 at 14:09 -0700, Jeff Jensen wrote:
>> Is there any way to stop netfilter from logging mac addresses?
>
>Possible a bit of an over-kill, but you could maybe use the ULOG target
>instead?

Or rather, NFLOG.
