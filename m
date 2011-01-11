From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Best way to kill a live TCP connection?
Date: Tue, 11 Jan 2011 15:41:45 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1101111537180.8612@obet.zrqbmnf.qr>
References: <4D2C4E92.6040902@tana.it>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4D2C4E92.6040902@tana.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Vesely <vesely@tana.it>
Cc: netfilter@vger.kernel.org

On Tuesday 2011-01-11 13:35, Alessandro Vesely wrote:

>Hi all,
>this is clearly an overworked topic.  However, I haven't been able to
>find definitive info about it.  Please help providing more insight.
>In particular, if it is possible/convenient to design an RST injector
>that uses libnetfilter_queue and how to attach it to iptables?  (I
>would only send a RST to the local host/network.)

If you use a ruleset that emits RST for NEW connections that are picked 
up rather than SYN-new,

-m conntrack --ctstate NEW -p tcp ! --syn --dport 22 -j REJECT 
--reject-with tcp-reset

.. makes it possible to RST-kill connections using `conntrack -D`.
