From: Primero <primero@fastwebnet.it>
Subject: Re: Dual ISPs - controlled path for certain ports - ip route
 2	balancing for others
Date: Thu, 23 Sep 2004 11:33:48 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4152987C.90100@fastwebnet.it>
References: <200409221315.05822.Alistair@nerdnet.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="------------enigA1B109D624EA386FC4AA51E4"
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409221315.05822.Alistair@nerdnet.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
To: Alistair Tonner <Alistair@nerdnet.ca>
Cc: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enigA1B109D624EA386FC4AA51E4
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Alistair Tonner wrote:

>	
>	 I'm wondering if 
>	there are rules I can use (consider that the webserver/mailserver and FTP 
>	server are sadly on the firewall at the moment) to force the servers to reply
>	via the DSL or internal lan only, even if the default route points at the
>	cable link? (this would be a quick and dirty solution for me) -- the cablelink will have to shortly support a VPN tunnel back to work.
>  
>
i was using Iproute2 like u until a day i decided to "man iptables" ....

i've found in EXTENSIONS TARGET section:

....
ROUTE

       This is used to explicitly override the core network stack's 
routing decision.  mangle table.

       --oif ifname
              Route the packet through `ifname' network interface

       --iif ifname
              Change the packet's incoming interface to `ifname'

       --gw IP_address
              Route the packet via this gateway

       --continue
              Behave like a non-terminating target and continue 
traversing the rules.  Not valid in combination with `--iif'
....

this way u can use a normal matching syntax of iptables and change the 
routing decision about the "interesting traffic".
I hope it works since i had no time yet to try it out ... let us know :)

bye

--------------enigA1B109D624EA386FC4AA51E4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQFBUph/OGoQ6Fir3nYRAlmXAJ9AX4rzvIVFMX3TXKyYbh7U28i9rwCcD7r8
Je0NajebLV9Xg8sRSTSQjvQ=
=vrDW
-----END PGP SIGNATURE-----

--------------enigA1B109D624EA386FC4AA51E4--

