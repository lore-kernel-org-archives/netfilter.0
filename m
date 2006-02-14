From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: RE: ipsec and iptables
Date: Tue, 14 Feb 2006 17:35:24 +0100
Message-ID: <BAY103-F16347FD522ACCAE30BA2A9B2060@phx.gbl>
References: <1139934266.22417.14.camel@fly.in.iantel.com.uy>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1139934266.22417.14.camel@fly.in.iantel.com.uy>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: edspremolla@antel.com.uy
Cc: netfilter@lists.netfilter.org


Eduardo Spremolla wrote:

>I use a trick stste on ipsec-tools howto:
>
>iptables -t mangle -A PREROUTING -i eth0 -p esp -j MARK --set-mark 1
>
>then to catch the uncapsulated packet:
>
>iptables -A INPUT -m mark --mark 1 -j ACCEPT

Yes. There are many way to filter ipsec packets. However
I think that the proper way to filter ipsec packets is the
policy match with recent kernel (2.6.16) and iptables (1.3.5).

Ciao



