From: shiva vafadar <sh_vafadar@yahoo.com>
Subject: A problem in configuring a firewall system
Date: Tue, 2 Sep 2003 04:51:59 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030902115159.79965.qmail@web10701.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-1701452095-1062503519=:79691"
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

--0-1701452095-1062503519=:79691
Content-Type: text/plain; charset=us-ascii

Dear all
 
I have a problem in configuring my firewall system.
My Linux system has two Net cards and there are two interfaces in it. eth0 and eth1.
I want to forward a incoming request ( from 192.168.1.1) to another destination(132.20.48.5). I have added a rule in firewall iptables using Nat and prerouting. As a consequence of this rule a recorde is added to the log file after requesting, with following informaiton:
IN=eth0, OUT= eth1, Source=192.168.1.11 and Destination=132.20.48.5.
I think this is exactly what I want. 
I used tcp dump and I see that there is a request from 192.168.1.11 to firewall system on eth0 but there is no request from eth1 to the 132.20.48.5.
I conclude that there is somthing wrong in connection between lan cards and interfaces, Is it all right? And what should I do to bridge this gap?
 
I approciate your consideration in advance.
 
Shiva Vafadar
 
 


---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
--0-1701452095-1062503519=:79691
Content-Type: text/html; charset=us-ascii

<DIV>Dear all</DIV>
<DIV>&nbsp;</DIV>
<DIV>I have a problem in configuring my firewall system.</DIV>
<DIV>My Linux system has two Net cards and there are two interfaces in it. eth0 and eth1.</DIV>
<DIV>I want to forward a incoming request ( from 192.168.1.1)&nbsp;to another destination(132.20.48.5). I have added a rule in firewall iptables using Nat and prerouting. As a consequence of this rule&nbsp;a recorde is added to the log file after requesting, with following informaiton:</DIV>
<DIV>IN=eth0, OUT= eth1, Source=192.168.1.11 and Destination=132.20.48.5.</DIV>
<DIV>I think this is exactly what I want. </DIV>
<DIV>I used tcp dump and I see that there is a request from 192.168.1.11 to firewall system on eth0 but there is no request from eth1 to the 132.20.48.5.</DIV>
<DIV>I conclude that there is somthing wrong in connection between lan cards and interfaces, Is it all right? And what should I do to bridge this gap?</DIV>
<DIV>&nbsp;</DIV>
<DIV>I approciate your consideration in advance.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Shiva Vafadar</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</a> - Free, easy-to-use web site design software
--0-1701452095-1062503519=:79691--

