From: "David Sparks" <dave@ca.sophos.com>
Subject: DNAT multiple --to-destination gone: why?
Date: Wed, 09 Jul 2008 17:32:44 -0700
Message-ID: <487558AC.8080704@ca.sophos.com>
Reply-To: "David Sparks" <dave@ca.sophos.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@vger.kernel.org

According to man iptables:

DNAT...
               In Kernels up to 2.6.10 you  can  add  several  --to-destination
               options.  For those kernels, if you specify more than one desti-
               nation address, either via an address range  or  multiple  --to-
               destination  options, a simple round-robin (one after another in
               cycle) load  balancing  takes  place  between  these  addresses.
               Later  Kernels  (>= 2.6.11-rc1) don't have the ability to NAT to
               multiple ranges anymore.

I'm wondering why this feature was removed?

What are the workarounds/alternatives?

The reason I ask is that I'm using the range feature to DNAT packets 
round-robin to 5 machines (.101-.105).  .103 just had a hard drive failure and 
when I went to remove it from the iptables config I find I can't do that 
anymore as the feature was removed!  I've worked around the problem by 
re-IPing a machine but I'm wondering if there is a iptables solution to this 
so I'll be better prepared in future?

Thanks!

ds
