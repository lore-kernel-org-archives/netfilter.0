From: ads nat <adsnat@yahoo.com>
Subject: SMTP HTTP port allow
Date: Sat, 30 Aug 2003 06:11:17 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030830131117.62494.qmail@web20702.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-836099041-1062249077=:61193"
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

--0-836099041-1062249077=:61193
Content-Type: text/plain; charset=us-ascii

I can not reply to email there is some problem therefore separate email.
 
 
I tried to reply you twice, somehow emails are not going out through my LAN machine.
I tried as you adviced but it didn't work.
Please find my rc.local file below. My iptables file is totally commented and restarted.
I am facing following probles.
PROBLEM-1
When I try to send email to squid emailing list I get following error.
****
Hi. This is the qmail-send program at squid-cache.org.
I'm afraid I wasn't able to deliver your message to the following 
addresses.
This is a permanent error; I've given up. Sorry it didn't work out.
<squid-users@squid-cache.org>:
ezmlm-reject: fatal: Sorry, I don't accept messages of MIME 
Content-Type 'multipart/alternative' (#5.2.3)
--- Below this line is a copy of the message.
Return-Path: <adssquid@yahoo.com>
Received: (qmail 65674 invoked from network); 27 Aug 2003 11:00:53 
-0000
Received: from web20502.mail.yahoo.com (216.136.226.137)
  by squid-cache.org with SMTP; 27 Aug 2003 11:00:53 -0000
Message-ID: <20030827110050.81255.qmail@web20502.mail.yahoo.com>
Received: from [203.94.221.44] by web20502.mail.yahoo.com via HTTP; 
Wed, 27 Aug 2003 04:00:50 PDT
Date: Wed, 27 Aug 2003 04:00:50 -0700 (PDT)
From: ads squid <adssquid@yahoo.com>
Subject: RE: [squid-users] delay pool problem
To: Adam Aube <aaube@firstindependent.net>, squid-users@squid-cache.org
In-Reply-To: <000001c36c08$42969990$647fa8c0@firstindependent.net>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
boundary="0-181363567-1061982050=:80891"
--0-181363567-1061982050=:80891
Content-Type: text/plain; charset=us-ascii
*****
Also my LAN users can not send emails through outlook express.
However when email can be send through dialup connection of LAN user. 

PROBLEM -2 
When I try to upload files from LAN user to my outside webserver provider through CuteFTP it gives following message
****
 Login successful
COMMAND:> TYPE I
 200 Type set to I.
COMMAND:> pwd
 257 "/" is current directory.
COMMAND:> TYPE A
 200 Type set to A.
STATUS:> Retrieving directory listing...
COMMAND:> PORT 192,168,0,42,4,62
 500 Illegal PORT command.
STATUS:> Error opening data socket 
*****
I can upload files to my webserver from dialup connection.
My rc.local is as follows :
#!/bs script will be executed *after* all the other init scripts.
# You can put your own initialization stuff in here if you don't
# want to do the full Sys V style init stuff.
#!/bs script will be executed *after* all the other init scripts.
# You can put your own initialization stuff in here if you don't
# want to do the full Sys V style init stuff.
touch /var/lock/subsys/local
route del default gw 202.183.69.129 dev eth0
iptunnel add tunnel0 mode ipip local 202.183.69.130 remote 202.183.73.206 ttl 255
ip link set tunnel0 up
ip addr add 202.63.162.62/30 dev tunnel0
route add default gw 202.63.162.61 dev tunnel0
route add -net 202.183.73.204 netmask 255.255.255.252 gw 202.183.69.129
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
iptables --table nat --append POSTROUTING --out-interface tunnel0 -j MASQUERADE
iptables --append FORWARD --in-interface eth1 -j ACCEPT
#iptables -t nat -A POSTROUTING -p tcp --dport 25 -j MASQUERADE
#iptables -t nat -A POSTROUTING -p tcp -o eth1  -j SNAT --to 207.106.22.35:80
#iptables -t nat -A POSTROUTING -p tcp -s 192.168.0.23 -d 207.106.22.35 --dport 21 -j MASQUERADE
#iptables -t nat -A POSTROUTING -p tcp -s 192.168.0.23 -d 207.106.22.35 --dport 80 -j MASQUERADE
#iptables -t nat -A POSTROUTING -p tcp -s 192.168.0.23 -d 207.106.22.35 --dport 21 -j MASQUERADE
#iptables -t nat -A POSTROUTING -p tcp -s 192.168.0.23 -d 207.106.22.35 --dport 80 -j MASQUERADE
iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128
#iptables -A FORWARD -s 0/0 -d 0/0 -p tcp --dport 4662 -j DROP
#iptables -A FORWARD -s 0/0 -d 0/0 -p tcp --dport 1214 -j DROP
#iptables -A FORWARD -s 0/0 -d 0/0 -p tcp --dport 4672 -j DROP
#
he other init scripts.
#iptables -t nat -A POSTROUTING -p tcp --dport 25 -j MASQUERADE
#iptables -t nat -A POSTROUTING -p tcp -o eth1  -j SNAT --to 207.106.22.35:80
#iptables -t nat -A POSTROUTING -p tcp -s 192.168.0.23 -d 207.106.22.35 --dport 21 -j MASQUERADE
#iptables -t nat -A POSTROUTING -p tcp -s 192.168.0.23 -d 207.106.22.35 --dport 80 -j MASQUERADE
#iptables -t nat -A POSTROUTING -p tcp -s 192.168.0.23 -d 207.106.22.35 --dport 21 -j MASQUERADE
#iptables -t nat -A POSTROUTING -p tcp -s 192.168.0.23 -d 207.106.22.35 --dport 80 -j MASQUERADE
iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128
*****

SMTP HTTP port allow 



---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
--0-836099041-1062249077=:61193
Content-Type: text/html; charset=us-ascii

<DIV>I can not reply to email there is some problem therefore separate email.</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>I tried to reply you twice, somehow emails are not going out through my LAN machine.<BR>I tried as you adviced but it didn't work.</DIV>
<DIV>Please find my rc.local file below. My iptables file is totally commented and restarted.</DIV>
<DIV>I am facing following probles.</DIV>
<DIV>PROBLEM-1</DIV>
<DIV>When I try to send email to squid emailing list I get following error.<BR>****<BR>Hi. This is the qmail-send program at squid-cache.org.<BR>I'm afraid I wasn't able to deliver your message to the following <BR>addresses.<BR>This is a permanent error; I've given up. Sorry it didn't work out.<BR>&lt;<A href="mailto:squid-users@squid-cache.org">squid-users@squid-cache.org</A>&gt;:<BR>ezmlm-reject: fatal: Sorry, I don't accept messages of MIME <BR>Content-Type 'multipart/alternative' (#5.2.3)<BR>--- Below this line is a copy of the message.<BR>Return-Path: &lt;<A href="mailto:adssquid@yahoo.com">adssquid@yahoo.com</A>&gt;<BR>Received: (qmail 65674 invoked from network); 27 Aug 2003 11:00:53 <BR>-0000<BR>Received: from web20502.mail.yahoo.com (216.136.226.137)<BR>&nbsp; by squid-cache.org with SMTP; 27 Aug 2003 11:00:53 -0000<BR>Message-ID: &lt;<A href="mailto:20030827110050.81255.qmail@web20502.mail.yahoo.com">20030827110050.81255.qmail@web20502.mail.yahoo.com</A>&gt;<BR>Rec
 eived:
 from [203.94.221.44] by web20502.mail.yahoo.com via HTTP; <BR>Wed, 27 Aug 2003 04:00:50 PDT<BR>Date: Wed, 27 Aug 2003 04:00:50 -0700 (PDT)<BR>From: ads squid &lt;<A href="mailto:adssquid@yahoo.com">adssquid@yahoo.com</A>&gt;<BR>Subject: RE: [squid-users] delay pool problem<BR>To: Adam Aube &lt;<A href="mailto:aaube@firstindependent.net">aaube@firstindependent.net</A>&gt;, <A href="mailto:squid-users@squid-cache.org">squid-users@squid-cache.org</A><BR>In-Reply-To: &lt;<A href="mailto:000001c36c08$42969990$647fa8c0@firstindependent.net">000001c36c08$42969990$647fa8c0@firstindependent.net</A>&gt;<BR>MIME-Version: 1.0<BR>Content-Type: multipart/alternative; <BR>boundary="0-181363567-1061982050=:80891"<BR>--0-181363567-1061982050=:80891<BR>Content-Type: text/plain; charset=us-ascii<BR>*****<BR>Also my LAN users can not send emails through outlook express.<BR>However when email can be send through dialup connection of LAN user. </DIV>
<DIV><BR>PROBLEM -2 </DIV>
<DIV>When I try to upload files from LAN user to my outside webserver provider through CuteFTP it gives following message<BR>****<BR>&nbsp;Login successful<BR>COMMAND:&gt; TYPE I<BR>&nbsp;200 Type set to I.<BR>COMMAND:&gt; pwd<BR>&nbsp;257 "/" is current directory.<BR>COMMAND:&gt; TYPE A<BR>&nbsp;200 Type set to A.<BR>STATUS:&gt; Retrieving directory listing...<BR>COMMAND:&gt; PORT 192,168,0,42,4,62<BR>&nbsp;500 Illegal PORT command.<BR>STATUS:&gt; Error opening data socket <BR>*****</DIV>
<DIV>I can upload files to my webserver from dialup connection.</DIV>
<DIV>My rc.local is as follows :</DIV>
<DIV>#!/bs script will be executed *after* all the other init scripts.<BR># You can put your own initialization stuff in here if you don't<BR># want to do the full Sys V style init stuff.<BR>#!/bs script will be executed *after* all the other init scripts.<BR># You can put your own initialization stuff in here if you don't<BR># want to do the full Sys V style init stuff.<BR>touch /var/lock/subsys/local<BR>route del default gw 202.183.69.129 dev eth0<BR>iptunnel add tunnel0 mode ipip local 202.183.69.130 remote 202.183.73.206 ttl 255<BR>ip link set tunnel0 up<BR>ip addr add 202.63.162.62/30 dev tunnel0<BR>route add default gw 202.63.162.61 dev tunnel0<BR>route add -net 202.183.73.204 netmask 255.255.255.252 gw 202.183.69.129<BR>echo 1 &gt; /proc/sys/net/ipv4/ip_forward<BR>iptables --flush<BR>iptables --table nat --flush<BR>iptables --delete-chain<BR>iptables --table nat --delete-chain<BR>iptables --table nat --append POSTROUTING --out-interface tunnel0 -j MASQUERADE<BR>iptable
 s
 --append FORWARD --in-interface eth1 -j ACCEPT<BR>#iptables -t nat -A POSTROUTING -p tcp --dport 25 -j MASQUERADE<BR>#iptables -t nat -A POSTROUTING -p tcp -o eth1&nbsp; -j SNAT --to 207.106.22.35:80<BR>#iptables -t nat -A POSTROUTING -p tcp -s 192.168.0.23 -d 207.106.22.35 --dport 21 -j MASQUERADE<BR>#iptables -t nat -A POSTROUTING -p tcp -s 192.168.0.23 -d 207.106.22.35 --dport 80 -j MASQUERADE<BR>#iptables -t nat -A POSTROUTING -p tcp -s 192.168.0.23 -d 207.106.22.35 --dport 21 -j MASQUERADE<BR>#iptables -t nat -A POSTROUTING -p tcp -s 192.168.0.23 -d 207.106.22.35 --dport 80 -j MASQUERADE<BR>iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128<BR>#iptables -A FORWARD -s 0/0 -d 0/0 -p tcp --dport 4662 -j DROP<BR>#iptables -A FORWARD -s 0/0 -d 0/0 -p tcp --dport 1214 -j DROP<BR>#iptables -A FORWARD -s 0/0 -d 0/0 -p tcp --dport 4672 -j DROP<BR>#<BR>he other init scripts.<BR>#iptables -t nat -A POSTROUTING -p tcp --dport 25 -j MASQUERADE<BR>#iptables -t
  nat -A
 POSTROUTING -p tcp -o eth1&nbsp; -j SNAT --to 207.106.22.35:80<BR>#iptables -t nat -A POSTROUTING -p tcp -s 192.168.0.23 -d 207.106.22.35 --dport 21 -j MASQUERADE<BR>#iptables -t nat -A POSTROUTING -p tcp -s 192.168.0.23 -d 207.106.22.35 --dport 80 -j MASQUERADE<BR>#iptables -t nat -A POSTROUTING -p tcp -s 192.168.0.23 -d 207.106.22.35 --dport 21 -j MASQUERADE<BR>#iptables -t nat -A POSTROUTING -p tcp -s 192.168.0.23 -d 207.106.22.35 --dport 80 -j MASQUERADE<BR>iptables -t nat -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128<BR>*****</DIV>
<DIV><BR>SMTP HTTP port allow <BR></DIV><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</a> - Free, easy-to-use web site design software
--0-836099041-1062249077=:61193--

