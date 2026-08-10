Received: from scc-mailout-kit-02.scc.kit.edu (scc-mailout-kit-02.scc.kit.edu [129.13.231.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886F923393F
	for <netfilter@vger.kernel.org>; Mon, 10 Aug 2026 01:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.13.231.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786324664; cv=none; b=kmSNtg0rT5XCkamkiJaPPFMK2lew/h4NMv5UK/KLTGE2xmA+JtFd5KRLwB2fSh9smMrZvaoPxLoiRnNTZHV4KZZJw5PvsvPF84aR8J7z6OmDISuHgCppA3Mkb5IHc7qEvyMhVdGmtuYX57h0fS3NNQnYYdcHtOFPSEpOj/39mCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786324664; c=relaxed/simple;
	bh=VHJqrx5581ga+f6P5BAkDWYE2jsYYzBFh6BX2ejLukk=;
	h=Message-ID:Subject:From:To:Date:Content-Type:MIME-Version; b=UkDUVGhWTJ3Cr7D7zEmmC2rHRujWx9ucvoTymNsA3jiiP00ywPIDnGLvBN8SpXmWOTlojWf6BhKjrBttx+R4cPEKGPs7BIF7hElTW+SQ/qbtd6uZFtGWTY2EQqE6AZQPo9mNM9QVyRq7L4heUsWGCx0uMjtv7IhxYSsZ7VBZMLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=student.kit.edu; spf=pass smtp.mailfrom=student.kit.edu; dkim=pass (2048-bit key) header.d=student.kit.edu header.i=@student.kit.edu header.b=BGpYcmBu; dkim=permerror (0-bit key) header.d=student.kit.edu header.i=@student.kit.edu header.b=xC50qmvv; arc=none smtp.client-ip=129.13.231.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=student.kit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.kit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=student.kit.edu header.i=@student.kit.edu header.b="BGpYcmBu";
	dkim=permerror (0-bit key) header.d=student.kit.edu header.i=@student.kit.edu header.b="xC50qmvv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=student.kit.edu; s=kit2; h=MIME-Version:Content-Type:Date:To:Reply-To:From:
	Subject:Message-ID:Sender:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=55l9EVYlFQk8VxTFVzXj1izB+ricX2Ez3WYoEMLKKuM=; b=BGpYcmBuZwDLZzRfGS9f1qAno/
	iAKZc+28TypL3h/YOZBlUn1331f7xjrqxwCYNnnbp+gmg1wiCZ/tLG8uRmAfbZlxYlAe7zV0VBYjy
	NCXIShGmH0opcpCvgbH0/aliUV3XeZ9oW87iqYTI/8Jhy1E1ZrYh4p2w14GkXxhDecjvQVO85eQyC
	vIDQXWcKKGqaKBZaZxIQmOOOE+GtBQYytuuRUJPn4XF0XXAM0QLoBN/6cVeA25rElJI1LYSzvGRCT
	5UoEGvFLTTjwiki5sujjsa8vRPPBBvK246KGr3lx5YUc6TRMRiTj+eSJVbTxmAtv59bS5MthCLwrg
	AE+r3FtA==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=student.kit.edu; s=kit2ed25519; h=MIME-Version:Content-Type:Date:To:
	Reply-To:From:Subject:Message-ID:Sender:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=55l9EVYlFQk8VxTFVzXj1izB+ricX2Ez3WYoEMLKKuM=; b=xC50qmvvz5m3QLzYccK6YxoxqS
	8rdlCs0diXh/UaC6latlcywzUFte+RVqSHkM8chGwaWpM4O3Ez9aC4BI8HDQ==;
Received: from kit-msx-44.kit.edu ([2a00:1398:9:f612::144])
	by scc-mailout-kit-02.scc.kit.edu with esmtps (TLS1.2:ECDHE_SECP384R1__RSA_SHA256__AES_256_GCM:256)
	(envelope-from <julius.rueberg@student.kit.edu>)
	id 1wtEdz-00000005yxG-3TtN
	for netfilter@vger.kernel.org;
	Mon, 10 Aug 2026 03:17:37 +0200
Received: from julquiet.fritz.box (2003:f3:4f35:5b00:eb73:db74:28fa:deb9) by
 smtp.kit.edu (2a00:1398:9:f612::106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 03:17:35 +0200
Message-ID: <582d218b638be68342dd80893c41746b35c1be76.camel@student.kit.edu>
Subject: nftables set/map operations failing in user namespace with Linux
 7.1.6
From: Julius =?ISO-8859-1?Q?R=FCberg?= <julius.rueberg@student.kit.edu>
Reply-To: <julius.rueberg@student.kit.edu>
To: <netfilter@vger.kernel.org>
Date: Mon, 10 Aug 2026 03:17:34 +0200
Content-Type: multipart/signed; micalg=sha-256;
	protocol="application/pkcs7-signature"; boundary="=-5StNle9XtNr2qCa3BQyc"
User-Agent: Evolution 3.60.2 
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

--=-5StNle9XtNr2qCa3BQyc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I'm reaching out because I'm encountering an issue with nftables using set/=
map
operations (e.g., ip6 daddr set ip6 daddr map @forwardmap) inside user name=
spaces,
introduced somewhere between Linux 7.0.12 and 7.1.3.
I don't encounter the issue on the LTS Kernel (6.18.43).

If this is now intentionally restricted,
could you provide me with a workaround on kernels >=3D 7.1.3?

Context:
We (the kira-rust project) use nftables in the forwarding plane,
and rely on unshare to run our network emulation in isolated namespaces
as unprivileged user.


System Info:
- Distro: Arch Linux
- Kernel I tested:
  * 6.18.43-1-lts: succeeds
  * 7.0.12-arch1-1: succeeds
  * 7.1.3-arch2-2: fails
  * 7.1.5-arch1-2: fails
  * 7.1.6-arch1-1: fails
- nftables: v1.1.6
- Architecture: x86_64


Minimal Reproducible Example:
$ cat <<EOF | unshare -u -n --map-root user nft -f -
table ip6 foo {
    map forwardmap {
        type ipv6_addr : ipv6_addr
    }
    chain forward {
        ip6 daddr set ip6 daddr map @forwardmap
    }
}
EOF

Experienced Error:
/dev/stdin:6:9-17: Error: Could not process rule: Operation not permitted
        ip6 daddr set ip6 daddr map @forwardmap
        ^^^^^^^^^

Sincerely,


Julius R=C3=BCberg


kira-rust: https://gitlab.kit.edu/kit/tm/telematics/kira/kira-rust
KIRA project: https://s.kit.edu/kira

--=-5StNle9XtNr2qCa3BQyc
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCFBYw
ggZEMIIELKADAgECAhAV+a5sqo0u1NNveH8e3HsBMA0GCSqGSIb3DQEBCwUAMG8xCzAJBgNVBAYT
AkdSMTcwNQYDVQQKDC5IZWxsZW5pYyBBY2FkZW1pYyBhbmQgUmVzZWFyY2ggSW5zdGl0dXRpb25z
IENBMScwJQYDVQQDDB5IQVJJQ0EgQ2xpZW50IFJTQSBSb290IENBIDIwMjEwHhcNMjUwMTAzMTEx
MzA4WhcNMzkxMjMxMTExMzA3WjBjMQswCQYDVQQGEwJHUjE3MDUGA1UECgwuSGVsbGVuaWMgQWNh
ZGVtaWMgYW5kIFJlc2VhcmNoIEluc3RpdHV0aW9ucyBDQTEbMBkGA1UEAwwSR0VBTlQgUy9NSU1F
IFJTQSAxMIIBojANBgkqhkiG9w0BAQEFAAOCAY8AMIIBigKCAYEAq7hur/5vIqMejblfPfZgGY75
auSZz5SZ9x1dIIjvJrDBT0lIwQcAAoABJomkuv0kDK362UH+uf9JrOdLBjiKkEh99HQPmT+d1+Ij
nnd1aAjiL+2Q4aU16P/snITYJL2ROU46zqmDkdoOnCqMCEKSN74gHKDmApYfqXO8wmjmNA62wYHa
rp7lxgrBr0sk4BxHyKq52z0sWyxsdIy5V1K5OOkCNwYupZ9b74LRhelYP5SieNDqU0S6IpQOasVz
5IS0vDnqVi2ni67Gbgtb8dBKzH6gbAwGppHoeEFDcvJ042Oxtxt6BGolkUmguyfAgeisRqDjhQi+
NfNgkDH81OLBV0eV07twS9axwNvJAtH2SgGiWKrYeuBgVCzs1DFT7sws1KHyLrOdZU0hJQSDfoz/
8jwFmXhWoPvQQuWEoo3uvH6LsHAo53aDF1aAUmGQ/JC72j7zZH16leJFuWj+t2TK/7YEVHtWluA9
TOdx2Lz/SHh0/+pAVicD4N/QUWPuBhzPAgMBAAGjggFmMIIBYjASBgNVHRMBAf8ECDAGAQH/AgEA
MB8GA1UdIwQYMBaAFKDWBz1eJPd7oEQuJFINGaorBJGnMFAGCCsGAQUFBwEBBEQwQjBABggrBgEF
BQcwAoY0aHR0cDovL2NydC5oYXJpY2EuZ3IvSEFSSUNBLUNsaWVudC1Sb290LTIwMjEtUlNBLmNl
cjBEBgNVHSAEPTA7MDkGBFUdIAAwMTAvBggrBgEFBQcCARYjaHR0cDovL3JlcG8uaGFyaWNhLmdy
L2RvY3VtZW50cy9DUFMwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMEUGA1UdHwQ+MDww
OqA4oDaGNGh0dHA6Ly9jcmwuaGFyaWNhLmdyL0hBUklDQS1DbGllbnQtUm9vdC0yMDIxLVJTQS5j
cmwwHQYDVR0OBBYEFOuyLzv9rgLMKkQGXSXNHRIiaLBHMA4GA1UdDwEB/wQEAwIBhjANBgkqhkiG
9w0BAQsFAAOCAgEAO964RfbcPCuTKAq2wXsOZxMaaLxITbSOYkt7RMxPw3CzU2qmkTQALKbVqC1j
UiNQWbkxZpsb8hy9FOHywH1xFmANAypks0Iuh+ovhqP90oFcfhvAfYxV2M0cGga9mTKFHP+QET7H
W9pZdyWFZAw5fmdW9Ex+IQmJii0w/sozzwhpVn0OQYkkRV+2ydRa68JZS2NqAPpdaWoseM2X4u5+
Jn+H2UO9paobX+ht91K2Ch8xzfREv4RLqBgpHBmkIDVygXNdXsKfDHy2hOXxtF6oI1d7ErPGWoBx
Fc86aUqQlC6pEjb3ug24w+eg1kJj7IufHJ3iRm67Rdw5M1OlWMzxu+DwAKqFJhqes0OL/NOJOTuD
Cb0bIfVfjl8U0Y0QWCkhoCmNPZQQu6QM6Y/XxnALgRB4drA8kip98wSZQmbqptE8oac2ZzLKCHiJ
lTdBuREsundnpBXdahMSrJ/mYv2pMZLpYkbrkvyhorDVeH9t0a5UgPIFqGl8/ZzakJ3RQfr7HvdG
ur0YWU6KNWvY5BK8qHMRM0b3XtK9xREIGEychAVReodDIhjrR4fWmjpa006r/UrmSk4bpKrVFVzT
YsSK3jy4ri1ExVQp6RI6Ou4ZdbfwOYCuI9wweMjpVBuqNzRKrVU/Pvp57gUzm4u+JJRkdioMOoxZ
rwsUiYr2KIojwTcwggbjMIIFS6ADAgECAhA8uwhm9xlY7POW11dGvfa2MA0GCSqGSIb3DQEBCwUA
MGMxCzAJBgNVBAYTAkdSMTcwNQYDVQQKDC5IZWxsZW5pYyBBY2FkZW1pYyBhbmQgUmVzZWFyY2gg
SW5zdGl0dXRpb25zIENBMRswGQYDVQQDDBJHRUFOVCBTL01JTUUgUlNBIDEwHhcNMjUwNzMxMTU0
NjUyWhcNMjcwNzMxMTU0NjUyWjCB4zELMAkGA1UEBhMCREUxGzAZBgNVBAgMEkJhZGVuLVd1ZXJ0
dGVtYmVyZzEtMCsGA1UECgwkS2FybHNydWhlciBJbnN0aXR1dCBmdWVyIFRlY2hub2xvZ2llMREw
DwYDVQRhDAhHT1ZERStCVzEQMA4GA1UEBAwHUnVlYmVyZzEVMBMGA1UEKgwMSnVsaXVzIE1hcmlh
MR0wGwYDVQQDDBRKdWxpdXMgTWFyaWEgUnVlYmVyZzEtMCsGCSqGSIb3DQEJARYeanVsaXVzLnJ1
ZWJlcmdAc3R1ZGVudC5raXQuZWR1MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAoqiD
WnWP+KAdi07WnfOIx7iMUAQK1iA3HVmq9aree+OVLHXteBPvCTpG9DBcXVZp1kNnfXLbf8VwJW68
qQrofPdx1NCfAYAJHYBYsTcGMIhqTMBinOzeaFisPAntV+0A6aYDLyrFOgUkhQ/gHqCsgRB8vnju
TdmE3GlC6WGlnEyEt15luxpEnW5zIZBBr4wmT+o8Kk6h5uT7OL7IIxt98hcQpxAWXb1+voyOQLn4
gSkQLmF3mbR3aGYVwtGkVL0hW0zI15z/FOvf7LP/j+yE+9q32I4sbrtFek3otDTpNZU78svUvRLc
JwSJ1dXmOgcVFWdjfZP2aGUgPV0R52qHcBHCw7P22tsvyv0Iogw+sr9yk+M1M919/lsrYDtkkAdr
b9GgxCwQzYhzTvtNEHb0qRKZzUpoU8JXTtIAZNW0stfoWwPaoRByDsRBS8JfVUKvlOwlx2fqY5xt
95Px7xYV3ZluBrJcbidLqJgJ0xQmABG8IYf1QuKcAB16gLlNOz/m1eCSURI+U2MPmRiXHuIyxu56
CRgSK5P+wC986YodQvshXpoeWZEU1kahzaET5//ZTsArCIimFWvR65YpWn0AHnNx4yiRvGauQL3s
yfhEtPVeNmIqpu1JQPpiAdLoeBGY485wWZrYiQCtBGFPYtcLmCMjlzYgObdf6qoZ+76Ek+MCAwEA
AaOCAZAwggGMMB8GA1UdIwQYMBaAFOuyLzv9rgLMKkQGXSXNHRIiaLBHMEoGCCsGAQUFBwEBBD4w
PDA6BggrBgEFBQcwAoYuaHR0cDovL2NydC5oYXJpY2EuZ3IvSEFSSUNBLUdFQU5ULVNNSU1FLVIx
LmNlcjApBgNVHREEIjAggR5qdWxpdXMucnVlYmVyZ0BzdHVkZW50LmtpdC5lZHUwYwYDVR0gBFww
WjAJBgdngQwBBQMCMAgGBgQAj3oBAzBDBg0rBgEEAYHPEQEBAgQCMDIwMAYIKwYBBQUHAgEWJGh0
dHBzOi8vcmVwby5oYXJpY2EuZ3IvZG9jdW1lbnRzL0NQUzAdBgNVHSUEFjAUBggrBgEFBQcDAgYI
KwYBBQUHAwQwPwYDVR0fBDgwNjA0oDKgMIYuaHR0cDovL2NybC5oYXJpY2EuZ3IvSEFSSUNBLUdF
QU5ULVNNSU1FLVIxLmNybDAdBgNVHQ4EFgQU2f8jDCmwecG+RKfgIkga/vpR7VwwDgYDVR0PAQH/
BAQDAgWgMA0GCSqGSIb3DQEBCwUAA4IBgQCLt/KuVqn1Qsj9QpwA2eq5vddKhCHXMfxy1B/HfeMi
oZ+Qc18tvcQXTHgc7S3he2RCHTlR0LBeZm/0vjpRoJqE4UEaFYxebLbsOQn4ujNohaQv31581h7+
/OemZz77OZVl1QdpZmjNMvNw2uLvIDjquJ4waB6TbSUKjRbpHOYTCAJianHMOUgYqIudmxjxPaab
JVNcmkzMjNOjpS8Zf0Xa7X5tP+lV4vpM9HwlpQncYers+a1thkGa7BIeqen9wMYlH+7dLFxxKm3D
Q3eKTFZdv6m3Lw8L4HS0DkZrNPhtwkxBp79SYCg24S3IWHtnagBRpxkoqrIsHYxSf6bNfd5dTlL4
QAxThrSMJbiY/hYNHMcCUjD+TqKKvvGnd3hklCxICUgfQ4A7wLJotwOGcERWGzVAbXLruVSkoqAr
Yevk549hn8Wv6EcHP684qrOVGn3R5SH5TVFZ62UQZQQ2WylhKeB707JSbnQe0uzvoIyN2mB8bDPP
iJxDr3ncWtY7R7gwggbjMIIFS6ADAgECAhA8uwhm9xlY7POW11dGvfa2MA0GCSqGSIb3DQEBCwUA
MGMxCzAJBgNVBAYTAkdSMTcwNQYDVQQKDC5IZWxsZW5pYyBBY2FkZW1pYyBhbmQgUmVzZWFyY2gg
SW5zdGl0dXRpb25zIENBMRswGQYDVQQDDBJHRUFOVCBTL01JTUUgUlNBIDEwHhcNMjUwNzMxMTU0
NjUyWhcNMjcwNzMxMTU0NjUyWjCB4zELMAkGA1UEBhMCREUxGzAZBgNVBAgMEkJhZGVuLVd1ZXJ0
dGVtYmVyZzEtMCsGA1UECgwkS2FybHNydWhlciBJbnN0aXR1dCBmdWVyIFRlY2hub2xvZ2llMREw
DwYDVQRhDAhHT1ZERStCVzEQMA4GA1UEBAwHUnVlYmVyZzEVMBMGA1UEKgwMSnVsaXVzIE1hcmlh
MR0wGwYDVQQDDBRKdWxpdXMgTWFyaWEgUnVlYmVyZzEtMCsGCSqGSIb3DQEJARYeanVsaXVzLnJ1
ZWJlcmdAc3R1ZGVudC5raXQuZWR1MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAoqiD
WnWP+KAdi07WnfOIx7iMUAQK1iA3HVmq9aree+OVLHXteBPvCTpG9DBcXVZp1kNnfXLbf8VwJW68
qQrofPdx1NCfAYAJHYBYsTcGMIhqTMBinOzeaFisPAntV+0A6aYDLyrFOgUkhQ/gHqCsgRB8vnju
TdmE3GlC6WGlnEyEt15luxpEnW5zIZBBr4wmT+o8Kk6h5uT7OL7IIxt98hcQpxAWXb1+voyOQLn4
gSkQLmF3mbR3aGYVwtGkVL0hW0zI15z/FOvf7LP/j+yE+9q32I4sbrtFek3otDTpNZU78svUvRLc
JwSJ1dXmOgcVFWdjfZP2aGUgPV0R52qHcBHCw7P22tsvyv0Iogw+sr9yk+M1M919/lsrYDtkkAdr
b9GgxCwQzYhzTvtNEHb0qRKZzUpoU8JXTtIAZNW0stfoWwPaoRByDsRBS8JfVUKvlOwlx2fqY5xt
95Px7xYV3ZluBrJcbidLqJgJ0xQmABG8IYf1QuKcAB16gLlNOz/m1eCSURI+U2MPmRiXHuIyxu56
CRgSK5P+wC986YodQvshXpoeWZEU1kahzaET5//ZTsArCIimFWvR65YpWn0AHnNx4yiRvGauQL3s
yfhEtPVeNmIqpu1JQPpiAdLoeBGY485wWZrYiQCtBGFPYtcLmCMjlzYgObdf6qoZ+76Ek+MCAwEA
AaOCAZAwggGMMB8GA1UdIwQYMBaAFOuyLzv9rgLMKkQGXSXNHRIiaLBHMEoGCCsGAQUFBwEBBD4w
PDA6BggrBgEFBQcwAoYuaHR0cDovL2NydC5oYXJpY2EuZ3IvSEFSSUNBLUdFQU5ULVNNSU1FLVIx
LmNlcjApBgNVHREEIjAggR5qdWxpdXMucnVlYmVyZ0BzdHVkZW50LmtpdC5lZHUwYwYDVR0gBFww
WjAJBgdngQwBBQMCMAgGBgQAj3oBAzBDBg0rBgEEAYHPEQEBAgQCMDIwMAYIKwYBBQUHAgEWJGh0
dHBzOi8vcmVwby5oYXJpY2EuZ3IvZG9jdW1lbnRzL0NQUzAdBgNVHSUEFjAUBggrBgEFBQcDAgYI
KwYBBQUHAwQwPwYDVR0fBDgwNjA0oDKgMIYuaHR0cDovL2NybC5oYXJpY2EuZ3IvSEFSSUNBLUdF
QU5ULVNNSU1FLVIxLmNybDAdBgNVHQ4EFgQU2f8jDCmwecG+RKfgIkga/vpR7VwwDgYDVR0PAQH/
BAQDAgWgMA0GCSqGSIb3DQEBCwUAA4IBgQCLt/KuVqn1Qsj9QpwA2eq5vddKhCHXMfxy1B/HfeMi
oZ+Qc18tvcQXTHgc7S3he2RCHTlR0LBeZm/0vjpRoJqE4UEaFYxebLbsOQn4ujNohaQv31581h7+
/OemZz77OZVl1QdpZmjNMvNw2uLvIDjquJ4waB6TbSUKjRbpHOYTCAJianHMOUgYqIudmxjxPaab
JVNcmkzMjNOjpS8Zf0Xa7X5tP+lV4vpM9HwlpQncYers+a1thkGa7BIeqen9wMYlH+7dLFxxKm3D
Q3eKTFZdv6m3Lw8L4HS0DkZrNPhtwkxBp79SYCg24S3IWHtnagBRpxkoqrIsHYxSf6bNfd5dTlL4
QAxThrSMJbiY/hYNHMcCUjD+TqKKvvGnd3hklCxICUgfQ4A7wLJotwOGcERWGzVAbXLruVSkoqAr
Yevk549hn8Wv6EcHP684qrOVGn3R5SH5TVFZ62UQZQQ2WylhKeB707JSbnQe0uzvoIyN2mB8bDPP
iJxDr3ncWtY7R7gxggQjMIIEHwIBATB3MGMxCzAJBgNVBAYTAkdSMTcwNQYDVQQKDC5IZWxsZW5p
YyBBY2FkZW1pYyBhbmQgUmVzZWFyY2ggSW5zdGl0dXRpb25zIENBMRswGQYDVQQDDBJHRUFOVCBT
L01JTUUgUlNBIDECEDy7CGb3GVjs85bXV0a99rYwDQYJYIZIAWUDBAIBBQCgggF9MBgGCSqGSIb3
DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDgxMDAxMTczNFowLwYJKoZIhvcN
AQkEMSIEIFm5b3IRUN7Y2vnV0miAwZuhPNOVZdEP5tsb/rL9U8nzMIGGBgkrBgEEAYI3EAQxeTB3
MGMxCzAJBgNVBAYTAkdSMTcwNQYDVQQKDC5IZWxsZW5pYyBBY2FkZW1pYyBhbmQgUmVzZWFyY2gg
SW5zdGl0dXRpb25zIENBMRswGQYDVQQDDBJHRUFOVCBTL01JTUUgUlNBIDECEDy7CGb3GVjs85bX
V0a99rYwgYgGCyqGSIb3DQEJEAILMXmgdzBjMQswCQYDVQQGEwJHUjE3MDUGA1UECgwuSGVsbGVu
aWMgQWNhZGVtaWMgYW5kIFJlc2VhcmNoIEluc3RpdHV0aW9ucyBDQTEbMBkGA1UEAwwSR0VBTlQg
Uy9NSU1FIFJTQSAxAhA8uwhm9xlY7POW11dGvfa2MA0GCSqGSIb3DQEBAQUABIICACdXO333gEh7
a74FVGVeFrwhGNSV7PcE9wxst5jI+c2eYBPwlqskh79YEjElL7gtAqpn/EGUtbbKofup91WBTdIY
HxsUjkYpRLYbIDCbThz9NyJo8qvA6a7+B2qiZ2cLk559ZfXVyfb1L5DQBRKZs0mfKIsFT3/VvhbY
0Fycg41aIp13IrIN9KZlkOi8lXjrgYZM1lTv9QhoHF1Tj1jb9xJBXZZCa0Sk11cw1aIG4kWEGpg0
jGM1nY/gC5p8CtQpDD/APjhYbMjvqvNkzJhfO1JKz3h2CvoLVDowt77549Q5zQpd79t4y7AT2XFr
80tV5ir2RN91lLDzhed4CKkrG4ielzER8ZeqxshtCLPyRInW8DQOWv3ik/fvYcFFiV77VJyTDhl8
GUjhb6CZwAuo0xYdXKHwE4pZtf0ftol+fcNPoARZRHH+LofmbwUImY2utevR6Z1mi5BfxvROt1G4
gl6+FbQ6OKGgaO/enH9xSF8gjCO2MJrsoQXH+ZnJlY/bo4mZ7mo+vQaI2oJLF1JATVGGg0fD2qfF
XUAOJtbvoq8qEaQugkfBolXwQWybUkejuPaY4cxrH4rOnLkdbXBcY1TJiZ/XuyXq3byLybO91J1I
IesTKO7cPMuBpyUCxt8fU+nKTD13u+a5lCa1uv6drU/Y1pOx0q/Ptvm2m4h4x9J+AAAAAAAA


--=-5StNle9XtNr2qCa3BQyc--
