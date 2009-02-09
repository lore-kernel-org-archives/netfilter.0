From: Ralf <rm@amitrader.com>
Subject: Hooks for own protocol implementation
Date: Mon, 09 Feb 2009 03:46:34 +0100
Message-ID: <gmo5eb$ik9$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I want to implement my own protocol incl. session handshake.
Does iptables/netfilter have API functions for this case?
Ie. passing all packets to/from to a port, without modifying them.

