From: =?iso-8859-1?q?Christof=20Nyffenegger?= <cnyf@yahoo.de>
Subject: Re: unexpected behaviour...?
Date: Tue, 26 Aug 2003 21:48:01 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030826194801.53066.qmail@web21414.mail.yahoo.com>
References: <Pine.LNX.4.53.0308251407140.2855@xena.cft.ca.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0308251407140.2855@xena.cft.ca.us>
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

 --- Jim Carter <jimc@math.ucla.edu> schrieb: > On Sat, 23 Aug 2003, Christ=
of
Nyffenegger wrote:
> > We're in trouble with our brand new linux hot standby firewall cluster.=
 it
> --- snip ---
>=20
> > now one would expect all the sessions to freeze immediately after failo=
ver.
> > this is the case indeed with the ftp session and the http download - th=
ey
> > freeze to ice because FW B has no established sessions in its connection
> table
> > when it acquires the service adresses and the connections are routed
> through it
> > (after the gratuitous arp from heartbeat). but surpise - the ssh session
> > survives the failover. a few seconds after the failover it shows up in =
the
> > connection table on FW B as an established session. Hmm.
> --- snip ---
> > am i getting something wrong? or is this the expected behaviour?
>=20
> It's the behavior I expect :-)  When the MAC address of the gateway chang=
es
> from firewall A to firewall B, the packets of the SSH connection go there
> and are routed through, no sweat.

but what about the connection table on firewall B? it contains no establish=
ed
ssh session - in fact no session at all, since it didn't forward any traffi=
c so
far. only established and related sessions are allowed in its rulebase, plus
explicitly defined NEW sessions of course (for example the forementioned ssh
connection). now i ask myself why the ssh session appears in the connection
table as an established session on firewall B if the session was not
established through firewall B? or maybe i missunderstand the concept of a
stateful firewall from the ground up...?=20

>=20
> FTP is another matter.  The control channel is getting through, I'm sure,
> but if you fail over, most likely firewall B would not be aware that that
> it's a FTP control channel and would not do the conntrack magic necessary
> to let the FTP server originate data connections to the client, or in
> passive mode, to let the client originate data connections to the arbitra=
ry
> ports that the server tells it to use.  Similarly for any service that us=
es
> multiple connections.

the ftp session freezes because there is nor a control nor a related data
connection in the connection table on firewall B - no surprise.

>=20
> On the HTTP proxy action, if you failed over in the middle of a download,
> of course it would freeze, because the proxy on the other server would not
> have an established connection and the packets would be tossed, but
> subsequent downloads should work, since each one is an independently open=
ed
> connection.  Unless for some reason the server on firewall A answered usi=
ng
> its own IP address and the client said, hey, I used the proxy on
> 192.168.2.3 (the shared address), but it's answering from 192.168.2.1, so
> I'm supposed to use that from now on.  When the failover happened, the
> client would find that it had been too smart for its own good.
>=20

the proxy server is not running on the firewalls - it was a http donwload
*through* firewall A from a browser client to a squid proxy elsewhere in the
network. as i mentioned it's no surprise to see this session freeze after
failover. but the point is that the ssh session did NOT freeze after failov=
er.
i think i understand why the ftp and http sessions froze, but i don't
understand why the ssh session did not.

Thanks for any pointers

__________________________________________________________________

Gesendet von Yahoo! Mail - http://mail.yahoo.de
Logos und Klingelt=F6ne f=FCrs Handy bei http://sms.yahoo.de

