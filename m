From: "Rob Sterenborg (lists)" <lists@sterenborg.info>
Subject: Re: Question about using SSH-tunnel / Frage zum Benutzen eines
 SSH-Tunnels
Date: Fri, 12 Aug 2011 11:47:13 +0200
Message-ID: <1313142433.3060.2.camel@ns014530.dcyb.net>
References: <4E44F1DC.3090605@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E44F1DC.3090605@gmx.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Fri, 2011-08-12 at 11:26 +0200, J. Zeidler wrote:
> English:
> 
> Hello,
> 
> I use a SSH-tunnel with Putty on Ubuntu 11.04. I want to achieve, that 
> the network traffic over a specific port is redirected over the tunnel. 
> I need this because of a strict firewall, which i can not configure. the 
> tunnel runs on localhost:9999. i can use this as proxy with firefox, so 
> the tunnel works. i tried this without success:
> 
> iptables -A OUTPUT -t nat -p udp -d 65.18.193.12 -j DNAT --to 127.0.0.1:9999

I think you should use REDIRECT instead.

man iptables:

REDIRECT
This target is only valid in the nat table, in the PREROUTING and OUTPUT
chains, and user-defined chains which are only called from those
chains.
It  redirects  the packet to the machine itself by changing the
destination IP to the primary address of the incoming interface
(locally-generated packets are mapped to the 127.0.0.1 address).

--to-ports port[-port]
This specifies a destination port or range of ports to use: without
this, the destination port is never altered.  This is only valid if the
rule also specifies -p tcp or -p udp.


--
Rob


