From: "Matthew TenHulzen" <mlt@willconsult.com>
Subject: exclude NAT to multiple networks
Date: Fri, 15 Nov 2002 17:20:54 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <LMEMIBPDHPIPKJNOIJNGEELGDIAA.mlt@willconsult.com>
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

I have the following NAT line that excludes NAT'ing to the 192.168.250.0/24
network.

$IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -d ! 192.168.250.0/24 -j
SNAT --to-source $INET_IP

I need to exclude NAT for additional networks, but cannot figure out how to
do it.  I have tried duplicating this line, but it doesn't work.  I also
cannot figure out how to specify multiple subnets in the same line.


Does anyone know how to exclude traffic to multiple subnets from being
NAT'ed??

Matt


