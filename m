From: Nuitari <nuitari@balthasar.nuitari.net>
Subject: Problem with counting
Date: Sat, 5 Oct 2002 06:12:57 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210050609420.13964-100000@balthasar.nuitari.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm trying to get the byte counters to work with my nat firewall.

However, only a small fraction of all of the traffic is actualy counted.

iptables -A FORWARD -o eth0 -d 10.0.0.2 -j ACCEPT
iptables -A FORWARD -i eth0 -d 10.0.0.2 -j ACCEPT

to try to count both incoming and outgoing data for the 10.0.0.2 host.
However when I do

iptables -L -n -v -x

All I see is 0 transfer, which is quite impossible as I use that host to 
transfer huge amounts of data.


