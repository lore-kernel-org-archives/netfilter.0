From: Justin Piszcz <jpiszcz@lucidpixels.com>
Subject: Re: iptables/when loading a webpage, get subsequent firewall
 block(s)?
Date: Mon, 16 Nov 2009 06:16:34 -0500 (EST)
Message-ID: <alpine.DEB.2.00.0911160615450.12141@p34.internal.lan>
References: <alpine.DEB.2.00.0911140807540.27423@p34.internal.lan> <4AFEF457.6080208@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AFEF457.6080208@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org



On Sat, 14 Nov 2009, Pascal Hambourg wrote:

> Hello,
>
> That's a RST for an already closed connection -> state INVALID.
>
>> This last packet at 08:13:19 appears to be what gets blocked by iptables,
>> even though ESTABLISHED,RELATED is in effect.

Pascal,

Thanks for the explanation.

Do you know what would cause a RST for an already closed connection?

Is this normal, do you/others see this as well?

Justin.
