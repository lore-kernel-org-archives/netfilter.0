From: "Mark Ryan" <markryan@cfl.rr.com>
Subject: Help with game server
Date: Sat, 21 Dec 2002 21:06:11 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c2a95e$b93651c0$0501a8c0@underworld>
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

I have a linux firewall/router with iptables firewall script.  I am
trying to run a Medal of Honor game server so that me and a friend can
play.
 
I only want him to be able to connect...however I can't seem to get the
rules right.  It seems that Medal of Honor is using port 12203.  I have
the following rules but they don't work:

These to allow the connection:
$IPTABLES -A INPUT -p udp -i $EXT_IF -s 68.99.10.xx -d 67.8.168.xx
--dport 12203 -j ACCEPT
$IPTABLES -A INPUT -p tcp -i $EXT_IF -s 68.99.10.xx -d 67.8.168.xx
--dport 12203 -j ACCEPT

These to forward to internal machine:
$IPTABLES -t nat -A PREROUTING -p tcp --dport 12203 -i eth1 -s
68.99.10.xx -j DNAT --to 192.168.1.5:12203
$IPTABLES -t nat -A PREROUTING -p udp --dport 12203 -i eth1 -s
68.99.10.xx -j DNAT --to 192.168.1.5:12203
 
Am I doing something wrong?
 
Mark



