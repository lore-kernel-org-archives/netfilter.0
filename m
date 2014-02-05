From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: iptables: Distinguishing packets from bridge-nf-call-iptables
Date: Wed, 05 Feb 2014 12:53:48 +0100
Message-ID: <52F2264C.2060500@chello.at>
References: <BC2A25BE-4E4F-4270-855A-E0D092F4A7C0@alex.org.uk>
Reply-To: mart.frauenlob@chello.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BC2A25BE-4E4F-4270-855A-E0D092F4A7C0@alex.org.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex Bligh <alex@alex.org.uk>
Cc: netfilter list <netfilter@vger.kernel.org>

On 05.02.2014 12:24, Alex Bligh wrote:
> I am trying to run two pieces of software X and Y on a linux box.
>
> X assumes /proc/sys/net/bridge/bridge-nf-call-iptables is set to 1. I am not able to modify this.
>
> Y assumes /proc/sys/net/bridge/bridge-nf-call-iptables is set to 0. This is my software and I can modify it.
>
> I want to adapt my rules for Y so that it copes with /proc/sys/net/bridge/bridge-nf-call-iptables=1 by ignoring (in the iptables rule) any traffic which is purely bridged, and simply doing the ebtables rules on these packets.
>
> In the iptables rules, how do I differentiate ip forwarded traffic from bridged traffic? The bridge interfaces may or may not carry IP addresses.
>

-m physdev ... ?
