From: Ben Skeggs <darktama@iinet.net.au>
Subject: Re: IPv6 state match - possible bug.
Date: Tue, 14 Feb 2006 15:24:31 +1100
Message-ID: <1139891071.26079.11.camel@araqiel.keine.ath.cx>
References: <1139835278.26079.7.camel@araqiel.keine.ath.cx>
	<200602140403.k1E43GCu003190@toshiba.co.jp>
	<200602140416.k1E4GXbM015693@toshiba.co.jp>
Reply-To: darktama@iinet.net.au
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200602140416.k1E4GXbM015693@toshiba.co.jp>
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
Content-Type: text/plain; charset="us-ascii"
To: Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp>
Cc: netfilter@lists.netfilter.org

On Tue, 2006-02-14 at 13:16 +0900, Yasuyuki KOZAKAI wrote:
> From: Yasuyuki KOZAKAI <yasuyuki.kozakai@toshiba.co.jp>
> Date: Tue, 14 Feb 2006 13:03:15 +0900 (JST)
> 
> > looks fine to me. I tested with recent kernel, same kernrel config,
> > and same rules, but couldn't reproduce above log.
> > 
> > Which version of kernel(or git commit id) and ip6tables ?
> > And could you do
> > 	echo 255 > /proc/sys/net/ipv4/netfilter/ip_conntrack_log_invalid
> 
> Sorry, right sysctl is
> 
>   	echo 255 > /proc/sys/net/netfilter/nf_conntrack_log_invalid
Okay, seems there is an issue somewhere..  I'm using 2.6.16-rc3, and
also had the same issue with -rc2.  iptables is version 1.3.5.

nf_ct_tcp: bad TCP checksum IN= OUT=
SRC=2001:0200:0000:8002:0203:47ff:fea5:3085
DST=2001:0388:c17d:0000:020f:eaff:fe70:ebf9 LEN=80 TC=0 HOPLIMIT=56
FLOWLBL=525788 PROTO=TCP SPT=80 DPT=52498 SEQ=1589838125 ACK=2289866071
WINDOW=57344 RES=0x00 ACK SYN URGP=0 OPT
(020405A0010303000101080A2DA73166049359BE)
IP6-IN: IN=eth0 OUT= MAC=00:0f:ea:70:eb:f9:00:50:8d:e3:b5:89:86:dd
SRC=2001:0200:0000:8002:0203:47ff:fea5:3085
DST=2001:0388:c17d:0000:020f:eaff:fe70:ebf9 LEN=80 TC=0 HOPLIMIT=56
FLOWLBL=525788 PROTO=TCP SPT=80 DPT=52498 WINDOW=57344 RES=0x00 ACK SYN
URGP=0

Which is odd, without any ip6tables rules everything seems to work well.

Thanks,
Ben Skeggs.
> 
> -- Yasuyuki Kozakai

