From: "John Arthur" <lists@davey.net.au>
Subject: RE: iptables on Satellite receive only linux PC
Date: Sat, 31 Jul 2004 21:17:42 +0930
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <AEEEIGKNFEANJOMAMBCBMENCCGAA.lists@davey.net.au>
References: <200407311205.39799.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407311205.39799.Antony@Soft-Solutions.co.uk>
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

> You should "echo 0 > /proc/sys/net/ipv4/conf/all/rp_filters"
> 
> You want the result of "cat 
> /proc/sys/net/ipv4/conf/all/rp_filters" to be 0, 
> not 1.
> 

Actually assuming that the satellite card is pentanet0 you want

echo 0 > /proc/sys/net/ipv4/conf/all/rp_filters
echo 1 > /proc/sys/net/ipv4/conf/pentanet0/rp_filters

To only turn off spoofing protection on the one interface.

