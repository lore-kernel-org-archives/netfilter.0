From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: Is it possible to Jam windows network neighbour?
Date: Tue, 24 Aug 2004 09:09:58 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512C0@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

> > a firewall can only filter traffic that passes through it.  if your
> > clients are all sitting on a LAN together, there is no way for an
> > upstream firewall to keep them from communicating with each other.
>
> Not quite true, sort of, but we're into Firewall / IPS ( Intrusion
> Prevention System ) territory here.  "Snort" *might* be able to deny
> traffic on the network, failing that you're probably looking at
> commercial software.

good point.  something along the lines of setting up a snort box (with =
flexresp) on a SPAN port and watching for TCP 139/445 traffic and =
resetting the connections?  i played around with this awhile back, and i =
noticed that the snort box generally loses the race in the race =
condition, but it does effectively keep the hosts from communicating.  =
not pretty, but effective enough.

need more coffee...

-j

