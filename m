From: Hans Scheffers <hans@jiffie.nl>
Subject: Loggin using fwlogwatch
Date: 03 Jun 2002 17:12:57 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <1023117177.2206.27.camel@taz.jiffie.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@lists.samba.org" <netfilter@lists.samba.org>

Hi
I have the following rules in my iptables conf:
iptables -N bad_tcp_packets
iptables -A bad_tcp_packets -p TCP ! --syn -m state --state  NEW -m
limit --limit 3/minute -j LOG --log-prefix "New not syn: "

When I look in the logging using fwlogwatch I see: 
new not syn: eth0 x packets from xxx.xxx.xxx.xxx to 192.168.xxx.xxx port
y ---r--

This last part can also be:
sa----
-a-r--
-af---
-a--p-

I thought this was meant to be the header options of TCP packets,
meaning:
1 = URG
2 = ACK
3 = PSH
4 = RST
5 = SYN
6 = FIN

Am I wrong in this, and what do the s,a,f,r,p,? mean if I am (and also
when I am right ;)

This packages also exist between 2 of ou own servers, on ports that are
closed for the outside world, in the private range of the servers
Anyone any ideas?

-- 
mailto: hans@jiffie.nl
http://www.jiffie.nl/stamboom

