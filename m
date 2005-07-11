From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: DNS and NAT
Date: Mon, 11 Jul 2005 23:36:57 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507112334001.14463@yvahk01.tjqt.qr>
References: <BAY17-F385E7ADF96986B0821571980DC0@phx.gbl>
	<42D2E3C0.1030405@gmx.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42D2E3C0.1030405@gmx.co.uk>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org


> Proxy servers are a good choice in some circumstances; you maintain maximum
> control over what clients can and cannot do (unless users have shell access to
> the proxy server, perhaps.) But proxying is far more resource-intensive than
> NAT.

Not hard either. Just catch any non-squid packets and redir them to lo. In 
iptables words:

  -A OUTPUT -j DNAT -p tcp --dport {80|3128} --to-dest 127.0.0.1:80 \
    -m owner ! --uid-owner squid

{80,3128} depending on whether you want transparent(80) proxying or 
intercepted(3128) proxying.

Since squid usually listens on an unprivilegued port (3128), the socket 
creation can be deferred until after the setuid from root to squid; therefore, 
the socket belongs to "squid" and thus, --uid-owner can match.


Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/


