From: Katriel Traum <katriel@traum.org.il>
Subject: Re: DNAT/MASQ Precedence
Date: Fri, 31 Jan 2003 13:41:11 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200301311341.11635.katriel@traum.org.il>
References: <200301301931.41645.katriel@traum.org.il> <200301311314.06777.katriel@traum.org.il> <20030131111949.GV11221@miggy.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030131111949.GV11221@miggy.org>
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

On Friday 31 January 2003 11:19, Athan wrote:
> On Fri, Jan 31, 2003 at 01:14:06PM +0000, Katriel Traum wrote:
> > Okay, sounds good, so say I want to save me a 2000 SNAT ports (I don't
> > think I'll have 2000 sockets open at the same time)
> > here's the ruleset I should use:
> >
> > iptables -A PREROUTING -i $INET_IF -p tcp --dport ! 60000:62000 -j DNAT=
 \
> > - --to-destination $DMZ_IP
> > iptables -A PREROUTING -i $INET_IF -p udp --dport ! 60000:62000 -j DNAT=
 \
> > - --to-destination $DMZ_IP
> >
> > iptables -A POSTROUTING -o $INET_IF -i $LAN_IF -j SNAT --to-source \
> >  $INET_IP:60000-62000
>
>    Looks good at first glance here.
>
> > as for ICMP, I didn't quite understand you. can you elaborate?
>
>   For TCP to operate correctly you *NEED* some ICMP working.  ICMP isn't
> just for ping!  There are things like network, host and port
> unreachable.  There's also things like Path MTU discovery which involves
> an ICMP message being sent back if a packet is too big for part of the
> route and has the Do not Fragment (DF) flag set.
>   Basically not allowing ICMP in a blind fashion is NOT the way to do
> things.  You probably just need to make sure you have the proper FORWARD
> rules (filter chain, it's the default so no -t) to allow both
> ESTABLISHED and RELATED.  You can find these in any mention of SNAT in
> docs/howtos.
Ofcourse ICMP is important. I wan't going to leave it out.
The qiestion is will the rule:
iptables -A PREROUTING -i $INET_IF -p icmp --dport ! 60000:62000 -j DNAT \
=2D --to-destination $DMZ_IP

do it? and what about ICMP messages aimed back at the LAN?
This will all be acompanied with the apropriate -m state entries.

Katriel
>
> HTH,
>
> -Ath

=2D --=20
+katriel                                                =EB=FA=F8=E9=E0=EC+
pgp key: traum.org.il/gpg.asc
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+Onz3DWy+Hv/461sRAphzAJ9ZBpO+lsHt2x468/Pwf4bmM/LJYACgioZ5
5E+0wiAx7l3IC0JuyetYGts=3D
=3D5J6o
=2D----END PGP SIGNATURE-----


