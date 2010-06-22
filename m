From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: randomly changing IPs from different subnets (Google Mail)
Date: Tue, 22 Jun 2010 20:19:25 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006222018140.31071@obet.zrqbmnf.qr>
References: <B993B335-596D-48D3-9767-F3565C3B1112@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <B993B335-596D-48D3-9767-F3565C3B1112@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Effenberger <floeff@gmail.com>
Cc: netfilter@vger.kernel.org

On Tuesday 2010-06-22 20:16, Florian Effenberger wrote:
>
>[block by DNS]
>
>If I want to have destination host based rules, how can I do this with 
>iptables? My current idea is to run a cron job every few minutes to add 
>the rules again with the changed IPs, but this sounds like an ugly 
>workaround, and will clutter my user-defined chain heavily.

So create another chain. The in-memory table does not know DNS, and 
rightfully so.

>Is there any other approach, other than opening up all traffic to 993 
>and 587?

SOCKS proxies.
