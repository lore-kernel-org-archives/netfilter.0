From: ads nat <adsnat@yahoo.com>
Subject: iptables installation problem
Date: Fri, 5 Sep 2003 04:17:54 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030905111754.9251.qmail@web20701.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-489246669-1062760674=:8959"
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

--0-489246669-1062760674=:8959
Content-Type: text/plain; charset=us-ascii

Hi,
I am trying to install iptables-1.2.8.tar.bz2 on Linux 8.0 server.
I have downloaded iptables-1.2.8.tar.bz2 file from netfilter downloads to /root/iptables-1.2.8 directory. 
by using command 
"tar -xf iptables-1.2.8.tar"
It has created iptables-1.2.8 directory in which all files are extracted.
 
I don't know how to go further.
I tried make and make install.
 
Then when i gave command "/etc/rc.d/rc.local"
it gives following error.
"[root@xyz iptables-1.2.8]# /etc/rc.d/rc.local
SIOCDELRT: No such process
RTNETLINK answers: File exists
SIOCADDRT: File exists
SIOCADDRT: File exists
iptables v1.2.6a: can't initialize iptables table `-nat': Table does not exist (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.
 
How to go ahead now?
 
Thanks




---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
--0-489246669-1062760674=:8959
Content-Type: text/html; charset=us-ascii

<DIV>Hi,</DIV>
<DIV>I am trying to install iptables-1.2.8.tar.bz2 on Linux 8.0 server.</DIV>
<DIV>I have downloaded iptables-1.2.8.tar.bz2 file from netfilter downloads to /root/iptables-1.2.8 directory. </DIV>
<DIV>by using command </DIV>
<DIV>"tar -xf iptables-1.2.8.tar"</DIV>
<DIV>It has created iptables-1.2.8 directory in which all files are extracted.</DIV>
<DIV>&nbsp;</DIV>
<DIV>I don't know how to go further.</DIV>
<DIV>I tried make and make install.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Then when i gave command "/etc/rc.d/rc.local"</DIV>
<DIV>it gives following error.</DIV>
<DIV>"[root@xyz iptables-1.2.8]# /etc/rc.d/rc.local<BR>SIOCDELRT: No such process<BR>RTNETLINK answers: File exists<BR>SIOCADDRT: File exists<BR>SIOCADDRT: File exists<BR>iptables v1.2.6a: can't initialize iptables table `-nat': Table does not exist (do you need to insmod?)<BR>Perhaps iptables or your kernel needs to be upgraded.</DIV>
<DIV>&nbsp;</DIV>
<DIV>How to go ahead now?</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks<BR><BR></DIV><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</a> - Free, easy-to-use web site design software
--0-489246669-1062760674=:8959--

