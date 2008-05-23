From: Josh Cepek <josh.cepek@usa.net>
Subject: Re: DNAT iptables bug or connection tracking issue?
Date: Fri, 23 May 2008 17:44:44 -0500
Message-ID: <483748DC.3090508@usa.net>
References: <4836D208.9040808@ibocchi.com.br>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig8A9D57194CC4F88459B06627"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4836D208.9040808@ibocchi.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: =?ISO-8859-1?Q?Irm=E3os_Bocchi_=26_CIA_Ltda?= <challado@ibocchi.com.br>, netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig8A9D57194CC4F88459B06627
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Irm=E3os Bocchi & CIA Ltda wrote:
> 1) I have two routers in two different networks: one is a FreeBSD 7.0=20
> router, here called "Router A" and another is a Debian 4.0 router,=20
> here called "Router B"
> 2) The Router A uses pf to make the firewall rules, with standard=20
> installation. The Router B have the kernel 2.6.25.4 and iptables 1.4.0
> 3) In the first router, I have a rule to access my vnc server in a=20
> windows machine. To make these, I need to create this rule
> rdr on sk0 proto tcp from any to <my external addr> port 5900 -> <my=20
> internal addr> port 5900
> nat on sk0 proto tcp from <my internal addr> port 5900 to any -> sk0
>
> In resume: I need to create a rule to make the redirection and, after=20
> these, I need to insert a rule to make the nat
>
> 4) In the second router, only adding this rule
> iptables -t nat -I PREROUTING -i eth0 -p tcp --dport 5900 -j DNAT=20
> --to-destination <my internal addr> port 5900
>
> THE RULES WORK PERFECTLY!
>
> It's a bug? Because, in my vision, I need to create the two rules, the =

> DNAT rule and the MASQUERADE rule to these work.

Typically when you have a LAN behind NAT you use either MASQUERADE or=20
SNAT on all packets going out the public interface.  It doesn't make=20
sense to do so only for certain packets; if you intend to filter traffic =

to prevent it from going out to the Internet you should do so in the=20
filter table, not by preventing NAT from occurring (which won't=20
necessarily stop the packet from being forwarded.)

> Another point of view: If I need to permit only the machines A, B and=20
> C to access the VNC, in BSD, I only need to create these rules
>
> my_servers=3D"{ server_a_addr, server_b_addr, server_c_addr }"
> rdr on sk0 proto tcp from any to <my external addr> port 5900 -> <my=20
> internal addr> port 5900
> nat on sk0 proto tcp from <my internal addr> port 5900 to $my_servers=20
> -> sk0
>
> or
>
> rdr on sk0 proto tcp from $my_servers to <my external addr> port 5900=20
> -> <my internal addr> port 5900
> nat on sk0 proto tcp from <my internal addr> port 5900 to any -> sk0
>
> How I can make these in iptables?

The easiest way is probably to create a user-defined chain containing=20
tests for the IP's you want to allow to connect to this port.  If you=20
include a rule to allow ESTABLISHED traffic prior to the jump to=20
vnc_access only the first packet in the connection will need to traverse =

the list of IP's to allow.  Something like this should accomplish the=20
task (along with the NAT rule you listed above):

iptables -N vnc_access
iptables -A vnc_access -s server_a_addr -j ACCEPT
iptables -A vnc_access -s server_b_addr -j ACCEPT
iptables -A vnc_access -s server_c_addr -j ACCEPT
iptables -A vnc_access -j DROP

[... other rules may go here ...]

iptables -A FORWARD -d <internal addr> -p tcp --dport 5900 -j vnc_access

If you have many IP's you want to add to the vnc_access chain, another=20
way to write that first portion by using a bash for-loop might be as=20
follows:

my_servers=3D"server_a_addr server_b_addr server_c_addr"
iptables -N vnc_access
for ip in $my_servers; do
    iptables -A vnc_access -s $ip -j ACCEPT
done
iptables -A vnc_access -j DROP

For many hundreds or thousands of IP's you probably want to look at=20
ipsets for a performance increase when processing that many rules.

Finally, note that this will only cause packets to be dropped that are=20
sourced from IP's not in your list.  The standard VNC protocol has=20
inherently weak security and would still be vulnerable to a=20
man-in-the-middle attack potentially exposing your VNC password.  An=20
encrypted tunnel such as a VPN or ssh port-forwarding would secure the=20
VNC data cryptographically.

--=20
Josh



--------------enig8A9D57194CC4F88459B06627
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEARECAAYFAkg3SOAACgkQHSSgJy5aUSekIwCfZ7Q1xPBjtGJxgGrNUa3rpUdo
a3YAnj9pSvvj9Kuby5Iiq40FFK+Ncwo0
=i+Hp
-----END PGP SIGNATURE-----

--------------enig8A9D57194CC4F88459B06627--

