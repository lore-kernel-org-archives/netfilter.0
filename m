From: carlopmart <carlopmart@gmail.com>
Subject: A question about ebtables and virtual switching
Date: Thu, 12 May 2011 10:17:06 +0200
Message-ID: <4DCB9782.6030605@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=UPLbgDxyDUClfRFXZYc28i1yRAecoL1ngj02H4dtvw4=;
        b=ahcmD8X9KWSFjXEkKOZDyO6hS7Acpa10kECF6+vIKJbDkRSqJjDTI6Vw+Osljg2FCN
         mUd1XYfDTL5QTdkYn3h8NXLnIGei0u+l1oPHCd4tZXrLA+URABrodfRMdMy7q7OyzrG+
         Z7cpKSQlB8kE3rar602MSxzhD/zGTwaunGHEk=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,

  I have installed a virtual machine with snort to sniff traffic on a 
dedicated virtual lan.

  But exists a problem: this snort vm only sees traffic destinated to 
its own MAC address and traffic with the multicast bit set in the 
destination address. This scenario is unusable for snot.

  I have found a partial soultion: set ageing to 0 in host's bridge but 
this produces another problem, all vms attached to this virtual switch 
sees all traffic, and that is not what I want.

  If I not wrong, ebtables is the solution to make snort work, but I 
didn't find any doc about how can I implement this solution.

  How can I configure ebtables rules to make a port mirroring in this 
virtual switch where snort needs to sniff??

  I am using KVM as virtualization platform.

  Thanks.
-- 
CL Martinez
carlopmart {at} gmail {d0t} com
