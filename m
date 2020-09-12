From: "K. de Jong" <kees.dejong@neobits.nl>
Subject: Filter based on string (or other content)
Date: Sat, 12 Sep 2020 15:41:00 +0200
Message-ID: <d3356c66687003310366b87a69328d329074efcb.camel@neobits.nl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-XNmaNhlsDNEOB5rTP0YP"
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.neobits.nl B08DE3DF8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neobits.nl;
        s=20181026; t=1599918062;
        bh=niYayeNaelUbl16/zdzxa9uvAyMMhMviS/c7B/obr9k=;
        h=Subject:From:To:Date:From;
        b=mPXruDbfD5i/MmLJYkxbkFr25J4jh+Pg5kIponUZ+QzBMMzvc86NRic/7CLL+gaTb
         jpc7BFk2j7AJVtOTQsK284AmYGVfMHFUCloBC+PkIAhDR3gXniZJJpxrOA75aVdveE
         EOMiq1JknwM2LzYl9Q52TJGsaIVUYQltPSfWDJvNS5nLoA0VIc75Xh7gWugAu6xens
         8iWuVKy3ZtPacKv04KLyBK8ZMhK9MbR85Xgce+iGVLBRQrqfppQIWnI+XJApLEkodQ
         BaiByQfln1r+XpyAKaEerPWetD23YfiDh5lpXxsl3n4cpaG64LbftgOmHeVvxnCf81
         gFC6lvBVw1AoQ==
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.neobits.nl 71F903DEB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neobits.nl;
        s=20181026; t=1599918061;
        bh=niYayeNaelUbl16/zdzxa9uvAyMMhMviS/c7B/obr9k=;
        h=Subject:From:To:Date:From;
        b=VHHCHgSbCrVeQx4epWga9Ylorri5FmSRpT9KrttdaUf4cBVAyJADdr00bOV7sSm2d
         I54MFhwurpkikQSEP1nfIMfD1PBBn5ZKnh4lWTuuMdQlDDAG+5NVI/Z1PvE8W63ikc
         +s482gkunWzuPlPOKVVTEckMf/2vitpxSCFfXkMk/+KwbS5De6Dpa0XxlSIzPI+GYH
         hz74lzbAjDNh0A5EbHX6j+gewFmFI5dsVpv6FxeRyE2HLPPq98fwl3vpWfPA4HkaMo
         yxdRzXj/ieQt2cXX9WPuPBEHPAvE+n20Pc3J7QOL7jyA5YJzDQ+fEK1dvH0OO7sS2U
         J0k+nXIn48Nhw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org


--=-XNmaNhlsDNEOB5rTP0YP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I switched to nftables, but I miss one key feature. That is the ability
to filter packets based on a string. The goal is to filter all traffic
going to facebook.com or m.facebook.com for a set of days and time
ranges. The time ranges and days features are present in nftables, I've
spotted them. So I'll not focus on that. nftables-translate gave
errors.


This is what I had in my iptables script:


---

# Some variables, there are used in the rules below
facebook_filters=3D("www.facebook.com" "fbcdn.net" "m.facebook.com")
week_fb_timestart=3D"03:00:00"
week_fb_timestop=3D"20:00:00"
weekend_fb_timestart=3D"03:00:00"
weekend_fb_timestop=3D"17:00:00"


# Create table called facebook, which includes day and time
specifications
iptables -A facebook -p tcp -m multiport --dports 80,443 -m conntrack
--ctstate NEW,RELATED,ESTABLISHED -m comment --comment "Reject Facebook
during the week" -m time --timestart "$week_fb_timestart" --timestop
"$week_fb_timestop" --weekdays Mon,Tue,Wed,Thu,Fri -j REJECT --reject-
with icmp-port-unreachable


# A rule that applies the string filter, created by a loop through the
facebook_filters array
for filter in "${facebook_filters[@]}"; do
  iptables -A FORWARD -i tun+ -s "$vpn_ipv4_sub" -m string --string
"$filter" --algo bm -j facebook
done


---

I can't seem to find an equal feature in nftables that can perform the
same like I do here in iptables. A filter based on IPs is not reliable,
so adding the IPs of facebook.com might work for a while, until those
IPs change.

Does anyone know a solution to do this with nftables?

--=-XNmaNhlsDNEOB5rTP0YP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE9EOOACidEyH97tOb442fihuaY3sFAl9cz+cACgkQ442fihua
Y3uKJBAA1pZFZpnYbRDYzg5ibhO8HzxXkeHUA1MBeq8/FUOQBSeteEMa5XNKr/Qf
OL2P8bDAgLeCkPfZZ2DgEq0Oqjhjzvw9slpVp4La1Lf5/ACfU/ebWpP8bfsfjE85
bviEHbKyoU1bX64V8HGPMCGcwzdFTSCRLzo5zWQ2yevOhDKLAppA+zD13PAtC0Ic
JqjhIpCYJgZYna8PQTRm6SEMmoOr/q2HEAmkDQxepa1M/xuM9QGCZ+JxboqasODX
Nc4G9pHUAVWQpXYY95hAwBeA4jnsc/dpPvtCzYoMEc8lN/X6gkjIhh7eIUPEKxBi
AcwtdgX6NK0QncHYkPPPp+0EwD+5oF+OLi0GVjsI0IV1im9atetxB/lsZcW0OX1Z
GSz6VIm0IQHxlGO24T+uhaM51n3Zvmx3zpQIm8F/RBnGIlX19aSZ/WhB+txI9LcL
B32anmTLYW8towUTMvEWj8AK65Xxwv9T83gTMiEykUU+SuWBaMn2cRo4a6zUW6kz
FIjCrDku5nVn8k+oP0a+iqVyYPQmRxlzvq2Ovnr7eErXqW25ml3abqg2v+DQE0r8
XdgeLdfXwrE4OMZeSjUZCi0v61q2DAZRA09PXvz6Ov6ShL0ytb4OSyFwfA/ce0/E
o6aaCdUucOsjFDJ51mrrSHYfpdTiYSoEpQAXDQIPTFEWOB9QXOg=
=77QK
-----END PGP SIGNATURE-----

--=-XNmaNhlsDNEOB5rTP0YP--

