From: Corin Langosch <info@corinlangosch.com>
Subject: network namespaces and conntrack
Date: Sat, 26 Sep 2015 10:54:50 +0200
Message-ID: <56065D5A.9050701@corinlangosch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi guys,

do network namespaces share conntrack data structures under the hood or does each netns get its own? So is it possible
that a (malicious) program in netns1 can overflow conntrack on the host or any other netns or is it safe? Can the tables
(size, hash size, ...) be tuned individually for each netns?

Cheers
Corin
