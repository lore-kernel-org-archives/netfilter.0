From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: SNAT multiple address allocation, connection tracking
Date: Mon, 14 Jun 2004 20:13:06 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087258386.2047.14.camel@localhost>
References: <40CE1F42.4030705@dunslane.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40CE1F42.4030705@dunslane.net>
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
To: Andrew Dunstan <andrew@dunslane.net>
Cc: netfilter@lists.netfilter.org

On Mon, 2004-06-14 at 17:57, Andrew Dunstan wrote:
> Hi,
> 
> I have this problem.
> 
> eth0 is internal network, eth1 is external network
> eth1 has a large set of additional virtual addresses
> 
> all connections go from internal to external
> 
> Third party app does this in fairly quick succession: telnet session, 
> close, ftp (non-passive), close, pop3 session, close.
> 
> The app needs each of these to get the same SNAT address (from the pool 
> of virtual addresses) on the external interface, because at the other 
> end some state is kept based on the IP address (crazy, I know, but true).
> 
> However, if another host uses the same address it in effect clobbers the 
> previous state, so each host (within some shortish period) needs to get 
> a different address from any other host.
> 
> My reading suggests that SNAT with a range does some sort of round robin 
> or LRU on a per connection basis, rather than reusing an address that 
> the same host recently used. Is this correct?
> 
> I can't nail the addresses up, because some will be DHCPd hosts from a 
> larger pool than I have available.
> 
> Can someone please suggest a combination of modules and rules that will 
> do what I need?
> 
> TIA
> 
> andrew

Ouch! That's a tough one.  If it were not for the address pool mismatch,
you could use the NETMAP patch.  The only thought that comes immediately
to mind is to move the application to some shared pool of virtual
servers.  That is, set up some number of terminal servers /thin client
hosts with addresses that are mapped one-to-one through NETMAP and have
users access the application through some thin client mechanism.

If the likelihood of simultaneous access is remote, I suppose one could
nail up all the addresses with one SNAT each (yuch!) even if there is
some duplication but I hate solutions where I know success is a matter
of probability and not predetermined based upon sound engineering!

I'll be curious to see what some of the more experienced folks with more
think time come up with short of writing some custom helper module -
John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 


