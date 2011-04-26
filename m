From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: ipset maximal/minimal revision conflict
Date: Tue, 26 Apr 2011 12:16:53 +0100
Message-ID: <4DB6A9A5.5070301@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:message-id:disposition-notification-to:date
         :from:user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=4ici2hW3i/DOdPxOT3xIgugBSRYIlHq/5YrgwPe1v/A=;
        b=fy2xvLxpXEg5mcM7EeJ4quaqi2MShkGkuULU8/OEGF5mZtM9nUIR/oHqrdFtjBcItg
         3WlnhyEuVVWLTt60C35xtF0VTJTf/qH4o1rugd/ltjDuky3P5O/8Fsjp0LImHk0Yg6bl
         JEdniEkpMZVqqITDOVuZNS7drIcOkZUDsVrXc=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I get a weird error when executing the following ipset command:

[root@test1 ~]# ipset -N test hash:net,port
ipset v6.4: Kernel supports hash:net,port type, family INET with maximal 
revision 0 while ipset program with minimal revision 1.
You need to upgrade your kernel.

The "revision", as far as I know, is exactly the same - ipset 6.4! The 
userspace has been compiled from the released v6.4, while the kernel 
part was built from a snapshot dated 24 April, which included the 3 
patches not present in .39-rc4 (so, in essence, if anything, the kernel 
part should be newer than the userspace part of the released v6.4, 
right?). It is strange that I do not get this error when attempting any 
other type of set (hash:ip or hash:net).

It is also worth noting that I have IPv6 administratively disabled on 
that machine, though do not know if that's the reason for the above 
error. How can I correct this?
