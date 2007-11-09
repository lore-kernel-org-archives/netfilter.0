From: Martijn Lievaart <m@rtij.nl>
Subject: Re: NAT'ing multiple IPsec clients to the same destination IPSec
 server
Date: Sat, 10 Nov 2007 00:01:41 +0100
Message-ID: <4734E6D5.4050902@rtij.nl>
References: <1194648215.26369.17.camel@fe7pawong.versa.versasys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1194648215.26369.17.camel@fe7pawong.versa.versasys.com>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: pawong@versasys.com
Cc: netfilter@vger.kernel.org

Patrick Wong wrote:
> Way back in 2.0.18 kernel, there was an IPsec connection tracking module
> that would allow me to masquerade multiple IPsec clients (eg Cisco VPN
> client) all going to the same remote IPsec server onto one external IP
> address. This was done with IPsec connection module + ipmasqadm +
> ipchains.
>
> I have never been able to get the above to work on iptables. In the
> early days of iptables, I also noticed there was no IPsec conntrack
> module. 
>
> If I have only 1 external IP address on my firewall/gateway to SNAT to,
> is there a way to support multiple IPSec clients on my internal LAN all
> establishing IPSec connections to the same destination IPSec server?
>   

Cisco VPN client supports UDP encapsulation. You have to allow it on the 
concentrator too, but if that is possible, it should work without 
specific iptables rules.

M4

