From: Noino <mg8c1zu02@sneakemail.com>
Subject: simple port translation on the localhost / local loopback
Date: Thu, 27 Mar 2008 22:16:43 +0100
Message-ID: <20080327211643.B37CA78C86@gam.mel.teaser.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi, List ! 

I wish to submit to you experts an apparently simple problem involving port 
address translation on the localhost/local loopback, which I've tried and 
tried and read and couldn't find an authoritative answer for. 

Setup: Linux SUSE w/ kernel 2.6.5. Iptables v. 1.2.9.
Have a relay DNS listener on UDP port 10053.
Most DNS clients only know to contact a DNS server on port 53 though. 

Problem: using netfilter/ip divert packets from local clients to hit port 
10053 instead of 53, and of course responses should come back to requesters 
appearing as though coming from port 53. This is very elementary PAT, but 
... whatever I've tried using iptables, either one of two equally incorrect 
things happen : 

 - (DNAT) requests hit the server, but the port number in replies in 
untouched hence replies are ignored, or
 - (SNAT) replies disappear in the ether & requesoer times out... 

Searching found that, maybe, a kernel option : CONFIG_IP_NF_NAT_LOCAL should 
be necessary for PAT to work on the local host; can you confirm that it 
would indeed work if I were to recompile my kernel with that option set ?  
Further search seemes to imply that this option was removed from later 
kernels altogether, which gets even more confusing... 

Can you help me set up the very basic port translation I need, using my 
existing software if at all possible ? 

What alternative options exist ? I've read about a thing called "Fast-NAT", 
which unfortunately also seems to have been broken even before the 2.6 
kernels. Is linux following the lead of the "other" OS in carelessly 
breaking things along the road? \\\\\\\\\rub-out last question. 

Regards, 

-- 
Noino 

-- 
Noino

