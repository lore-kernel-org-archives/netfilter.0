From: Robert White <rwhite@pobox.com>
Subject: Why is --in-interface illegal in POSTROUTING?
Date: Mon, 3 Jul 2017 23:56:17 +0000
Message-ID: <a63f701b-bf6f-8f50-e330-3c7f3b26424b@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-CA
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Someone just pointed out that --in-interface is not legal in the
POSTROUTING rules. I can think of several reasons to use this
information directly at that point (instead of redundant marking ans so
forth).

Does the in-interface information get lost somehow or is that just an
arbitrary restriction?


