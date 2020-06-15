From: n3ph@cccfr.de
Subject: Re: "Carrier Grade" NAT44 setup
Date: Mon, 15 Jun 2020 07:05:33 +0200
Message-ID: <e68f3a0b-916c-5bdd-4a86-6f3b2c21fafa@cccfr.de>
References: <5c2c7d45-ea99-0f70-04ee-544f9837b8a8@rfc2324.org>
Content-Type: multipart/mixed;
 boundary="------------7A8AF0A50202F129E2A1C70F"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5c2c7d45-ea99-0f70-04ee-544f9837b8a8@rfc2324.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Maximilian Wilhelm <max@rfc2324.org>, netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------7A8AF0A50202F129E2A1C70F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi There,

HE once wrote a recommendation of using 1 public IPv4 address per /24
(255 clients) [1]. Therefore you would need at least 40 public IPv4
addresses for 10k clients.

It is easy to statically link every /24 to one of these NAT IPs, what
makes me think of a more sophisticated pool management mechanism, to get
connections dynamically patched to "free" ones. Does this makes sense?
ATM I have no idea how to approach this.

[1]
https://services.geant.net/sites/cbp/Knowledge_Base/Campus_Networking/Documents/CBP-16_NAT44_address_translation.pdf

-- 
best regards,

n3ph

--------------7A8AF0A50202F129E2A1C70F
Content-Type: application/pgp-keys;
 name="0x520DF07814B030DF.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="0x520DF07814B030DF.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D=3D
=3DCnwI
-----END PGP PUBLIC KEY BLOCK-----

--------------7A8AF0A50202F129E2A1C70F--
