From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Re: Assigning multiple marks to a packet
Date: Wed, 31 Mar 2010 16:39:54 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1003311636230.28798@obet.zrqbmnf.qr>
References: <1270042299.S.2914.40735.f6mail-144-156.rediffmail.com.old.1270045298.57648@webmail.rediffmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1270042299.S.2914.40735.f6mail-144-156.rediffmail.com.old.1270045298.57648@webmail.rediffmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: agashi shipora <gashipo@rediffmail.com>
Cc: alvesfonseca@ibest.com.br, netfilter@vger.kernel.org


On Wednesday 2010-03-31 16:21, agashi shipora wrote:

>Hi,
>Referring tohttp://www.frozentux.net/iptables-tutorial/iptables-tutorial.html#MARKTARGE
>T
>
>the description of the MARK target doesn't mention that the new value
>mentioned along with the --set-mark target in a rule will be logically OR'ed
>with the existing value of the mark.Hence the new value will overwrite the
>old one
>
>Is it something that has not been mentioned in the link I am referring to?

It helps to read the manpage of a current iptables release, and not
some documents originally written three years ago (that includes
manpages from ancient iptables releases.)

Also note that it is a tutorial only and not a complete description
of all possible options (though it starts to look like one).
