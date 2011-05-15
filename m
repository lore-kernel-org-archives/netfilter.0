From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: UDP packet and INVALID state
Date: Sun, 15 May 2011 17:15:38 +0200
Message-ID: <4DCFEE1A.2080504@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello all,

What are the possible conditions for a UDP packet to have the INVALID
state but still be accepted by the destination ?

I already found a previous reply from Jozsef Kadlecsik mentionning the
following conditions :

- the header is too small, truncated or malformed, etc.) ;
- the IP addresses or the protocol parameters (ports) for a unique
  tuple (src ip, dst ip, proto, src "port", dst "port") cannot be
  extracted from the packet.

But wouldn't that also make the destination discard the packet ?

Are there other conditions ?
Maybe if the conntrack table is full ?

Thanks for all insights.
