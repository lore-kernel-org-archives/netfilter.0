From: Fabian Hartmann <realdeal@realdealz.ch>
Subject: Re: problem with forward/nat
Date: Sun,  7 Mar 2004 19:24:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078683840.404b68c0641ac@realdealz.ch>
References: <BAY1-F168WzqJX7rVGS00004a39@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY1-F168WzqJX7rVGS00004a39@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: Pierre Gillet <gpg__gpg@hotmail.com>

> hello,
>
Hi Pierre

> #forward
> 
> iptables -A FORWARD -s 192.168.1.0/24 -j ACCEPT -o eth0

The rule above won't work! you must set the -o flag before you set the -j <TARGET>
i. e. iptables -A FORWARD -o eth0 -s 192.168.1.0/24 -j ACCEPT

Otherwise the rule won't be accepted by iptables and you have no rule that
accepts  forwarded traffic when the default policy for the FORWARD chain is set
to DROP.

---
Fabian Hartmann

realdeal@realdealz.ch
www.realdealz.ch

