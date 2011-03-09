From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: How to completely disable conntrack?
Date: Wed, 9 Mar 2011 20:05:36 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1103092005130.9143@obet.zrqbmnf.qr>
References: <4D7785DC.8050904@centrum.cz> <AANLkTimkFarQO63ekSKJBL0PUqaMQV8QWWGLSQyQrDfq@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimkFarQO63ekSKJBL0PUqaMQV8QWWGLSQyQrDfq@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pandu Poluan <pandu@poluan.info>
Cc: =?UTF-8?Q?Petr_=C5=A0=C5=A5astn=C3=BD?= <petr.stastny@centrum.cz>, netfilter@vger.kernel.org

On Wednesday 2011-03-09 15:24, Pandu Poluan wrote:

>I'm sure there's a sysctl knob, but off the top of my head:
>
>-t raw -A PREROUTING -j NOTRACK

-j CT --notrack

'-j NOTRACK' is on the path to removal.

