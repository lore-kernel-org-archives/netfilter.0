From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: unexpected behaviour...?
Date: Tue, 26 Aug 2003 20:52:13 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0308262037240.3634@xena.cft.ca.us>
References: <20030826194801.53066.qmail@web21414.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030826194801.53066.qmail@web21414.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?iso-8859-1?q?Christof=20Nyffenegger?= <cnyf@yahoo.de>
Cc: netfilter@lists.netfilter.org

On Tue, 26 Aug 2003, Christof Nyffenegger wrote:

>  --- Jim Carter <jimc@math.ucla.edu> schrieb:
> but what about the connection table on firewall B? it contains no established
> ssh session - in fact no session at all, since it didn't forward any traffic so
> far. only established and related sessions are allowed in its rulebase, plus
> explicitly defined NEW sessions of course (for example the forementioned ssh
> connection). now i ask myself why the ssh session appears in the connection
> table as an established session on firewall B if the session was not
> established through firewall B? or maybe i missunderstand the concept of a
> stateful firewall from the ground up...?

Hmmm, good point.  However, I think a packet is considered to be part of an
established connection because it has particular header bits set, not
because of IP address matching in the conntrack tables.  Someone who's more
familiar with the sources, could you please confirm or correct this
statement?

> the proxy server is not running on the firewalls - it was a http donwload
> *through* firewall A from a browser client to a squid proxy elsewhere in the
> network. as i mentioned it's no surprise to see this session freeze after
> failover. but the point is that the ssh session did NOT freeze after failover.
> i think i understand why the ftp and http sessions froze, but i don't
> understand why the ssh session did not.

Oh, I didn't understand the configuration.  Hmmm again.  I would really
expect the http and ssh connections to behave the same.  What are the
differences between the connections?  Are the services on different
operating systems (Linux / Windows), so the TCP stack behaves differently?
Maybe you could put the server-side DMZ's switch into promiscuous mode (so
you can snoop on all packets) and run tcpdump / ethereal / snort.  If any
machine is somehow using the IP address of the individual firewall box as
its gateway, its connections won't survive the failover, while if the
shared address is being used, as it should be, it should work.  The same
principle applies on the client side too.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)

