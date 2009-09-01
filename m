From: Patrick McHardy <kaber@trash.net>
Subject: Re: ULOG The kernel doesn't support a certain ebtables extension,
 consider recompiling your kernel or insmod the extension.
Date: Tue, 01 Sep 2009 13:43:59 +0200
Message-ID: <4A9D08FF.7070705@trash.net>
References: <4A9C2F4C.9050405@branndal.se> <200908311534.19700.rob0@gmx.co.uk> <4A9CD19C.6040107@branndal.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A9CD19C.6040107@branndal.se>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Berg <thomas.berg@branndal.se>
Cc: /dev/rob0 <rob0@gmx.co.uk>, netfilter@vger.kernel.org

Thomas Berg wrote:
>>> ebt_ip                  1752  29
>>> ebt_log                 3268  32
>>> ebtable_broute          1740  0
>>> ebtable_nat             2000  0
>>> ebtable_filter          2028  1
>>> ebtables               14108  3
>>> ebtable_broute,ebtable_nat,ebtable_filter
>>> ipt_ULOG                6684  1
>>> x_tables               14108  4 ebt_ip,ebt_log,ebtables,ipt_ULOG
>>> bridge                 39968  1 ebtable_broute
>>> 8021q                  17932  0
>>> garp                    6996  1 8021q
>>> stp                     2112  2 bridge,garp
>>>     
> br0:/lib/modules/2.6.26-1-686/kernel/net/bridge/netfilter# modprobe
> ebt_ulog
> FATAL: Error inserting ebt_ulog
> (/lib/modules/2.6.30-1-686/kernel/net/bridge/netfilter/ebt_ulog.ko):
> Cannot allocate memory

ebt_ulog and ipt_ULOG can't be used simultaneously since they both use
the same netlink unit. I don't think we can fix it at this point since
both are obsolete and this would break existing setups. You can use
nfnetlink_log and xt_NFLOG/ebt_NFLOG as a replacement.
