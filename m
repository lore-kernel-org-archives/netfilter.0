From: Katriel Traum <katriel@traum.org.il>
Subject: Re: DNAT/MASQ Precedence
Date: Fri, 31 Jan 2003 13:14:06 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301311314.06777.katriel@traum.org.il>
References: <200301301931.41645.katriel@traum.org.il> <200301310958.38656.katriel@traum.org.il> <20030131101420.GU11221@miggy.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030131101420.GU11221@miggy.org>
Content-Description: clearsigned data
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: Text/Plain; charset="windows-1255"
To: Athan <netfilter@miggy.org>
Cc: netfilter@lists.netfilter.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Friday 31 January 2003 10:14, Athan wrote:
> On Fri, Jan 31, 2003 at 09:58:35AM +0000, Katriel Traum wrote:
> > On Thursday 30 January 2003 19:34, Athan wrote:
> > > On Thu, Jan 30, 2003 at 07:31:38PM +0000, Katriel Traum wrote:
> > > > I want to redirect _all_ traffic into the DMZ (is that even
> > > > possible?) and in the same time MASQ the LAN. The question is will
> > > > they collide? If I use a ruleset such as:
> > > > iptables -A PREROUTING -i $INET_IF -j DNAT --to-destination $DMZ_IP
> > > > iptables -A POSTROUTING -o $INET_IF -j MASQUERADE
> > > > (yes, there's only one computer in the DMZ)
> > > >
> > > > Will I get return traffic into my lan? won't it be DNATed into the
> > > > DMZ?
> > >
> > >   You need at least one public IP that is *NOT* in the DMZ.  Then
> > > change the DMZ rule to exclude on this:
> > >
> > > iptables -A PREROUTING -i $INET_IF -d ! <not-DMZ IP> -j DNAT
> > > --to-destination $DMZ_IP
> >
> > Well, the problem is I have 1 public IP via a cable modem.
> > So I ask again, if I DNAT everything into the DMZ lan, and try to MASQ =
my
> > private lan, will I even get return traffic?
>
>   That would be a problem yes, as the PREROUTING gets done before the
> POSTROUTING and will change the packets prior to the routing decision.
> You may be able to get away with reserving a range of ports to be used
> with SNAT though as the --to-source argument can take a range of port
> numbers.
>
> 	iptables -A PREROUTING -i $INET_IF -p tcp --dport ! port1:port2 -j DNAT
> --to-destination $IP
>
> 	iptables -A POSTROUTING -o $INET_IF -s <LAN network> -j SNAT --to-source
> $IP:port1-port2
>
> Note that the DNAT rule DOES now mention protocol explicitly, it has to
> for --dport to be valid.  Duplicate the line with "-p udp" if you also
> need UDP to be working.
>   For non UDP/TCP (i.e. ICMP) to work correctly you have to hope a few
> rules with the appropriate -m state will do the right thing.  AIUI they
> should as how they treat things should be based on the connection
> tracking table.
Okay, sounds good, so say I want to save me a 2000 SNAT ports (I don't thin=
k=20
I'll have 2000 sockets open at the same time)
here's the ruleset I should use:

iptables -A PREROUTING -i $INET_IF -p tcp --dport ! 60000:62000 -j DNAT \
=2D --to-destination $DMZ_IP
iptables -A PREROUTING -i $INET_IF -p udp --dport ! 60000:62000 -j DNAT \
=2D --to-destination $DMZ_IP

iptables -A POSTROUTING -o $INET_IF -i $LAN_IF -j SNAT --to-source \
 $INET_IP:60000-62000
=20
as for ICMP, I didn't quite understand you. can you elaborate?

Thanks!
>
> -Ath

=2D --=20
+katriel                                                =EB=FA=F8=E9=E0=EC+
pgp key: traum.org.il/gpg.asc
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+OnaeDWy+Hv/461sRAltIAKCU6yz8Skmcl20bHgnv9aPGOj8PlACdEM3r
KxSFqh3zQlw1guKUYi5poxE=3D
=3DsaOz
=2D----END PGP SIGNATURE-----


