From: wschroed@schroedernet.net
Subject: -p protocol question
Date: Thu, 6 May 2004 07:58:33 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <39017.4.19.111.130.1083848313.squirrel@home.schroedernet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

I am currently writing a mini how-to for a SANS paper and I have a
question regarding information in the man page that apparently behaves
differently than expected.
It is my understanding that in order to use --sport or --dport in the
filter chain, -p Protocol must be used. For example:
iptables -A INPUT -i eth0 -s 192.168.0.1 --sport 5000 -d 192.168.0.22
--dport 56 -j ACCEPT yields
iptables v1.2.8: Unknown arg `--sport'
Try `iptables -h' or 'iptables --help' for more information.
but iptables -A INPUT -i eth0 -p tcp -s 192.168.0.1 --sport 5000 -d
192.168.0.22 --dport 56 -j ACCEPT works.
Now, according to the man page, the argument to -p can be tcp,udp,icmp,all
or a number representing a protocol in /etc/protocols or a name from
/etc/protocols. I have found that in reality iptables yields the same
error above for anything expcept tcp.udp,icmp or their associated numbers.
What have I missed -or- is the man page wrong?
Will

