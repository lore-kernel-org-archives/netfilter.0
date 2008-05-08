From: whiplash <whiplash@bofhland.org>
Subject: Re: ip rule fwmarks letting me down
Date: Thu, 08 May 2008 14:51:12 +0200
Message-ID: <4822F740.4070400@bofhland.org>
References: <4822967E.8030407@trinity.unimelb.edu.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4822967E.8030407@trinity.unimelb.edu.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Geoff Crompton wrote:

> So when I ping from a machine behind this firewall, it should be routed
> via 203.28.240.92, but it isn't. I've been running tcpdump on both
> 203.28.240.92 and 203.28.240.91, and the packets are definately being
> routed via 203.28.240.91.

Did you
ip route flush cache
before testing?
