From: ads nat <adsnat@yahoo.com>
Subject: Is it iptables problem?
Date: Wed, 21 Jul 2004 20:05:03 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040722030503.15900.qmail@web60407.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

Hi,
I have setup Redhat Linux 9.0 server with 3 ethernet
cards.
1) eth0 for Internet access.
2) eth1 (10.0.0.2) without any connection.
3) eth2 (192.168.0.1) where LAN users are connected.

I have setup Apache and sendmail servers on same
machine.
202.63.167.192 is a static ip address of domain
networkshastrihall.com which is registered.


I have stopped iptables and has got only these lines
in file "/etc/rc.d/rc.local"
#####
touch /var/lock/subsys/local
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -i eth2 -j ACCEPT

ptables -t nat -A PREROUTING -d 202.63.167.192 -i eth0
-p tcp -m tcp --dport 995 -j DNAT --to-destination
10.0.0.2:995
iptables -t nat -A PREROUTING -d 202.63.167.192 -i
eth0 -p udp -m udp --dport 995 -j DNAT
--to-destination 10.0.0.2:995
iptables -t nat -A PREROUTING -d 202.63.167.192 -i
eth0 -p tcp -m tcp --dport 80 -j DNAT --to-destination
10.0.0.2:80
iptables -t nat -A PREROUTING -d 202.63.167.192 -i
eth0 -p udp -m udp --dport 80 -j DNAT --to-destination
10.0.0.2:80
iptables -t nat -A PREROUTING -d 202.63.167.192 -i
eth0 -p tcp -m tcp --dport 53 -j DNAT --to-destination
10.0.0.2:53
iptables -t nat -A PREROUTING -d 202.63.167.192 -i
eth0 -p udp -m udp --dport 53 -j DNAT --to-destination
10.0.0.2:53
iptables -t nat -A PREROUTING -d 202.63.167.192 -i
eth0 -p tcp -m tcp --dport 25 -j DNAT --to-destination
10.0.0.2:25
iptables -t nat -A PREROUTING -d 202.63.167.192 -i
eth0 -p udp -m udp --dport 25 -j DNAT --to-destination
10.0.0.2:25
iptables -t nat -A PREROUTING -d 202.63.167.192 -i
eth0 -p tcp -m tcp --dport 110 -j DNAT
--to-destination 10.0.0.2:110
iptables -t nat -A PREROUTING -d 202.63.167.192 -i
eth0 -p udp -m udp --dport 110 -j DNAT
--to-destination 10.0.0.2:110

iptables -t nat -A PREROUTING -s
192.168.0.0/255.255.255.0 -d 202.63.167.192 -i eth2 -p
tcp -m tcp --dport 80 -j DNAT --to-destination
10.0.0.2:80
iptables -t nat -A PREROUTING -s
192.168.0.0/255.255.255.0 -d 202.63.167.192 -i eth2 -p
udp -m udp --dport 80 -j DNAT --to-destination
10.0.0.2:80

iptables -t nat -A PREROUTING -s
192.168.0.0/255.255.255.0 -d 202.63.167.192 -i eth2 -p
tcp -m tcp --dport 53 -j DNAT --to-destination
10.0.0.2:53
iptables -t nat -A PREROUTING -s
192.168.0.0/255.255.255.0 -d 202.63.167.192 -i eth2 -p
udp -m udp --dport 53 -j DNAT --to-destination
10.0.0.2:53
iptables -t nat -A PREROUTING -s
192.168.0.0/255.255.255.0 -d 202.63.167.192 -i eth2 -p
tcp -m tcp --dport 110 -j DNAT --to-destination
10.0.0.2:110
iptables -t nat -A PREROUTING -s
192.168.0.0/255.255.255.0 -d 202.63.167.192 -i eth2 -p
udp -m udp --dport 110 -j DNAT --to-destination
10.0.0.2:110
iptables -t nat -A PREROUTING -s
192.168.0.0/255.255.255.0 -d 202.63.167.192 -i eth2 -p
tcp -m tcp --dport 995 -j DNAT --to-destination
10.0.0.2:995
iptables -t nat -A PREROUTING -s
192.168.0.0/255.255.255.0 -d 202.63.167.192 -i eth2 -p
udp -m udp --dport 995 -j DNAT --to-destination
10.0.0.2:995
iptables -t nat -A PREROUTING -s
192.168.0.0/255.255.255.0 -d 202.63.167.192 -i eth2 -p
tcp -m tcp --dport 25 -j DNAT --to-destination
10.0.0.2:25
iptables -t nat -A PREROUTING -s
192.168.0.0/255.255.255.0 -d 202.63.167.192 -i eth2 -p
udp -m udp --dport 25 -j DNAT --to-destination
10.0.0.2:25
###################


default policy of INPUT, OUTPUT and FORWARD is drop.

I want to protect LAN hence routing web and mail
request to eth1(10.0.0.2).

Web server is serving properly for LAN as well as
Outside(Internet) users.

For mail server access from LAN, I am using Outlook
Express from client machine. setting of senamil and
outlook are O.K. since I am using same settings on my
othet DMZ firewall network where it works perfectly
allright. 


PROBLEM :

When I try to connect from client outlook. I get
follwoing message while receiving and sending mails at
outlook express error box.

############

The connection to the server has failed. Account:
'A.D.Shintre', Server: 'mail.networkshastrihall.com',
Protocol: SMTP, Port: 25, Secure(SSL): Yes, Socket
Error: 10061, Error Number: 0x800CCC0E


The connection to the server has failed. Account:
'A.D.Shintre', Server: 'mail.networkshastrihall.com',
Protocol: POP3, Port: 995, Secure(SSL): Yes, Socket
Error: 10061, Error Number: 0x800CCC0E

###################

Is it iptables problem? should not be since no drop
policy is adopted.
What is this error "Socket Error:" any idea?
Help appreciated.




	
		
__________________________________
Do you Yahoo!?
Vote for the stars of Yahoo!'s next ad campaign!
http://advision.webevents.yahoo.com/yahoo/votelifeengine/

