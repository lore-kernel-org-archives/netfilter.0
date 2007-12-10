From: Martijn Lievaart <m@rtij.nl>
Subject: Re: interfaces in /proc/net/ip_conntrack
Date: Tue, 11 Dec 2007 00:36:06 +0100
Message-ID: <475DCD66.5080102@rtij.nl>
References: <26618.83.227.11.237.1197308966.squirrel@mh.linnea.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <26618.83.227.11.237.1197308966.squirrel@mh.linnea.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: oscar@linnea.net
Cc: netfilter@vger.kernel.org

Oscar N wrote:
> Are the interfaces saved in any way in a session or is it only ip src, dst
> and ports that are saved and matched against?
>
> Why I ask is because what happens if I configure a linuxbox as two virtual
> firewall with same nets being used on different vlans. Will all the
> sessions be separate or will they sometimes "merge" if it happens to be
> the same IPs and ports in two sessions.
>   

Interfaces are not used, not in this sense. In fact, this is a feature. 
It allows asymetric routing, where packets go out through one interface 
and the return packets arrive at a different interface.

I would use two physical or virtual machines, as the risk you describe 
is real, if remote.

HTH,
M4

