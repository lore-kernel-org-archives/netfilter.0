From: richard lucassen <mailinglists@lucassen.org>
Subject: doc on user defined chains
Date: Thu, 9 Jan 2014 22:17:03 +0100
Message-ID: <20140109221703.785eeaca09947c8fee885fe6@lucassen.org>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Is there a document with the exact description of the syntax of the
name of a user defined chain? Searching google on this subject generates
a lot of noise. The only thing I can find is an error message by
iptables itself:

# iptables -N ABCDEFGHIJ12345678901234567890
iptables v1.4.21: chain name `ABCDEFGHIJ12345678901234567890' too long
(must be under 29 chars)

Ok, 28 chars max, but which chars? I read somewhere on the net that a
hyphens are allowed, but underscores are not. However, iptables does
not complain when I feed it underscores.

Anyone a link to the authoritative doc?

R.

-- 
___________________________________________________________________
It is better to remain silent and be thought a fool, than to speak
aloud and remove all doubt.

+------------------------------------------------------------------+
| Richard Lucassen, Utrecht                                        |
+------------------------------------------------------------------+
