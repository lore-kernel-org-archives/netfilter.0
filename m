From: "Han, Yan" <hany@u.library.arizona.edu>
Subject: Help! NAT unable to routing
Date: Thu, 30 Oct 2003 17:12:47 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BEA73FB6B8F62545A5B2818724D0DF2902E70843@u.library.Arizona.EDU>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>


Hi! 

I am using IPTables to do some re-routing tests. Basically I try to re-route
the traffic from one box to another box. But it failed (not forwarding, but
timeout). Can anyone point to what errors about my script.
p.s. I did open forward (net.ipv4.ip_forward = 1) in Linux.


#set the dafault policies; 
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

# what is wrong ??
iptables -t nat -A PREROUTING -i eth0 -p tcp -d 150.135.44.245 --dport 80 -j
DNAT --to 150.135.45.96



