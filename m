From: "Sundaram Ramasamy" <sun@percipia.com>
Subject: Redhat Linux 8.0 IPtables help
Date: Thu, 5 Jun 2003 15:32:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000f01c32b99$3d65fab0$8c01a8c0@percipia.com>
References: <20030602160653.GB14609@eris> <20030602165342.GC14917@harp.incogen.com> <20030602171755.GA6298@hactar.local.funknet.net> <200306041635.19489.rfunk@funknet.net>
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

Hi,



I have Linux machine with single Network interface. I want to block all the
tcp,udp and icmp port's other then 22,23,24 and 80.



Can you verify the following script?





IPTABLES=/sbin/iptables



$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

$IPTABLES -A INPUT -p tcp -m multiport --destination-port 22,23,24,80 -j
ACCEPT



$IPTABLES -A INPUT -p udp -m multiport --destination-port 22,23,24,80 -j
ACCEPT





What port should I block for icmp protocol?



-SR



