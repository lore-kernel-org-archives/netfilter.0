From: =?ISO-8859-1?Q?Antonio_P=E9rez?= <antonio.perez02@alu.umh.es>
Subject: nat/masquerade with kernel 2.6.x
Date: Sat, 11 Dec 2004 13:45:08 +0100
Message-ID: <41BAEBD4.8080401@alu.umh.es>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,
I hava a local network with private directions, and a adsl conection. I 
want to do masquerade. Then I do:
    echo 1 > /proc/sys/net/ipv4/ip_forward
    iptables --table nat --append POSTROUTING --out-interface eth1 -j 
MASQUERADE
where eth1 is the interface conected to internet. This work perfectly 
with the kernels 2.4.x.
But one week ago I installed the kernel 2.6.8 and when I do :
    echo 1 > /proc/sys/net/ipv4/ip_forward
    iptables --table nat --append POSTROUTING --out-interface 
$ifc_internet -j MASQUERADE
the hosts of the internal network can do ping to internet, and this is 
normal, but they can not open any web or conection the msn , they
only can do ping. This is very stranger. I try the kernels 
2.6.7,2.6.7,2.6.8 and 2.6.9 and they do no work.
Can somebody help me, please?
Sorry for my bad english.

