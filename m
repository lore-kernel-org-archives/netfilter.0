From: Magnus Solvang <magnus@solvang.net>
Subject: $INET_IFACE -> $LAN_IFACE
Date: Wed, 26 Feb 2003 18:43:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030226174354.GA29213@first.knowledge.no>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Do you normally forward everything from e.g eth0 to eth1?
I recently upgraded (downloaded) a lot of packages on the
webserver, and noticed later on the mrtg-graph that the
traffic was identical (only switched) on the two interfaces.

Is downloading ftp-data to the firewall from the internet
really related, established, so that is should be forwarded
to the internal interface?

# iptables -L FORWARD -v
Chain FORWARD (policy DROP 5 packets, 224 bytes)
 pkts bytes target     prot opt in     out     source	destination
28224 2433K ACCEPT     all  --  eth0   eth1    anywhere	anywhere \
  state RELATED,ESTABLISHED


$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -m state \
--state ESTABLISHED,RELATED -j ACCEPT

- M

