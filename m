From: ads nat <adsnat@yahoo.com>
Subject: Re: Compiling options for IPTABLES to work.
Date: Tue, 16 Sep 2003 06:54:04 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030916135404.26996.qmail@web20709.mail.yahoo.com>
References: <3F670CDF.3020007@Loudoun-Fairfax.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="0-2048600242-1063720444=:24080"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F670CDF.3020007@Loudoun-Fairfax.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Cc: netfilter@lists.netfilter.org

--0-2048600242-1063720444=:24080
Content-Type: text/plain; charset=us-ascii

Following are the modules loaded :
[root@xyz root]# /sbin/lsmod
Module                  Size  Used by    Not tainted
sr_mod                 18136   2  (autoclean)
soundcore               6532   0  (autoclean)
ipip                    8772   1  (autoclean)
autofs                 13348   0  (autoclean) (unused)
8139too                17704   2
mii                     2156   0  [8139too]
ipt_MASQUERADE          2200   1  (autoclean)
ipt_REDIRECT            1368   1  (autoclean)
iptable_nat            19960   1  (autoclean) [ipt_MASQUERADE ipt_REDIRECT]
ip_conntrack           21244   1  (autoclean) [ipt_MASQUERADE ipt_REDIRECT iptab
le_nat]
iptable_filter          2412   1  (autoclean)
ip_tables              14936   6  [ipt_MASQUERADE ipt_REDIRECT iptable_nat iptab
le_filter]
ide-scsi               10512   1
ide-cd                 33608   0
cdrom                  33696   0  [sr_mod ide-cd]
mousedev                5524   1
keybdev                 2976   0  (unused)
hid                    22244   0  (unused)
input                   5888   0  [mousedev keybdev hid]
usb-uhci               26188   0  (unused)
ehci-hcd               17480   0  (unused)
usbcore                77024   1  [hid usb-uhci ehci-hcd]
ext3                   70368   5
jbd                    52212   5  [ext3]
aic7xxx               137140   6
sd_mod                 13552  12
scsi_mod              107144   4  [sr_mod ide-scsi aic7xxx sd_mod]


Are these modules O.K. for what I want to do?
Please guide.
Thanks

Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com> wrote:
ads nat wrote:
I want to get hands on experience of using iptables, DMZ firewall, DHCP firewall, etc.for which Tutorial says I need to compile kernal with following options OR as modules :
 

   
CONFIG_NETFILTER 

   
CONFIG_IP_NF_CONNTRACK 

   
CONFIG_IP_NF_IPTABLES 

   
CONFIG_IP_NF_MATCH_LIMIT 

   
CONFIG_IP_NF_MATCH_STATE 

   
CONFIG_IP_NF_FILTER 

   
CONFIG_IP_NF_NAT 

   
CONFIG_IP_NF_TARGET_LOG 


I have installed Redhat Linux 8.0 on server machine which by default installs iptables 1.2.6a. 

Do Redhat 8.0 install all these modules. How to check whether these modules are installed or not.  

Thanks

The stock Redhat kernels load these routines as modules. Run: /sbin/lsmod to see which modules are currently loaded. Note that the module name is not going to be the exact same name as the kernel option i.e.  if kernel option CONFIG_IP_NF_CONNTRACK is loaded as a module it will be loaded as module ip_conntrack.

Jeff


---------------------------------
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
--0-2048600242-1063720444=:24080
Content-Type: text/html; charset=us-ascii

