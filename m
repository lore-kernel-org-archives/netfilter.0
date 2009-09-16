From: "Tim Evans" <tkevans@tkevans.com>
Subject: Odd Results with RHN/RHEL 5.4 yum; iptables doing?
Date: Wed, 16 Sep 2009 11:08:12 -0400 (EDT)
Message-ID: <33684.199.173.225.25.1253113692.squirrel@tkevans.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Been seeing odd behavior with yum/RHN in my firewall since my 5.4 upgrade
was done, and wonder if something that would change iptables' behavior has
happened.  See below.

[root@www ~]# yum clean all
Loaded plugins: rhnplugin
Cleaning up Everything
[root@www ~]# yum list updates
Loaded plugins: rhnplugin
rhel-i386-server-5                                       | 1.3 kB     00:00
rhel-i386-server-5/primary                               | 2.3 MB     00:11
rhel-i386-server-5
6106/6106
Updated Packages
net-snmp-libs.i386            1:5.3.2.2-7.el5_4.2
rhel-i386-server-5
nspr.i386                     4.7.5-1.el5_4
rhel-i386-server-5

OK, so far, but now...

[root@www ~]# yum -y update
Loaded plugins: rhnplugin
Setting up Update Process
Resolving Dependencies
--> Running transaction check
---> Package net-snmp-libs.i386 1:5.3.2.2-7.el5_4.2 set to be updated
---> Package nspr.i386 0:4.7.5-1.el5_4 set to be updated
--> Finished Dependency Resolution

Dependencies Resolved

================================================================================
 Package          Arch    Version                   Repository
Size
================================================================================
Updating:
 net-snmp-libs    i386    1:5.3.2.2-7.el5_4.2       rhel-i386-server-5
1.3 M
 nspr             i386    4.7.5-1.el5_4             rhel-i386-server-5
119 k

Transaction Summary
================================================================================
Install      0 Package(s)
Update       2 Package(s)
Remove       0 Package(s)

Total download size: 1.4 M
Downloading Packages:


Error Downloading Packages:
  1:net-snmp-libs-5.3.2.2-7.el5_4.2.i386: failed to retrieve
getPackage/net-snmp-libs-5.3.2.2-7.el5_4.2.i386.rpm from
rhel-i386-server-5
error was [Errno 12] Timeout: <urlopen error timed out>
  nspr-4.7.5-1.el5_4.i386: failed to retrieve
getPackage/nspr-4.7.5-1.el5_4.i386.rpm from rhel-i386-server-5
error was [Errno 12] Timeout: <urlopen error timed out>

Even so, /var/log/up2date confirms yum's communicating with RHN (and that
my entitlement's valid):

[Wed Sep 16 10:52:46 2009] up2date updateLoginInfo() login info
[Wed Sep 16 10:52:46 2009] up2date logging into up2date server
[Wed Sep 16 10:52:47 2009] up2date successfully retrieved authentication
token from up2date server

Ideas?  Thanks.

-- 
Tim Evans, TKEvans.com, Inc.    |   5 Chestnut Court
UNIX System Admin Consulting    |   Owings Mills, MD 21117
http://www.tkevans.com/         |   443-394-3864
http://www.come-here.com/News/  |   tkevans@tkevans.com



