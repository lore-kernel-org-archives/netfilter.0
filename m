From: "Martin Fandel" <pingu.freak@gmx.de>
Subject: LXC and VLAN's?
Date: Wed, 23 Feb 2011 16:04:29 +0100
Message-ID: <20110223150429.210370@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

i know this is not the right mailing list for that, but maybe someone of you have a solution for it. VLANs are working under LXC, but it seems, that LXC doesn't support native vlan tagging. In consequence, i've to set down the mtu size on the client side to 1496. Does someone know about to fix this issue? I've also written to the LXC mailing list, but don't get any answer :/. It seems that not many are using vlans in containers?!

Thanks!

Regards,

Martin
-- 
GMX DSL Doppel-Flat ab 19,99 Euro/mtl.! Jetzt mit 
gratis Handy-Flat! http://portal.gmx.net/de/go/dsl