<DIV>Following are the modules loaded :</DIV>
<DIV>[root@xyz root]# /sbin/lsmod<BR>Module&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Size&nbsp; Used by&nbsp;&nbsp;&nbsp; Not tainted<BR>sr_mod&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18136&nbsp;&nbsp; 2&nbsp; (autoclean)<BR>soundcore&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6532&nbsp;&nbsp; 0&nbsp; (autoclean)<BR>ipip&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8772&nbsp;&nbsp; 1&nbsp; (autoclean)<BR>autofs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 13348&nbsp;&nbsp; 0&nbsp; (autoclean) (unused)<BR>8139too&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 17704&nbsp;&nbsp;
 2<BR>mii&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2156&nbsp;&nbsp; 0&nbsp; [8139too]<BR>ipt_MASQUERADE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2200&nbsp;&nbsp; 1&nbsp; (autoclean)<BR>ipt_REDIRECT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1368&nbsp;&nbsp; 1&nbsp; (autoclean)<BR>iptable_nat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 19960&nbsp;&nbsp; 1&nbsp; (autoclean) [ipt_MASQUERADE ipt_REDIRECT]<BR>ip_conntrack&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 21244&nbsp;&nbsp; 1&nbsp; (autoclean) [ipt_MASQUERADE ipt_REDIRECT iptab<BR>le_nat]<BR>iptable_filter&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2412&nbsp;&nbsp; 1&nbsp; (autoclean)<BR>ip_tables&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 14936&nbsp;&nbsp; 6&nbsp; [ipt_MASQUERADE ipt_REDIRECT iptable_nat
 iptab<BR>le_filter]<BR>ide-scsi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10512&nbsp;&nbsp; 1<BR>ide-cd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 33608&nbsp;&nbsp; 0<BR>cdrom&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 33696&nbsp;&nbsp; 0&nbsp; [sr_mod ide-cd]<BR>mousedev&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5524&nbsp;&nbsp; 1<BR>keybdev&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2976&nbsp;&nbsp; 0&nbsp; (unused)<BR>hid&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 22244&nbsp;&nbsp; 0&nbsp; (unused)<BR>input&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5888&nbsp;&nbsp; 0&nbsp; [mousedev keyb
 dev
 hid]<BR>usb-uhci&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 26188&nbsp;&nbsp; 0&nbsp; (unused)<BR>ehci-hcd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 17480&nbsp;&nbsp; 0&nbsp; (unused)<BR>usbcore&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 77024&nbsp;&nbsp; 1&nbsp; [hid usb-uhci ehci-hcd]<BR>ext3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 70368&nbsp;&nbsp; 5<BR>jbd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 52212&nbsp;&nbsp; 5&nbsp; [ext3]<BR>aic7xxx&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 137140&nbsp;&nbsp; 6<BR>sd_mod&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 13552&nbsp;
 12<BR>scsi_mod&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 107144&nbsp;&nbsp; 4&nbsp; [sr_mod ide-scsi aic7xxx sd_mod]<BR><BR></DIV>
<DIV>Are these modules O.K. for what I want to do?</DIV>
<DIV>Please guide.</DIV>
<DIV>Thanks</DIV>
<DIV><BR><B><I>Jeffrey Laramie &lt;JALaramie@Loudoun-Fairfax.com&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE class=replbq style="BORDER-LEFT: #1010ff 2px solid; MARGIN-LEFT: 5px; PADDING-LEFT: 5px"><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">ads nat wrote:<BR>
<BLOCKQUOTE type="cite" cite="mid20030916085405.88759.qmail@web20703.mail.yahoo.com">
<DIV>I want to get hands on experience of using iptables, DMZ firewall, DHCP firewall, etc.for which Tutorial says I need to compile kernal with following options OR as modules :</DIV>
<DIV>&nbsp;</DIV>
<UL>
<LI>
<P>CONFIG_NETFILTER </P></LI>
<LI>
<P>CONFIG_IP_NF_CONNTRACK </P></LI>
<LI>
<P>CONFIG_IP_NF_IPTABLES </P></LI>
<LI>
<P>CONFIG_IP_NF_MATCH_LIMIT </P></LI>
<LI>
<P>CONFIG_IP_NF_MATCH_STATE </P></LI>
<LI>
<P>CONFIG_IP_NF_FILTER </P></LI>
<LI>
<P>CONFIG_IP_NF_NAT </P></LI>
<LI>
<P>CONFIG_IP_NF_TARGET_LOG </P></LI></UL>
<P>I have installed Redhat Linux 8.0 on server machine which by default installs iptables 1.2.6a. </P>
<P>Do Redhat 8.0 install all these modules. How to check whether these modules are installed or not.&nbsp; </P>
<P>Thanks</P></BLOCKQUOTE><BR>The stock Redhat kernels load these routines as modules. Run: /sbin/lsmod to see which modules are currently loaded. Note that the module name is not going to be the exact same name as the kernel option i.e.&nbsp; if kernel option CONFIG_IP_NF_CONNTRACK is loaded as a module it will be loaded as module ip_conntrack.<BR><BR>Jeff<BR></BLOCKQUOTE><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com">Yahoo! SiteBuilder</a> - Free, easy-to-use web site design software
--0-2048600242-1063720444=:24080--

