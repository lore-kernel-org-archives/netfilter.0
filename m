From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: ebtables iptables DNAT something missing
Date: Wed, 14 Dec 2005 17:21:44 +0100
Message-ID: <43A04698.2000807@mnemon.de>
References: <s39fe950.070@gwia201.syr.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <s39fe950.070@gwia201.syr.edu>
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

Randy Grimshaw schrieb:
> I thought I followed the recipe for DNAT on a transparent firewall correctly with the statement below, and sniffing shows that the traffic is redirected. But although the client receives the return responses from the server at the dnat destination - the client basically ignores it. (possibly as unexpected noise). What am I missing?
> 
> iptables -t nat -D PREROUTING -p tcp --dport 80 -m physdev --physdev-in eth1 -m mark --mark 9 -j DNAT --to-destination 192.168.12.12:80

Are you sure ? -D means delete. Given that this is a typo, maybe you are
missing a SNAT rule ? Also maybe, that a tcpdump helps.


