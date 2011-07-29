From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: ebtables to copy traffic
Date: Fri, 29 Jul 2011 20:43:30 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1107291952040.17623@frira.zrqbmnf.qr>
References: <CACsKbv0r4PcDp0zKV53n=oAOYkvkPbOCtN8LE=L2zQPcUyasew@mail.gmail.com> <20110729100048.7b72be47@nehalam.ftrdhcpuser.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110729100048.7b72be47@nehalam.ftrdhcpuser.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Hemminger <shemminger@vyatta.com>
Cc: Greg Oliver <oliver.greg2@gmail.com>, netfilter@vger.kernel.org

On Friday 2011-07-29 19:00, Stephen Hemminger wrote:
>
>> So, I am pretty new to all of this, but we use port mirroring from
>> ethernet switches to record voip calls in our business.  We usually have
>> no issues due to using a physical port on the servers, but we are
>> migrating to a virtual model.
>> 
>> I am planning on using ebtables to copy all traffic on the mirror port
>> from the switch to a list of receiving MACs on the network, but I cannto
>> for the life of me get it right I guess.
>> 
>> I am trying to use dnat.
>
>It is easier to do this with TC filters and TC action mirred

Actually you can juse use -j TEE.
