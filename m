From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: IP options on netfilter
Date: Tue, 9 Nov 2010 12:24:08 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1011091219210.12991@obet.zrqbmnf.qr>
References: <13273927.56365.1289301117522.JavaMail.www@wwinf1d08>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <13273927.56365.1289301117522.JavaMail.www@wwinf1d08>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabien Danos <fabien.danos@wanadoo.fr>
Cc: netfilter@vger.kernel.org

On Tuesday 2010-11-09 12:11, Fabien Danos wrote:

>Hello,
>I have a question about netfilter.
>What is the policy of netfilter on Ip options?
>It's blocked by default or it's accepted?
>
>For example, on packet filter on BSD, it's blocked by default.
>If we want allowed it, we must use the option allow-opts.
>
>What is the policy of Netfilter?

Netfilter modules don't care about options; and as far as Xtables is 
concerned, it will just execute your ruleset, so you have to put any 
accept and/or drop in there.
