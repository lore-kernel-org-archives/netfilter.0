From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Forwarding packets received on bridged interfaces to DHCP server
 -regarding
Date: Fri, 23 May 2008 14:15:13 -0500
Message-ID: <483717C1.6040403@riverviewtech.net>
References: <69fec4520805221749u66f7e720sac91a67aaf6994b9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <69fec4520805221749u66f7e720sac91a67aaf6994b9@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 05/22/08 19:49, Knight Tiger wrote:
<snip>

> I only want the bridge to forward all the traffic it receives on eth0 
> to eth1 and eth1 should send the packets out.
> 
> All incoming packets not destined for eth1's IP address should be 
> forwarded to eth0.
> 
> I would greatly appreciate any leads in ebtables configuration.

I suggest that you bridge eth0 and eth1 together and then DHCP the 
bridge interface.

I don't think that this will have any thing to do with it, but make sure 
that ip_forward is not interfering with any thing.

Also what, if any thing, do you have for an IPTables config?



Grant. . . .
