From: =?iso-8859-1?q?Luis=20GUSTAVO?= <lgpcf@yahoo.com.br>
Subject: my script
Date: Fri, 16 Apr 2004 14:04:56 -0300 (ART)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040416170456.5600.qmail@web40511.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-824789750-1082135096=:4704"
Content-Transfer-Encoding: 8bit
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

--0-824789750-1082135096=:4704
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

what are you think, this my script
 
 
#Rc.firewall - By Luis GUSTAVO

iptables --flush                                                
iptables --table nat --flush
iptables --delete-chain                                         
iptables --table nat --delete-chain
iptables -F
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i lo -p all -j ACCEPT
iptables -A OUTPUT -o lo -p all -j ACCEPT
# Liberando WEB e E-mail
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 25 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 110 -j ACCEPT
# Liberando WEB e E-mail Interno
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 25 -j ACCEPT
iptables -A INPUT -p tcp --dport 110 -j ACCEPT

#Compartilhando a Internet
#iptables -t nat -A POSTROUTING -o eth0 -s 192.168.1.0/24 -d 0/0 -j MASQUERADE
iptables --table nat --append POSTROUTING --out-interface ppp0 -j MASQUERADE
iptables --append FORWARD --in-interface eth0 -j ACCEPT         
echo 1 > /proc/sys/net/ipv4/ip_forward                          
# Proxy transparente
#iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 3128
# Bloqueando ping
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP 
# Block all ports
#iptables -A FORWARD -s 192.168.1.0/24 -p tcp --dport 1024:65535
#iptables -A FORWARD -s 192.168.1.0/24 -p udp --dport 1024:65535
#iptables -A INPUT -s 192.168.1.0/24 -p udp --dport 1024:65535
#iptables -A INPUT -s 192.168.1.0/24 -p tcp --dport 1024:65535
#:.Bloqueando AIM: 
#iptables -A FORWARD -d login.oscar.aol.com -j REJECT 
#:.Bloqueando ICQ: 
#iptables -A FORWARD -s 192.168.1.0/24 -p tcp --dport 5190 -j DROP
#iptables -A FORWARD -s 192.168.1.0/24 -d login.icq.com -j DROP
#iptables -A FORWARD -s 192.168.1.0/24 -d go.icq.com -j DROP
#:.Bloqueando MSN: 
iptables -A OUTPUT -s 192.168.1.0/24 -p TCP --dport 1863 -j ACCEPT
#iptables -A FORWARD -s 192.168.1.0/24 -d messenger.hotmail.com -j DROP 
#iptables -A FORWARD -s 192.168.1.0/24 -d login.passport.com -j DROP 
#iptables -A FORWARD -s 192.168.1.0/24 -d rad.msn.com -j REJECT 
#iptables -A FORWARD -s 192.168.1.0/24 -d baym-cs160.msgr.hotmail.com -j DROP
#iptables -A FORWARD -s 192.168.1.0/24 -d baym-cs157.msgr.hotmail.com -j DROP
#:.Bloqueando Yahoo Messenger: 
#iptables -A FORWARD -s 192.168.1.0/24 -d cs.yahoo.com -j REJECT
#iptables -A FORWARD -s 192.168.1.0/24 -d scsa.yahoo.com -j REJECT 
#:.iMesh: 
#iptables -A FORWARD -s 192.168.1.0/24 -d 216.35.208.0/24 -j REJECT 
#:.BearShare: 
#iptables -A FORWARD -p TCP --dport 6346 -j REJECT 
#:.ToadNode: 
#iptables -A FORWARD -p TCP --dport 6346 -j REJECT 
#:.WinMX: 
#iptables -A FORWARD -d 209.61.186.0/24 -j REJECT
#iptables -A FORWARD -d 64.49.201.0/24 -j REJECT 
#:.Napigator: 
#iptables -A FORWARD -d 209.25.178.0/24 -j REJECT 
#:.Morpheus: 
#iptables -A FORWARD -d 206.142.53.0/24 -j REJECT
#iptables -A FORWARD -p TCP --dport 1214 -j REJECT 
#:.KaZaA: 
iptables -t filter -A INPUT -i ppp0 -p tcp --dport http -m string --string "kazaa" -j DROP
iptables -A FORWARD -d 213.248.112.0/24 -j REJECT
iptables -A FORWARD -p TCP --dport 1214 -j REJECT 
iptables -A FORWARD -m string --string "X-Kazaa-Username:" -j DROP
iptables -A FORWARD -m string --string "X-Kazaa-Network:" -j DROP
iptables -A FORWARD -m string --string "X-Kazaa-IP:" -j DROP
iptables -A FORWARD -m string --string "X-Kazaa-SupernodeIP" -j DROP
iptables -A FORWARD -m string --string "Kazaa" -j DROP
#iptables -A FORWARD -m string --string "msn." -j DROP
iptables -A FORWARD -m string --string ".mp3" -j DROP
#:.Limewire: 
#iptables -A FORWARD -p TCP --dport 6346 -j REJECT 
#:.Audiogalaxy: 
#iptables -A FORWARD -d 64.245.58.0/23 -j REJECT 
#iptables -A FORWARD -m unclean -j DROP 
#iptables -A INPUT -p tcp --syn -j DROP 
# Blocking Blaster
iptables -A INPUT -p tcp -i eth0 -s 0/0 --dport 135 -j DROP
iptables -A INPUT -p udp -i eth0 -s 0/0 --dport 135 -j DROP
iptables -A INPUT -p tcp -i eth0 -s 0/0 --dport 139 -j DROP
iptables -A INPUT -p udp -i eth0 -s 0/0 --dport 139 -j DROP
iptables -A INPUT -p tcp -i eth0 -s 0/0 --dport 445 -j DROP
iptables -A INPUT -p udp -i eth0 -s 0/0 --dport 445 -j DROP
#Windows Media Service | Fm odia
#iptables -A FORWARD -s 192.168.1.0/24 -p tcp -d mediasrv-2.ig.com.br -j DROP
#iptables -A FORWARD -s 192.168.1.0/24 -p tcp -d volstag2.uol.com.br -j DROP
#iptables -A FORWARD -s 192.168.1.0/24 -p tcp -d 200.221.5.17 -j DROP
#Protegendo contra synflood
#iptables -A INPUT -p tcp --syn -m limit --limit 1/s -j DROP
#Protegendo contra Scanner Oculto
#iptables -A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s -j DROP
#Protegendo contra scaner suspeito
#iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j DROP
# TOS
iptables -A OUTPUT -t mangle -p tcp --dport http -j TOS --set-tos Maximize-throughput
iptables -A OUTPUT -t mangle -p tcp --dport 20 -j TOS --set-tos Minimize-delay
iptables -A OUTPUT -t mangle -p tcp --dport 21 -j TOS --set-tos Minimize-delay
 
 

 
 
 
 



