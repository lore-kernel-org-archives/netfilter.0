From: Payal Rathod <payal-iptables@staticky.com>
Subject: please advise on this rule
Date: Wed, 13 Aug 2003 23:54:44 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030813182443.GA1468@linux.local>
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

Hi,
Does this FORWARD chain look ok in a simple NAT network where the Linux
box is connected to the net.

Chain FORWARD (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          state
RELATED,ESTABLISHED
REJECT     tcp  --  192.168.10.1         0.0.0.0/0          tcp dpt:80
reject-with icmp-port-unreachable


Is source 0/0 OK? Should be be 192.168.10.0/24 ?
Will the third rule block outgoing connection from 192.168.10.1 to any
server at port 80?

Thanks a lot and eagerly waiting for the reply.
With warm regards,
-Payal

-- 
"Visit GNU/Linux Success Stories"
http://payal.staticky.com
Guest-Book Section Updated.

