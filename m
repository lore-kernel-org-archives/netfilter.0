From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Why and when to use skb_make_writable()?
Date: Wed, 12 Jan 2011 13:26:12 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1101121325420.22535@obet.zrqbmnf.qr>
References: <701121.82199.qm@web111113.mail.gq1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <701121.82199.qm@web111113.mail.gq1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: doug arro <doug_arro@yahoo.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2011-01-05 19:19, doug arro wrote:

>Hello,
>
>What is the recommended practice for using skb_make_writable()?  I am experimenting with netfilter modules to manipulate IP headers in the mangle table.  Most of the target modules call skb_make_writable() right at the start of the target function but some don't.  What is the conventional wisdom?

No particular time, but it depends on context.
