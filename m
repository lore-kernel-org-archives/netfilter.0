From: Scott <gneamob@yahoo.com>
Subject: SMTP routing woes...
Date: Fri, 11 Mar 2005 05:17:27 -0800 (PST)
Message-ID: <20050311131727.11673.qmail@web54301.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello everyone, I am a new subscriber and longtime
linux/netfilter user.  On a remote host we've got an
ISP who has blocked all outgoing SMTP traffic except
to its own SMTP servers due to its IP ranges being
abused by spammers and open relays.  We run a legit
exim4+spamassasin+clamav with all relays turned off
except for authenticated MX domains.  However, this is
not good enough for the ISP so we need to implement a
fix to our other 'good' hosts.  I have read many
documents and other googled sources, including David
Coulsen's articles, and yet finding a solution that
fits this problem is simply not working.  Perhaps
someone on here can lead me in the right direction
because we are losing emails in a negative manner.  It
is my understanding thus far that I am missing a
POSTROUTING rule but I don't know how to form it
properly, I've tried several with no success.  Here's
the setup:

main routing table:

10.0.8.1 dev tun0  proto kernel  scope link  src
10.0.8.2 
X.X.X.X dev ppp0  proto kernel  scope link  src
Y.Y.Y.Y
10.0.8.0/30 via 10.0.8.1 dev tun0 
W.W.W.W/NM dev tun0  scope link 
W.W.W.W/NM dev eth1  proto kernel  scope link  src
W.W.W.Z
10.1.9.0/27 dev eth1  proto kernel  scope link  src
10.1.9.1 
default via X.X.X.X dev ppp0 

routing table rules:

0: from all lookup local 
20:    from all fwmark 0x7 lookup smtp 
21:    from W.W.W.W/NM lookup tun 
21:    from W.W.W.W/NM lookup vpn 
21:    from W.W.W.W/NM lookup lan 
29:    from 10.0.8.1 lookup tun 
29:    from 10.0.8.2 lookup tun 
41:    from X.X.X.X lookup sbc 
51:    from 10.1.9.0/27 lookup lan 
32766: from all lookup main 
32767: from all lookup default 

routing rules defined in /etc/iproute/rt_tables:
#
# reserved values
#
255    local
254    main
253    default
0  unspec
#
# local
#
1  inr.ruhep
20 lan
30 vpn
40 tun
50 sbc
100    smtp

script that sets up routing:

ip ro a default via 10.0.8.1 table tun pref 20
ip ru a from 10.0.8.1 lookup tun pref 29
ip ru a from 10.0.8.2 lookup tun pref 29

ip ro a default via Y.Y.Y.Y table sbc pref 40
ip ru a from X.X.X.X/32 lookup sbc pref 41

ip ro a default via W.W.W.Z table vpn pref 21
ip ru a from W.W.W.W/NM lookup tun pref 21
ip ru a from W.W.W.W/NM lookup vpn pref 21
ip ru a from W.W.W.W/NM lookup lan pref 21

ip ru a from 10.1.9.0/27 lookup lan pref 51

ip ru a fwmark 7 lookup smtp

route add -net W.W.W.W netmask M.A.S.K tun0


firewall rules:

*nat
:PREROUTING ACCEPT [48:2979]
:POSTROUTING ACCEPT [44:3015]
:OUTPUT ACCEPT [44:3015]
-A PREROUTING -s 10.1.9.0/255.255.255.224 -i eth1 -p
tcp -m tcp --dport 80 -j DNAT --to-destination
10.1.9.1:3128
-A POSTROUTING -s 10.1.9.0/255.255.255.224 -o ppp0 -j
SNAT --to-source Y.Y.Y.Y
COMMIT

