From: "etkaar" <lists.netfilter.org@prvy.eu>
Subject: How to concatenate subnet with port in a =?UTF-8?Q?set=3F?=
Date: Tue, 16 Mar 2021 16:34:49 +0100
Message-ID: <5q7dsb7wp.iCi4WV@prvy.eu>
Reply-To: <lists.netfilter.org+0cvssbcc2j@prvy.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=prvy.eu; s=20180701;
        t=1615908889; bh=mMXRUSJzSZVQsEwH8FVU05D5xykKerZQsFyrJQJCmtE=;
        h=Date:From:Reply-To:To:Subject:From;
        b=sjoKQK/p3MeFG1mc7IONjAaCG9arlA/iqmXhBD3t6QvDABQGS3SbvyUu1GzK8QjN8
         JxmWEgfXA1QtBM8h2yQsNdQoNj8ju07UxnxWYL9hWjngyW5Ht5O5jS8IdSA/gJjgfQ
         U1ioRuDNQehJrJ5Lo86R552jdN9XI4LSLbzBrNQX0Gw1IyWKyViqf32kQmvd/LvJRg
         Ole5PNozAdZ1FscnEBOP9jXdozNBRh6bWFEKqUV0wt0cy3ZnJj9KuDQ6/Kixb0Yn5k
         5kvhVo/MqRJZszfWlh5BliN3dXVhPt7d81hhFH0472zRD6hBlkyTFOQ/mKdrlWltiG
         0KkZz3LJotTsA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello!=0AI am currently using <nftables v0.9.0 (Fearless Fosdick)> on Debia=
n 10 (Buster). For a whitelist, I thought about a set like this:=0A1> set w=
hitelist_ipv4_tcp {2>=C2=A0 =C2=A0 =C2=A0type inet_service . ipv4_addr3>=
=C2=A0 =C2=A0 =C2=A0elements =3D {4>=C2=A0 =C2=A0 =C2=A0 22 . 255.255.255.2=
55,5>=C2=A0 =C2=A0 =C2=A0 22 . 255.255.255.0/246>=C2=A0 =C2=A0 =C2=A0}7> }=
=0AYou can see, that on line 5 I used a port concatenated by an IPv4 subnet=
. Unfortunately, this will not work. I could use subnets, but only as a sim=
ple unconcatenated set.=0AMy question is: When will it be possible to conca=
tenate subnets with different types such as inet_service (=3D port) in sets=
? Or is it already possible in a newer version than 0.9.0?=0A=0A=0A--etkaar

