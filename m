From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: unexpected behaviour...?
Date: Mon, 25 Aug 2003 14:29:13 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0308251407140.2855@xena.cft.ca.us>
References: <20030822224241.97443.qmail@web21408.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030822224241.97443.qmail@web21408.mail.yahoo.com>
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

On Sat, 23 Aug 2003, Christof Nyffenegger wrote:
> We're in trouble with our brand new linux hot standby firewall cluster. it
--- snip ---

> now one would expect all the sessions to freeze immediately after failover.
> this is the case indeed with the ftp session and the http download - they
> freeze to ice because FW B has no established sessions in its connection table
> when it acquires the service adresses and the connections are routed through it
> (after the gratuitous arp from heartbeat). but surpise - the ssh session
> survives the failover. a few seconds after the failover it shows up in the
> connection table on FW B as an established session. Hmm.
--- snip ---
> am i getting something wrong? or is this the expected behaviour?

It's the behavior I expect :-)  When the MAC address of the gateway changes
from firewall A to firewall B, the packets of the SSH connection go there
and are routed through, no sweat.

FTP is another matter.  The control channel is getting through, I'm sure,
but if you fail over, most likely firewall B would not be aware that that
it's a FTP control channel and would not do the conntrack magic necessary
to let the FTP server originate data connections to the client, or in
passive mode, to let the client originate data connections to the arbitrary
ports that the server tells it to use.  Similarly for any service that uses
multiple connections.

On the HTTP proxy action, if you failed over in the middle of a download,
of course it would freeze, because the proxy on the other server would not
have an established connection and the packets would be tossed, but
subsequent downloads should work, since each one is an independently opened
connection.  Unless for some reason the server on firewall A answered using
its own IP address and the client said, hey, I used the proxy on
192.168.2.3 (the shared address), but it's answering from 192.168.2.1, so
I'm supposed to use that from now on.  When the failover happened, the
client would find that it had been too smart for its own good.

You might try setting "ServerName 192.168.2.3:80" in
/etc/apache2/httpd.conf, and see if that makes a difference in the client's
behavior, because the default for ServerName is the box's own IP address
on the interface that the request came from.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)

