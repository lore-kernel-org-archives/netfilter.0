From: Ethan Sommer <sommere@gac.edu>
Subject: Different limits in 32bit vs 64bit?
Date: Fri, 06 Aug 2010 10:44:36 -0500
Message-ID: <4C5C2DE4.8080007@gac.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Background: We use iptables to mark and count traffic for all the ip 
addresses in our class B subnet. We then use Linux QoS to shape the 
traffic. (We give priority to users who have used less traffic in the 
last 24 hours. See 
http://www.resnetsymposium.org/resnet2009/session_materials/GustavusBandwidthManagement.pdf 
for a presentation I gave on our setup.)

Problem: This week we attempted to move our traffic shaping box to a new 
machine. The old one is 32 bit Centos. The new box was running Centos 
5.5 x86_64. When we went to "restore" our /etc/sysconfig/iptables file, 
it failed on the COMMIT line. We could get it to work if we only did the 
first 101 class C subnets.

I just reinstalled Centos on the new machine running 32 bit, and now it 
can load the exact same file it failed on with 64 bit.


Is this a known limitation of Netfilter/iptables? Is it a bug?

The machine only has 2GB of RAM, so I guess we'll just run 32 bit for 
now. I'd love to know if there is a fix though, in case we (or someone 
else) ever has a need for a large number of iptables rules on a 64bit 
system.

Ethan



-- 
Ethan Sommer
Associate Director of Core Services
Gustavus Technology Services
sommere@gustavus.edu
507-933-7042
