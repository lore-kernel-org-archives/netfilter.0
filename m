From: chrispatch@intrstar.net
Subject: RE: netfilter digest, Vol 1 #1396 - 14 msgs
Date: Wed, 17 Dec 2003 12:54:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <86A0DA300AA5A447BA587B1715BDF7F960507B@exchange.nt.intrstar.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

>On our Cisco we used a pool of public IP's for our users to NAT through.
>I've found a comparable configuration to do the same with iptables:
>
>iptables -t nat -p all -A POSTROUTING -s 10.0.0.0/8 -o eth0 -j SNAT --to
>x.x.x.x - y.y.y.y
>
>With this in place, outbound connections have a source address picked in a
>round-robin fashion from the pool which is basically what we want in order
>to not overload a single public IP. However, we now have an issue with
>some websites that have security measures in place to reject users
>connecting via a different IP for each transaction subsequent to logging
>in.
>
>For example, if my initial connection to http://secure.foo.com comes from
>xxx.xxx.xxx.4, the server will reject my next transaction if it comes from
>xxx.xxx.xxx.5.
>
>Somehow the Cisco NAT was able to address this with what I'm guessing was
>some kind of translation tracking procedure (either that or perhaps magic
>fairy dust) making subsequent connections to a site from a particular user
>come from the same IP.
>
>My question is, is there a way to configure iptables to do the same? If
>not, in your opinion how many users can we expect to successfully NAT to
>one public IP?

I have successfully NAT'ed 200-300 PC's to one ip in schools before, with no
problems.
Since you have multiple public IP addresses, try this
iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -j SNAT --to-source 1.1.1.1
iptables -t nat -A POSTROUTING -s 10.0.1.0/24 -j SNAT --to-source 1.1.1.2
iptables -t nat -A POSTROUTING -s 10.0.2.0/24 -j SNAT --to-source 1.1.1.3
iptables -t nat -A POSTROUTING -s 10.0.3.0/24 -j SNAT --to-source 1.1.1.4

This way all connections from the same host get NAT'ed to the same source,
but you are doing rudimentary balancing across your available public IP
addresses.




