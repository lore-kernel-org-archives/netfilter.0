From: "Robert LeBlanc" <robert@leblancnet.us>
Subject: Gateway cluster using iptables and CLUSTERIP
Date: Thu, 30 Mar 2006 09:31:32 -0700
Message-ID: <A78C6C481BFAE949BC5990E1EEB2FE125715@q.LeBlancNet.us>
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

I am basically familiar with iptables and can do some of the usual
stuff, block and drop packets, NAT, etc. I'm working on a project that
would provide an active-active gateway cluster using iptables and
heartbeat. I've got heartbeat configured to failover and failback the
CLUSTERIP, but CLUSTERIP address will not respond to network activity
and the host interface reports that the destination is not known.
Running tcpdump on the interface when doing a ping show arp traffic
requesting who has the address, but there is never a response. I did get
this to work once before, but it will not work again.

I've entered:

iptables -A INPUT -I eth1 -d 10.0.0.1 -j CLUSTERIP -new -hashmode
sourceip -clustermac 01:83:91:A7:0D:33 -total-nodes 1 -local-nodes 1

I have entered only one node in the cluster so that I would not have to
bring up both nodes during the testing or remember to add the other node
to /proc/net/ipt_CLUSTERIP/10.0.0.1.

I am running Debian stock kernel 2.6.15-1-686 and iptables v1.3.3. The
documentation that I have found has been very sparse and no one seemed
to have an answer for the lack of arp response. Once I get this problem
figured out, I will need help with getting this address to work as the
gateway address for the network. I'm not sure how to hook that address
in the SNAT chain (is that even what it is called?).

Thanks,
Robert LeBlanc
Brigham Young University

