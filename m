From: Andrew Beekhof <beekhof@gmail.com>
Subject: Masquerade difficulties
Date: Fri, 7 Jan 2005 22:42:34 +0100
Message-ID: <26ef5e705010713424fac90a9@mail.gmail.com>
Reply-To: Andrew Beekhof <beekhof@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi All,

I'm having some difficulties getting masquerading to work and hoping
for some pointers...

The server (BoxA) has an ipsec (openswan) connection to another
network and I've run:
        echo 1 > /proc/sys/net/ipv4/ip_forward
        iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

On the client (BoxB) I've set the gateway for the other network to be BoxA.

Normally that does the trick, but not today...
If BoxB tries to ping BoxC, I can see BoxA forwarding the request but
it never gets an answer to forward back to BoxB.  Obviously BoxA can
ping BoxC directly.

There are no errors in dmesg or /var/log/messages and I tried
comparing "-j LOG" entries from my old server (a SLES9 box) where
masquerading works with those from my new server and everything looks
the same... it just doesn't work :(

Any pointers on what I'm missing or things to try would be appreciated.

Andrew

Distro: Gentoo
Kernel: 2.6.9-gentoo-r13
iptables: iptables v1.2.11
Openswan: Linux Openswan U2.2.0/K2.6.9-gentoo-r13 (native)

