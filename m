From: Tom Van Overbeke <tvanoverbeke@ccncsi.net>
Subject: daisy chaining firewalls causes connection tracking problems ?
Date: Tue, 12 Aug 2003 15:38:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000501c360d7$0b5f5ca0$d90315ac@rsrc.be.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

Hi,


I'm faced with an environment where there are 3 iptables firewalls directly
connected to one another. I have a few servers on one end, that need to talk
to servers on the other end of the 3 firewalls. (we use fwbuilder to
maintain the firewalls).

normally, i have no problems adding stateful rules to enable/disable
traffic, but in this case, i seem to either have hit a bug, or maybe a
limitation of iptables ???


my case:

i need to have a server talk to our backup server via an agent. we know
which ports the backup app uses, and have before succesfully changed our
firewall to enable backups on previous occasions.

now, with 3 firewalls in between, i thought i could just use the exact 3
rules and put them on each firewall, and it should work.


but ... it doesn't. on one of the outer firewalls, i see that the session
setup packets (ACK SYN bits are set) is being blocked.


i had already solved a similar problem (with big brother) by doing it the
'ipchains' way, that is creating a rule for the traffic in each direction,
and disabling the 'statefulness' of the rule. obviously, i'm not too happy
with this solution, so I'd thought i ask you guys if the connection tracking
might have problems with multiple firewalls chained together ?



thx,


Tom.





****************************************************************************
Disclaimer: 
This electronic transmission and any files attached to it are strictly 
confidential and intended solely for the addressee. If you are not 
the intended addressee, you must not disclose, copy or take any
action in reliance of this transmission. If you have received this 
transmission in error, please notify the sender by return and delete
the transmission.  Although the sender endeavors to maintain a
computer virus free network, the sender does not warrant that this
transmission is virus-free and will not be liable for any damages 
resulting from any virus transmitted. 
Thank You.
****************************************************************************


