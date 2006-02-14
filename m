From: Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp>
Subject: Re: IPv6 state match - possible bug.
Date: Tue, 14 Feb 2006 13:03:15 +0900 (JST)
Message-ID: <200602140403.k1E43GCu003190@toshiba.co.jp>
References: <1139835278.26079.7.camel@araqiel.keine.ath.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1139835278.26079.7.camel@araqiel.keine.ath.cx>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: Text/Plain; charset="us-ascii"
To: darktama@iinet.net.au
Cc: netfilter@lists.netfilter.org

From: Ben Skeggs <darktama@iinet.net.au>
Date: Mon, 13 Feb 2006 23:54:38 +1100

> Hello,
> 
> I'm not sure if this is a bug, or something I'm doing incorrectly.
> 
> With the (attached) ruleset, I am able to receive ICMPv6 echo replies
> correctly but any other type of connection fails.  The SYN+ACK reply
> appears to get dropped by netfilter.
> 
> IP6-IN: IN=eth0 OUT= MAC=00:0f:ea:70:eb:f9:00:50:8d:e3:b5:89:86:dd
> SRC=2001:0200:0000:8002:0203:47ff:fea5:3085
> DST=2001:0388:c17d:0000:020f:eaff:fe70:ebf9 LEN=80 TC=0 HOPLIMIT=56
> FLOWLBL=1295 PROTO=TCP SPT=80 DPT=33215 WINDOW=57344 RES=0x00 ACK SYN
> URGP=0
> 
> The above is from trying to "wget -6 www.kame.net".
> 
> araqiel ~ # gzcat /proc/config.gz | grep -E "NF_CO|STATE"
> CONFIG_NF_CONNTRACK=y
> # CONFIG_NF_CONNTRACK_MARK is not set
> CONFIG_NF_CONNTRACK_EVENTS=y
> CONFIG_NF_CONNTRACK_FTP=y
> CONFIG_NETFILTER_XT_MATCH_STATE=y
> CONFIG_NF_CONNTRACK_IPV4=y
> # CONFIG_IP_NF_CONNTRACK is not set
> CONFIG_NF_CONNTRACK_IPV6=y
> 
> Does the above config seem okay?

looks fine to me. I tested with recent kernel, same kernrel config,
and same rules, but couldn't reproduce above log.

Which version of kernel(or git commit id) and ip6tables ?
And could you do
	echo 255 > /proc/sys/net/ipv4/netfilter/ip_conntrack_log_invalid

and test same rule ?

Regards,

-- Yasuyuki Kozakai

