From: Tasha Smith <tashamaillist@yahoo.com>
Subject: Need Some Help Fine Tunning Rule....
Date: Mon, 17 Feb 2003 02:29:59 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030217102959.25447.qmail@web13303.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1519726646-1045477799=:18299"
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

--0-1519726646-1045477799=:18299
Content-Type: text/plain; charset=us-ascii


Hiiiii,

I have a LAN that has 3 windows 2000 computers and 1 Redhat7.3 (2.4.20) running 

iptables 1.2.7a(Firewall/Router). I need some help fine tunning my rules right now 

the windows  machines on my LAN behind Firewall can access the net wihtout any 

restrictions. I mean as soon as i add a program like MSN Messenger i dont have to

add RULES to my Firewall Machine it just lets it pass right on through.Soo this 

means soo can TROJANS if they get opened on the firewall like for instance

younger brother downloading files using KAZAA ;).  How do i change my 

rules around soo i have to create a rule in my IPTABLES script for each program.I 

am little confused on the FORWARDING rules using iptables. "Could Some one 

please give me a few  examples rules and somehting i should change and add for 

somehting like WEBPAGE access and MSN MESSENGER soo get an idea how to 

do it". Here what most of my rules look like right now! 

##################

# This will also update my ipaddress.
IP_INET=`/sbin/ifconfig eth0 | grep inet | cut -d: -f2 | cut -d\  -f1`


# Remove any existing rules from all chains.
iptables --flush
iptables -t nat --flush
iptables -t mangle --flush

# Unlimited access on the loopback interface.
iptables -A INPUT  -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT
      
# Set the default policy to drop.
iptables --policy INPUT DROP
iptables --policy FORWARD DROP
iptables --policy OUTPUT ACCEPT

iptables -t nat --policy PREROUTING ACCEPT
iptables -t nat --policy OUTPUT ACCEPT
iptables -t nat --policy POSTROUTING ACCEPT

iptables -t mangle --policy PREROUTING ACCEPT
iptables -t mangle --policy OUTPUT ACCEPT


 

# Allow stateful connections 
iptables -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

 

# Allow Access for DNS UDP for my ISP DNS server.
if [ "$CONNECTION_TRACKING" = "1" ]; then
   iptables -A OUTPUT -o eth0 -p udp \
            -s $IP_INET --sport 1024:65535 \
            -d 209.53.4.130 --dport 53 \
            -m state --state NEW -j ACCEPT
fi

iptables -A OUTPUT -o eth0 -p udp \
         -s $IP_INET     --sport 1024:65535 \
         -d 209.53.4.130 --dport 53 -j ACCEPT


if [ "$CONNECTION_TRACKING" = "1" ]; then
    iptables -A OUTPUT -o eth0 -p udp \
             -s $IP_INET --sport 1024:65535 \
             -d 209.53.4.150 --dport 53 \
             -m state --state NEW -j ACCEPT
fi

iptables -A OUTPUT -o eth0 -p udp \
         -s $IP_INET --sport 1024:65535 \
         -d 209.53.4.150 --dport 53 -j ACCEPT
       
# Allow access for my ISP DHCP server.
if [ "$CONNECTION_TRACKING" = "1" ]; then
    iptables -A OUTPUT -o eth0 -p udp \
             -s $IP_NET --sport 1024:65535 \
             -d 209.53.4.129 --dport 67 \
             -m state --state NEW -j ACCEPT
fi

iptables -A OUTPUT -o eth0 -p udp \
         -s $IP_INET      --sport 1024:65535 \
         -d 209.53.4.129  --dport 67 -j ACCEPT


# Allow access to remote webservers PORT 80.
if [ "$CONNECTION_TRACKING" = "1" ]; then
    iptables -A OUTPUT -o eth0 -p tcp \
             -s $IP_INET --sport 1024:65535 \
             --dport 80 -m state --state NEW -j ACCEPT
fi

iptables -A OUTPUT -o eth0 -p tcp \
         -s $IP_INET --sport 1024:65535 \
         --dport 80 -j ACCEPT


# Attempt to connect to HHTPS connections.
if [ "$CONNECTION_TRACKING" = "1" ]; then
     iptables -A OUTPUT -o eth0 -p tcp \
              -m state --state NEW --dport 443 \
              --sport 1024:65535 \
              -j ACCEPT
fi

iptables -A OUTPUT -o eth0 -p tcp \
         -s $IP_INET --sport 1024:65535 \
         --dport 443 -j ACCEPT
 

# Fragmented ICMP Messages.
iptables -A INPUT -i eth0 --fragment -p icmp -j LOG \
         --log-prefix "Fragmented ICMP: "
iptables -A INPUT -i eth0 --fragment -p icmp -j DROP \

