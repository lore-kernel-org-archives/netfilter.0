From: Alex Bligh <alex@alex.org.uk>
Subject: Use iptables to force next hop
Date: Thu, 8 Nov 2012 21:08:10 +0000
Message-ID: <FABE6FFC-E757-421A-BB4B-F18975F31E9B@alex.org.uk>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: Alex Bligh <alex@alex.org.uk>

Is it possible to use iptables to force the next hop in (e.g.) the FORWARD table?

I know it is possible to do this with 'ip rule' and friends, but for various reasons (non-proliferation of tables) I'd like to do this in just iptables if possible. Let's assume I know what I'm doing, and the effect that I want is that if the iptables rule matches, I want to set the next hop (irrespective of the routing table) to an IP address which I can guarantee is on a directly connected interface.

-- 
Alex Bligh




