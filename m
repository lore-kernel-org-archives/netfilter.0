From: Kelly Setzer <Kelly.Setzer@placemark.com>
Subject: Purpose of self-referential rule
Date: Mon, 24 Feb 2003 10:06:28 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030224160628.GH4316@placemark.com>
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

I've been experimenting with gShield trying to learn the ins and outs
of iptables.  One of the rules is generates is:

iptables -A INPUT -s 192.168.6.0/24 -d 192.168.6.0/24 -i eth1 -j ACCEPT

The source and dest are correct for my internal network, and eth1 is
the internal net.  My question is, when would the firewall ever see a
packet that could possible match this?  Any packet with a source and
destination on the same network would send the packet directly (no
routing, thus no firewall).

What am I missing?

thanks,
Kelly
--
Kelly Setzer, System Administrator/Architect - Placemark Investments
14180 Dallas Pkwy, Suite 200, Dallas, TX 75240
kelly.setzer@placemark.com  http://www.placemark.com
(972)404-8100x41 (work)       (214) 287-3464 (cell)

