From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Problem with iptables -j TEE
Date: Wed, 13 Apr 2011 14:16:39 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104131413460.25539@obet.zrqbmnf.qr>
References: <BANLkTik2sHtuWOr64ty4yQhjP5EYwD20pg@mail.gmail.com> <BANLkTik_H3PYFvWde5c2MOGtEeAdYvOz9Q@mail.gmail.com> <20110413141020.4d30dca1@catus>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110413141020.4d30dca1@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: JOSE FELIX HERNANDEZ BARRIO <jose.hernandez@isthari.com>, netfilter@vger.kernel.org

On Wednesday 2011-04-13 14:10, Marek Kierdelewicz wrote:

>Hi,
>
>>I'm trying to copy the incoming traffic by tcp to another host using
>>TEE.
>>My command:
>>iptables -t mangle -A PREROUTING -p tcp -j TEE --gateway 192.168.0.100
>>And the error:
>>iptables: No chain/target/match by that name.
>>any tip?
>
>Answer is in the thread from 8 days ago:
>http://www.spinics.net/lists/netfilter/msg50656.html

And to summarize:

xt_TEE requires either:
   1. iptables >= 1.4.8 && kernel >= 2.6.35
OR 2. iptables < 1.4.8 && kernel < 2.6.35 && xtables-addons (its mconfig 
file may need to be adjusted)

because case 1's components only knows about xt_TEE revision 1, while 
xt-a's is revision 0 (deliberately - to avoid clashes, r1 is in fact, 
different).
