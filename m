From: Pandu Poluan <pandu@poluan.info>
Subject: When does NAT processing actually takes place?
Date: Thu, 17 Mar 2011 07:20:28 +0700
Message-ID: <AANLkTi=8aYepwRCxcCpo+syL4xjX6HkEFtPVbepZDf05@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Another question that's been bugging me:

When does the actual NAT process (i.e., swapping addresses) take place
for DNAT and SNAT/MASQUERADE? And when does the reciprocal NAT (i.e.,
reverse NAT, that should happen for instance to process a reply to a
packet that's been SNAT-ed) take place?

My guess is just after the packet exits the nat table, before it
enters the mangle table.

Am I correct?

Rgds,


-- 
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
