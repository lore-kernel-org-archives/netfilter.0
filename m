From: Thomas Jacob <jacob@internet24.de>
Subject: Quickly checking number of rules/chains
Date: Wed, 26 Nov 2008 16:43:50 +0100
Message-ID: <1227714230.8883.7.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello list,

Is there a way to quickly get some sort of indication from /proc, the
iptables-output or another tool, how many rules / chains are
configured? 

I'm looking for something that can frequently check this without having
to transfer the whole ruleset from the kernel and decode it, which
can take up a considerable amount of resources if you have a
really huge rulesets (XXXk rules), in order to determine whether
any rules are loaded yet.


   Thanks & Regards,
       Thomas



