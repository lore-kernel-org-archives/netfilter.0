From: Thomas Delrue <delrue.thomas@gmail.com>
Subject: Question on redirection & circumvention reporting
Date: Mon, 22 May 2017 15:45:52 -0400
Message-ID: <06a76100-227d-f5eb-535d-ef5051946bee@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="5b4HMSFR0g8DldXtkhIrwrXKB45leb39f"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:mime-version;
        bh=lqQIVNYGS4QMgZthT6G68jcVNJVSJZU+LxCDXQ8XOrA=;
        b=kTmwT9NEsvZvhJjxyjAFb5kVdFzeuKDLb1xobHQ5X3W9cZqYz3u5nwOLYP1UCriQF8
         Z7acDhWl0GsArv0pwMBtzsgPK5APnoUOY0j04t8RIR8+ydkUk+Eg+TrokQ7xNEeNb6wj
         8ZPc7EE+oT5PFkNkGZ3PFZBLpvdPES+eTj667UTGTGcvRUQWOitCuovfudAlcFj5JHd/
         xXM90hEXekpNbvOKO4H5SsaLga+aFGSSbBtHvkn19XnX8FJ+sRf80vAADb1C6R4r6uDN
         mbX+xFrUs3W1hFiy34hG0eUPVUpwF7hjyfpT9PQ+quBBjjNlyRVRzeu+dyFsgZgKR6Rm
         uZjA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5b4HMSFR0g8DldXtkhIrwrXKB45leb39f
Content-Type: multipart/mixed; boundary="qx3cjOdsfpx8PNWhx19xEtEp9EqA4xkTl";
 protected-headers="v1"
From: Thomas Delrue <delrue.thomas@gmail.com>
To: netfilter@vger.kernel.org
Message-ID: <06a76100-227d-f5eb-535d-ef5051946bee@gmail.com>
Subject: Question on redirection & circumvention reporting

--qx3cjOdsfpx8PNWhx19xEtEp9EqA4xkTl
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello,

I have an internal network with a couple tens-to-hundred devices on it.
For internal reasons, everyone on the network should be using a specific
set of DNS servers; for giggles, let's assume that the IP of those DNS
servers are 10.0.0.2 & 10.0.0.3.
On router for this network, we've set it so that it will use that
particular DNS server to resolve domains and by default we use DHCP to
tell all clients to use their gateway when resolving DNS queries, thus
using 10.0.0.2 or 10.0.0.3.

However, I'm sure you feel where I'm going because there's always that
one guy/gal who's a tad bit too clever for their own good:
We've run some traces and figured out that some of the folks (these are
people who are tech-savy, don't have access to the router but do have
admin/root-powers on their own machines) have been setting their own
machines to use a non-sanctioned DNS server (e.g. 8.8.8.8 for you
google-people out there).

My question is twofold:

First: Is there a way, using iptables (or some other firewall), to
intercept DNS requests to anything but 10.0.0.2 and 10.0.0.3 and
redirect them to 10.0.0.2 or 10.0.0.3 in such a way that said users
would /think/ they get a response from 8.8.8.8 (i.e. they fire off their
request to 8.8.8.8) but they actually get a response from 10.0.0.2 or
10.0.0.3.

Second: If I wanted to figure out, on an ongoing basis (i.e. for future
attempts), how many of these things are happening, when they are
happening and who is using the non-sanctioned DNS server, so how would I
generate a log of this? I would want genuine requests (to 10.0.0.2 or
10.0.0.3) to /not/ show up in the log and non-genuine requests (to port
53 on /anything but/ either 10.0.0.2 or 10.0.0.3) to show up with
time-stamp and source IP.
What would this look like?

I was thinking about this and came up with something like this for
iptables but don't know if it would work, so before I deploy/test this,
I was wondering if there is anyone who would be able to tell me whether
this would/could work or if this is a dumb thing to do...

iptables -N DNS_MANDATE
# these two DNS servers are mandated
iptables -A DNS_MANDATE -d 10.0.0.2 --dport 53 -j ALLOW
iptables -A DNS_MANDATE -d 10.0.0.3 --dport 53 -j ALLOW
# log anything that hasn't returned
iptables -A DNS_MANDATE -j LOG --log-prefix "DNS Circumvention Attempt:"
# rewrite and redirect
##### [ ??? what goes here to do the actual redirect ??? ] #####
# We're done after the redirect, but let the redirect through
iptables -A DNS_MANDATE -j RETURN # Is this the right thing to do?

# put this in the output chain?
iptables -A OUTPUT -p tcp --dport 53 -j DNS_MANDATE
iptables -A OUTPUT -p udp --dport 53 -j DNS_MANDATE

For extra credit: how would I do this using ip6tables (for servers with
IPv6 addresses assigned)? Would it be massively different? What about
netfilter/nftables?

Thanks


--qx3cjOdsfpx8PNWhx19xEtEp9EqA4xkTl--

--5b4HMSFR0g8DldXtkhIrwrXKB45leb39f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCgAGBQJZIz/wAAoJEKosl9oIs/pOudsP/j6+tf2PrrpxXAkfYXNTrM3W
S+zgDDVXE1xolWHMWqwQZKtpKz5AvDjr+8zKVj/btNwk1rnJvyVHt3AT6TLFy1AV
5fbTUlaHbyw+uO50qPQ9pQlV1vQG19yd9Qpqd/6hV3y3AJyygkQIKCg4x1eGKFYp
MRBzCOcTuHK822YHZ4F+p6yitHVhwkQu2jVKLaZkPtBNfHFy1kAn/q2w+Kx4viXZ
bl5ttoloN6nq3bOeTinPSMlk3V6a/EwjFw5Xoro7V5NjsDdk35g1TfcNNP5HfN6S
1qhlJrGJP/W8YJix2olx2/GlE28GAu565abFDUa3gjsvtXHdBZrzM5ZeKKfxNg/9
0ROV6zE45JkcfdpHoGYl/1IJYjfhM3+D2g5qp/S/UktVM9ke1JJop7FUZ/Dm2N2P
Prf85iXspGcBiUvWYUbySjvI075F7w11UqGt94LAL3tAb6m0PahBJTMMcrlhC3cA
5gNZbb/N+FM6gH32eZijY9jwBoIPcpxIsgyoPj2ZF7yQXF9BNuqjoJoaAetTBduK
W8IuarBXffG+4nbhtGsF9MwXT5HpOp/v0km5G+82XcdsHrUbCrCSATLU/jTGWl7D
FW1/tCTNH/Ag6gi5CgyLyYVGgGCeaUe435tJZKm2xlNirW1AqxyDt5giXDkmiT6U
xD6q3PlzGcPrDn9Aa8ap
=EEr6
-----END PGP SIGNATURE-----

--5b4HMSFR0g8DldXtkhIrwrXKB45leb39f--
