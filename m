From: ads nat <adsnat@yahoo.com>
Subject: SMTP HTTP port allow
Date: Tue, 26 Aug 2003 23:52:56 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030827065256.47173.qmail@web20708.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1268608863-1061967176=:46364"
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

--0-1268608863-1061967176=:46364
Content-Type: text/plain; charset=us-ascii

I am implimenting iptables for first time. 
I want to allow all my LAN users to send emails to SMTP (port no. 25) all destination with following code. :
 
***
iptables -A FORWARD -p tcp --dport 25 -j ACCEPT
***
 
I also want to allow LAN users having ip 192.168.0.42 192.168.0.23 to upload contents to webserver on ip 207.106.22.35 (outside of LAN) with following code. 
 
***
iptables -A FORWARD -p tcp -s 192.168.0.42 192.168.0.23 -d 207.106.22.35 --dport 80 -j ACCEPT
***
 
I would loke know whether It works or not.
Tell me whether my code is O.K. also where can i check logs.
Thanks




---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
--0-1268608863-1061967176=:46364
Content-Type: text/html; charset=us-ascii

<DIV>I am implimenting iptables for first time. </DIV>
<DIV>I want to allow all my LAN users to send emails to SMTP (port no. 25)&nbsp;all destination with following code. :</DIV>
<DIV>&nbsp;</DIV>
<DIV>***</DIV>
<DIV>iptables -A FORWARD -p tcp --dport 25 -j ACCEPT<BR>
<DIV>***</DIV>
<DIV>&nbsp;</DIV>
<DIV>I also want to allow LAN users having ip 192.168.0.42 192.168.0.23 to upload contents to webserver on ip 207.106.22.35 (outside of LAN)&nbsp;with following code. </DIV>
<DIV>&nbsp;</DIV>
<DIV>***</DIV>
<DIV>iptables -A FORWARD -p tcp -s 192.168.0.42 192.168.0.23 -d 207.106.22.35 --dport 80 -j ACCEPT</DIV>
<DIV>***</DIV>
<DIV>&nbsp;</DIV>
<DIV>I would loke know whether It works or not.</DIV>
<DIV>Tell me whether my code is O.K. also where can i check logs.</DIV>
<DIV>Thanks<BR></DIV></DIV><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</a> - Free, easy-to-use web site design software
--0-1268608863-1061967176=:46364--

