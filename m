From: ads nat <adsnat@yahoo.com>
Subject: iptables newbie
Date: Thu, 11 Sep 2003 06:41:33 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030911134133.91316.qmail@web20711.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-2016306992-1063287693=:90793"
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

--0-2016306992-1063287693=:90793
Content-Type: text/plain; charset=us-ascii

Hi,
I have Linux REDHAT 8.0 server. Iptables are installed while installing Linux 8.0. version 1.2.6a
 
I am getting following error.
 
[root@xyz root]# /etc/init.d/iptables restart
Flushing all current rules and user defined chains:        [  OK  ]
Clearing all current rules and user defined chains:        [  OK  ]
Applying iptables firewall rules: iptables-restore v1.2.6a: Unknown arg `--dport'
Try `iptables-restore -h' or 'iptables-restore --help' for more information.
                                                           [FAILED]
 
In iptables file i have used  :
*filter
-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 0:1023 --syn -j REJECT
-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 2049 --syn -j REJECT
-A RH-Lokkit-0-50-INPUT -p udp -m udp --dport 0:1023 -j REJECT
-A RH-Lokkit-0-50-INPUT -p udp -m udp --dport 2049 -j REJECT
-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 6000:6009 --syn -j REJECT
-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 7100 --syn -j REJECT
COMMIT
*nat 
-A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128
COMMIT
 
Do i have to install any additional module.
Thanks

 


---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
--0-2016306992-1063287693=:90793
Content-Type: text/html; charset=us-ascii

<DIV>Hi,</DIV>
<DIV>I have Linux REDHAT 8.0 server. Iptables are installed while installing Linux 8.0. version 1.2.6a</DIV>
<DIV>&nbsp;</DIV>
<DIV>I am getting following error.</DIV>
<DIV>&nbsp;</DIV>
<DIV>[root@xyz root]# /etc/init.d/iptables restart<BR>Flushing all current rules and user defined chains:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [&nbsp; OK&nbsp; ]<BR>Clearing all current rules and user defined chains:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [&nbsp; OK&nbsp; ]<BR>Applying iptables firewall rules: iptables-restore v1.2.6a: Unknown arg `--dport'<BR>Try `iptables-restore -h' or 'iptables-restore --help' for more information.<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [FAILED]</DIV>
<DIV>&nbsp;</DIV>
<DIV>In iptables file i have used&nbsp; :</DIV>
<DIV>*filter</DIV>
<DIV>-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 0:1023 --syn -j REJECT<BR>-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 2049 --syn -j REJECT<BR>-A RH-Lokkit-0-50-INPUT -p udp -m udp --dport 0:1023 -j REJECT<BR>-A RH-Lokkit-0-50-INPUT -p udp -m udp --dport 2049 -j REJECT<BR>-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 6000:6009 --syn -j REJECT<BR>-A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 7100 --syn -j REJECT</DIV>
<DIV>COMMIT</DIV>
<DIV>*nat </DIV>
<DIV>-A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128</DIV>
<DIV>COMMIT</DIV>
<DIV>&nbsp;</DIV>
<DIV>Do i have to install any additional module.</DIV>
<DIV>Thanks</DIV>
<DIV><BR>&nbsp;</DIV><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</a> - Free, easy-to-use web site design software
--0-2016306992-1063287693=:90793--

