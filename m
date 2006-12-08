From: Richhmond Dyes <rdyes@monroehosp.org>
Subject: Problem with re-directing from 2 sources to one server
Date: Thu, 07 Dec 2006 21:46:43 -0500
Message-ID: <4578D213.2000607@monroehosp.org>
Reply-To: rdyes@monroehosp.org
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

I have a server that I have to reach from 2 different networks, the
Internet and another private network called downtown and I also have to
reach from the server both networks.  If I have one of the set of rules
running, it works fine, but if I put both set of rules on, it doesn't
work.  below are my set of rules.  Can anyone tell me a how this can be
done?

Here is the setup.
mynetwork 172.31.0.0/21
eth0 172.31.4.254 my network interface
eth1 192.168.14.1 interface to downtown which on that network's side
routes to 10.0.0.0/9
eth2 publicIP to the internet
publicnetwork.100 is the virtual address on eth2 called eth2:100
172.31.5.100 is the private ip address of the server I want reached
192.168.14.10 is the virtual ip address on eth1 called eth1:10


$IPT -t nat -A PREROUTING -d publicnetwork.100 -j DNAT --to-destination
172.31.5.100
$IPT -t nat -A POSTROUTING -s 172.31.5.100 -j SNAT --to-source
publicnetwork.100

$IPT -t nat -A PREROUTING -d 192.168.14.10  -j DNAT --to-destination
172.31.5.100
$IPT -t nat -A POSTROUTING -s 172.31.5.100 -j SNAT --to-source 
192.168.14.10

Then I forward all my 10.0.0.0/9  ip requests to  downtown

$IPT -A FORWARD -m state --state NEW -i eth0 -s 172.31.0.0/21  -o eth1
-d 10.0.0.0/8  -j ACCEPT

Then I forward ip requests from downtown for the server to it.
$IPT -A FORWARD -i eth1 -s 10.0.0.0/8 -d 172.31.5.100 -m state --state
NEW -j ACCEPT

Then I forward ip request from the internet to the server.
$IPT -A FORWARD -i eth2 -s 0/0 -o eth0 -d 172.31.5.100 -m state --state
NEW -m multiport -p tcp  --dport 22,80,1352 -j ACCEPT

Again when I have both set of rules on, it does not work.  any ideas?





