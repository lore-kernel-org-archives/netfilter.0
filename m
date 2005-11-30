From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: DMZ Setup Question
Date: Wed, 30 Nov 2005 13:32:16 -0500
Message-ID: <FAC4E024BF776842876169173CE2F01313B204@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: jzorzi@marketlinksolutions.com, netfilter@lists.netfilter.org

Inline...=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Jay Zorzi
> Sent: Wednesday, November 30, 2005 11:22 AM
> To: netfilter@lists.netfilter.org
> Subject: DMZ Setup Question
>=20
> My colleague and i are having a disagreement about our=20
> network firewall and routing policies.  First the setup information.
> We have a Bridge Router running iptables and ebtables as our=20
> external firewall.  Behind that we have a DMZ that contains=20
> machines with valid external addresses.  Between the DMZ and=20
> our internal network there is another firewall.  Our choke=20
> firewall.  The choke firewall is doing NAT in order for our=20
> internal network to surf the Internet but for our DMZ=20
> machines to talk to our internal machines we are just using=20
> routing, no NAT.

When you say DMZ machines are talking to internal machines, do you mean
that you've set up routes to the choke firewall for your private subnet
on the DMZ machines?

> Now here is the disagreement.  Because the internal machines=20
> are using a private network address my colleague is concerned=20
> that we are violating Internet rules/etiquette by having this=20
> internal private ip's routing to our DMZ machines that have=20
> valid Internet IP's.  He is also suggesting that using nat is=20
> more secure.
>=20
> Can someone help us settle this disagreement?

I can't speak to Internet etiquette, but clearly you are following the
rules else things wouldn't be working. It is not as though what you are
doing will "break the Internet." NAT does not make anything more
"secure", it just simplifies routing. You can have a wide-open system
with NAT or a closed system using routing.

My inclination would be to use NAT (MASQUERADE) for your internal hosts
just because it makes things simpler (not necessarily more secure) and
your DMZ doesn't need routes to your internal network. Some may say then
that simpler is more secure and I agree, but I still say that NAT is a
routing tool and not a security tool.

Derick Anderson

