From: Mohammad Shakir <shakirz1@yahoo.com>
Subject: Proxy Setup
Date: Sun, 23 Nov 2003 23:48:17 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031124074817.51047.qmail@web40708.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1697700660-1069660097=:50459"
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
To: netfilter@lists.netfilter.org

--0-1697700660-1069660097=:50459
Content-Type: text/plain; charset=us-ascii

I have Red Hat Linux 7.3 with squid-2.4.STABLE6-1.7.2, kernel-2.4.18-3,iptables-1.2.5-3.
I want to run cable network with 100 users with normal dialup.
I have 4 PC PIII 733Mhz with 256MB RAM and USR 56K External Modem with Linux 7.3 configure Squid and 4 telephone lines.
Now I want all my request come on server1 ( for this I setup dhcp on server1 and define gateway,DNS to server1 to all clients),
I also setup MASQUREAD on server1 so all clients are connected with Internet.
But if any request come for browsing means tcp port 80 Linux automatically forward that request on server2, server3, server4.
Actually I want to distribute all browsing request to server2, server3 and server4.
I know normal telephone line is not best for 100 users but right now I do not have any other resource.
I am sending herewith my script which I am using on server1.

#  Flush all Rules
/sbin/iptables --flush
/sbin/iptables --table nat --flush
/sbin/iptables --delete-chain
/sbin/iptables --table nat --delete-chain

#  for transprent proxy
/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080

#  for MASQUREADE
/sbin/iptables --table nat --append POSTROUTING -s 192.168.0.0/24 --out-interface ppp0 -j MASQUERADE
/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -A INPUT -m state --state NEW -i ! ppp0 -j ACCEPT
/sbin/iptables -P INPUT DROP   #only if the first two are succesful
/sbin/iptables -A FORWARD -i ppp0 -o ppp0 -j REJECT
/sbin/iptables -I INPUT -p icmp -j REJECT
/sbin/iptables -I FORWARD -p icmp -j DROP
echo "1" > /proc/sys/net/ipv4/ip_forward
 


---------------------------------
Do you Yahoo!?
Free Pop-Up Blocker - Get it now
--0-1697700660-1069660097=:50459
Content-Type: text/html; charset=us-ascii

<DIV>I have Red Hat Linux 7.3 with squid-2.4.STABLE6-1.7.2, kernel-2.4.18-3,iptables-1.2.5-3.</DIV>
<DIV>I want to run cable network with 100 users with normal dialup.</DIV>
<DIV>I have 4 PC PIII 733Mhz with 256MB RAM and USR 56K External Modem with Linux 7.3 configure Squid and 4 telephone lines.</DIV>
<DIV>Now I want all my request come on server1 ( for this I setup dhcp on server1 and define gateway,DNS to server1 to all clients),<BR>I also setup MASQUREAD on server1 so all clients are connected with Internet.</DIV>
<DIV>But if any request come for browsing means tcp port 80 Linux automatically forward that request on server2, server3, server4.<BR>Actually I want to distribute all browsing request to server2, server3 and server4.</DIV>
<DIV>I know normal telephone line is not best for 100 users but right now I do not have any other resource.</DIV>
<DIV>I am sending herewith my script which I am using on server1.</DIV>
<DIV><BR>#&nbsp; Flush all Rules<BR>/sbin/iptables --flush<BR>/sbin/iptables --table nat --flush<BR>/sbin/iptables --delete-chain<BR>/sbin/iptables --table nat --delete-chain</DIV>
<DIV><BR>#&nbsp; for transprent proxy<BR>/sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 8080</DIV>
<DIV><BR>#&nbsp; for MASQUREADE<BR>/sbin/iptables --table nat --append POSTROUTING -s 192.168.0.0/24 --out-interface ppp0 -j MASQUERADE<BR>/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT<BR>/sbin/iptables -A INPUT -m state --state NEW -i ! ppp0 -j ACCEPT<BR>/sbin/iptables -P INPUT DROP&nbsp;&nbsp; #only if the first two are succesful<BR>/sbin/iptables -A FORWARD -i ppp0 -o ppp0 -j REJECT</DIV>
<DIV>/sbin/iptables -I INPUT -p icmp -j REJECT<BR>/sbin/iptables -I FORWARD -p icmp -j DROP</DIV>
<DIV>echo "1" &gt; /proc/sys/net/ipv4/ip_forward</DIV>
<DIV>&nbsp;</DIV><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/slv/mailtag/*http://companion.yahoo.com/">Free Pop-Up Blocker - Get it now</a>
--0-1697700660-1069660097=:50459--

