From: "Pedro Drimel Neto" <pedrodrimel@uol.com.br>
Subject: match nth
Date: Mon, 6 Feb 2006 11:00:00 -0200
Message-ID: <00bd01c62b1d$41c1be60$2f00a8c0@TRINTASETE>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi all,

I'm using nth on my linux box to do a simple load balancing, I need to use 
some different IPs to connect to another server (like a "bridge", the 
clients connect on linux box and them connect to the server) this is needed 
because the "server" understand the use of license by IP.

So, I'm using nth with --packet 0, 1 and 2 what means 3 different IP (one 
interface with two logics)

I added other interface like eth1 but I don't know how to do nth match with 
more IPs (like six).

These are the rules:

#ifconfig eth0 10.0.0.1 netmask 255.255.255.0
#ifconfig eth0:0 10.0.0.2 netmask 255.255.255.0
#ifconfig eth0:1 10.0.0.3 netmask 255.255.255.0

#iptables -t nat -A POSTROUTING -o eth0 -d 10.0.0.9 -m nth --counter 
7 --every 3 --packet 0 -j SNAT --to-source 10.0.0.1
#iptables -t nat -A POSTROUTING -o eth0 -d 10.0.0.9 -m nth --counter 
7 --every 3 --packet 1 -j SNAT --to-source 10.0.0.2
#iptables -t nat -A POSTROUTING -o eth0 -d 10.0.0.9 -m nth --counter 
7 --every 3 --packet 2 -j SNAT --to-source 10.0.0.3

It's OK but when I try with eth1 only the IPs of eth0 is funcional

#ifconfig eth1 10.0.0.4 netmask 255.255.255.0
#ifconfig eth1:0 10.0.0.5 netmask 255.255.255.0
#ifconfig eth1:1 10.0.0.6 netmask 255.255.255.0

#iptables -t nat -A POSTROUTING -o eth1 -d 10.0.0.9 -m nth --counter 
7 --every 3 --packet 0 -j SNAT --to-source 10.0.0.4
#iptables -t nat -A POSTROUTING -o eth1 -d 10.0.0.9 -m nth --counter 
7 --every 3 --packet 1 -j SNAT --to-source 10.0.0.5
#iptables -t nat -A POSTROUTING -o eth1 -d 10.0.0.9 -m nth --counter 
7 --every 3 --packet 2 -j SNAT --to-source 10.0.0.6


Sorry for my bad english...

Any ideas? Thanks.

Best Regards. 


