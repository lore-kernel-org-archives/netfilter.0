From: Akao <technique@akao.fr>
Subject: Relay to DNS Server ?
Date: Wed, 16 Jun 2004 15:31:37 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40D04BB9.2030907@akao.fr>
References: <1613.64.2.245.108.1087318849.squirrel@64.2.245.108>    <1087319969.3576.12.camel@anduril.intranet.cartel-securite.net> <1724.64.2.245.108.1087321922.squirrel@64.2.245.108>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1724.64.2.245.108.1087321922.squirrel@64.2.245.108>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello
I have set up a netfilter box as a gateway.
The network lookis like this:

subnet ---- eth1 - Netfilter box - eth0 --- modem/router --- FAI

The forwarding/masquerading is working fine, subnet boxes can ping 
external ip like.

But they can' t resolve domain names, because there isn' t any DNS 
server in the subnet.
I d like to use DNS Servers of the ISP, or another DNS Server I would 
set up OUTSIDE the subnet.
The netfilter box has the ISP DNS servers in resolv.conf and its gateway 
is the router.It  resolves domains names without problems.

Is it possible to use netfilter rules to "relay" clients DNS requests ?
Sorry but I m new to netfilter.

Thanks in advance.
Regards

Axel

