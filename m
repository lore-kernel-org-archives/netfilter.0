From: Real Cucumber <monkcucumber@yahoo.com>
Subject: Help with ICMP Ruls
Date: Thu, 15 Jul 2004 10:03:23 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040715170323.24191.qmail@web40707.mail.yahoo.com>
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

I'm trying to determine the best practice for allowing
the required ICMP messages to ensure stable
networking, while at the same time not allowing pings
or other unnecessary parts.

The server these rules are going to be added on is
just a packet forwarding firewall using fedora2 and
iptables, and it for now just forwards incoming SSH
packets to an Internal server.  So far SSH connections
are working fine though, but I've had much feedback
suggestions I enable ICMP.

The internal SSH server is not blocking ICMP.

The fedora box in front of it is not allowing ICMP at
all (for Input, Output, and Forward).

What I'd like to know is what are the recommended
allowed ICMP messages for me to set on the Fedora box?

Shoudl I just allow all ICMP to be forwarded or just
the four basic control/status messages (source quench,
parameter problem, incoming destination unreachable,
outgoing destination unreachable of subtype
fragmentation).

Also do I need to allow those in all 3 chains or just
the forward since it does not allow direct connections
to it anyhow?




		
__________________________________
Do you Yahoo!?
Yahoo! Mail - 50x more storage than other providers!
http://promotions.yahoo.com/new_mail

