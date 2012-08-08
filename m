From: Michael Vallaly <netfilter@nolatency.com>
Subject: Strange NOTRACK / CT --notrack causing connmark matching?
Date: Wed, 8 Aug 2012 16:21:00 -0500
Message-ID: <20120808162100.9dcd8066406f99f3ef17df71@nolatency.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


Hello list,

We are having a strange problem with netfilter, which we seem to
have traced down to a single entry in the raw table (specifically one
with NOTRACK / CT --notrack) that causes the matching packet to be
assigned an unrelated/erroneous connmark from an unrelated DNAT?.

At at very high level we are attempting to route packets sent to vlan99
to a different directly connected interface using FWMARK + iproute2.
The vlan99 interface on the target is also in the path for DNAT response
traffic which we are attempting to match using connmark (0x2). 

Long story short:
-A PREROUTING -s 10.1.99.0/24 -d 10.11.12.0/24 -i vlan99 -m addrtype !
--dst-type LOCAL -j CT --notrack 

^^ Seems to cause all matching traffic from an external host to _GAIN_
an unrelated connmark?

We had to hack up the TRACE target to narrow it down, but this magical
transformation seems to happen via solely the raw table?

Here is the patch:  connmark_trace.patch - http://pastebin.com/XAcV8HU2

Debugging details so far + logs (and TRACE output) can be found here:

http://pastebin.com/FQTjqCD7

Where/how does the connmark get set between TRACE timestamps 
92859.376260 and 92859.421921 ? Is this a bug in netfilter/connmark or
mis-configuration on our end?

Anyone have any ideas on how to debug further or what may be going
here? We don't get any entries matching this connmark in conntrack -L
either. The only solution I have come up with so far is making line 30
_MORE_ explicit in its match of the DNAT traffic, ignoring internal
address space. Am I missing something? 

Thanks for your time..

-Mike

-- 
Michael Vallaly <mvallaly@nolatency.com>
