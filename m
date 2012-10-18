From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: How to block all packets not destined to local IP's ?
Date: Thu, 18 Oct 2012 03:29:22 +0200
Message-ID: <k5nm1g$brb$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Subtitle: [xtables geoip] rules not applied to packets for non-configured IP's

Hi,
from the router link (just 1 link) I'm getting traffic for multiple IP's
(a quasi multihomed system, actually a host node and multiple virtual systems therein),
that's correct so, but is there a way to drop all packets to IP's
that are actually not configured on the local system?
Is there a better way than writing a drop/reject-rule for each such IP?

And related to this, I think there is a bug in xtables geoip
because if there is a packet for such a not-configured IP
then the iptables rules (at least geoip rules) aren't applied to such packets.
How to fix this?

Confirmation, fixes and workarounds welcome. Thx.

