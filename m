From: richard lucassen <mailinglists@lucassen.org>
Subject: string match
Date: Sun, 15 Jul 2012 15:26:34 +0200
Message-ID: <20120715152634.664762f582ce74ee16e7449b@lucassen.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello list,

Is it possible to select the last 8 bytes of a HEX string using the
"string" module?

Purpose: I want to create a "DNS ANY query" recent-filter (tons
of these queries from China). The last 8 bytes of such a query seem to
be:

00 FF 00 01

but AFAIU the manpage I can't use the --to and --from offset settings as
the length of the packet is variable.

Anyone another solution to block these queries?

R.

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
| Public key and email address:                                    |
| http://www.lucassen.org/mail-pubkey.html                         |
+------------------------------------------------------------------+
