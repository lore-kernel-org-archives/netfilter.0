From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: RHEL backported '--queue-bypass'
Date: Sun, 29 Jul 2012 18:30:48 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1207291829030.2056@frira.zrqbmnf.qr>
References: <CANaOheaxLhfPwXf0f7P=8HZn+wj4A94PqVfV2uqcBD5ypAA7hA@mail.gmail.com> <CANaOheZZXP1sCTTD4LAJkFPaOX-yfXGdH4jqu-2xC+3vT0weaA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CANaOheZZXP1sCTTD4LAJkFPaOX-yfXGdH4jqu-2xC+3vT0weaA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kay <kay.diam@gmail.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2012-07-25 11:21, kay wrote:

>The http://bugzilla.netfilter.org/show_bug.cgi?id=778 patch is wrong,
>I should not have to use it. Please ignore it.

In general, it is easier to just ship a new iptables version. Like Linux 
kernels, having something that has pretty much the same stability level 
at every release is a good approach.
