From: darius <dram@mailbox.org>
Subject: Metering is not working with dynamic sets on nft v0.9.2
Date: Thu, 6 Feb 2020 23:42:29 +0100
Message-ID: <8665bae3-ba91-2699-15ea-27d256d9bcd2@mailbox.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="Nq6bplu2KH43RoQuzN8Wct1EuSJ3eGwCh"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
        content-type:content-type:mime-version:date:date:message-id
        :subject:subject:from:from:received; s=mail20150812; t=
        1581029068; bh=bt/7occrgIS5xvnHkMG6EqhWv8XMSu4jH0JdDmbU8cA=; b=U
        U7UUvPDLCw7ZEHunYZrDnAd6WvMlEUpSydAG30Gnd/L/HyWqpcJgNQPnd1kRAg8W
        9MfpAcJlXyL13HweiwuP70AYEYYUnzKJZDFqwItF6BfuzF1ZKm6EZN8ZULYujrL3
        a7cMcdL5mVOr5sTIFD40GASt1VRtZVuCDaKQvd3j4pUYX7g6JWzJQKKp5vgm9EWP
        /2XYpEAt8YMre3t8LDsS3kvFdMCuJkhywZwzM2k3z8GADxwQWLjjy9UhQ77pYqQz
        oulWxqrLo7Wtf4ZY5SUUng9B4gdp2CMc25bSoFH1xPC8T8LWO1tHFsByDbJgD9JO
        T5by4j/6DtXILa1vjmA2w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
        t=1581029069;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
        to:to:cc:mime-version:mime-version:content-type:content-type:autocrypt:autocrypt;
        bh=M5rDjg6fT6q1cMlD3JJ2y6faq4ZqCaCwn2ad8zpovMs=;
        b=AXIQH+KkXhSGplYixpIELynCqf4pCIxByAehuupwigOfaYuIz6cgcRLMFO0c79q272DbKq
        JlYIc5SNIc/YpmOy9iTPYqKumrAFwo5C3/1M8saxRxymdfwGigInBGPrSTHRe+cdjXet4D
        YBIHYHG5y7/dqB+qU2YqVxml65iTXAW1KFdIdPtPaapNC98j27O+Uv/8DrOXagSZwDGehX
        FwFuaogxi/6KxO5kntee1WN/FJyBY4l9ZxnUNf8HFPbYDwIKMDvaOWs11zVUNnY62A0SnE
        rLBFaA3PnAITpQn1Kx6gymMYvdWzRW+5Px9U+OM3dlXIzolw9dPXXtElzWJpsQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Nq6bplu2KH43RoQuzN8Wct1EuSJ3eGwCh
Content-Type: multipart/mixed; boundary="ugXe3yaAAnXn5E62K0sy1II9Qgv8otX3n"

--ugXe3yaAAnXn5E62K0sy1II9Qgv8otX3n
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hello,
I was using meters by using 'meter' keyword, but apparently it is now
obsolete. So, I have decided to update rules and use dynamic sets
instead. For some reason I'm getting an error stating that rule is not
supported. Here is what was working before and still works:

ct state new meter mymeter { ip saddr timeout 30s limit rate over
50/second burst 50 packets } counter drop

Then I have tried to update this rule to the following:

=2E..
set mymeter{
    type ipv4_addr; flags timeout, dynamic;
}
=2E..
ct state new add @mymeter { ip saddr timeout 30s limit rate over
50/second burst 50 packets } counter drop

In this case nft throws fault message:

root@HOMEROUTER:/etc/config# /etc/init.d/firewall reload
/etc/config/ruleset.nft:416:9-187: Error: Could not process rule: Not
supported
        ct state new add @mymeter { ip saddr timeout 30s limit rate over
50/second burst 50 packets } counter drop

I'm running OpenWRT, kernel v4.14.167, nft v.0.9.2
Could anyone help to find out what I'm doing wrong? It seems that I did
it according to wiki.

Regards


--ugXe3yaAAnXn5E62K0sy1II9Qgv8otX3n--

--Nq6bplu2KH43RoQuzN8Wct1EuSJ3eGwCh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEsTT6a9w8eWH3N7FdweSUJGHD1ZoFAl48llsACgkQweSUJGHD
1Zq/IggAsdrhsFmxe7TVq30b9G97E2UffMwxzOwkqXpFOrULOzQ1HtGFk227PU5Z
w4/fx4orFwpMOQgBNQiF2HchZWb7FRlVFIflz5wS4n0cwQ+1Vp7+1CxGOBVcOPHI
KLNfYB6dFxXxrLIXUV7Eqm4YuMparXOPxVnd6IioVZFGLaPhDqa68O+BRwD99jR5
V6R7ZqxJlvuSdhmO6reoFJ6RTiG1bhSMcRcIsNyVdYfbap0lW8UO3Gh3rMSfA6Zp
xJRorikPWgdb8YT6ekPDD+iV0mG3yvaNqdZhcA6HF3/96ArWcXlklmrgBsrM0cwn
go+cJIm92sNHcDvX7vk0JNSaoJQm/g==
=O+Mu
-----END PGP SIGNATURE-----

--Nq6bplu2KH43RoQuzN8Wct1EuSJ3eGwCh--
