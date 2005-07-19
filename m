From: Kai Hendry <hendry@soltecsoftware.com.au>
Subject: DNAT
Date: Tue, 19 Jul 2005 12:01:22 +1000
Message-ID: <42DC5EF2.8060002@soltecsoftware.com.au>
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

I have three machines:
192.168.0.1
192.168.0.3
192.168.0.9

On 9 there is service running on port 1199 that I want clients (at 3) to 
use from 1.

With SSH I can get this working from 1 with clients at 1 with:
ssh -L 1199:localhost:1199 192.168.0.9
Thought telnet localhost 1199 only works, not telnet 192.168.0.1 1199
Anyway, I don't need encryption.

DNAT is what I've been told I need so:
http://netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html

$ cat i.sh
sudo /sbin/iptables -t nat -F
# This alone doesn't work
sudo /sbin/iptables -t nat -A PREROUTING -p tcp --dport 1199 -i eth0 -j 
DNAT --to 192.168.0.9:1199
# I suspect something is wrong here:
sudo /sbin/iptables -t nat -A POSTROUTING -p tcp --dport 1199 -j SNAT 
--to 192.168.0.1:1199
sudo /sbin/iptables -t nat -vnxL --line-numbers

It just does not work when from 3:
$ telnet 192.168.0.1 1199
Trying 192.168.0.1...

Packets do show up:
SOLTEC-HDSVR$ sudo /sbin/iptables -t nat -vnxL --line-numbers
Chain PREROUTING (policy ACCEPT 6494 packets, 466878 bytes)
num      pkts      bytes target     prot opt in     out     
source               destination
1           4      240 DNAT       tcp  --  eth0   *       
0.0.0.0/0            0.0.0.0/0          tcp dpt:1199 to:192.168.0.9:1199

Chain POSTROUTING (policy ACCEPT 2102 packets, 388967 bytes)
num      pkts      bytes target     prot opt in     out     
source               destination

Chain OUTPUT (policy ACCEPT 2102 packets, 388967 bytes)
num      pkts      bytes target     prot opt in     out     
source               destination

Though from 1 not at all:
$ telnet 192.168.0.1 1199
Trying 192.168.0.1...
telnet: Unable to connect to remote host: Connection refused

What am I doing wrong?

