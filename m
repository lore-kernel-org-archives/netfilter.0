From: "Yuta Kawamoto" <sceotjp@ybb.ne.jp>
Subject: Internet Servers behind firewall (passthrough)
Date: Wed, 11 Feb 2004 10:29:39 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1AqjCT-0004ja-FZ@vishnu.netfilter.org>
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

Hi, I am not a very netfilter savvy person. (beginner)
My problem is this:

I have 10 public(internet) IP addresses, each for a server.
These servers run a variety of OS-es, from RedHat Linux to MaxOSX
the only path for them to the internet, is a single network cable(a "red"
colored wire).
Right now, I have a RedHat Linux 9 machine connected to this red wire.
I have installed IPTABLES, but do not really know how to configure rules.

I would like this Linux "routing machine" to take all traffic to the 10
internet IP's
and pass them straight on to the servers connected on the other side of this
machine.


Internet(red wire) -> [eth0]Linux Routing PC[eth1] -> Switch/Hub -> 10
servers

I would need all ports on each of the machines,
as they would be serving all forms of traffic.

I have asked some friends who know more about Linux than I do, to no avail.
I would really appreciate any and all help in this matter.

Yuta Kawamoto



