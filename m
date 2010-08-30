From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: IPv6 routing
Date: Mon, 30 Aug 2010 11:26:09 +0100
Message-ID: <4C7B8741.3030908@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi Everyone,

I'm using HE's IP6 Tunnel broker service. I'm trying to use a Ubuntu box 
as a router. I've set up the tunnel (which connects to HE's server via 
IPv4).

Everything does work when I don't have any iptables rules. However, I 
don't wish to leave the box open.

For some reason, forwarding of packets (from HE WAN to the other side of 
my router) only works when I have my ip6tables INPUT chain to ACCEPT. 
Even when putting in a state RELATED,ESTABLISHED in there doesn't work.

Does anyone have any ideas why this is the case? I have a funny feeling 
it has something to do with NDP and ip6tables not marking something as 
"related".

Thanks
