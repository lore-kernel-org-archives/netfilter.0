From: Sascha Pollok <netfilter@pollok.net>
Subject: Problems with SNAT and packets not NATed
Date: Wed, 18 Feb 2004 15:33:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1AtSm8-0007py-00@mail-out1.iphh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Dear folks,

I have just subscribed because we ran into a problem that
many people we asked were not able to solve. I hope that this
is the right place for asking. Please bear with me if it's not.

We have a latest Debian running a 2.4.24 kernel. Pretty straight
forward, absolutely nothing special about it. The box is
routing between two NICs (inner and outer LAN). Internal is
private IP-addresses, external is a public one. We configured
an overload-nat like this:

  iptables -A POSTROUTING -s 192.168.100.0/24 -o eth0 -j SNAT --to x.x.x.1

Nothing more. We have flushed all other queues. This has been
working on many boxes we have set up.

Today, we ran into the problem that *some* of the packets
travelling from internal eth1 to eth0 (outside) do not
get NATed although the rule is in there. Apparently these
are mostly ICMP packets (like ping) but also others like
UDP/53 (DNS) do not get NATed. This is really strange
because we did tests like:

  - Reboot Linux-Router
  - Linux-Client (192.168.100.5) can not ping
  - Windows-Client (192.168.100.6) can ping
  - Linux-Client can suddenly ping, too.

When the boxes are not able to ping, it is just because
the appropriate packets don't get NATed and end up at
the ISPs router since they have RFC1918 addresses in the
source field.

Making a long question short: why do some packets get NATed
and others don't?

Please tell me if you need any additional information to
evaluate. This might be obvious but we did not find
anything.

Thanks a lot.

Cheers!
Sascha


