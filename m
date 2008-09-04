From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Reject on a Bridge
Date: Thu, 04 Sep 2008 11:18:39 -0500
Message-ID: <48C00A5F.2080104@riverviewtech.net>
References: <d95317090809031541n396f4ddao29dbbfa196801f64@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d95317090809031541n396f4ddao29dbbfa196801f64@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 09/03/08 17:41, Gilad Benjamini wrote:
> I am using iptables to run a firewall on a bridge. The bridge 
> consists of eth1 and eth2. Neither interface, nor the bridge itself, 
> have an IP address. eth0, which is not on the bridge, does have an IP 
> address.
> 
> Trying to use the REJECT target with --tcp-reset doesn't work. If I 
> understand the code correctly, the route for the RST packet is 
> determined through ip_route_me_harder in the send_reset function, 
> implying in my case that the RST packet will leave through eth0, 
> which is not the desired behavior. Theoretically, eth0 might be even 
> physically disconnected from the bridged network.
> 
> Am I missing something, or is this a real problem ?

I'm not sure where the rejection is going to come from.  At least as I 
understand it the rejection comes from a system (with an IP) in the path 
that is refusing to pass the packet.  Thus I don't see how the bridge 
can reject the packet because there is no source IP to send the 
rejection from.  Can you add an IP to the bridge interface that is with 
in the subnet that is being bridged through it so that there is a source 
IP for the rejection?



Grant. . . .
