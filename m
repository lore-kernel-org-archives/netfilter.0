From: "R. Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: Nat
Date: Sun, 8 Sep 2002 23:27:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000401c2577e$8ee60410$0401000a@win2k>
References: <3D7BB687.6010300@iol.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D7BB687.6010300@iol.it>
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

> I tried these lines, but it doesn't work:
>
> iptables -t nat -F POSTROUTING
> iptables -t nat -A POSTROUTING -j DROP
> iptables -t nat -A POSTROUTING -s 192.168.1.0/255.255.255.0
> -o ppp0 -j
> MASQUERADE

Try :

iptables -P INPUT DROP
iptables -A INPUT -s 192.168.1.0/24 -j ACCEPT

iptables -P FORWARD DROP
iptables -A FORWARD -s 192.168.1.0/24 -o ppp0 -j ACCEPT
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o ppp0 -j MASQUERADE


Rob


