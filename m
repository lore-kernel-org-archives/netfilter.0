From: kannel sms <kannel_sms@yahoo.com>
Subject: DHCP /MAC
Date: Sat, 8 Nov 2003 02:42:00 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031108104200.61132.qmail@web60205.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-2062485438-1068288120=:60091"
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

--0-2062485438-1068288120=:60091
Content-Type: text/plain; charset=us-ascii

Dear Friends , 
 
i think u all can help me .
I have DHCP server . That is allow for dialup/Cable modem users . So that users use that certain modems . That all modems have MAC adderesses . Those modems providing by us . 
So those valid modems has known MAC addresses . If unknow modem connected to the modem that will be restyrict by the firewall .
 
Actually i want  to block unknown MACs and allow the other all known MACs .
 
I have did some configurations in iptables but it doesn't work . Currently i'm testing this concept in a LAN with 5 PCs . 
 

######################################################################################################################iptables -P INPUT DROPiptables -P FORWARD DROPiptables -P OUTPUT DROP#######################################################################################################################iptables -A INPUT -i lo -m state --state NEW -j ACCEPTiptables -A OUTPUT -o lo -m state --state NEW -j ACCEPTiptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPTiptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPTiptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPTiptables -A OUTPUT -m state --state NEW -j ACCEPT######################################################################################################################iptables -A INPUT -p udp -s 192.168.30.0/24 --dport 67 -i ! eth0 -m state --state NEW -m mac --mac-source 00:50:BA:50:36:25 -j ACCEPTiptables -A INPUT -p tcp -s 192.168.30.0/24 --dport 67 -i ! eth0 -m state --stat
 e NEW -m
 mac --mac-source 00:50:BA:50:36:25 -j ACCEPTiptables -A INPUT -p udp -s 192.168.30.0/24 --dport 68 -i ! eth0 -m state --state NEW -m mac --mac-source 00:50:BA:50:36:25 -j ACCEPTiptables -A INPUT -p tcp -s 192.168.30.0/24 --dport 68 -i ! eth0 -m state --state NEW -m mac --mac-source 00:50:BA:50:36:25 -j ACCEPT#####################################################################################################################pls help me .............where can be the problem 

 

 

thanx

 
 


---------------------------------
Do you Yahoo!?
Protect your identity with Yahoo! Mail AddressGuard
--0-2062485438-1068288120=:60091
Content-Type: text/html; charset=us-ascii

<DIV>Dear Friends , </DIV>
<DIV>&nbsp;</DIV>
<DIV>i think u all can help me .</DIV>
<DIV>I have DHCP server . That is allow for dialup/Cable modem users . So that users use that certain modems . That all modems have MAC adderesses . Those modems providing by us . </DIV>
<DIV>So those valid modems has known MAC addresses . If unknow modem connected to the modem that will be restyrict by the firewall .</DIV>
<DIV>&nbsp;</DIV>
<DIV>Actually i want&nbsp; to block unknown MACs and allow the other all known MACs .</DIV>
<DIV>&nbsp;</DIV>
<DIV>I have did some configurations in iptables but it doesn't work . Currently i'm testing this concept in a LAN with 5 PCs . </DIV>
<DIV>&nbsp;</DIV>
<DIV><PRE>######################################################################################################################
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP
#######################################################################################################################

iptables -A INPUT -i lo -m state --state NEW -j ACCEPT
iptables -A OUTPUT -o lo -m state --state NEW -j ACCEPT

iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -m state --state NEW -j ACCEPT

######################################################################################################################
iptables -A INPUT -p udp -s 192.168.30.0/24 --dport 67 -i ! eth0 -m state --state NEW -m mac --mac-source 00:50:BA:50:36:25 -j ACCEPT
iptables -A INPUT -p tcp -s 192.168.30.0/24 --dport 67 -i ! eth0 -m state --state NEW -m mac --mac-source 00:50:BA:50:36:25 -j ACCEPT

iptables -A INPUT -p udp -s 192.168.30.0/24 --dport 68 -i ! eth0 -m state --state NEW -m mac --mac-source 00:50:BA:50:36:25 -j ACCEPT
iptables -A INPUT -p tcp -s 192.168.30.0/24 --dport 68 -i ! eth0 -m state --state NEW -m mac --mac-source 00:50:BA:50:36:25 -j ACCEPT
#####################################################################################################################

pls help me .............where can be the problem </PRE><PRE>&nbsp;</PRE><PRE>&nbsp;</PRE><PRE>thanx</PRE></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://antispam.yahoo.com/whatsnewfree">Protect your identity with Yahoo! Mail AddressGuard</a>
--0-2062485438-1068288120=:60091--

