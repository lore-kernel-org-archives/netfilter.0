From: Paul Evans <paul@mxtelecom.com>
Subject: -j ROUTE and conntrack
Date: Wed, 29 Oct 2008 15:46:50 +0000
Message-ID: <20081029154650.004cc3b5@nacelle.mxtelecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Our outbound traffic gets SNATted to claim to come from one of several
role IPs. These IPs are hosted on different routers for load
distribution purposes. The choice of which role IP to use depends on
the exact destination IP address / TCP port number the connection goes
to.

I'm using the "-j ROUTE" target to force a routing decision for this,
but it seems to have the side effect of breaking conntrack. Without -j
ROUTE, the outbound connection appears in the conntrack table, so that
when incoming replies arrive, they pass an ESTABLISHED test, and are
let in. If it needs to -j ROUTE on the way out, then when the reply
comes back, no conntrack entry means it fails ESTABLISHED and gets
dropped. It seems that "-j ROUTE --continue" doesn't help either, it
still goes missing.

Can anyone shed any light on this? How to keep the entry in conntrack
even though using -j ROUTE. Failing that, how else to perform a routing
decision override in a way that won't break conntrack?

-- 
Paul Evans <paul@mxtelecom.com>
Tel: +44 (0) 845 666 7778
Fax: +44 (0) 870 163 4694
http://www.mxtelecom.com
