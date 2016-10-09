From: Joerg Dorchain <joerg@dorchain.net>
Subject: Re: nf_conntrack_sip regression?
Date: Sun, 9 Oct 2016 11:27:13 +0200
Message-ID: <20161009092713.ursiwck3hg6d6jie@Redstar.dorchain.net>
References: <20161009001947.4eszsjifuc5wfacq@Redstar.dorchain.net>
 <5fc84a99-1a7c-7aad-9baf-7e3047ca912d@free.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jbdlzgcx3bb7cgjv"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 Redstar.dorchain.net u999RE2O007883
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorchain.net;
        s=redstar; t=1476005234;
        bh=pW66eUWi88B4wsTjlzS/yUpBg3fec6QAAqgvQgdlfoY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CiJDRpAwd9OUoJ3VhHj89eeZNi2PUcM1GK+wmULl/VFoJCn6y9yZ+fUe45Dpjggjf
         IriyMkTEMqL9svMunb08s66VnURcQBz2Hc0zZezIgQ/VCruQddTajzoLjD3GPq6gn0
         Jp/E3+VPBXjgsPEtirIo3fjBNG4A6MZYCUNLQl9o=
Content-Disposition: inline
In-Reply-To: <5fc84a99-1a7c-7aad-9baf-7e3047ca912d@free.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Adel Belhouane <bugs.a.b@free.fr>
Cc: netfilter@vger.kernel.org


--jbdlzgcx3bb7cgjv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 09, 2016 at 05:55:18AM +0200, Adel Belhouane wrote:
> Le 09/10/2016 =E0 02:19, Joerg Dorchain a =E9crit :
> > Hello,
> >=20
> > I am having a problem with iptables rules that used to work with
> > kernel 4.6, but does not anymore with 4.8 (I think I skipped 4.7)
> >=20
> [...]
> >=20
> > This input rule used to match incoming rtp packets when initiating
> > a sip call from the local asterisk, but now it does not match
> > anymore.
> >=20
> > Did something change with netfilters?
>=20
> There was this dmesg log for long: "nf_conntrack: automatic helper
> assignment is deprecated and it will be removed soon. Use the iptables
> CT target to attach helpers instead."=20

I am sorry to quote myself, but as I wrote, I have in the RAW
table

> Chain PREROUTING (policy ACCEPT 19781 packets, 3776K bytes)
>  pkts bytes target     prot opt in     out     source               desti=
nation
>    86 48515 CT         udp  --  any    any     anywhere             anywh=
ere             udp dpt:sip CT helper sip

I remember having seen this kernel message long ago and introduced
the rule above.

> Chain INPUT (policy DROP 0 packets, 0 bytes)
>  pkts bytes target     prot opt in     out     source               desti=
nation
> ...
> 14969 3316K ACCEPT     all  --  any    any     anywhere             anywh=
ere             ctstate RELATED,ESTABLISHED
> ...
I meanwhile added another rule for debugging:

    0     0 LOG        all  --  any  any     anywhere             anywhere =
            helper match "sip" LOG level warning prefix "Lsiprelhp: "

That gets triggered from the telephone on the internal ethernet
connecting to asterisk, where no firewall openeing is necessary,
but not for the outgoing call leg via ppp0 from asterisk.

Sorry for being unclear, I can easily give the rules in
iptables-save output if that helps.

> I think that's the answer to the problem:
> https://www.spinics.net/lists/netfilter/msg56874.html

I searched through the recent archive of this list before, found
this thread, but the solution does not work for me.

I tried the=20
        echo 1 > /proc/sys/net/netfilter/nf_conntrack_helper
but it did not change.


Thanks for bearing with me,

Joerg

--jbdlzgcx3bb7cgjv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJNBAABCAA3BQJX+g1sMBSAAAAAABUAEnBrYS1hZGRyZXNzQGdudXBnLm9yZ2pv
ZXJnQGRvcmNoYWluLm5ldAAKCRBxI390Nm4cqG2SD/9NckNm0Bz4kEII4mBL9sLn
cy05F1IWBVIUzRhQGQuZbkrvguBOoIAWMiKcLixzy7NZTN8CGgzzBLzto3iQylX+
HkxCowvW88bIG4LH8scK8oPcY99fcLg/ezUHfHTbkUHMZPrRz0QGx4S+o+FNKL4J
pzRA5eSdGVJ4OXtI9qoZLwcU2O06pcR5v1Y3hAPT1oIko4gTlGakUcsTH/66CYwZ
/VLpZJBNH2uKqB+/cVd66nCbYsUEuNRmFHsX1grJbyTKxR3sUF4fk2YR8REpVneo
3ECkzc1cfTMXqCUA/7ZKE/Cvnel8fQBsGWdk0dw5T293R5SfvChI0A7+d7WtfaEU
rqYcTi6mGKww0Pwhb0AjRKpCC++rDVthlC1Pk1QLFiIqMG3QHmbnYgttZJ20GtjU
2SB30hueunGPdLelp8sfC1EVJBXBcav//adzpVBzUO99Zf1TF4CRDLIyrcVdoJeY
bpB4xj8Qy5hZeVE0twcigcR//PDaiSIxH6RCb59rFyPuyQcA91E4ZLvYHbTmL/mD
aEJDPHzzZ10XLVmyVFzgEDKlqMcHB0ZRzdcRsSE3qbTUNmrhm1Z0bb0WMWVRH2VU
tVOa0SnFIonzT+eQfSzJCohRBAZ0t2qyXVNcmHzWX2tiCBi+Et/Xy1NY3P+qbpxg
Ec0gD6dpOa6EIMRihg9ooQ==
=VlWC
-----END PGP SIGNATURE-----

--jbdlzgcx3bb7cgjv--
