From: pejman moghadam <pmoghadam@yahoo.com>
Subject: Yahoo messenger confusion
Date: Fri, 1 Aug 2003 06:56:00 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030801135600.12725.qmail@web14511.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-875713272-1059746160=:11726"
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

--0-875713272-1059746160=:11726
Content-Type: text/plain; charset=us-ascii

hi gurus
I have a linux box in my LAN with :
 
RH 9 , iptables-1.2.6a-2 , kernel 2.4.18.-14 , iproute-2.4.7-5 , squid-2.5.STABLE1
valid IPs : 1.2.3.140 -- 1.2.3.143
invalid IPs : 192.168.0.128 -- 192.168.0.191

ifconfig eth0 192.168.0.135 netmask 255.255.255.192 broadcast 192.168.0.191
ifconfig eth0:0 1.2.3.142 netmask 255.255.255.252 broadcast 1.2.3.143
route add default gw 1.2.3.141
iptables -t nat -A POSTROUTING -s 192.168.0.128/26 -o eth0 -j SNAT --to 1.2.3.142
iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to 3128

this box is my gateway; everything is good : my users can ping the internet, use http and ftp and . . . 
but there is a problem : 
when they want to login with yahoo messenger sometimes they can , and sometimes they can't :(
 
any idea?
 
thanks in advance
Pejman


---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
--0-875713272-1059746160=:11726
Content-Type: text/html; charset=us-ascii

<DIV>hi gurus<BR>I have a linux box in my LAN with :</DIV>
<DIV>&nbsp;</DIV>
<DIV>RH 9 , iptables-1.2.6a-2 , kernel 2.4.18.-14 , iproute-2.4.7-5 , squid-2.5.STABLE1</DIV>
<DIV>valid IPs : 1.2.3.140 -- 1.2.3.143<BR>invalid IPs : 192.168.0.128 -- 192.168.0.191</DIV>
<DIV><BR>ifconfig eth0 192.168.0.135 netmask 255.255.255.192 broadcast 192.168.0.191<BR>ifconfig eth0:0 1.2.3.142 netmask 255.255.255.252 broadcast 1.2.3.143</DIV>
<DIV>route add default gw 1.2.3.141</DIV>
<DIV>iptables -t nat -A POSTROUTING -s 192.168.0.128/26 -o eth0 -j SNAT --to 1.2.3.142<BR>iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to 3128</DIV>
<DIV><BR>this box is my gateway; everything is good : my users can ping the internet, use http and ftp and . . . <BR>but there is a problem : <BR>when they want to login with yahoo messenger sometimes they can , and sometimes they can't :(</DIV>
<DIV>&nbsp;</DIV>
<DIV>any idea?</DIV>
<DIV>&nbsp;</DIV>
<DIV>thanks in advance<BR>Pejman</DIV><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</a> - Free, easy-to-use web site design software
--0-875713272-1059746160=:11726--

