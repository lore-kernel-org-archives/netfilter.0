From: "Martijn Lievaart" <m@rtij.nl>
Subject: Re: packets skipping DNAT rules
Date: Fri, 31 Mar 2006 11:47:53 +0200 (CEST)
Message-ID: <30418.217.166.60.19.1143798473.squirrel@ma.rtij.nl>
References: <442ACC85.1060807@candlefire.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <442ACC85.1060807@candlefire.org>
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
To: netfilter@candlefire.org
Cc: netfilter@lists.netfilter.org

Mr Ritter zei:
> I have some rules in the PREROUTING of the nat table that perform a DNAT
>  however, on a very consistent basis the rules doesn't get applied and
> the packet ends up in the filter table without the destination modified.
>  95% of the time it works, 5% it doesn't. I can't put a finger on whats
> causing it, or see anything in particular about the packets that fail to
>  DNAT. Any suggestions on how to resolve this?

You can start by posting your ruleset, please show us the output from
iptables-save. Also, you failed to mention if those packets that don't get
DNATted are really random or creating a new connection.

HTH,
M4




