From: Philip Craig <philipc@snapgear.com>
Subject: Re: PPTP reviisted
Date: Tue, 30 Sep 2003 09:58:50 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F78C73A.8060003@snapgear.com>
References: <E1A43gZ-0007lH-Mn@bear.dns-nac-zone.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1A43gZ-0007lH-Mn@bear.dns-nac-zone.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Miller <cmiller@compuville.net>
Cc: netfilter@lists.netfilter.org

Chris Miller wrote:
> 7)       Booted new kernel. Everything seems fine. SSH in so I can apply a
> rule that for some reason didn't get applied at boot. Here's what happenend:
> 
>  
> 
> # iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j MASQUERADE
> 
> iptables: Invalid argument

 From the help for the latest pptp-conntrack-nat.patch:

- you have to recompile your iptables userspace program since some
   structure sizes change

-- 
Philip Craig - philipc@snapgear.com - http://www.SnapGear.com
SnapGear - Custom Embedded Solutions and Security Appliances


