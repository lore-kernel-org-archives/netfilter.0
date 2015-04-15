From: Eric Leblond <eric@regit.org>
Subject: Re: Alternatively
Date: Wed, 15 Apr 2015 13:25:36 +0200
Message-ID: <1429097136.30959.4.camel@regit.org>
References: <EF695DA0-9C90-4E93-BDDD-875FE7F6AE00@fox-it.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <EF695DA0-9C90-4E93-BDDD-875FE7F6AE00@fox-it.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kees-Jan Hermans <hermans@fox-it.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

On Wed, 2015-04-15 at 11:21 +0000, Kees-Jan Hermans wrote:
> Could someone please explain how the nfq_set_verdict function works? More specifically, what must be in the data_len and buf parameters - an IP packet (like the one you get out of nfq_get_payload())? Must it be the same pointer as you get out of nfq_get_payload or may it be different? The documentation is a bit terse on that.

0 and NULL are ok if you don't want to do packet modification. It you
wanna modify packet then you pass the raw IP data and the length. Please
note that if you set checksum to 0 they will be compute by the kernel.

Please check:
https://home.regit.org/netfilter-en/using-nfqueue-and-libnetfilter_queue/


BR,
-- 
Eric Leblond <eric@regit.org>

