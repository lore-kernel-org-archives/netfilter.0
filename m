From: "Eric Poulin" <epoulin@onepost.net>
Subject: Output Chain Problem...
Date: Fri, 18 Jun 2004 08:44:14 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005d01c45531$f6f4bfd0$800101df@lvl.digidyne.ca>
Reply-To: "Eric Poulin" <epoulin@onepost.net>
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

Good Day,

    I'm trying to harden a bit my firewall, who as been working perfectly in
the last 2 years. However, on of the chain I have never played with was the
OUTPUT chain. I never though that there could be a security breach with the
Default policy set to "ACCEPT" on it, but it goes against security "best
practices".

    Now, packet flow through a chain from top to bottom, and will hit the
Default Policy if no rules are match... My first test was to put those rules
in my output chain(That was completly empty before).

iptables -A OUTPUT -p ALL -s 127.0.0.1 -j ACCEPT
iptables -A OUTPUT -p ALL -s 192.168.0.0/24 -j ACCEPT
iptables -A OUTPUT -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

    After this, I did try to set the Default policy to drop... Strangely, I
lost my ssh connection(but as expected, all my NAT rules continued to work
perfectly). So I changed the policy to accept again, and decided to log
every packet hitting the bottom of the chain(Without results, so I have
added a general ACCEPT rule for testing):

Chain OUTPUT (policy ACCEPT 19 packets, 2060 bytes)
    pkts      bytes target     prot opt in     out     source
destination
       0        0 ACCEPT     all  --  *      *       127.0.0.1
0.0.0.0/0
    2410   327840 ACCEPT     all  --  *      *       192.168.0.0/24
0.0.0.0/0
       2      128 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0          state NEW,RELATED,ESTABLISHED
       0        0 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0
       0        0 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0          LOG flags 0 level 4 prefix `Output:'

    To my surprise, nothing seems to hit my LOG rule, and even the overall
ACCEPT rule... But again, as soon as I change the default policy to DROP, I
can't communicate with the box.

    Any idea? I must be missing something reallly obvious...

Eric


