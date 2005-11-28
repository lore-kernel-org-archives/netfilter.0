From: Martin Kahlert <mkcon@gmx.de>
Subject: Howto redirect internet traffic from local machine back to local
	machine?
Date: Mon, 28 Nov 2005 08:55:25 +0100
Message-ID: <20051128075525.GA11446@keksy.local>
Reply-To: mkcon@gmx.de
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi!

Unfortunately i did not find a proper answer on the web although i googled
around for quite a lot of time:

I want to analyse a malware on my computer. The malware connects to a
lot of sites on the internet (hard coded in the program but unfortunately
these IPs are encrypted).

I know the port the program wants to connect to and i want to answer its
requests by a script on the same machine.

I tried this for a test to catch connections to mail servers:

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -F
iptables -t nat -A PREROUTING -p tcp -d ! 192.168.100.0/24 --dport 25 -j DNAT
                --to 127.0.0.1:25

But it does not work:

$ telnet mail.gmx.net 25
Trying 213.165.64.21...
Connected to mail.gmx.net.         <--- of course, that's not my box
Escape character is '^]'.
220 {mp027} GMX Mailservices ESMTP

I assume the problem has something to do that the packets are generated
on the "iptables-machine". Unfortunately, i only have this machine and thus
i cannot send the packets through a second firewall-machine.

I would be very happy if any kind soul could give me a hint!

Thanks in advance,
Martin.

