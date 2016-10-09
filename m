From: Joerg Dorchain <joerg@dorchain.net>
Subject: nf_conntrack_sip regression?
Date: Sun, 9 Oct 2016 02:19:47 +0200
Message-ID: <20161009001947.4eszsjifuc5wfacq@Redstar.dorchain.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qmhublyi2pllvbn4"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 Redstar.dorchain.net u990JlAp005653
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorchain.net;
        s=redstar; t=1475972387;
        bh=vGw70chV+ynVbDo8OKOdb6l2mGqYNGfDxYaJEP4J1L4=;
        h=Date:From:To:Subject:From;
        b=UO9U2FQOpsVtGOnKGCGK8o86PqOacyIdOc+Rq6EEp0XgHQr7VBsxughBDb0pyswrx
         84B8xBNpKqSnHngmZ+Wkc2oDhv1jmQHHhdN+qUJH40/k5ZgpsWH4ZOFS2rX1ONmsJv
         4MPU7I5qKRhb4NzKfWQhZzjqPewhZ2sBkyDMiQeY=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--qmhublyi2pllvbn4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I am having a problem with iptables rules that used to work with
kernel 4.6, but does not anymore with 4.8 (I think I skipped 4.7)

I have a machine running asterisk, and the idea was to use
connecting tracking to dynamically allow incoming packets, esp,
sip related rtp data.

So I have some rule in the tables:
Chain PREROUTING (policy ACCEPT 19781 packets, 3776K bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion        =20
   86 48515 CT         udp  --  any    any     anywhere             anywher=
e             udp dpt:sip CT helper sip

Chain OUTPUT (policy ACCEPT 10950 packets, 1223K bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion        =20


Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destina=
tion        =20
=2E..
14969 3316K ACCEPT     all  --  any    any     anywhere             anywher=
e             ctstate RELATED,ESTABLISHED
=2E..

This input rule used to match incoming rtp packets when initiating
a sip call from the local asterisk, but now it does not match
anymore.

Did something change with netfilters?
Is this supposed to work at all?
What other concept would work for this setup?

Thanks for a hint,

Joerg

--qmhublyi2pllvbn4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJNBAABCAA3BQJX+Y0cMBSAAAAAABUAEnBrYS1hZGRyZXNzQGdudXBnLm9yZ2pv
ZXJnQGRvcmNoYWluLm5ldAAKCRBxI390Nm4cqMOBD/sFnxNoOcLYvUTvNA1KHEOg
BpzOvmA5M9DG9l6ETzpCClubUZcYWP66BQIxKYSD11SfBjlh/mIgSOCWmJdrROXa
Ybqi7oWhgxuxzEYz1rkMk/4Itv5jvI+gXJYNm5xJJkQ2CQYZzDmLJTzUq8o1cMqx
/7DhQO+9/HLVXjMrXZLFIoNhYqBFH1ZATXTxfewQFlJxnE1SRWKuq112sflrUd7U
1po8mhOiaqaWA4nICwutpo2UKLy/msEXuo4aa09Cn4bCiPLEPpqDneHLQjXFs0Ar
xuR1ant0fv4YYrwPv/j7/7XRjhmx1XjcGH7DaktWzPfiGGSLnZSwb6odNhEN/F9Q
MrSWaJnMwF02yt0uJyqDkmhqUfYt3DVOFtzsJEb0V6JHRbcPK+e2B1Ege9tqc0tI
sp4pqKOz/AchnvVJLndyw6i/ta3CK7NTTRncbm270VycYCWtwvjEc9sRj+srl1GG
rf2jeDY0AdM9a2XvXb7YH+uRSbfQj254ZWJ98es6COpcMAmkX7kI6CfiHm4sVevv
94AqIVZ6qtnNce8hNIve5QqVu/XA1Uilg32J7d1AXyJx3+z4ApM1fuguS0bLMSWp
is4doWx9+vpA4SeJMtwpPpWEQGlAeERMmffg0U5p+cEa1wZb3H8gWa8zVeNUUR66
q4Uz123HZL9Kf+DP1BPO1A==
=9d0Y
-----END PGP SIGNATURE-----

--qmhublyi2pllvbn4--
