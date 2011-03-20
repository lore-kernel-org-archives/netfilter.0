From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: How to achieve reverse NETMAP functionality?
Date: Sun, 20 Mar 2011 09:20:32 +0100
Message-ID: <20110320092032.18159dbd@catus>
References: <20110318164554.G20495@masktools.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20110318164554.G20495@masktools.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kurt Wampler <Kurt.Wampler@brion.com>
Cc: netfilter@vger.kernel.org

Hi,

>We have a need to "alias" portions of a customer's internal private IP
>network, because they have an address range which overlaps a private IP
>address range used internally in one of our systems installed at their
>site.  We are trying to avoid having to re-IP either network.

I haven't tried it, but it seems there's stateless nat available as tc
action. You *probably* could try to do dnat on egress (eg. interface
eth0) and snat on ingress (ingress qdisc attached to eth0).

# tc action add action nat help
Usage: ... nat NAT
NAT := DIRECTION OLD NEW
DIRECTION := { ingress | egress }
OLD := PREFIX
NEW := ADDRESS

Best regards,
Marek Kierdelewicz
