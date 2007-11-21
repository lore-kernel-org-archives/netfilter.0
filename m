From: Helge Hafting <helge.hafting@aitel.hist.no>
Subject: Is it possible to do bonding/connection teaming with non-ethernet
 devices?
Date: Wed, 21 Nov 2007 15:31:27 +0100
Message-ID: <4744413F.1000700@aitel.hist.no>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I am trying to set up a mobile router using linux. It connects to 
several ISPs
using 3G connections, and offers a NATed wireless network for clients.

I wish to utilize the bandwith when all ISPs are available, and
be able to provide internet access for all as long as at least one
ISP is available.

I have looked at bonding and "ifenslave". But I can't use this
because some of the 3G devices provides ppp links like
ppp0, ppp1, ... and bonding seems to want physical ethernet devices only.
Windows was able to do this - but the os turned out to be too unstable.

Is there some other approach that might work?

Helge Hafting
