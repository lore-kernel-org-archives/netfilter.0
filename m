From: Carlos Robles <carlos.r@quadnet.co.uk>
Subject: Routing through Debian
Date: Mon, 16 Feb 2004 14:40:49 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <021A59AE3C21D649BCEA0B7802EC408A443142@quadnet_fs1.quadnet.co.uk>
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
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hello my name is Carlos
This is the first time I'm emailing here and I don't know really how this
works, I'm just going nuts with the next issue:
I'm trying to connect from my XP office computer to my Home (XP prof)
computer (192.168.0.4).
In my home I have a small network made out of 5 computers, they all  connect
to internet through a Debian 2.4 box(private 192.168.0.5, public:
80.1.122.39) that I've configured to work as a router-firewall.
I modified ip-tables so to let any connection coming to the router to port
3389 to redirect it to 192.168.0.4:
iptables -t nat -I POSTROUTING -p tcp --sport 3389 -s 192.168.0.4 -j SNAT
--to 80.1.122.39:3389
iptables -t nat -I PREROUTING -p tcp --dport 3389 -d 80.1.122.39 -j DNAT
--to 192.168.0.4:3389
Commands go well, no problems.
But still I can't connect, is there something that I'm missing?

Thanks very much

Carlos Robles 
mailto txarli11@hotmail.com


