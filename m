From: Stephane Jourdois <netfilter@rubis.org>
Subject: Re: Modifying Source Ip on input/prerouting
Date: Wed, 11 Dec 2002 16:38:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021211153854.GA9333@nath.rubis.org>
References: <20021211135812.GA8394@nath.rubis.org> <3DF7536F.9050002@istitutocolli.org>
Reply-To: stephane@tuxfinder.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3DF7536F.9050002@istitutocolli.org>
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
To: Andrea Rossato <mailing_list@istitutocolli.org>
Cc: netfilter@lists.netfilter.org

On Wed, Dec 11, 2002 at 04:02:07PM +0100, Andrea Rossato wrote:
> Stephane Jourdois wrote:
> >I would need to be able to modify the source ip on input GRE paquets.
> >This is because I'm trying to setup a pptp tunnel, via a router that
> >doesn't NAT correctly the GRE.
> >The client receives GRE, but replies with it's own local ip, then my
> >server cannot receive the answers... If I could just change the source
> >ip on those paquets, that would be perfect...
>=20
> i don't know if I've got your problem correctly, also because I don't=20
> know pptp too much (so, shut up, you'll say...;)
no, no, I won't ;-)

> if you want to match gre packets and change their source address (not=20
> the source addr. of encapsulated packets) you should be able with
> iptables -A POSTROUTING -t nat -p gre -j SNAT --to-source=20
> new-grepacket-source-addr
> this will match all outgoing (from the client) traffic using gre protocol.
The problem is that I wan't to change the incoming traffic...
What I would need is something similar to :
	-A PREROUTING -j SNAT --from-source xxx

> but is this what you need?
> where are the tunnel end points? the router has two tunnels connecting=20
> the server and the client? the tunnel is between the router and the serve=
r?
The server is My linux machine, on which I wan't to modify the GRE
traffic, because I don't have access to the gateway of the client (a
windows 2k, but that doesn't matter).

> Instead, if you want to change source address of encasplulated packets,=20
> that would be interesting...
mmm No, they are not. Well, they are over IP ;-)

Thanks for your help, anyway.

--=20
 ///  Stephane Jourdois        	/"\  ASCII RIBBON CAMPAIGN \\\
(((    Ing=E9nieur d=E9veloppement 	\ /    AGAINST HTML MAIL    )))
 \\\   6, av. George V	         X                         ///
  \\\  75008  Paris             / \    +33 6 8643 3085    ///

