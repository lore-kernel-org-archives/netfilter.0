From: Ville Herva <vherva@vianova.fi>
Subject: Re: Linux 2.6.17-rc1: /sbin/iptables does not find kernel netfilter
Date: Sun, 9 Apr 2006 17:44:16 +0300
Message-ID: <20060409144416.GO1686@vianova.fi>
References: <Pine.LNX.4.64.0604022037380.3781@g5.osdl.org> <20060408200915.GN1686@vianova.fi> <44388908.6070602@trash.net> <20060409074313.GZ15954@vianova.fi>
Reply-To: vherva@vianova.fi
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750741AbWDIOoW@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20060409074313.GZ15954@vianova.fi>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: linux-kernel@vger.kernel.org, netfilter@lists.netfilter.org, davem@davemloft.net

On Sun, Apr 09, 2006 at 10:43:13AM +0300, you [Ville Herva] wrote:
> > 
> > Most likely you didn't enable the new xtables options. Please post your
> > full config.
> 
> The full .config is here
>  http://www.iki.fi/v/tmp/2.6.17-rc1.config

Now "iptables -L" works, but I still get

> iptables -A INPUT         -p tcp -d 0.0.0.0/0   --dport  http -m state --state NEW,ESTABLISHED -j ACCEPT
iptables: Unknown error 4294967295

from about half of the iptables rules.
My current config is here:

http://www.iki.fi/v/tmp/2.6.17-rc1.config.new

The following modules are loaded:
iptable_nat             6948  1 
ip_nat                 14860  1 iptable_nat
ip_conntrack           43188  2 iptable_nat,ip_nat
ipt_REJECT              4704  0 
iptable_filter          2784  0 

and 
CONFIG_NETFILTER=y
CONFIG_NETFILTER_XTABLES=y
CONFIG_IP_NF_IPTABLES=y
are compiled in statically.

I just realized 
# CONFIG_NETFILTER_XT_MATCH_STATE is not set
should probably be set. I'm building a new kernel now...


-- v -- 

v@iki.fi
