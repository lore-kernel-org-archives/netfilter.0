From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: Compiling options for IPTABLES to work.
Date: Tue, 16 Sep 2003 10:45:38 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F672212.9070908@Loudoun-Fairfax.com>
References: <20030916135404.26996.qmail@web20709.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------020102030301080208050705"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030916135404.26996.qmail@web20709.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: ads nat <adsnat@yahoo.com>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------020102030301080208050705
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

ads nat wrote:

> Following are the modules loaded :
> [root@xyz root]# /sbin/lsmod
> Module                  Size  Used by    Not tainted
> sr_mod                 18136   2  (autoclean)
> soundcore               6532   0  (autoclean)
> ipip                    8772   1  (autoclean)
> autofs                 13348   0  (autoclean) (unused)
> 8139too                17704   2
> mii                     2156   0  [8139too]
> ipt_MASQUERADE          2200   1  (autoclean)
> ipt_REDIRECT            1368   1  (autoclean)
> iptable_nat            19960   1  (autoclean) [ipt_MASQUERADE 
> ipt_REDIRECT]
> ip_conntrack           21244   1  (autoclean) [ipt_MASQUERADE 
> ipt_REDIRECT iptab
> le_nat]
> iptable_filter          2412   1  (autoclean)
> ip_tables              14936   6  [ipt_MASQUERADE ipt_REDIRECT 
> iptable_nat iptab
> le_filter]
> ide-scsi               10512   1
> ide-cd                 33608   0
> cdrom                  33696   0  [sr_mod ide-cd]
> mousedev                5524   1
> keybdev                 2976   0  (unused)
> hid                    22244   0  (unused)
> input                   5888   0  [mousedev keybdev hid]
> usb-uhci               26188   0  (unused)
> ehci-hcd               17480   0  (unused)
> usbcore                77024   1  [hid usb-uhci ehci-hcd]
> ext3                   70368   5
> jbd                    52212   5  [ext3]
> aic7xxx               137140   6
> sd_mod                 13552  12
> scsi_mod              107144   4  [sr_mod ide-scsi aic7xxx sd_mod]
>
> Are these modules O.K. for what I want to do?
> Please guide.
> Thanks
>
The basic modules are loaded. I don't know what you're trying to do, so 
I don't know if these are all the modules you need. Does it work?

Jeff

--------------020102030301080208050705
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
ads nat wrote:<br>
<blockquote type="cite"
 cite="mid20030916135404.26996.qmail@web20709.mail.yahoo.com">
  <div>Following are the modules loaded :</div>
  <div>[root@xyz root]# /sbin/lsmod<br>
Module&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Size&nbsp; Used by&nbsp;&nbsp;&nbsp; Not tainted<br>
sr_mod&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 18136&nbsp;&nbsp; 2&nbsp; (autoclean)<br>
soundcore&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 6532&nbsp;&nbsp; 0&nbsp; (autoclean)<br>
ipip&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8772&nbsp;&nbsp; 1&nbsp; (autoclean)<br>
autofs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 13348&nbsp;&nbsp; 0&nbsp; (autoclean) (unused)<br>
8139too&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 17704&nbsp;&nbsp; 2<br>
mii&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2156&nbsp;&nbsp; 0&nbsp; [8139too]<br>
ipt_MASQUERADE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2200&nbsp;&nbsp; 1&nbsp; (autoclean)<br>
ipt_REDIRECT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1368&nbsp;&nbsp; 1&nbsp; (autoclean)<br>
iptable_nat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 19960&nbsp;&nbsp; 1&nbsp; (autoclean) [ipt_MASQUERADE
ipt_REDIRECT]<br>
ip_conntrack&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 21244&nbsp;&nbsp; 1&nbsp; (autoclean) [ipt_MASQUERADE
ipt_REDIRECT iptab<br>
le_nat]<br>
iptable_filter&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2412&nbsp;&nbsp; 1&nbsp; (autoclean)<br>
ip_tables&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 14936&nbsp;&nbsp; 6&nbsp; [ipt_MASQUERADE ipt_REDIRECT
iptable_nat iptab<br>
le_filter]<br>
ide-scsi&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 10512&nbsp;&nbsp; 1<br>
ide-cd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 33608&nbsp;&nbsp; 0<br>
cdrom&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 33696&nbsp;&nbsp; 0&nbsp; [sr_mod ide-cd]<br>
mousedev&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5524&nbsp;&nbsp; 1<br>
keybdev&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2976&nbsp;&nbsp; 0&nbsp; (unused)<br>
hid&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 22244&nbsp;&nbsp; 0&nbsp; (unused)<br>
input&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5888&nbsp;&nbsp; 0&nbsp; [mousedev keybdev hid]<br>
usb-uhci&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 26188&nbsp;&nbsp; 0&nbsp; (unused)<br>
ehci-hcd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 17480&nbsp;&nbsp; 0&nbsp; (unused)<br>
usbcore&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 77024&nbsp;&nbsp; 1&nbsp; [hid usb-uhci ehci-hcd]<br>
ext3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 70368&nbsp;&nbsp; 5<br>
jbd&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 52212&nbsp;&nbsp; 5&nbsp; [ext3]<br>
aic7xxx&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 137140&nbsp;&nbsp; 6<br>
sd_mod&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 13552&nbsp; 12<br>
scsi_mod&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 107144&nbsp;&nbsp; 4&nbsp; [sr_mod ide-scsi aic7xxx sd_mod]<br>
  <br>
  </div>
  <div>Are these modules O.K. for what I want to do?</div>
  <div>Please guide.</div>
  <div>Thanks</div>
  <br>
</blockquote>
The basic modules are loaded. I don't know what you're trying to do, so
I don't know if these are all the modules you need. Does it work?<br>
<br>
Jeff<br>
</body>
</html>

--------------020102030301080208050705--


