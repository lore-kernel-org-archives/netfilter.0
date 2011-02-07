From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Allow all established and related connections
Date: Mon, 7 Feb 2011 13:35:27 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1102071333001.5510@obet.zrqbmnf.qr>
References: <AANLkTinhVk9+s2qGjVbZdLOOj3A-9CSuBH48OnHr_USs@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTinhVk9+s2qGjVbZdLOOj3A-9CSuBH48OnHr_USs@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carlos Cruz Luengo <carlos@cruzccl.com>
Cc: Mail List - Netfilter/iptables <netfilter@vger.kernel.org>

On Monday 2011-02-07 13:22, Carlos Cruz Luengo wrote:

>Hi,
>
>I am writing a firewall script and I have run into a doubt. Is it
>correct to allow already established and related connections by a set
>of rules like these at the beginning of the script...
>
>iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>
>... and then only take care of NEW connections?

You can do all the things you want. Early exclusion is however nothing 
new.
The concept is http://iq0.com/notes/deep.nesting.html ("Else considered 
harmful") and is also advocated by 
http://jengelh.medozas.de/documents/Perfect_Ruleset.pdf
