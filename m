From: Josh Cepek <josh.cepek@usa.net>
Subject: Re: Connection intercept
Date: Wed, 16 Jan 2008 01:01:17 -0600
Message-ID: <478DABBD.2000400@usa.net>
References: <478CE2B1.2000806@telbiomed.at>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enigE904B87AD4056C9D361FB024"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <478CE2B1.2000806@telbiomed.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigE904B87AD4056C9D361FB024
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

DI Roman Fiedler wrote:
> Hi all,
>
> I want to create an iptables setup that routes all packets that would=20
> be dropped to a gateway on a separate interface. I try to do it by=20
> marking these packets with a INTERCEPT connmark (and ACCEPT them) and=20
> use a different routing table (std. policy routing) with a default=20
> route to the separate interface.  The problem: I want to use the=20
> filter tables to do the filtering, but the packets are already routed=20
> when they reach the filter tables. So I cannot route the first packet=20
> of a connection to this special interface, hence no real connection=20
> intercept is possible.
>
> Setup:
>
> Inet  - Firewall - Internal Zone
>                 |
>              Intercept host

Rather then fuss with routing, why not DNAT all normally rejected=20
packets to your intercept host?  I'll assume for a moment that you have=20
a fairly generic setup where you accept return traffic with some rule=20
such as `iptables -A FORWARD -i ${WAN} -o ${LAN} -m state --state=20
ESTABLISHED,RELATED -j ACCEPT` and possibly services you wish to expose=20
(like a web or SSH server.)  Normally all other packets sent through the =

firewall are dropped or rejected as bogus traffic.

DNAT, as with the CONNMARK target, can only be set prior to the routing=20
decision (and thus any filtering) but you can work around that.  At the=20
end of your PREROUTING chain on the nat table add a reference to a new=20
chain (let's call it "intercept" in this example.)  On that chain you=20
want to exclude packets you normally want to let through such as traffic =

to your public services; to do this you will need to test for each=20
condition and -j RETURN on each one.  The last rule in this intercept=20
chain will DNAT anything you don't normally allow and send it instead to =

your intercept host.  Be sure you don't include any other DNAT rules=20
after calling the intercept chain since they'll be ignored (and=20
redirected instead to your intercept host.)  Here's a sample of this idea=
:

# add an intercept chain on nat table:
iptables -t nat -N intercept
# call this chain for inbound packets to the public IP's of this network:=

iptables -t nat -A DNAT -i ${WAN_IFACE} -d ${YOUR_PUBLIC_NETRANGE} -j=20
intercept
# example exceptions for web and SSH services:
iptables -t nat -A intercept -p tcp --dport 80 -j RETURN
iptables -t nat -A intercept -p tcp --dport 22 -j RETURN
# send everything else to intercept host:
iptables -t nat -A intercept -j DNAT --to-destination ${INTERCEPT_HOST}

That ruleset will make exceptions for services you normally accept and=20
sent all other NEW connections to your intercept host.

> The intercept host will answer for all IPs (Honeypot like), so that=20
> connections that would have been refused are openen and can be=20
> analysed. Example: Host xxxx from internal zone tries to reach=20
> nonstandard mail exchange, mail connection is automatically routed to=20
> the intercept host and mail is captured to see if xxxxx is just=20
> malconfigured or if some malware tries to send out some data.

The one remaining issue is how you handle the response to connections on =

your intercept host.  The above rules will just blindly forward any=20
traffic normally rejected to the intercept host as if it was actually=20
the final destination, but it is still up to the host to establish the=20
connection and send out the proper reply.  This means you'll need to set =

up applications for any service you want to receive connections from,=20
such as mail, web, SSH, telnet, etc.  You're probably already aware of=20
this point, but I just wanted to re-iterate it for completeness.

--=20
Josh



--------------enigE904B87AD4056C9D361FB024
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)

iD8DBQFHjau9HSSgJy5aUScRAvx5AJ4j2zbW2ZqQv8G/eO3BU0ybhd3lFgCfWFQT
gu/Vf59lItdw2qGBayj/w7o=
=48Bj
-----END PGP SIGNATURE-----

--------------enigE904B87AD4056C9D361FB024--

