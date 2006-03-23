From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: Per-client routing, plus masquerading -- possible?
Date: Thu, 23 Mar 2006 13:23:45 +0100
Message-ID: <20060323122344.GA1302@zion.homelinux.com>
References: <51e5f6120603221910j3a7d3827oddb2b3bdcacaa818@mail.gmail.com>
	<44224FB7.3020502@netboxblue.com>
	<51e5f6120603230135s75fbaeffx6f7e873185be28b3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <51e5f6120603230135s75fbaeffx6f7e873185be28b3@mail.gmail.com>
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
To: Jeremy Elson <jelson@gmail.com>
Cc: Netfilter Mailing list <netfilter@lists.netfilter.org>


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline


Hi Jeremy,

On Thu, Mar 23, 2006 at 01:35:20AM -0800, Jeremy Elson told us:
> I have one more quick question: is there some way to get iptables -L
> to show full rules?  It seems that there are some aspects of the rules
> that exist but are not printed, such as the interface selected.  In
> other words:  when I type a command like:
>
>  iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

try

iptables -L -v

this will give you additional information about your rules!

> ... and then later check my work with iptables -t nat -L, it doesn't
> show "tap0" anywhere.   I actually mistyped this as "eth" (without the
> 0) -- the original iptables command did not give me an error
> (non-existant interface!), and the -L command didn't show me the error
> :-(.

I don't think iptables checks if the interface exists on rule
insertion time. Which makes sense in my opinion, so you can add
rules e.g. for device ppp0 (or even all devices beginning with 'ppp'
as expressed by 'ppp+') before the specific device has been created.

hope that helps!!


have a nice day :-)

Sven

--
Linux zion.homelinux.com 2.6.16-rc3-mm1_27 #27 Wed Feb 15 17:51:36 CET 2006 i686 athlon i386 GNU/Linux
 13:15:01 up 33 days, 17:30,  1 user,  load average: 0.18, 0.31, 0.46

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFEIpNQo4FAdB2PneQRAggFAJ9uJ3+V9YF62RH+Gj2U03D75eyFQQCfQdHY
DUEfJ07RVVNYXJ4zgJNbgjI=
=/1J4
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--

