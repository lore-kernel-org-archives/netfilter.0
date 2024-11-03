Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36563157490
	for <netfilter@vger.kernel.org>; Sun,  3 Nov 2024 07:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730620295; cv=none; b=LKGLgDVZPgCW80GbtrSuV2yPSW4EaY/E0MW7ilo01w2bKhWPM/Tq4i/StN9/qQMreq6JH+UIeKWbooyFPpqL3OTcihJENAHUZ3K+qdcMwc1aEQqAcGXU//tKhopoRm1mWItu4g2vIvTJJ6oyS0Wr+OY1KpSj/36fHs01gsviH/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730620295; c=relaxed/simple;
	bh=GTOQRAq1icJntlztXaHQ4QDCxY8NfQXJejH9lzPEawo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=GS/iaJhoYJF00+8iA5aZKLAiKO//j/wR9bGOiUFe2n5ECIRPf1xl34ttVAj+1KhyfWIjhUJN2rkJcTjxhMXRtgtzVEO435Sgjm8SDNkJ+Jblc24KctJJD6ExETsOpspItlML8FHiQ2wwQG/DF2rwoqW7Zv6RP+eiHlduLduPePM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=lars.nooden@gmx.com header.b=XpzkDLEZ; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=lars.nooden@gmx.com header.b="XpzkDLEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1730620291; x=1731225091; i=lars.nooden@gmx.com;
	bh=75TL4tJWJPBCuAOg22Jm/0nE3KxJvf5lcFC7ZngVy4s=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=XpzkDLEZXqbFp4vcb1pdPj3VvsbXry6YijRJZbWDvoGMgDOxSMpaQO37kNxpZtri
	 1tPfVQ7X7HsyyY2oXJg8+qt0dL32EHGyLjSFuw6quMYd7zMlgQQm0uyZtP5mBvEl4
	 isvlenYHPPJVymfT26A9ZPp3TIqpX3bgXTztG8JCTIzCC98LSiyBeguXma2/SxT6y
	 4DLDZVdDp1gSoVXNoSGSJBSWf0KTCMz/F+tHHLQ/uBDe76aPMQ7q40h8NqsH4inLB
	 /87aY4C7YbwypP4ngLZa+tVvdQtR8h6bOiABxEzy1f5uhzyRCGMCY4fXS/ZcASkzk
	 wQeRZnxqau9494ZGwQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.11.9.65] ([80.220.108.110]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1Mo6ux-1tdmp73l0N-00fwsR for
 <netfilter@vger.kernel.org>; Sun, 03 Nov 2024 08:51:31 +0100
Message-ID: <d985d5e4-18b9-4f66-9e24-c7b1c9640caa@gmx.com>
Date: Sun, 3 Nov 2024 09:51:30 +0200
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: =?UTF-8?Q?Lars_Nood=C3=A9n?= <lars.nooden@gmx.com>
Autocrypt: addr=lars.nooden@gmx.com; keydata=
 xsFNBFMwE5UBEADohhbeU/1lQZ1d9TN6ePhW/vw42MvasRrWJpf2t6D/y0xxbpMZTWRCgQ37
 9UwAUATwfPKQ8ScZZaiTzQYZ+yAWkeOu/4BcOCr+k1KT1fW33lspRbMmmnf0OljbGazi01+F
 qXiC5pPvk3fj6nlSTI3GreV8bLxuTDltCnkkkxkgkd6W8MfEwCBGJySrk5ljnhIAi9PjClzs
 /qw/twOtHGy1EkH2huPgTOHmybgjOjz+3H19KHBnwSyZQ5me9ftWpUmaAMeImVW7nGNTqpUD
 NR01pELI8LwYzI6v8a95qflY0SKYu6bKg7sNlEvwFqm+ox6jBrm/w5dNhz71IJJDRa3Cpugf
 a64YZC021taHdTvs8fYqUOyYzh8g9ilkfD+fkJ6nR+2PUx9yeLBKCsJT0bkNdFGhmmD9aafD
 LMRhbFCHanEGERT89LRWpb26TTjdWn9Bv3n4TKc3gGX7YhFqACEOfB8zFIfb+cVASmpTU76z
 +hVTFbQcr8Vr67528ehiQFUvlptHgZlo24p8HhbKiKlLUEshL7KjDcXnUyiMoXNxkcZ99spY
 eWAMaapaipsGLTMfjEBxt5hxVti0ewTFc28sdbVY2jOesAIiNWhrxFEIhWW09o2PO9Z+3XRO
 Z/Hkrud0ofx2zVXwPmHhZ61yQkp+c9aso/rkMVojiVbsoy2jbQARAQABzSJMYXJzIE5vb2TD
 qW4gPGxhcnMubm9vZGVuQGdteC5jb20+wsGXBBMBCABBAhsDBQsJCAcCBhUICQoLAgQWAgMB
 Ah4BAheAAhkBFiEEU75BlAiumCkMIiuL3vIKtmU86ucFAmXt7ckFCRSd+8sACgkQ3vIKtmU8
 6ucYGxAAlQWtwNA28c2dbGMlwl/89KQiW4YCqbQ/Ywx5j1te2vnnLscahSYwI08uYWPfr3F4
 63zB4vzpwYTYvaCN9/ejdiODJAMlktUBKfAHtNWQForHEOA3f6iHl+ScxvoumvjQ8L2rYW5J
 WxgsqAxZcqyHgPkpCcNBcKddQ1GX5cdCm+yHyA/BWgEWB20BtysMdpY4swct6b5JHzzf3I/V
 HCi59apuy+aUfkMDrcKsPjQnQx7LCvRJcMHG9N9QduwGMZG00zJnwZMO5FM51UrYlpA+dntG
 QP2ARBkkPSzWW3vBQXqjVCjdVpdGIO71Tjiev500WldJz5qALrqjwFF3/rmsGcmSZHErRINB
 bTj3pBKw/4G5+g0W6sgTi5Px62ebTHvRPI7ouiGVZdhfA8s8uNmvEZKUQWxRibz/Bg8cVMAn
 +TwLA10m/R6fpiBLcT4F7yg180jVuKv2oxvxfsgpVg06IoC1QG92F2UtOSNguDhPPS8X5IBe
 o59tROq9q1o9gq3AbcJIC84srCVuZQcv60kq5dbuDy+SoJrt81VzcjujhF/1c+TkJxfrYcbN
 eHBNedOzua2HGmYABbuP3s/Zh3lzz16N1u0nZb+qxTzd3zaUXL7+bOoBSgH56YY1bCNd6qXt
 D4mDCcIxUEYX/wRCkehxI3t9iPP2Hqpl1H/j/PW9aK3OwU0EUzATlQEQALJiBEqFsa8oBktK
 W5kYrYvPfkWNc9+oyulSyDkFLIBK0dxfon+Icjxg9mHTVdnu+J5gZ5xfcJh293RjaGQa4Gm4
 E71KemjQempaEiuXL2RNBMElwtrLxDpsztRANstM0l76pBqHpruInJlNk62dcMf64c0TcZR0
 gf47ni06+ifxGCm2hCe+BoHJo+S4Tke7j33GGgDPNX6zLpxrqdauDko0cU0ArgPHH88ZxXP6
 OROQWpkZ31AvyyeFS1ghaeU4R5mKszalAUlSJ5gMBWmOAt7yT6GLNZCxwaFF80CY2Apnbk/N
 pUYYoS89MehbqdVIgoEsBOIP5gI/8xc7sV61oRTBPLJJhp1ngNl7+/V4EGdz83e9ukjvNrNc
 nJxntzBZWFe0deewViWjoStS9nmMhqNGchRmFd1Y8s496qlRC42z6uGyxfp2JddEMz61DtEq
 hWdfx8qVQtzYoUjVg+etMF3YC3G68OHCjFEmd8ygrWewH8G1s4R2OZ7EyFCzCIa10iu6EZr3
 Qem+r4tGacoOoPDPLBc25AJiQOehJ0hto2aYHENVfsksrS7cQesJ6av3KzUh5C2Icl/jPQLJ
 6vf9ncDLGNz7lAkJ+D2fT1a81BZ7kZnvjcI1MyapPxsxCjwvzlf63M/kIlQ2kirc87l/tqK1
 KGcDVQ6nEctWZLHIBABxABEBAAHCwXwEGAEKACYCGwwWIQRTvkGUCK6YKQwiK4ve8gq2ZTzq
 5wUCZe3tyQUJFJ37ywAKCRDe8gq2ZTzq588aD/9v5/UWGfyc6RBlq9vXZN/FLSSR3ar7e3FH
 slAUtjONGLxEFxqFu/D39qG5oQnRc0KfsyQkg2DGuLDOlA8GbSkantoYAiHV7BzFsIGlXwFG
 F4Hkae/RHjqExjvUz25nY58s81UC5+H02k4Ouhw5MACDV96YUGUlwmVvphEjaKVC7/8xWIJy
 MMijwQcaoFqrXdg6AkFoC+MB1qnDKjjNhsGM1hlr1K8RTZtruMknAC3XN0D4UfMKGFkX3Bil
 cw2zB2IFuHqdltAHuGGrJALdhYQ7jV9F8xyhNxX8UuWFewvFksOCIp32eXoZ2gWf+0v+3ZDr
 sN+U9KNIhx9jg2sLuy6ubShm2iQcLtJhRW69ipqebz+BmB65BhwvFRn0HdgLWRbnOpozbEIe
 B5kev3TnJzvZru339yYb4vKhS/rfS+gk9V0ZvO4F6gj18acE9AJ2o8lcNjMd5VsKitbGDzQj
 xyjbmwVA35xYVacWChTKVt1wORj/WG3KNK0xOsGclHHRhUHxpSoBGBw+U5aLFYqKvze4ckno
 qhc6mOiJteFQ1vCuaZAz3fWvcrSz4bsZzuFph+U/jHmlTxvtrQ7gO9wghij+ErInvfjPI7Le
 nArCVvIbhs23saOr41MHsy4VxWUTj0RxWI0vIiTgOuS9e0hdr1CVhLFtXvxuYPas+0IuO0xr 2w==
Subject: Countering some types of SSH spoofing with NFTables
To: Linux Netfilter Users List <netfilter@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VPENixxfyoVQ5Nh34TE55feaoF6F4gwlFl3+mCODMhDygwC5pNE
 HVuSPFS4hcVn6vTBksKdgiSIyaoNVmdDVELiBdJUcATKCd/4zLOPVQSuIUUT5OvbUVa7j2U
 hs8zWly4fE5OAJMQl5Sbgg/4tm7RkYEzZp9DpmdHYpniCQELrjDrKbwwcRL7eBQdEB1AcXO
 8L520JAaVZD4yqDHU1J1Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZB651c5k+z8=;u3ToeUNoaYXIrFrH1Py6ZOI9yFX
 Yuvu2PYT596gmhzXFgelbjfkYAJTqrKWluLhPYMXkMjjirWnVGcRaiP3YCLBNO2mK6bw2b3FP
 W6Lixsx5FEo7dRGoBJx8iBwORi6/L6eK8uaSMX3GI+46UjV0Pb8HnyIpJswuPrROD0/QaQKSJ
 1STXxfc6UObYQVew/r0IaIuhnOEd51DFJEoxlHzfxX76hTIAyZ+2AEawAVu2M0Lj2Lm2sdNgP
 RB41w6XzFsFrhDnfkV6m4PuhilteUiwwnLFUUNy7neEFwdA+y7Z1+hw8ME6jchNSjaIVt5beI
 m6f44iVjGkBXA54oSFPOzaDoD4VtpIy/hFKjip2O0lkA+MB9R0zVkRhBI68GuOYLWZrSQ++ii
 wkXrvn+ujrhhysojGGh+uObCddEiiwlx3CO5+TU5ysEXEzdzCfs73S3pzx2Iy02ot437SCDtb
 jorruf8FMPG51iHB+2qvPMiqmo6ageh/DphAaFpD7LyQWiafgw+1PhccgM5vDBt1DbP0IgoU2
 Z6tBoeZEah8JJYn9KRbgzhs/nX4TbNkLwS7GrcTttM2bog5CslQPrI5MEWpiRFFdXmcXPdIRV
 9SITZvhsr0EtLed7mgqHQPEbOBawkfjEv5DZPj1eFIVqzkUQesIc5QQIwAEJ+FrYwqXxEOtbC
 CNyy24wZlkwvZq6NSiPfOhwdX4LCqxoZKqybinpG98s24xe7jcq4WEbQvxnldHZjB+lKrBqzi
 rcyz79YRiTrU+wwc3MR9r3sXbn0KbFEfdCYM1gghsTYbdiSpNHTwv8=

Greetings,

There is some discussion on another list about dealing with the problem
of a type of spoofed SSH connection.  Here is a description of the
problem, along with how to use tcpdump to identify it:

	https://delroth.net/posts/spoofed-mass-scan-abuse/

One solution offered in a message on the other list was to add the
following rule into its own table:

	nft add rule ip accounting input \
		tcp sport 22 tcp flags =3D=3D syn\|ack counter

The following seems to load without error and I have some beginner level
questions.  Specifically, I wonder how or if it does the job.

Also,

1) Do port 22 IPv4 packets pass through both tables?  They seem to.  But
how can I verify that?

2) Is a second similar table needed for IPv6?

3) Are the counters for port 22 in the 'filter4' table redundant with
the counters for port 22 in the 'accounting' table?

Any explanations or corrections welcome.

/Lars

#!/usr/sbin/nft -f
# vim:set ts=3D4:

flush ruleset

table ip filter4 {
	chain input {
		type filter hook input priority filter; policy drop;
		iif "lo" ip saddr 127.0.0.0/8 \
			ip daddr 127.0.0.0/8 counter accept
		ct state established,related counter accept
		icmp type echo-request limit rate 1/second \
			counter accept
		tcp dport 22 ct state new limit rate 4/minute \
			counter accept
		counter reject
	}
	chain output {
		type filter hook output priority filter; policy drop;
		oif "lo" ip saddr 127.0.0.0/8 \
			ip daddr 127.0.0.0/8 counter accept
		ip protocol tcp counter accept
		ip protocol udp counter accept
		ip protocol icmp counter accept
		counter reject
	}
}
table ip accounting {
	chain input {
		type filter hook input priority filter; policy accept;
		tcp sport 22 tcp flags =3D=3D 0x12 counter
	}

	chain output {
		type filter hook output priority filter; policy accept;
	}
}
