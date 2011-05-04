From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Port Scan Detection
Date: Thu, 5 May 2011 00:42:39 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1105050016560.9967@obet.zrqbmnf.qr>
References: <1304543808.31120.1448324677@webmail.messagingengine.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1304543808.31120.1448324677@webmail.messagingengine.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@buglecreek.com
Cc: netfilter@vger.kernel.org

On Wednesday 2011-05-04 23:16, netfilter@buglecreek.com wrote:

>I have seen these rules used to detect a port scan:
>
>iptables -A INPUT -i $INTERFACE --proto tcp --tcp-flags SYN,ACK,FIN,RST
>RST -j LOG --log-prefix "PORT SCAN: " --log-level 6
>iptables -A INPUT -i $INTERFACE --proto tcp --tcp-flags SYN,ACK,FIN,RST
>RST -j DROP
>
>It seems to me that this is a legitimate TCP flag combination, unless
>I'm reading the rule wrong.


Bloggers using --tcp-flags to purportedly detect port scans are wasting 
their time. They could have just used -m conntrack --ctstate INVALID 
which should catch bogus flag combinations already.

Secondly, some scan types can use completely RFC-compliant traffic and 
therefore need a more sophisticated approach (cf. "Detecting 
and deceiving network scans" PDF).
