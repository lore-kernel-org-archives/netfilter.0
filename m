From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: help with routing/firewall
Date: Thu, 18 Dec 2003 21:46:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031218204612.CB1038718@sterenborg.info>
References: <20031218180112.66315.qmail@web20419.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031218180112.66315.qmail@web20419.mail.yahoo.com>
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

> Simple configuration. 
> eth0 internet
> eth1 local net
> Everything accepted from eth1, nothing from eth0, 
> traffic from eth1 is routed to internet.
> IP forwarding is enabled.
> From local net I can ping eth1 and eth0 (that means 
> machine is routing packets), but I cant go outside 
> eth0. Same happens when ther is no firewall. What's 
> the problem with routing?
> What comands can I use to monitor what is happening 
> with packets?

So do your masq/snat rules look like ?

Should be something like :
(echo "0" > /proc/sys/net/ipv4/ip_forward)
iptables -P FORWARD DROP
iptables -A FORWARD -i eth1 -o eth0 -s <local_net> \
    -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -s <local_net> \
    -j SNAT --to-source <inet_ip>     ** OR **
iptables -t nat -A POSTROUTING -o eth0 -s <local_net> \
    -j MASQUERADE
(echo "1" > /proc/sys/net/ipv4/ip_forward)

Gr,
Rob