*mangle
:PREROUTING ACCEPT [2942:265470]
:INPUT ACCEPT [2604:239332]
:FORWARD ACCEPT [338:26138]
:OUTPUT ACCEPT [2891:533173]
:POSTROUTING ACCEPT [3234:559411]
-A PREROUTING -p tcp -m tcp --dport 25 -j TOS
--set-tos 0x02
-A PREROUTING -p tcp -m tcp --dport 25 -j MARK
--set-mark 0x7
-A PREROUTING -p tcp -m tcp --dport 25 -j RETURN
-A INPUT -i ppp0 -p tcp --tcp-flags ALL FIN,URG,PSH -j
DROP
-A INPUT -i ppp0 -p tcp --tcp-flags ALL ALL -j DROP
-A INPUT -i ppp0 -p tcp --tcp-flags ALL
SYN,RST,ACK,FIN,URG -j DROP
-A INPUT -i ppp0 -p tcp --tcp-flags ALL NONE -j DROP
-A INPUT -i ppp0 -p tcp --tcp-flags SYN,RST SYN,RST -j
DROP
-A INPUT -i ppp0 -p tcp --tcp-flags SYN,FIN SYN,FIN -j
DROP
-A OUTPUT -p tcp -m tcp --dport 25 -j TOS --set-tos
Minimize-Cost
-A OUTPUT -p tcp -m tcp --dport 25 -j MARK --set-mark
0x7
COMMIT
*filter
:INPUT DROP [5:140]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [2891:533173]
-A INPUT -m state --state RELATED,ESTABLISHED -j
ACCEPT 
-A INPUT -m limit --limit 30/min -j LOG --log-prefix
"INPUT: " --log-level 7 
-A INPUT -m limit --limit 30/min -j LOG --log-prefix
"Default DROP - INPUT chain:" --log-level 5 
-A INPUT -d 192.168.0.0/255.255.0.0 -m limit --limit
30/min -j LOG --log-prefix "PPPoE DROP:" --log-level 5
-A INPUT -d 10.1.9.0/255.255.255.224 -m limit --limit
30/min -j LOG --log-prefix "LAN DROP - INPUT chain:"
--log-level 5 
-A INPUT -d W.W.W.W/M.A.S.K -m limit --limit 30/min -j
LOG --log-prefix "VPN DROP - INPUT chain:" --log-level
5 
-A INPUT -s 127.0.0.0/255.0.0.0 -d 127.0.0.0/255.0.0.0
-i lo -p icmp -j ACCEPT 
-A INPUT -s 127.0.0.0/255.0.0.0 -d 127.0.0.0/255.0.0.0
-i lo -p tcp -m tcp -j ACCEPT
-A INPUT -s 127.0.0.0/255.0.0.0 -d 127.0.0.0/255.0.0.0
-i lo -p udp -m udp -j ACCEPT
-A INPUT -s 127.0.0.1/255.0.0.0 -d 127.0.0.1/255.0.0.0
-i lo -p tcp -m tcp -j ACCEPT
-A INPUT -s 127.0.0.1/255.0.0.0 -d 127.0.0.1/255.0.0.0
-i lo -p udp -m udp -j ACCEPT
-A INPUT -s 10.1.9.0/255.255.255.224 -i lo -j ACCEPT 
-A FORWARD -m state --state RELATED,ESTABLISHED -j
ACCEPT
-A FORWARD -m limit --limit 3/min --limit-burst 3 -j
LOG --log-prefix "IPT FORWARD packet died: "
--log-level 7
-A FORWARD -p tcp -m tcp --tcp-flags SYN,RST SYN -j
TCPMSS --clamp-mss-to-pmtu
-A FORWARD -p icmp -m limit --limit 12/hour
--limit-burst 1 -m icmp --icmp-type 8 -j LOG
--log-prefix "ICMP flood: " --log-level 5
-A FORWARD -p tcp -m tcp --tcp-flags SYN,RST,ACK SYN
-m limit --limit 12/hour --limit-burst 1 -j LOG
--log-prefix "SYN flood (Nmap SYN Scan?): "
--log-level 5
-A FORWARD -s 10.1.9.0/255.255.255.224 -i eth1 -o ppp0
-j ACCEPT
-A FORWARD -s W.W.W.W/M.A.S.K -i eth1 -o tun0 -j
ACCEPT
-A FORWARD -s W.W.W.W/M.A.S.K -i eth1 -o eth1 -j
ACCEPT
-A FORWARD -p 11 -j DROP
-A OUTPUT -p tcp -m tcp --tcp-flags SYN,RST SYN -j
TCPMSS --clamp-mss-to-pmtu
COMMIT



		
__________________________________ 
Do you Yahoo!? 
Yahoo! Small Business - Try our new resources site!
http://smallbusiness.yahoo.com/resources/ 

