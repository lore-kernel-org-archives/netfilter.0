From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: High accuracy bandwidth accounting?
Date: Sun, 15 May 2011 00:33:55 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105150032430.7873@obet.zrqbmnf.qr>
References: <4DC7F632.9020105@wildgooses.com>  <4DC8775D.1080007@wildgooses.com>  <1305365024.1921.475.camel@andybev-desktop>  <4DCE8540.4060909@wildgooses.com> <1305390543.1921.705.camel@andybev-desktop>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1305390543.1921.705.camel@andybev-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: Ed W <lists@wildgooses.com>, Netfilter <netfilter@vger.kernel.org>

On Saturday 2011-05-14 18:29, Andrew Beverley wrote:

>On Sat, 2011-05-14 at 14:36 +0100, Ed W wrote:
>
>Okay, I've played around with this myself using a similar scenario. It
>looks to me like the packets *are* making it into the conntrack system.
>
>I tried setting a LOG target to match those packets with a ctstate of
>RELATED:
>
>iptables -A INPUT -p ICMP -m conntrack --ctstate RELATED -j LOG
>
>And they were indeed logged. But there was no visibility of them using
>the conntrack userspace program.

Does `conntrack -L` show anything for you at all? There is/was a 
short intermediate time when it would not return anything.
