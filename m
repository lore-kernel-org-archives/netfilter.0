From: Carlos Carvalho <carlos@fisica.ufpr.br>
Subject: FORWARD chain and local interfaces
Date: Wed, 18 Dec 2002 09:31:33 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <15872.23701.537527.186599@hoggar.fisica.ufpr.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hi netfilter users,

I have a doubt/problem with this since kernel 2.2. Suppose you have a
box with two interfaces, for example eth0=192.168.1.0/24 and
eth1=192.168.2.0/24, and the box addresses are 192.168.1.1 and
192.168.2.1 respectively. The machine is a firewall and has ip_forward
activated. If you ping 192.168.2.1 from a machine connected to eth0,
say 192.168.1.5, you get an answer, which is normal because of the
forwarding.

Now let's block the FORWARD chain, say with iptables -P FORWARD DROP
and no rules in the chain. I'd expect to not get any answers to the
ping above, because the echo-request's are arriving on an interface
and are destined to the other, so they should go through the FORWARD
chain which is blocked. However I still get the normal echo-reply's...
This means that the kernel sees the interface is local and doesn't
route them through the FORWARD chain.

I'd like to know if this is expected or an unwanted side-effect. For
me it's annoying because I use SNAT and I don't want the internal
(192.168.2.1 in this example) visible from outside. I also find it
conceptually strange. Is there a way to avoid this without filtering
these packets at the INPUT chain?

