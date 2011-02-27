From: Alex Bligh <alex@alex.org.uk>
Subject: turning off iptables processing for bridged packets
Date: Sun, 27 Feb 2011 15:04:32 +0000
Message-ID: <DD1D3360D73274A4C51A9FAB@Ximines.local>
Reply-To: Alex Bligh <alex@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Alex Bligh <alex@alex.org.uk>

By default netfilter appears to apply iptables rules (specifically the
FORWARD chain) to bridged packets. Is there a way to turn this off
(i.e. only apply the FORWARD chain to routed packets, not bridged
ones)? I seem to remember there is, but I can't for the life of
me find the configuration setting.

-- 
Alex Bligh
