From: Shawn <core@enodev.com>
Subject: Is this correct?
Date: 19 Jun 2003 16:07:19 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1056056839.18406.21.camel@localhost>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

I have a, iptables statement I would just like someone to say if I have
it right.

Let's say I have a linux box with eth0=10.0.0.250 and
eth1=192.168.0.250, and there's a host (192.168.0.1) connected to eth1.
I want to route connections from hosts in 10.0.0.0/24 land to 10.0.0.1
onto the linux box's eth0, and have them NATed to 192.168.0.1

Will the following statement do that?

iptables -t nat -I PREROUTING -i eth0 -d 10.0.0.1 -J DNAT \
	--to 192.168.0.1


