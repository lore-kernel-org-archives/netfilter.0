From: Jamal Hadi Salim <jhs@mojatatu.com>
Subject: ANNOUNCE: New talk accepted on Netfilter Connection Tracking
Date: Sat, 11 Mar 2017 08:48:53 -0500
Message-ID: <71f7cf32-ab66-2b05-aa55-631e08d23a45@mojatatu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=iJgoSPiL/lSDSV2iVlEcefOgZti9nLtF0pXWuQglFBk=;
        b=LXaX6Gw+BY3VhWrT/p5PV6RF6keKwG0Q18UETm0BHOlQfPsOJKmoxyv7c98eEjcuBp
         eqarGiW15zsSsCUo570RSsFUx+lJJZ5evlZn/WjPqD4AFaIIFm946kKKe+9TRTpz0PA7
         GnBH9t/5QlXcsKHF4WDHA6LFU8rMcxIQtjt34nzQjBVUqCFOnQ4VYiZkgOxPmNAEkFPD
         goypAvB6q+jcl1dYOMNagxeYAk9AonjvB18bIVw3U6THI4R7Dv/lUl2Pc2GJjjPScubB
         PHgHxO7HQEo8dhs2LrUSYwd/cUsChPKzTlU6GNSY456bIOECuOCut+Vv2HUJtygBwGRO
         1k0Q==
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
