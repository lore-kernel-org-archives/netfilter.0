From: Tomasz Wrona <tmp@eter.tym.pl>
Subject: Deleting rule with "-m time" doesn't work.
Date: Tue, 9 Jul 2002 22:56:28 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1747283092.20020709225628@wp.pl>
Reply-To: Tomasz Wrona <tmp@eter.tym.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hello,

What could be a reason that deleting rule with "-m time" doesn't work?

When I add sample rule:
iptables -t mangle -A FORWARD -i eth0 -o eth1 -m time --timestart \
18:00 --timestop 19:00 --days Mon,Tue,Wed,Thu,Fri,Sat,Sun -j ACCEPT

and than:
iptables -t mangle -D FORWARD -i eth0 -o eth1 -m time --timestart \
18:00 --timestop 19:00 --days Mon,Tue,Wed,Thu,Fri,Sat,Sun -j ACCEPT

I have following message:
iptables: Bad rule (does a matching rule exist in that chain?)

Deleting rule ie. with iptables -t mangle -D FORWARD 1 works fine.

I used latest v 1.2.6a


Regards,
tw                   
--