Luis GUSTAVO         lgpcf@yahoo.com.br
+55 (21) 9891-3560    http://skafe.sites.uol.com.br
---------------------------------------------------------------------------------
 








---------------------------------
Yahoo! Messenger - Fale com seus amigos online. Instale agora!
--0-824789750-1082135096=:4704
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: 8bit

<DIV>what are you think, this my script</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>#Rc.firewall - By Luis GUSTAVO</DIV>
<DIV><BR>iptables --flush&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <BR>iptables --table nat --flush<BR>iptables --delete-chain&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <BR>iptables --table nat --delete-chain<BR>iptables -F<BR>iptables -P INPUT DROP<BR>iptables -P OUTPUT DROP<BR>iptables -P FORWARD DROP</DIV>
<DIV><BR>iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT<BR>iptables -A INPUT -i lo -p all -j ACCEPT<BR>iptables -A OUTPUT -o lo -p all -j ACCEPT</DIV>
<DIV># Liberando WEB e E-mail<BR>iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT<BR>iptables -A OUTPUT -p tcp --dport 25 -j ACCEPT<BR>iptables -A OUTPUT -p tcp --dport 110 -j ACCEPT</DIV>
<DIV># Liberando WEB e E-mail Interno<BR>iptables -A INPUT -p tcp --dport 80 -j ACCEPT<BR>iptables -A INPUT -p tcp --dport 25 -j ACCEPT<BR>iptables -A INPUT -p tcp --dport 110 -j ACCEPT</DIV>
<DIV><BR>#Compartilhando a Internet<BR>#iptables -t nat -A POSTROUTING -o eth0 -s 192.168.1.0/24 -d 0/0 -j MASQUERADE</DIV>
<DIV>iptables --table nat --append POSTROUTING --out-interface ppp0 -j MASQUERADE<BR>iptables --append FORWARD --in-interface eth0 -j ACCEPT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <BR>echo 1 &gt; /proc/sys/net/ipv4/ip_forward&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </DIV>
<DIV># Proxy transparente<BR>#iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 3128</DIV>
<DIV># Bloqueando ping<BR>iptables -A INPUT -p icmp --icmp-type echo-request -j DROP </DIV>
<DIV># Block all ports<BR>#iptables -A FORWARD -s 192.168.1.0/24 -p tcp --dport 1024:65535<BR>#iptables -A FORWARD -s 192.168.1.0/24 -p udp --dport 1024:65535<BR>#iptables -A INPUT -s 192.168.1.0/24 -p udp --dport 1024:65535<BR>#iptables -A INPUT -s 192.168.1.0/24 -p tcp --dport 1024:65535</DIV>
<DIV>#:.Bloqueando AIM: <BR>#iptables -A FORWARD -d login.oscar.aol.com -j REJECT </DIV>
<DIV>#:.Bloqueando ICQ: <BR>#iptables -A FORWARD -s 192.168.1.0/24 -p tcp --dport 5190 -j DROP<BR>#iptables -A FORWARD -s 192.168.1.0/24 -d login.icq.com -j DROP<BR>#iptables -A FORWARD -s 192.168.1.0/24 -d go.icq.com -j DROP</DIV>
<DIV>#:.Bloqueando MSN: <BR>iptables -A OUTPUT -s 192.168.1.0/24 -p TCP --dport 1863 -j ACCEPT<BR>#iptables -A FORWARD -s 192.168.1.0/24 -d messenger.hotmail.com -j DROP <BR>#iptables -A FORWARD -s 192.168.1.0/24 -d login.passport.com -j DROP <BR>#iptables -A FORWARD -s 192.168.1.0/24 -d rad.msn.com -j REJECT <BR>#iptables -A FORWARD -s 192.168.1.0/24 -d baym-cs160.msgr.hotmail.com -j DROP<BR>#iptables -A FORWARD -s 192.168.1.0/24 -d baym-cs157.msgr.hotmail.com -j DROP</DIV>
<DIV>#:.Bloqueando Yahoo Messenger: <BR>#iptables -A FORWARD -s 192.168.1.0/24 -d cs.yahoo.com -j REJECT<BR>#iptables -A FORWARD -s 192.168.1.0/24 -d scsa.yahoo.com -j REJECT </DIV>
<DIV>#:.iMesh: <BR>#iptables -A FORWARD -s 192.168.1.0/24 -d 216.35.208.0/24 -j REJECT </DIV>
<DIV>#:.BearShare: <BR>#iptables -A FORWARD -p TCP --dport 6346 -j REJECT </DIV>
<DIV>#:.ToadNode: <BR>#iptables -A FORWARD -p TCP --dport 6346 -j REJECT </DIV>
<DIV>#:.WinMX: <BR>#iptables -A FORWARD -d 209.61.186.0/24 -j REJECT<BR>#iptables -A FORWARD -d 64.49.201.0/24 -j REJECT </DIV>
<DIV>#:.Napigator: <BR>#iptables -A FORWARD -d 209.25.178.0/24 -j REJECT </DIV>
<DIV>#:.Morpheus: <BR>#iptables -A FORWARD -d 206.142.53.0/24 -j REJECT<BR>#iptables -A FORWARD -p TCP --dport 1214 -j REJECT </DIV>
<DIV>#:.KaZaA: <BR>iptables -t filter -A INPUT -i ppp0 -p tcp --dport http -m string --string "kazaa" -j DROP<BR>iptables -A FORWARD -d 213.248.112.0/24 -j REJECT<BR>iptables -A FORWARD -p TCP --dport 1214 -j REJECT <BR>iptables -A FORWARD -m string --string "X-Kazaa-Username:" -j DROP<BR>iptables -A FORWARD -m string --string "X-Kazaa-Network:" -j DROP<BR>iptables -A FORWARD -m string --string "X-Kazaa-IP:" -j DROP<BR>iptables -A FORWARD -m string --string "X-Kazaa-SupernodeIP" -j DROP<BR>iptables -A FORWARD -m string --string "Kazaa" -j DROP<BR>#iptables -A FORWARD -m string --string "msn." -j DROP<BR>iptables -A FORWARD -m string --string ".mp3" -j DROP</DIV>
<DIV>#:.Limewire: <BR>#iptables -A FORWARD -p TCP --dport 6346 -j REJECT </DIV>
<DIV>#:.Audiogalaxy: <BR>#iptables -A FORWARD -d 64.245.58.0/23 -j REJECT <BR>#iptables -A FORWARD -m unclean -j DROP <BR>#iptables -A INPUT -p tcp --syn -j DROP </DIV>
<DIV># Blocking Blaster<BR>iptables -A INPUT -p tcp -i eth0 -s 0/0 --dport 135 -j DROP<BR>iptables -A INPUT -p udp -i eth0 -s 0/0 --dport 135 -j DROP<BR>iptables -A INPUT -p tcp -i eth0 -s 0/0 --dport 139 -j DROP<BR>iptables -A INPUT -p udp -i eth0 -s 0/0 --dport 139 -j DROP<BR>iptables -A INPUT -p tcp -i eth0 -s 0/0 --dport 445 -j DROP<BR>iptables -A INPUT -p udp -i eth0 -s 0/0 --dport 445 -j DROP</DIV>
<DIV>#Windows Media Service | Fm odia<BR>#iptables -A FORWARD -s 192.168.1.0/24 -p tcp -d mediasrv-2.ig.com.br -j DROP<BR>#iptables -A FORWARD -s 192.168.1.0/24 -p tcp -d volstag2.uol.com.br -j DROP<BR>#iptables -A FORWARD -s 192.168.1.0/24 -p tcp -d 200.221.5.17 -j DROP</DIV>
<DIV>#Protegendo contra synflood<BR>#iptables -A INPUT -p tcp --syn -m limit --limit 1/s -j DROP</DIV>
<DIV>#Protegendo contra Scanner Oculto<BR>#iptables -A INPUT -p tcp --tcp-flags SYN,ACK,FIN,RST RST -m limit --limit 1/s -j DROP</DIV>
<DIV>#Protegendo contra scaner suspeito<BR>#iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 1/s -j DROP</DIV>
<DIV># TOS<BR>iptables -A OUTPUT -t mangle -p tcp --dport http -j TOS --set-tos Maximize-throughput<BR>iptables -A OUTPUT -t mangle -p tcp --dport 20 -j TOS --set-tos Minimize-delay<BR>iptables -A OUTPUT -t mangle -p tcp --dport 21 -j TOS --set-tos Minimize-delay</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV><BR><BR><DIV>
<DIV>
<DIV>
<DIV>
<DIV>
<P><STRONG>Luis GUSTAVO</STRONG>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <A href="http://br.f405.mail.yahoo.com/ym/Compose?To=lgpcf@yahoo.com.br" target=_blank>lgpcf@yahoo.com.br</A><BR>+55 (21) 9891-3560&nbsp;&nbsp;&nbsp; <A href="http://skafe.sites.uol.com.br/" target=_blank><FONT color=#0000ff>http://skafe.sites.uol.com.br</FONT></A><BR>---------------------------------------------------------------------------------<BR>&nbsp;</P></DIV></DIV></DIV></DIV></DIV><p><br><hr size=1><a href="http://br.rd.yahoo.com//mail_br/tagline/?http://br.download.yahoo.com/messenger/"><b>Yahoo! Messenger</b></a> - Fale com seus amigos online. <a href="http://br.rd.yahoo.com//mail_br/tagline/?http://br.download.yahoo.com/messenger/">Instale agora!
--0-824789750-1082135096=:4704--