# Source Quench Control
iptables -A INPUT -i eth0 -p icmp \
         --icmp-type source-quench -d $IP_INET -j ACCEPT
iptables -A OUTPUT -o eth0 -p icmp \
         -s $IP_INET --icmp-type source-quench -j ACCEPT

# Parameter Problem Status.
iptables -A INPUT -i eth0 -p icmp \
         --icmp-type parameter-problem -d $IP_INET -j ACCEPT
iptables -A OUTPUT -o eth0 -p icmp \
         -s $IP_INET --icmp-type parameter-problem -j ACCEPT

# Destination Unreachable Error.
iptables -A INPUT -i eth0 -p icmp \
         --icmp-type destination-unreachable -d $IP_INET -j ACCEPT
iptables -A OUTPUT -o eth0 -p icmp \
         -s $IP_INET --icmp-type fragmentation-needed -j ACCEPT
iptables -A OUTPUT -o eth0 -p icmp \
         -s $IP_INET --icmp-type destination-unreachable -j DROP

# Time Exceeded Status
iptables -A INPUT -i eth0 -p icmp \
         --icmp-type time-exceeded -d $IP_INET -j ACCEPT

# Allow Outgoing pings to remote hosts
if [ "$CONNECTION_TRACKING" = "1" ]; then
     iptables -A OUTPUT -o eth0 -p icmp \
              -s $IP_INET --icmp-type echo-request \
              -m state --state NEW -j ACCEPT
fi

iptables -A OUTPUT -o eth0 -p icmp \
         -s $IP_INET --icmp-type echo-request -j ACCEPT

# Incoming ping from Remote Hosts.
if [ "$CONNECTION_TRACKING" = "1" ]; then
     iptables -A INPUT -i eth0 -p icmp \
              -s 209.53.1.231 --icmp-type echo-request -d $IP_INET \
              -m state --state NEW -j ACCEPT
fi

iptables -A INPUT -i eth0 -p icmp \
         -s 209.53.1.231 --icmp-type echo-request -d $IP_INET -j ACCEPT
iptables -A OUTPUT -o eth0 -p icmp \
         -s $IP_INET --icmp-type echo-reply -d 209.53.1.231 -j ACCEPT

# Fowarding is allowed in the direction
iptables -A FORWARD -i eth1 -o eth0 -s 192.168.0.0/24 -j ACCEPT 

# Enables Packet Forwarding
iptables -t nat -A POSTROUTING -o eth0  -j MASQUERADE

echo 1 > /proc/sys/net/ipv4/ip_forward 


 

Thank You...




---------------------------------
Do you Yahoo!?
Yahoo! Shopping - Send Flowers for Valentine's Day
--0-1519726646-1045477799=:18299
Content-Type: text/html; charset=us-ascii

