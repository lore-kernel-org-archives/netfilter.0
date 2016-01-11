From: "Amaro, Anthony" <anthonyamaro@txstate.edu>
Subject: how to migrate legacy netfilter rule that used "--userspace-helper"
Date: Mon, 11 Jan 2016 18:49:29 +0000
Message-ID: <18D278887C13234AB310CEB9573BF701358E0659@EXCHMBX8.matrix.txstate.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello everyone!

I've inherited some code that appears to depend on some deprecated net filter behavior (linux kernel 2.6). The rule uses the connection tracker "CT" and then has a switch called "--userspace-helper". Looking at the documentation for modern netfilter, this appears to have been replaced with "--helper ftp" or some other registered helper. I cannot find any documentation that states what this switch does, and how connection tracker handled matching rules intended to be prerouted to userspace using this switch.

example with a dummy port number:
-A PREROUTING -p tcp -p tcp --dport 12345 -j CT --userspace-helper

Ultimately my question is how can I migrate the older --userspace-helper rule to work with a newer netfilter implementation (linux kernel 4.1)? If I try to use the switch then iptables errors out claiming it's unrecognized. Must I create a helper module to handle the traffic, or is there some other way to have netfilter work the way it did before with the --userspace-helper switch?

If I have to port the old behavior using a new netfilter helper module, is there any documentation somewhere that describes how it forwarded packets in this older manner so I can translate from old to new behavior?

Thanks!

Anthony