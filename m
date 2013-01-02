From: Stephen Hemminger <shemminger@vyatta.com>
Subject: Fw: [Bug 52171] New: Error: No such file or directory
Date: Wed, 2 Jan 2013 08:01:35 -0800
Message-ID: <20130102080135.6f3944d0@nehalam.linuxnetplumber.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org



Begin forwarded message:

Date: Wed,  2 Jan 2013 11:42:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: shemminger@linux-foundation.org
Subject: [Bug 52171] New: Error: No such file or directory


https://bugzilla.kernel.org/show_bug.cgi?id=52171

           Summary: Error: No such file or directory
           Product: Networking
           Version: 2.5
    Kernel Version: 3.6.3
          Platform: All
        OS/Version: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: IPV4
        AssignedTo: shemminger@linux-foundation.org
        ReportedBy: ganeshsurfs@yahoo.com
                CC: ganeshsurfs@yahoo.com
        Regression: No


Created an attachment (id=90141)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=90141)
Part of console script for the end port where the build stopped

I am getting an error when building the kernel for use. The menuconfig is new
and is not copied from my system or other system. "make defconfig" ran
successfully to create a .config file. "make menuconfig" ran successfully to
.Kconfig. I am using i3 machine with gentoo linux livecd. I received this error
when running "make arch=x86" command to build the core. It compiled a lot of
files but stops at "net" folder compilation with error

  CC      net/ipv4/netfilter/ipt_ah.o
  CC      net/ipv4/netfilter/ipt_rpfilter.o
  CC      net/ipv4/netfilter/ipt_CLUSTERIP.o
  CC      net/ipv4/netfilter/ipt_ECN.o
net/ipv4/netfilter/ipt_ECN.c:20:42: fatal error:
linux/netfilter_ipv4/ipt_ECN.h: No such file or directory
compilation terminated.
make[3]: *** [net/ipv4/netfilter/ipt_ECN.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2
make[1]: *** [net/ipv4] Error 2
make: *** [net] Error 2


Any workaround or you suggest a different version download? Will be using this
for my personal system on a insecure network. So need this?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
