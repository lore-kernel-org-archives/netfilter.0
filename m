From: Pandu Poluan <pandu@poluan.info>
Subject: ipset ipporthash - need -p tcp|udp?
Date: Tue, 15 Mar 2011 02:43:52 +0700
Message-ID: <AANLkTikqUPBmwvGG3Lt5jVR1rdnwA+iOTi4ijfWbC0qs@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

A question's been bugging me since this evening:

Do I need to specify -p tcp|udp if I want to match against an IP set
of type ipporthash?

Or, in other words, can I just write a rule like `iptables -A FORWARD
-m set --match-set SetName dst,dst -j ACCEPT` ?

Rgds,


-- 
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