<P>Hiiiii,</P>
<P>I have a LAN that has 3 windows 2000 computers and 1 Redhat7.3 (2.4.20) running </P>
<P>iptables 1.2.7a(Firewall/Router). I need some help fine tunning my rules right now </P>
<P>the windows &nbsp;machines on my LAN behind Firewall can access the net wihtout any </P>
<P>restrictions. I mean as soon as i add a program like MSN Messenger i dont have to</P>
<P>add RULES to my Firewall Machine it just lets it pass right on through.Soo this </P>
<P>means soo can TROJANS if they get opened on the firewall like for instance</P>
<P>younger brother downloading files using KAZAA ;).&nbsp; How do i change my </P>
<P>rules around soo i have to create a rule in my IPTABLES script for each program.I </P>
<P>am&nbsp;little confused on the FORWARDING rules using iptables. "Could&nbsp;Some one </P>
<P>please give me&nbsp;a few &nbsp;examples rules&nbsp;and somehting i should change and add for </P>
<P>somehting like WEBPAGE access and MSN MESSENGER soo get an idea how to </P>
<P>do it". Here what&nbsp;most of my&nbsp;rules look like right now!&nbsp;</P>
<P>##################</P>
<P class=MsoPlainText style="MARGIN: 0in 0in 0pt"><SPAN style="mso-fareast-font-family: 'MS Mincho'"><FONT face="Courier New"># This will also update my ipaddress.<BR>IP_INET=`/sbin/ifconfig eth0 | grep inet | cut -d: -f2 | cut -d\<SPAN style="mso-spacerun: yes">&nbsp; </SPAN>-f1`</FONT><BR></SPAN></P><SPAN style="mso-fareast-font-family: 'MS Mincho'">
<P class=MsoPlainText style="MARGIN: 0in 0in 0pt"><SPAN style="mso-fareast-font-family: 'MS Mincho'"><FONT face="Courier New"># Remove any existing rules from all chains.<BR>iptables --flush<BR>iptables -t nat --flush<BR>iptables -t mangle --flush<BR><BR># Unlimited access on the loopback interface.<BR>iptables -A INPUT<SPAN style="mso-spacerun: yes">&nbsp; </SPAN>-i lo -j ACCEPT<BR>iptables -A OUTPUT -o lo -j ACCEPT<BR><SPAN style="mso-tab-count: 1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN><BR># Set the default policy to drop.<BR>iptables --policy INPUT DROP<BR>iptables --policy FORWARD DROP<BR>iptables --policy OUTPUT ACCEPT</FONT></SPAN></P><SPAN style="mso-fareast-font-family: 'MS Mincho'"><FONT face="Courier New">
<P class=MsoPlainText style="MARGIN: 0in 0in 0pt"><SPAN style="mso-fareast-font-family: 'MS Mincho'">iptables -t nat --policy PREROUTING ACCEPT<BR>iptables -t nat --policy OUTPUT ACCEPT<BR>iptables -t nat --policy POSTROUTING ACCEPT<BR><BR>iptables -t mangle --policy PREROUTING ACCEPT<BR>iptables -t mangle --policy OUTPUT ACCEPT<BR></SPAN></P></FONT></SPAN><SPAN style="mso-fareast-font-family: 'MS Mincho'"><FONT face="Courier New">
<P class=MsoPlainText style="MARGIN: 0in 0in 0pt"><SPAN style="mso-fareast-font-family: 'MS Mincho'"></SPAN>&nbsp;</P>
<P class=MsoPlainText style="MARGIN: 0in 0in 0pt"><SPAN style="mso-fareast-font-family: 'MS Mincho'"># Allow stateful connections <BR>iptables -A INPUT<SPAN style="mso-spacerun: yes">&nbsp;&nbsp; </SPAN>-m state --state ESTABLISHED,RELATED -j ACCEPT<BR>iptables -A OUTPUT<SPAN style="mso-spacerun: yes">&nbsp; </SPAN>-m state --state ESTABLISHED,RELATED -j ACCEPT<BR></SPAN><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 'Times New Roman'; mso-fareast-font-family: 'MS Mincho'"><FONT size=2>iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT</FONT></SPAN></P>
<P class=MsoPlainText style="MARGIN: 0in 0in 0pt"><SPAN style="FONT-SIZE: 12pt; FONT-FAMILY: 'Times New Roman'; mso-fareast-font-family: 'MS Mincho'"></SPAN>&nbsp;</P></FONT>
<P class=MsoPlainText style="MARGIN: 0in 0in 0pt"><SPAN style="mso-fareast-font-family: 'MS Mincho'"><FONT face="Courier New"># Allow Access for DNS UDP for my ISP DNS server.<BR>if [ "$CONNECTION_TRACKING" = "1" ]; then<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp; </SPAN>iptables -A OUTPUT -o eth0 -p udp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-s $IP_INET --sport 1024:65535 \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-d 209.53.4.130 --dport 53 \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-m state --state NEW -j ACCEPT<BR>fi<BR><BR>iptables -A OUTPUT -o eth0 -p udp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-s $IP_INET<SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>--sport 1024:65535 \<BR><SPAN style="mso-sp
 acerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-d 209.53.4.130 --dport 53 -j ACCEPT<BR><BR><BR>if [ "$CONNECTION_TRACKING" = "1" ]; then<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp; </SPAN>iptables -A OUTPUT -o eth0 -p udp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-s $IP_INET --sport 1024:65535 \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-d 209.53.4.150 --dport 53 \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-m state --state NEW -j ACCEPT<BR>fi<BR><BR>iptables -A OUTPUT -o eth0 -p udp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-s $IP_INET --sport 1024:65535 \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-d 209.53.4.150 --dport 53 -j 
 ACCEPT<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN><BR># Allow access for my ISP DHCP server.<BR>if [ "$CONNECTION_TRACKING" = "1" ]; then<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp; </SPAN>iptables -A OUTPUT -o eth0 -p udp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-s $IP_NET --sport 1024:65535 \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-d 209.53.4.129 --dport 67 \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-m state --state NEW -j ACCEPT<BR>fi<BR><BR>iptables -A OUTPUT -o eth0 -p udp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-s $IP_INET<SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>--sport 1024:65535 \<BR><SPAN style="mso-spacerun: yes">&nb
 sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-d 209.53.4.129<SPAN style="mso-spacerun: yes">&nbsp; </SPAN>--dport 67 -j ACCEPT<BR><BR><BR># Allow access to remote webservers PORT 80.<BR>if [ "$CONNECTION_TRACKING" = "1" ]; then<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp; </SPAN>iptables -A OUTPUT -o eth0 -p tcp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-s $IP_INET --sport 1024:65535 \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>--dport 80 -m state --state NEW -j ACCEPT<BR>fi<BR><BR>iptables -A OUTPUT -o eth0 -p tcp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-s $IP_INET --sport 1024:65535 \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>--dport 80 -j ACCEPT<BR><BR><BR># Attempt to connect to HHTPS connections.<BR>if [ "$C
 ONNECTION_TRACKING" = "1" ]; then<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>iptables -A OUTPUT -o eth0 -p tcp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-m state --state NEW --dport 443 \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>--sport 1024:65535 \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-j ACCEPT<BR>fi<BR><BR>iptables -A OUTPUT -o eth0 -p tcp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-s $IP_INET --sport 1024:65535 \<BR><SPAN style="mso-spacerun: yes">&nbsp;</SPAN><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>--dport 443 -j ACCEPT<BR><SPAN style="mso-spacerun: yes">&nbsp;</SPAN><BR><BR># Fragmented ICMP Messages.<BR>iptables -
 A INPUT -i eth0 --fragment -p icmp -j LOG \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>--log-prefix "Fragmented ICMP: "<BR>iptables -A INPUT -i eth0 --fragment -p icmp -j DROP \<BR><BR># Source Quench Control<BR>iptables -A INPUT -i eth0 -p icmp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>--icmp-type source-quench -d $IP_INET -j ACCEPT<BR>iptables -A OUTPUT -o eth0 -p icmp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-s $IP_INET --icmp-type source-quench -j ACCEPT<BR><BR># Parameter Problem Status.<BR>iptables -A INPUT -i eth0 -p icmp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>--icmp-type parameter-problem -d $IP_INET -j ACCEPT<BR>iptables -A OUTPUT -o eth0 -p icmp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-s $IP_INET --icmp-type pa
 rameter-problem -j ACCEPT<BR><BR># Destination Unreachable Error.<BR>iptables -A INPUT -i eth0 -p icmp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>--icmp-type destination-unreachable -d $IP_INET -j ACCEPT<BR>iptables -A OUTPUT -o eth0 -p icmp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-s $IP_INET --icmp-type fragmentation-needed -j ACCEPT<BR>iptables -A OUTPUT -o eth0 -p icmp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-s $IP_INET --icmp-type destination-unreachable -j DROP<BR><BR># Time Exceeded Status<BR>iptables -A INPUT -i eth0 -p icmp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>--icmp-type time-exceeded -d $IP_INET -j ACCEPT<BR><BR># Allow Outgoing pings to remote hosts<BR>if [ "$CONNECTION_TRACKING" = "1" ]; then<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp; </
 SPAN>iptables -A OUTPUT -o eth0 -p icmp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-s $IP_INET --icmp-type echo-request \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-m state --state NEW -j ACCEPT<BR>fi<BR><BR>iptables -A OUTPUT -o eth0 -p icmp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-s $IP_INET --icmp-type echo-request -j ACCEPT<BR><BR># Incoming ping from Remote Hosts.<BR>if [ "$CONNECTION_TRACKING" = "1" ]; then<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>iptables -A INPUT -i eth0 -p icmp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-s 209.53.1.231 --icmp-type echo-request -d $IP_INET \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb
 sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-m state --state NEW -j ACCEPT<BR>fi<BR><BR>iptables -A INPUT -i eth0 -p icmp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-s 209.53.1.231 --icmp-type echo-request -d $IP_INET -j ACCEPT<BR>iptables -A OUTPUT -o eth0 -p icmp \<BR><SPAN style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </SPAN>-s $IP_INET --icmp-type echo-reply -d 209.53.1.231 -j ACCEPT<BR><BR># Fowarding is allowed in the direction<BR>iptables -A FORWARD -i eth1 -o eth0 -s 192.168.0.0/24 -j ACCEPT <BR><BR># Enables Packet Forwarding<BR>iptables -t nat -A POSTROUTING -o eth0<SPAN style="mso-spacerun: yes">&nbsp; </SPAN>-j MASQUERADE<BR><BR>echo 1 &gt; /proc/sys/net/ipv4/ip_forward </FONT><BR></SPAN></P>
<P class=MsoPlainText style="MARGIN: 0in 0in 0pt">&nbsp;</P>
<P class=MsoPlainText style="MARGIN: 0in 0in 0pt">Thank You...<BR></P></SPAN></SPAN><p><br><hr size=1>Do you Yahoo!?<br>
<a href="http://rd.yahoo.com/O=1/I=brandr/vday03/text/flow/*http://shopping.yahoo.com
/shop?d=browse&id=20146735">Yahoo! Shopping</a> - Send Flowers for Valentine's Day
--0-1519726646-1045477799=:18299--

