From: <kwang@kwang.org>
Subject: IP forwarding on port 80
Date: Tue, 10 Jun 2003 17:08:20 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <33603.128.83.147.87.1055282900.squirrel@www.kwang.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Firewall, called dscp, has these iptables settings:

Chain INPUT (policy ACCEPT)
target     prot opt source               destination
ACCEPT     tcp  --  localhost.localdomain  anywhere
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED
ACCEPT     icmp --  anywhere             anywhere
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:http
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ssh
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:sftp
DROP       all  --  anywhere             anywhere

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       tcp  --  anywhere             dscp.nur.utexas.edutcp dpt:http
to:192.168.0.2

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

HTTP server has these settings:

Chain INPUT (policy ACCEPT)
target     prot opt source               destination
ACCEPT     tcp  --  localhost.localdomain  anywhere
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED
ACCEPT     icmp --  anywhere             anywhere
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:http
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ssh
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:sftp
DROP       all  --  anywhere             anywhere

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Firewall connects to the world via eth1 and to the HTTP server on eth0. HTTP
server connects to the firewall on eth0 and to another machine on eth1.

I can access the HTTP server from the firewall just fine but not from the
internet. Any clues?



