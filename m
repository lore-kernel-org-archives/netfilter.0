Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90AC1DC05F
	for <netfilter@vger.kernel.org>; Wed, 19 Feb 2025 23:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740007922; cv=none; b=ekOlJcR6pg/qO6p6XD3k8hv1fhhiawMn7mupPPawW9tlVRWvvlD4aXHQ3Ii6OV1xWQWh4A/YO98QTOFeoqRJwlxBuUJCG+Rutz8/oaAfB4QS/3pGvcnmk//NP/2LRRB8FqpormZYrKdisqSA2Z+R23mbUzrJHIkkk7qsZV0Fvq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740007922; c=relaxed/simple;
	bh=gJvC4BMl8hueBCa0gZtLdj3BZsMIAt25ONc90OhDfLE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cq5RT+j66EvRuiJ68vbd3kHOab/WQ1IHVjYG8Lcp+FQeLOiebGjMcyLQygvL9rccetBNrg3ggbzdiisOMRoQ/t8VeRhSQ3xEmbnDBlY354wLqNANGzAWnnsU4vyXcLc+EbUDq2Z8kxADY9CB4axmZXdpqZsg84aArqggi5WxF1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=E/UkjOMo; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="E/UkjOMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1740007912; x=1740267112;
	bh=Rcb8ZQMPobmd6x2Qrttjjd3n51zh7+7nK+vTGGWAUvQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=E/UkjOMoT1RN9tiaBVUotvVrhOd51wPoAlsK3Mja50O0l+Ludrq+YcuXDR3vxH5o/
	 0BY2FYWJOUVqpex2mgchb36ePPgqx4iw+CmjHZ+Y//7Rm5hapJpoeGideT4ZT4xNw1
	 KvpusQEC07AnRBdoMIYdHQuG1NUkcIGMx41ePCmhkf3kwqjKoKzfSJoh9unRTlbcQg
	 jG8jg8GAeF5HymbXif4E/lBiTrjMsk8ixeUDbdQRu1M3xt9ncyRfX6kfdUHbahDTsg
	 h7G4FbxhTbRxMYeNKrC4LiNWUKbAkyzTntee/PxZ08+bSw1hbCWLB4/t6UjmsTjbaa
	 IXRlLQWu0aeaA==
Date: Wed, 19 Feb 2025 23:31:49 +0000
To: Chris Hall <netfilter@gmch.uk>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: NAT and ICMP
Message-ID: <4hsquyHJcCy4nfOS75I-ZTDKSl8H5iO2rcJKyfAAuexJ7Kakp2TR4Z9UK0DYtTHmPmOLNKO7OKAFKw9X46HC9Y5Juh8NK-4A9zKnfjajs1s=@protonmail.com>
In-Reply-To: <79155174-f4f8-4368-8fde-cbab6b30091e@gmch.uk>
References: <79155174-f4f8-4368-8fde-cbab6b30091e@gmch.uk>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 812676f4a5e27a2db014d2a8c98f0575741533a7
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

> ...configure the firewall/router to use a different range

You do not need to allocate a different range, per se; the port selection a=
lgorithm of the kernel will only use a port if it is not already in use.

For LAN to WAN forwarded connections; you should SNAT the local port of mos=
t requests to the range 49152-65535, and the address to an available or app=
ropriate 'public IP' (appears to be 203.0.113.1). Requirements may be diffe=
rent as defined by the network administrator for your LAN or a MAN/Intranet=
.

Refer to IANA Service Name and Transport Protocol Port Number Registry for =
a description of ephemeral/private/dynamic ports; and why you may wish to a=
void the 'System' and 'User' port range for local ports. There are exceptio=
ns: NTP is static 123<->123; do not blindly NAT everything.

> ICMP "Query Identifier"

May you explain this one in more detail? I'm unfamiliar with an ICMP Query =
Identifier.

> SNAT all outbound ICMP queries, something like:
>
>  .... ip protocol ICMP ip saddr 203.0.113.1 snat to 203.0.113.1

This SNAT is not neccessary and will only load the router for not much gain=
. It may be neccesary if you were attempting to alter the port: though, if =
you wish for the router to use a different port range across the board; you=
 can simply change the "net.ipv4.ip_local_port_range" via `# sysctl -w net.=
ipv4.ip_local_port_range=3D"low high"` where low and high are the lower and=
 upper bounds of the port range.

To adhere to IANA recommendations:

`sudo sysctl -w net.ipv4.ip_local_port_range=3D"49152 65535"`
or
`su -l root && sysctl -w net.ipv4.ip_local_port_range=3D"49152 65535"`
or
something that adheres to your SELinux policy.

I am unsure of how to make these edits persistent (they revert after a rebo=
ot with no further interaction); you may need to recompile the kernel to do=
 so. Looks like `man sysctl` mentions `/etc/sysctl.d/*.conf` files: these m=
ay be of use also.

As for:

> where should I look to find the degree of conformance to the various "NAT=
 Behavioural Requirements"...

I am unsure. I am hoping for "Address and Port-Dependent Mapping". I believ=
e the best way to check is to make some connections in a test environment a=
nd observe tshark / wireshark logs. If you were looking for a 'NAT Connecti=
on State' table; I am unsure. You could browse the likes of VyOS source cod=
e (I think it is available!). If you can't use tshark / wireshark, try the =
TCP and UDP tables in `/net/tcp` and `/net/udp`.

sunny
