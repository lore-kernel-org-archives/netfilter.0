From: Jan Engelhardt <jengelh@medozas.de>
Subject: RE: Very strange ftp mget problem
Date: Wed, 13 Apr 2011 15:06:35 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104131504570.25539@obet.zrqbmnf.qr>
References: <925A849792280C4E80C5461017A4B8A27D88F4@mail733.InfraSupportEtc.com> <925A849792280C4E80C5461017A4B8A27D88F5@mail733.InfraSupportEtc.com> <alpine.LNX.2.01.1104131417360.25539@obet.zrqbmnf.qr>
 <925A849792280C4E80C5461017A4B8A27D88F6@mail733.InfraSupportEtc.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <925A849792280C4E80C5461017A4B8A27D88F6@mail733.InfraSupportEtc.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Scott <GregScott@Infrasupport.com>
Cc: netfilter@vger.kernel.org

On Wednesday 2011-04-13 14:55, Greg Scott wrote:

>Interesting - checking some of the other places I tested from that did 
>not fail - one used 2.6.27, the other used 2.6.35.  Well, hang on a 
>second - I just went back through my notes from last week and it looks 
>like I also saw one hang with the 2.6.35 site as a destination.  I'll 
>do some more testing with this site.

It can occur if either side runs the old kernel. An intermediate router 
should only affect it when TCP data is actively modified, such as by 
NAT.

>Curious - the problem only seems to happen when copying from one 
>particular source.  Copying the same material from different sources 
>seemed to work properly.
>
>Other than bulk testing, is there a footprint to this problem I can 
>look for to compare a before/after scenario?

tcpdump, and watch for packets that are not acknowledged.
