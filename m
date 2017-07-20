From: iptables@trodman.com
Subject: quick cut-over iptables to firewalld
Date: Thu, 20 Jul 2017 14:34:38 -0500
Message-ID: <201707201934.v6KJYcj6029286@epjdn.zq3q.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <netfilter-owner@vger.kernel.org>
Content-ID: <29277.1500579278.1@epjdn.zq3q.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Whats are best practice steps 
to migrate a host that is currently running
a simple set of 6 or so iptables rules,
to firewalld?  

Assume I know how to create the firewalld version manually.  The goal is to prepare the firewalld
version in advance and then rapidly swap it in.

--
thanks!,
Tom
