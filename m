From: Whit Blauvelt <whit@transpect.com>
Subject: SNAT "invalid argument"
Date: Mon, 4 Aug 2003 14:56:01 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030804185601.GA8546@free.transpect.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Hi,

I've been using SNAT for some time on several systems. However on a system I
just built I get the following response:

# iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to 1.2.3.4
iptables: Invalid argument

That's with 1.2.3.4 replaced by a real IP (or not).

This is driving me up the wall since "Full NAT"  support is compiled into
the 2.4.21 kernel. The iptables version is 1.2.8. The only thing different
in the kernel options from what I've used before is that I also included
"NAT of local connections" - haven't tried to use that yet though. 

iptables is otherwise working fine. -j MASQUERADE (also compiled in) also
gives me an "Invalid argument" - so it does look like something's wrong in
the NAT section, but damned if I know what.

Whit


