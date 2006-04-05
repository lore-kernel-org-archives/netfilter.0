From: "Robert LeBlanc" <robert@leblancnet.us>
Subject: CLUSTERIP refuses to answer ARP
Date: Wed, 5 Apr 2006 12:18:50 -0600
Message-ID: <A78C6C481BFAE949BC5990E1EEB2FE12572B@q.LeBlancNet.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

I just compiled a 2.6.16.1 kernel and installed iptables 1.3.5 and
CLUSTERIP is still not responding to ARP requests. Am I missing
something here?

iptables -A INPUT -i eth1 -d 192.168.0.10 -j CLUSTERIP --new --hashmode
sourceip --clustermac 01:23:45:67:89:AB --total-nodes 2 --local-node 1
echo "+2" > /proc/net/ipt_CLUSTERIP/192.168.0.10

Robert LeBlanc

