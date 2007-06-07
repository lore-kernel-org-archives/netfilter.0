From: "Vincent Wen" <vincent.wen@advantechamt.com>
Subject: linux-2.6.21 and iptables1.3.7 modprobe could not parse modules.dep
Date: Thu, 7 Jun 2007 10:54:15 -0400
Message-ID: <1A60C93388AFD3419AEE0E20A116D320028E1951@exch2k>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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

Hi,

I have a problem with the linux 2.6.21 and iptables 1.3.7, I've built
ip_tables into the kernel with CONFIG_IP_NF_IPTABLES=3Dy and build the
iptables with NO_SHARED_LIBS=3D1, now when I start the iptables,  I got
the error message, modprobe :could not parse modules.dep.=20

I have tried with CONFIG_IP_NF_IPTABLES=3Dm, there are still some error.

when I build the itables without the "NO_SHARED_LIBS=3D1",  no modprobe
error message, but the iptables couldn't get --dport work.

Some advice would be very welcome. Thanks very much.

Vincent

