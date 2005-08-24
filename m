From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Odd issue with two SNATed Firewalls and Wireless router
Date: Wed, 24 Aug 2005 10:40:58 -0500
Message-ID: <430C950A.7080900@riverviewtech.net>
References: <1124886644.9968.186.camel@andrew.iface.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1124886644.9968.186.camel@andrew.iface.lan>
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

> most of the mail comes down .... it seems to break when transmissions
> are over +-600 KB)

Try using the TCPMSS target to limit the MSS (Maximum (TCP) Segment Size) value to be at least as small as your path MSS.

Hint:

iptables -t filter -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu



Grant. . . .

