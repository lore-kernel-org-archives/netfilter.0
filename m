From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: NAT on the same network
Date: Thu, 29 May 2008 10:24:35 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0805291023080.19264@fbirervta.pbzchgretzou.qr>
References: <1212005433.483dbc39ef035@www.versateladsl.be> <483E0127.4070301@riverviewtech.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <483E0127.4070301@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>


On Thursday 2008-05-29 03:04, Grant Taylor wrote:
>> What can I do ?
>
> You are close with your DNATing rules except for the fact that when "Bob"
> replies to "Tom" (who is on your network) "Bob's" reply will not pass through
> the system that did the redirecting.  This means that "Tom" will see a packet
> from "Bob" that he has no idea where it came from and as such hang up on "Bob".

In other words... *drumroll*
http://jengelh.medozas.de/images/dnat-mistake.png :-)

> To make this work, you need to SNAT the traffic [...]

Therefore making bug hunting harder because the wrong IP address
shows up in the logs on the final host.
