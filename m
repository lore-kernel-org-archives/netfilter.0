From: Harald Welte <laforge@netfilter.org>
Subject: Re: pptp problem
Date: Wed, 21 Jan 2004 08:07:07 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040121130707.GI8642@obroa-skai.de.gnumonks.org>
References: <HKEHIDPBOOKOHFABIPNIOEKHCAAA.piotr@3id.pl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <HKEHIDPBOOKOHFABIPNIOEKHCAAA.piotr@3id.pl>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; x-action="pgp-signed"
Content-Transfer-Encoding: 7bit
To: Piotr Klose <piotr@3id.pl>
Cc: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tue, Jan 20, 2004 at 10:20:51AM +0100, Piotr Klose wrote:
> Hi,
> I'm trying to make a pptp connection from my LAN to a outside standing pptp
> server.

Let me give you another example: I'm trying to find orange juice.  

One might wonder:
In which supermarket?  In which city?  In what year?

want to say:  Any question / bug report / ... is totally useless if it
is not accompanied by a very detailed report on
- - which kernel version
- - which patches (from which version of patch-o-matic)
- - what ruleset (only rules related to the issue are important)
- - which loaded modules
- - any other information that might be necessarry.
- - a detailed description.  "trying to connect but doesn't work" does not
  count as detailed.

Also, please Cc' the netfilter@lists.netfilter.org mailinglist, in case
somebody else has already found an answer to your problem.

> I get this message in syslog: kernel: ip_conntrack_pptp.c: bad csum

this is not an error message, but rather a warning message.  Let me
guess, you have a w2k PPTP client?  This has a known bug to send packets
with bad checksums. This is definitely not the cause of any problem.

> BR
> ---
> Piotr Klose

P.S.: Please don't take this too personally.  I just receive way too
many emails like this, and this is now a rant about all of them, hoping
that people on the list will pick it up.

- -- 
- - Harald Welte <laforge@gnumonks.org>               http://www.gnumonks.org/
============================================================================
Programming is like sex: One mistake and you have to support it your lifetime
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFADnl6XaXGVTD0i/8RAizTAKCN+4SRANEDYBg0JIWthGZ+ahWcIACfY6IG
GnF8Yq3jRZ1hvsDsjv8vjw8=
=jct4
-----END PGP SIGNATURE-----

