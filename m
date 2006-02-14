From: Ben Skeggs <darktama@iinet.net.au>
Subject: Re: IPv6 state match - possible bug.
Date: Tue, 14 Feb 2006 16:53:01 +1100
Message-ID: <1139896381.27048.1.camel@araqiel.keine.ath.cx>
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
Just another followup with some more info.. I built 2.6.16-rc3 on my
other machine (x86) and it does indeed appear to work correctly there.

I'm wondering if there is some amd64-specific bug?

Cheers,
Ben.
> 
> -- Yasuyuki Kozakai

