From: Ben Goedeke <goedeke-netfilter@gmx.net>
Subject: NATed and direct connection to one server
Date: Tue, 17 Feb 2004 20:29:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40326B8E.10303@gmx.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hey everybody,

I just took over administering a LAN at a university site and I have to 
move an entire subnet from private to regular IPs. Up until now the only 
outside access to this net was a pop and an smtp server both of which 
the users accessed through the firewall's _IP_ address (there was no DNS 
entry). There were two NAT rules that forwarded the ports to the real 
servers.

To make the move as painless as possible for the users I want to keep 
the DNAT rules for a while (and point them to the new IP of the mail 
servers). I also added DNS entries for the real IPs of the mail servers. 
In the long run I want to drop NAT altogether but for now the mail 
servers should be reachable via both the firewall and their own 
addresses. Because I doubt everybody will immediately change their mail 
client'ss settings.

Now for my question: Do I need to add an SNAT rule in POSTROUTING to 
handle responses from the mail servers or is it enough to have the DNAT 
rules in PREROUTING? And if I indeed need an SNAT rule how can I 
possibly distinguish packets that belong to connections that were DNATed 
when they came in and those that weren't and had the right destination 
IP all along?

I feel like I'm making a simple thing very complicated here... but I 
only have limited experience with iptables. So any help is greatly 
appreciated.

Thanks,
Ben

