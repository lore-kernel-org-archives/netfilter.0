From: Andreas Schultz <aschultz@tpip.net>
Subject: HOWTO combine a map with snat
Date: Wed, 27 May 2015 17:28:22 +0000 (UTC)
Message-ID: <2059014969.60220.1432747702088.JavaMail.zimbra@tpip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

Hi,

How do I combine a map with snat in nft?

What I want is something like:

add map nat vnat { type ipv4_addr : snat; }
add element nat vnat { 10.0.0.1 : 1.1.1.2:3001-4000 }
add element nat vnat { 10.0.0.2 : 1.1.1.2:4001-5000 }

Is this somehow achivable with nft???

Andreas


-- 
-- 
Dipl. Inform.
Andreas Schultz
