From: Ian Pilcher <arequipeno@gmail.com>
Subject: ebtables rules for specific bridge
Date: Mon, 12 Apr 2021 16:29:51 -0500
Message-ID: <s52e4f$nr6$1@ciao.gmane.io>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I need to create the equivalent of a PVLAN for a few VMs on an older
(EL7) hypervisor.  This hypervisor has multiple Linux bridges, so I
need to create ebtables rules that affect the "PVLAN" bridge, but not
the other bridges on the box.

My searches haven't come up with any examples for this particular
scenario.  Looking at ebtables(8), I have a suspicion that --logical-in
and/or --logical-out may have a role to play, but I'm not sure that's
true or when to use which.

Any hints would be appreciated.

Also, -Ln and -Lc don't seem to have any effect (beyond that of -L).  Is
there some trick to actually showing line numbers and/or counters in the
ebtables output?  (This is ebtables 2.0.10 on kernel 3.10.0.)

Thanks!

-- 
========================================================================
                  In Soviet Russia, Google searches you!
========================================================================

