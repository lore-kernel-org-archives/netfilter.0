From: Tom Marshall <tommy@home.tig-grr.com>
Subject: Re: finding out the culprit ip
Date: Thu, 4 Sep 2003 14:13:20 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030904211320.GA8959@home.tig-grr.com>
References: <20030905183420.GA1850@linux.local>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030905183420.GA1850@linux.local>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I'm not very familiar with 'doze viruses, but one of my machines was
infected last week (my first virus, w00!)  The infected machine generated
tons of ARP requests.  Perhaps you can try running tcpdump and watch for
clients that generate an abnormally large amount of ARP traffic.

On Sat, Sep 06, 2003 at 12:04:20AM +0530, Payal Rathod wrote:
> Hi,
> A particular machine in my LAN is affected by SoBig virus and is sending
> mails to remote sites. I need to find that IP. The only lead I have is
> that it is that IP which is generating maximum SMTP traffic. How do I
> find it out and block it (or maybe clean it)?
>=20
> Any ideas on this?
> With warm regards,
> -Payal
>=20
> --=20
> "Visit GNU/Linux Success Stories"
> http://payal.staticky.com
> Guest-Book Section Updated.

--=20
It is by the fortune of God that, in this country, we have three benefits:
freedom of speech, freedom of thought, and the wisdom never to use either.
        -- Mark Twain

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iEYEARECAAYFAj9XqvAACgkQFMm9uvwPXW5umwCfdPmP0yuT5fmRxiCiNIUVSS60
l+AAnRxDjaFy2LIv3mOICTT1Evt5RbNi
=eMRC
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--

