From: "Nix N. Nix" <nix@go-nix.ca>
Subject: DNAT to localhost
Date: 13 Nov 2002 15:35:19 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037219719.6450.5.camel@tux.go-nix.ca>
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

Hi ! I sent the following message to netfilter@lists.samba.org as well,
so, if it hits this list twice, please forgive me.

Here it is:

Why doesn't this work ?

/sbin/iptables -t nat -A PREROUTING -p udp --destination 192.168.1.1/32
--dport 80 -j DNAT --to-destination 127.0.0.1:8080

The idea is:  The Web server listens solely on 127.0.0.1:8080 .  This
allows me to run a Web server as a non-root user.  But then, I want
${OUTSIDE_IP}:80 and 192.168.1.1:80 (my interface) to be forwarded to
127.0.0.1:8080 .  I'm sure you've guessed by now that I'm running the
Web server on my firewall ;o)

Anyway, I tried setting /proc/sys/net/ipv4/conf/lo/rp_filter to 0, but
that didn't help either.

IMHO, the reason this doesn't work is that the above rule is added at
the PREROUTING stage of the game.  So, when the packet is routed, the
routing decision is based on 
+----------------------+
|  Packet              |
+----------------------+
|source:<192.168.1.xxx>|
|dest:  <127.0.0.1>    |
+----------------------+
and, of course, somewhere, this packet gets dropped, because nothing
should be able to reach 127.0.0.0/8 but 127.0.0.0/8, right ?  But hell,
I'm no expert.

So, is there any way to forward TCP ports from local interfaces to the
loopback interface ?



Thanks for your advice.


