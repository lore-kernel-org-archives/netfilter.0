From: longraider <longraider@gazeta.pl>
Subject: Re: Two inet connections and stateful SNAT
Date: Mon, 28 Aug 2006 12:28:52 +0200
Message-ID: <44F2C564.8080509@gazeta.pl>
References: <44F01E8B.1040504@gazeta.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44F01E8B.1040504@gazeta.pl>
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
To: netfilter@lists.netfilter.org

> Hi
> I've got a problem with proper configuration of firewall described in:
> 10.4.1. Outbound traffic Using Multiple Connections to the Internet
> described at http://linux-ip.net/html/adv-multi-internet.html
> 

I've finally got it. The rp_filter needs to be disabled.
echo 0 > /proc/sys/net/ipv4/conf/$DSL_IF/rp_filter


-- 
mati



