From: joe@princerupertlibrary.ca
Subject: 1 webserver NATd, 2nd won't work
Date: Tue, 21 Oct 2003 10:14:11 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0310211011580.16322-100000@orca.princerupertlibrary.ca>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello Everyone:
I am trying to get our second webserver NAT'd behind our firewall but I'm 
stuck and hoping someone can point out what I'm doing wrong.
I was able to get it working outside the firewall, but I want it inside if 
possible.

I will be using pseudonyms for the machines and public IP addresses
The two web servers are:
NAME		INTERNAL IP ADDRESS	PUBLIC IP ADDRESS

marge.prl.ca 	192.168.0.244		8.8.8.149
homer.prl.ca	192.168.0.211		8.8.8.148

The firewall (also the nameserver of our prl.ca domain) is bart.prl.ca and 
is 8.8.8.149

I have successfully NAT'd the first web server marge with the following instructions:
#Open ports on Marge
#First the regular port 80
/sbin/iptables -A FORWARD -j ACCEPT -p tcp --dport 80
/sbin/iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j DNAT --to 192.168.0.244:80
#

But when I try to NAT homer with the following commands I can NOT find the page outside of 
our network.  
#Opening a route to Homer
/sbin/iptables -A FORWARD -j ACCEPT -p tcp --dport 80
/sbin/iptables -t nat -A PREROUTING -d homer.prl.ca -p tcp --dport 80 -j DNAT --to 192.168.0.211:80

OR
#Opening a route to PRL's webserver
#Using the same format as what's working for dynix
/sbin/iptables -A FORWARD -j ACCEPT -p tcp --dport 80
/sbin/iptables -t nat -A PREROUTING -d 8.8.8.148 -p tcp --dport 80 -j DNAT --to 192.168.0.211:80

Can anybody tell me what I'm doing wrong? 

Many thanks and well-wishes to you,
Joe Zelwietro
Prince Rupert Library






