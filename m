From: Fabiano Bonin <fabiano@personalsoft.com.br>
Subject: Redirecting ports on localhost
Date: Tue, 30 Mar 2004 09:46:18 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40696C1A.5080400@personalsoft.com.br>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I followed a thread about redirecting ports on localhost, but i still 
did not have success in my case.
I have a service listening on port 5050, just on the local interface, as 
shown below:

netstat -n -a -p | grep 5050
tcp        0      0 127.0.0.1:5050          0.0.0.0:*               
LISTEN      7485/0

I need to access this service from other hosts through ETH0 interface 
(ip 192.168.0.254). The other hosts are in the same network.
I already enabled "NF_NAT_LOCAL" kernel option (btw, all netfilter 
options are enabled in my kernel), and the commands i'm using are these:

iptables -F
iptables -F -t nat
iptables -A OUTPUT -t nat -p tcp -o lo -d 192.168.0.254 --dport 5050 -j 
REDIRECT --to-ports 5050
echo "1" > /proc/sys/net/ipv4/ip_forward

After these commands, i can access the service on the eth0 interface 
from the server host itself, but not from other hosts in the same network.

What am i doing wrong?

Thanks.


