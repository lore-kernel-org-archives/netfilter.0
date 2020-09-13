From: "K. de Jong" <kees.dejong@neobits.nl>
Subject: Re: Filter based on string (or other content)
Date: Sun, 13 Sep 2020 12:59:35 +0200
Message-ID: <e2df420904ad798ffef01c7efc895bd38fbcb428.camel@neobits.nl>
References: <d3356c66687003310366b87a69328d329074efcb.camel@neobits.nl>
         <55b116c5-5b29-f4bc-24ad-6d55a74a71c8@hajes.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-gRCVoi+I1pHa9iZnf1Cx"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.neobits.nl ADAEF3E8BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neobits.nl;
        s=20181026; t=1599994780;
        bh=q1k2g3TPXO4L+rFCULcTVjDu7movSY5Jy0+YT91Gol0=;
        h=Subject:From:To:In-Reply-To:References:Date:From;
        b=Gsckqb0kcjvLfXbs5bXdg0pbVzEF/lrqyQVCVC2I2a1wR9T9Et/sofYzvUg+n8iKQ
         KYxWl/1Ilc0yXL8z8lWafm2dOtqoNiX0SCwUO2zWAIf9RalTvbprDvfvCI+8OQ/xCj
         VnS7rST4Qrl4+6gIFTNdMTinQf4C7LnMYoG+UDYeLAzR9ReuoiRpxtTZvBfUk3Evng
         G8ijRo21kJmYCix7kqsJCmzuPe9ZpkF6uo1g2jqN6vsXLszdnyf4tl9039Y1K2hbNT
         +uQ71BCJJOJPgYFmmG6OxNdpq93X3ir1TQakWZfYgk3z0QbDk/Dpv22MBZWVXuZ6DL
         bxLDXeWLmGH8w==
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.neobits.nl 516693E8B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neobits.nl;
        s=20181026; t=1599994776;
        bh=q1k2g3TPXO4L+rFCULcTVjDu7movSY5Jy0+YT91Gol0=;
        h=Subject:From:To:In-Reply-To:References:Date:From;
        b=kMqmVBXmJyWuQUk7P1AALh3aArOGK0QSbOseI8qaVbEg0m/z2msn+Vtp+CKJs89KX
         Y+yRXERTw9vM5uRe3Hn4xhZKtiKfzba5UTbBpPICUnIudvbHBEhR7tlKCh280IaGI6
         eM8qWSVAmnIIGyWXS8W3Pz75cZm5q8G40luf+wwmXp5B3UHg7sxtenDTxugm14zxpU
         0Ud2Ydw7RN7b5csd/0tZwKpH7S8R2RTB7nsIPFhN7yMwGgdbcMG6NDRZsCZeoDUh4Q
         Zr8n5E6N782P6wsde2CicMQW6UCJGKd8dmKEyPx2ZYqPh7a9n57pBpheULXwyQ//rA
         lVOKi7Y1Had9w==
In-Reply-To: <55b116c5-5b29-f4bc-24ad-6d55a74a71c8@hajes.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter <netfilter@vger.kernel.org>


--=-gRCVoi+I1pHa9iZnf1Cx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2020-09-12 at 17:45 +0200, david@hajes.org wrote:
> sounds like Layer-7 filtering.
>=20
> There is something similar what you seek=20
> <
> https://serverfault.com/questions/998962/nftables-support-string-matching=
-support>=20
>=20

That indeed looks like what I'm trying to do. I fiddled around with it,
but it's very different than the iptables method of simply provide a
filter for a string and iptables will parse headers for it and block
anything that matches.

I tried it with nftables, by putting this in there for the output chain
on my laptop:

chain output {
  ct state invalid drop
  meta l4proto tcp @th,160,128 0x0970726f787970697065036e657400 counter
drop comment "block queries for proxypipe.net"
  type filter hook output priority 0; policy accept;
  oifname "lo" accept
  ip6 daddr $ipv4_rfc3964 log prefix "6TO4_REJECT: " counter reject
with icmpv6 type addr-unreachable comment "Reject 6to4 (RFC3964)"
}

But it doesn't block anything in Chrome when I visit proxypipe.net. And
I'm just guessing at this point because these nftable options are way
more complex than iptables. The example from server fault is about
blocking DNS UDP requests to that website. But what I want to do is
block web requests. Which worked fine for Facebook with iptables. And
was easy to setup.

Could someone guide me towards the right direction? Simply blocking DNS
requests won't cut it, since I want to deny the website on specific
days and time ranges. If facebook.com is still in the DNS cache, it
will load the website. I have my own (unbound) recursive resolver, so
blocking Facebook entirely is no issue in terms of a DNS block. But the
thing is, I sometimes would like to allow Facebook on a firewall level.
That way I can enforce it for my phone via VPN as well. There are apps
for this as well. And Android has something builtin to limit website
visit time with Digital Wellbeing. But I prefer to have this central
solution.

Any suggestions or more specific examples for this use case?

--=-gRCVoi+I1pHa9iZnf1Cx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE9EOOACidEyH97tOb442fihuaY3sFAl9d+5EACgkQ442fihua
Y3vUNg//aDRJc7RplM/LteNPv8XT+utHEr3CgjBPNIxXSEyU5QBj8dcCoIMiXrYd
+5dBiWfBpHyU2a1Q9wW/sFT2Sp7UVPMiQNSfww0pMCE27O1rJVkW8Wr+ozzzxIA3
Lw4vcZlFfzx1YpSilGjFdD2ffd48jI2LpaDQ34R1rfgbJ9uO4rrvv4DpZlPhKAW+
KEo5w3KPRZ7UCsEosF1FGjveXSOg2lVOZcSGysDFeQp1bFPZNSSEy1LELqdpv3iO
hlkAdCCFnMrq/sT5BOGVG1yyrhWDSlsTPfWlsEqpj6f+mZgrng+E102AWK2qtbLb
/Tc0/lRrYkKvxc9fI+pkpG0AsrWmdseH/T1laN3t+8PxzAkncJDIGlewCuVxk+vi
YbMJt5lfuVhYYca1ORPWNvqcbFFx1FdTCSjdgxRk8mAYyXqfsCa+zFN2Gbf+6g+e
OZaWHKlYYgwhibnV5ng0og39+AsHnUaxViICJ/4Pw1WvVKYfOyDibaiRpv56Ojvg
7MG4u6mxHyi2kvuS3sBoZTmaPHIlQDtmnGglu0lwAgdoAk5JPejBzn3RvtO8q2m5
uH48T7dFC0he6K8QZN5WFH61GYAwEQuz2JIeAlvw9tu4ZwiKqq52eB4S4ERao+ip
Vmgjssz+eDCJflTxEyKAvTDdlaWJn4bP29N5Tld62JSDocbfl1w=
=/4hZ
-----END PGP SIGNATURE-----

--=-gRCVoi+I1pHa9iZnf1Cx--

