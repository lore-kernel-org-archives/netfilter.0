From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: SNAT
Date: Tue, 12 Nov 2002 22:01:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001a01c28a8e$9af7b7b0$0401000a@robbysan.org>
References: <003201c28a85$304077d0$2c00a8c0@PERUCCHI>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003201c28a85$304077d0$2c00a8c0@PERUCCHI>
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

> I want when to request internal 192.168.0.1:53 he leaves how
> ip external
> 200.200.200.1:53
> I tried to do that. But no this working
> iptables -t nat -I POSTROUTING -p udp -s 192.168.0.1 --sport 53 -j
> SNAT --to-source 200.200.200.1:53

I don't know if dns traffic is always sent *from* 53/udp, but I do
know it is always sent *to* 53/udp.

Do you have a default policy set to DROP in the FORWARD chain ?
Something like this should do the trick I think :
# iptables -A FORWARD -s 192.168.0.1 -p udp --dport 53 -o <eth-out> -j
ACCEPT
# iptables -t nat -A PREROUTING -s 192.168.0.1 -p tcp --dport 53 -j
SNAT --to-source 200.200.200.1


Rob


