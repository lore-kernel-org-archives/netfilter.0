From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: [1.3.6] "Couldn't find match `string'"?
Date: Sat, 2 Apr 2011 15:19:17 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104021518550.30801@obet.zrqbmnf.qr>
References: <qbr8p69r6r6favuori53ct8bepfg8mefeo@4ax.com> <alpine.LNX.2.01.1103311426250.3599@obet.zrqbmnf.qr> <mt1ep6hsroebifmo1h99k3pss1lndge97c@4ax.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <mt1ep6hsroebifmo1h99k3pss1lndge97c@4ax.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gilles <gilles.ganault@free.fr>
Cc: netfilter@vger.kernel.org

On Saturday 2011-04-02 13:42, Gilles wrote:

>On Thu, 31 Mar 2011 14:28:58 +0200 (CEST), Jan Engelhardt
><jengelh@medozas.de> wrote:
>>Your kernel is either tooooooo old, or was not compiled with the module 
>>enabled. iptables 1.3.6 is also obsolete by now.
>
>Thanks for the help. I know they're old, but until I can figure out
>how to compile a newer kernel + iptables, I'm stuck with that
>three-year old release.

Not 3, but 4 1/2.

>I now have a working iptables, but there is no /etc/iptables/ and
>"iptables -h" doesn't say where the iptables configuration file should
>be. 

iptables has no configuration file.
