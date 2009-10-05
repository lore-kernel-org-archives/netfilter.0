From: Roman Fiedler <roman.fiedler@ait.ac.at>
Subject: Understanding conntrack: Delete and manual readd of same entry possible?
Date: Mon, 5 Oct 2009 09:55:20 +0200
Message-ID: <4AC9A668.3050009@ait.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi list,

The failure to conduct a simple test with conntrack makes me believe, 
that I misunderstood some part of the concept.

The testcase:

* Create one forwarded tcp connection via iptables-firewall and leave it 
open
* Delete the conntrack entry of this connection
* Readd the same conntrack entry with conntrack -I
* Verify, that old and new entry looked the same (conntrack -L)
* Send one more byte over the still open tcp connection

The expected result:
* TCP flow continues without creating a new conntrack entry, using the 
one added manually
* ACCEPT via ESTABLISHED rule because of valid conntrack entry

The actual result:
* Conntrack code seems to believe, that packets do not belong to 
conntrack entry
* Conntrack code does not create new conntrack entry
* Conntrack code cannot update conntrack-entry even when packet is accepted.

Can someone enlighten me, if manual entry creation is possible?

Thanks, Roman
