From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: QoS in Netfilter
Date: Thu, 17 Apr 2014 21:08:07 -0400
Message-ID: <201404172108.07951.neal.p.murphy@alum.wpi.edu>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Wednesday, April 16, 2014 04:57:43 AM Nikolai Lusan wrote:
> Hi,
> 
> So the merits of MARK vs. CLASSIFY? What do people think is the best way
> of using QoS?

In a short sentence: Use CONNMARK to identify types of traffic (even when 
using a higher-layer sniffer); use CLASSIFY to assign types of traffic to 
classes. That's really the best you can hope to do until a simple and well-
supported layer 7 analyzer is available. And don't even think about trying to 
classify encrypted streams.

Alas, Traffic Control needs a complete rewrite to handle modern traffic flows. 
HTB is nice. And works very well once it's understood. But it's far too 
complicated and doesn't really handle today's net usages very well. I've an 
idea what to do, but don't have the time to experiment. Think amalgamation of 
HTB and conntrack.
