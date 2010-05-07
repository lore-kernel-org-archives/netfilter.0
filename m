From: Jan Engelhardt <jengelh@medozas.de>
Subject: RE: conntrack-tools 0.9.14 can not block the connection
Date: Fri, 7 May 2010 11:50:04 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1005071132030.5643@obet.zrqbmnf.qr>
References: <201005061651.40203.rfeng@wurldtech.com> <alpine.LSU.2.01.1005070954230.32277@obet.zrqbmnf.qr> <011f01caedc2$3a71b810$af552830$@sterenborg.info>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <011f01caedc2$3a71b810$af552830$@sterenborg.info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@vger.kernel.org

On Friday 2010-05-07 10:49, Rob Sterenborg wrote:

>Jan Engelhardt wrote:
>> On Friday 2010-05-07 01:51, Richard Feng wrote:
>> 
>> >Hi,
>> >
>> >I am using Linux 2.6.29. I have the problem for using 'conntrack'
>[...]
>> Upgrading to a newer kernel (you're probably running some stoneage
>> thing).
>
>For my information: I know that 2.6.29 isn't recent, but is it already
>considered a 'stone age thing'?

Let's requote:
>that "have to set /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal to 

That file "ip_conntrack_tcp_be_liberal" was last seen in ...
anyway, it's nf_conntrack_tcp_be_liberal now.
