From: Gerry Reno <greno@verizon.net>
Subject: Re: fwknop: use with Fedora?
Date: Sun, 23 Sep 2007 09:47:53 -0400
Message-ID: <46F66E89.1000809@verizon.net>
References: <46F5B7F8.2060502@verizon.net> <46F5C161.7090908@verizon.net>
 <46F5CF0C.3060004@verizon.net> <20070923043058.GA2940@minastirith>
 <46F65D0E.6050005@verizon.net> <46F65EBE.30502@verizon.net>
 <46F66A11.5000901@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <46F66A11.5000901@verizon.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Yes, the RPM installs and the daemon starts ok:

# yum localinstall /tmp/fwknop-1.8.2-1.fc7.i386.rpm
Loading "installonlyn" plugin
Setting up Local Package Process
Examining /tmp/fwknop-1.8.2-1.fc7.i386.rpm: fwknop - 1.8.2-1.fc7.i386
Marking /tmp/fwknop-1.8.2-1.fc7.i386.rpm to be installed
fedora 100% |=========================| 2.1 kB 00:00
updates 100% |=========================| 2.3 kB 00:00
Resolving Dependencies
--> Running transaction check
---> Package fwknop.i386 0:1.8.2-1.fc7 set to be updated

Dependencies Resolved

=============================================================================
Package Arch Version Repository Size
=============================================================================
Installing:
fwknop i386 1.8.2-1.fc7 /tmp/fwknop-1.8.2-1.fc7.i386.rpm 22 M

Transaction Summary
=============================================================================
Install 1 Package(s)
Update 0 Package(s)
Remove 0 Package(s)

Total download size: 22 M
Is this ok [y/N]: y
Downloading Packages:
Running Transaction Test
Finished Transaction Test
Transaction Test Succeeded
Running Transaction
Installing: fwknop ######################### [1/1]
Can't open /etc/fwknop/knopwatchd.conf: No such file or directory.
[+] You can edit the EMAIL_ADDRESSES variable in /etc/fwknop/fwknop.conf
/etc/fwknop/fwknop.conf to have email alerts sent to an address
other than root\@localhost

Installed: fwknop.i386 0:1.8.2-1.fc7
Complete!
#

# service fwknop start
Starting the fwknop daemons: [ OK ]
#

So now to test.

Gerry

