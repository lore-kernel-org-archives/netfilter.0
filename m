From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: Re: LOG target missing
Date: Tue, 18 Sep 2012 22:16:48 +0200
Message-ID: <k3akrf$kjp$1@ger.gmane.org>
References: <k3aan9$n75$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <k3aan9$n75$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

U.Mutlu wrote, On 09/18/2012 07:23 PM:
> Hi,
> on a newly setup system I can't find iptables LOG target, neither ipt_LOG nor xt_LOG nor nf_LOG is present.
> Has the module name changed, or what's the reason it's not found anymore?
<snip>

My experiments to locate the reason indicate that the kernel compilation
command "make menuconfig" is the culprit: it seems it just doesn't take
the provided .config, instead creates a new one, one with missing/disabled
CONFIG_NETFILTER_XT_TARGET_LOG ... And that of course explains much... :-)
Now recompiling the kernel... takes about an hour... :-)


