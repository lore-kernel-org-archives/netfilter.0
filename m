From: =?iso-8859-1?q?Christof=20Nyffenegger?= <cnyf@yahoo.de>
Subject: Re: unexpected behaviour...?
Date: Thu, 28 Aug 2003 13:33:29 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030828113329.32071.qmail@web21404.mail.yahoo.com>
References: <Pine.LNX.4.53.0308262037240.3634@xena.cft.ca.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0308262037240.3634@xena.cft.ca.us>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Jim Carter <jimc@math.ucla.edu>
Cc: netfilter@lists.netfilter.org

 --- Jim Carter <jimc@math.ucla.edu> schrieb:
> Hmmm, good point.  However, I think a packet is considered to be part of =
an
> established connection because it has particular header bits set, not
> because of IP address matching in the conntrack tables.  Someone who's mo=
re
> familiar with the sources, could you please confirm or correct this
> statement?

As far as i (thought to) know, a session has to go through the SYN_SENT and
SYN_RCVD states before reaching the ESTABLISHED state. the firewall box has=
 to
see the TCP SYN, SYN/ACK, ACK packets of a new session before the session is
added to the connection table as an established session. if the firewall la=
ter
sees packets belonging to one of the established sessions in it's connection
table, it forwards them if the rulebase is configured so. packets of an
established session which can't be matched against a session in the connect=
ion
table - according to the source and destination sockets - are dropped.=20

> Oh, I didn't understand the configuration.  Hmmm again.  I would really
> expect the http and ssh connections to behave the same.

Yep, thats the point. but they don't.

> What are the
> differences between the connections?  Are the services on different
> operating systems (Linux / Windows), so the TCP stack behaves differently?

The clients are win 2k and Linux, the servers are running Linux (SuSE 8.2,
Knoppix) and solaris 8.

> Maybe you could put the server-side DMZ's switch into promiscuous mode (so
> you can snoop on all packets) and run tcpdump / ethereal / snort.  If any
> machine is somehow using the IP address of the individual firewall box as
> its gateway, its connections won't survive the failover, while if the
> shared address is being used, as it should be, it should work.  The same
> principle applies on the client side too.

We were running sniffers on the win 2k client (winpcap/ethereal) and on the
servers (tcpdump) as well. on the client and the servers, the gateways were=
 set
correctly to the failover addresses of the firewall boxes.
i'm aware that we didn't sniff the complete traffic on the switched network
segments, but since we didn't see any packets belonging to a new session se=
tup
after failover (we would have seen them in the dumps), imho there is no nee=
d to
dig into the stack implementations at this stage. for me it looks really as=
 if
netfilter is not working as it should in this case.


__________________________________________________________________

Gesendet von Yahoo! Mail - http://mail.yahoo.de
Logos und Klingelt=F6ne f=FCrs Handy bei http://sms.yahoo.de

