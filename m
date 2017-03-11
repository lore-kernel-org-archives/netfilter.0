From: Jamal Hadi Salim <jhs@mojatatu.com>
Subject: ANNOUNCE: New talk accepted on OVS without OVS
Date: Sat, 11 Mar 2017 09:26:30 -0500
Message-ID: <4bf8ef8c-0b02-56e6-17f5-c8b1e509cffd@mojatatu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=iJgoSPiL/lSDSV2iVlEcefOgZti9nLtF0pXWuQglFBk=;
        b=w0ksWf/jERHM0bHgI0DEUb4n7a9msggxiwmaw5obAy58uporuebwqpNTMJImTuSMgU
         sEUXpBFccBdzx3bXc1RtHI+iqgqhEaH87fuiKKK1oZmnVGsCszECmlZ7nu6HAZ4A4u0F
         LF/UIX7z48PUzdLT17UrbCUplZ0xnjMPR07NHHJV+8I6orplcaEbHOR5bxFw8VIMLlzR
         e8Xh6RbfEILTy6j4ORipAtOhmELBZ+MgdPC5Vs/7C3fNcfxFvrvmsHLkdo84JOBLJkCT
         nL92uV0JQEM+eH3buXQV8EMqZp83R9B0BR16Ie50Y7mhj9wGuhqXBAtu8k0i6j+7Tlq4
         DxuQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: people@netdevconf.org
Cc: tech-committee@netdevconf.org, Brenda Butler <bjb@mojatatu.com>, Stephen Jaworski <jaws@mojatatu.com>, netfilter@vger.kernel.org


The tech committee would like to announce a new accepted talk.
OVS without OVS, by Joe Stringer

The description is as follows:
-----
The OVS kernel module provides a user-facing API that models a datapath 
bridge that connects multiple ports and is configured through a single 
flow table. This flow table allows policies to be written around a wide 
range of fields and provides actions to manipulate and redirect packets. 
A primary goal of this design is to allow flexible user-defined policies 
without complicating the kernel for every use-case; this has been 
well-aligned with recent industry interest in SDN.

The most well known user of the the OVS kernel module is ovs-vswitchd, 
which is a fairly large userspace program that provides an OpenFlow API 
for programming. However, there are a number of other users and 
use-cases outside of ovs-vswitchd and SDN for the OVS kernel module. 
This paper presents the OVS kernel API, shows how it can be directly 
configured with simpler low-level utilities (eg, ovs-dpctl), and looks 
at how it compares to similar APIs such as cls_flower. Finally, this 
paper surveys a variety of open source projects which build upon the OVS 
kernel API without using the OVS userland utilities.
----

cheers,
jamal
