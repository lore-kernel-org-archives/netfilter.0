From: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Subject: module owner does not work
Date: Mon, 1 Mar 2010 10:33:48 +0100
Message-ID: <15785B7E063D464C86DD482FCAE4EBA5D794CFF8D5@XCH11.scidom.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: de-DE
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "'netfilter@vger.kernel.org'" <netfilter@vger.kernel.org>

Hello,

I'd like to use the owner module to limit access to somes hosts just for some users. But it doesn't work.
My rule is:
iptables -I OUTPUT -d 0.0.0.0/0 -m owner --uid-owner 1000 -j REJECT
This is a very wide rule, just for testing purpose.

But uid 1000 is still able e.g. to send emails from the shell using mail.
I googeled already a lot, and found people saying the owner-module was canceled in Kernel 2.6.14, others saying that it still works in kernel 2.6.18. Some say it does not work with a SMP host. But i have the default kernel and only one CPU. Please help me, i'm running out of ideas.
I'm running SLES 10 SP3, kernel 2.6.16.60-0.59.1-default, iptables 1.3.5 .

Bernd
