From: "Joel Linuxdude" <linuxlists@hotmail.com>
Subject: How to direct packets to my server. DOES THIS LOOK RIGHT?
Date: Sun, 15 Dec 2002 00:33:59 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F22R4BnmJZBRZ2ZBHQB0001f322@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

My Netfilter firewall (unfortunately) is running also
my Apache web server, FTP server and Telnet daemon.
I honestly think this is ok but its confusing me with
the whole firewall aspect.

I wanted to allow new packets to go to my Linux box
such as port 21 and 80 but only about 4 new connections
per second.

Eth0 = <Internet IP from my ISP/cable modem company>
Eth1 = 192.168.0.1

Would I do it like this;

/sbin/iptables -A PREROUTING -i eth0 -p tcp -d x.x.x.x --dport 21 -m state 
--state NEW -m limit --limit 4/second -j DNAT --to x.x.x.x

Whereas x.x.x.x is my IP that my ISP assigns me. Or would I use
the following;

/sbin/iptables -A PREROUTING -i eth0 -p tcp -d x.x.x.x --dport 21 -m state 
--state NEW -m limit --limit 4/second -j DNAT --to 192.168.0.1

THANKS!!!

Joel




_________________________________________________________________
MSN 8 with e-mail virus protection service: 2 months FREE* 
http://join.msn.com/?page=features/virus


