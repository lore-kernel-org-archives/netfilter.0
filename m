From: Kees-Jan Hermans <hermans@fox-it.com>
Subject: Alternatively
Date: Wed, 15 Apr 2015 11:21:58 +0000
Message-ID: <EF695DA0-9C90-4E93-BDDD-875FE7F6AE00@fox-it.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Content-ID: <3AD7951BB522A84684F213F9263AA5A9@fox-it.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Could someone please explain how the nfq_set_verdict function works? More specifically, what must be in the data_len and buf parameters - an IP packet (like the one you get out of nfq_get_payload())? Must it be the same pointer as you get out of nfq_get_payload or may it be different? The documentation is a bit terse on that.

Thanks!

KJ