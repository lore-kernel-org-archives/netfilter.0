Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73EE17E
	for <netfilter@vger.kernel.org>; Sun, 26 Jan 2025 06:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737872376; cv=none; b=qB9moVDNoI64IjEmAAOWP1XfqaVqUg2sBbr3NK6KPIWlL1ORt1WmC9P/rp+WOneu4BWRc0eP8UKvKMPpCTl9sbdwo3nhKAu6IEQd2KnuvwgArAfNyTRDq8NpEYA7XZbJzdmJ9TyYMNDMdqU8wSnq/vA0zq0waDod9FLLWYoeyR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737872376; c=relaxed/simple;
	bh=G9b9/bwz8iCKaSvDCY5f3N/JUIDIUjsxru7LAqSwaUg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Enh4sWmb18f60mjtiTtUI6hv5n8HFRorO/qF2eRmRDPLSd2YdLHW0NwIBgNXOx+k6s+cYjKWWFDwnmSYvmxLnpYXIuBfoNlVMbtlCPXJnXLPk7NzpyvcJrCejbr29RHScIgDllrIgW4QUCS+bFO3zFIIKQOn0IZKQfWafXFzJzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=MdyWUrYm; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="MdyWUrYm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1737872366; x=1738131566;
	bh=m5ylAkKTcRmc63b6aiwJc4O08+DUQmaNgmIaDUjcJEg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=MdyWUrYmBV9r28iM2fJRFjFhDkrPl01GHdVmakG7kGpJtFVfENkIH3sbq+lZd+0LB
	 7PyQszTc2Gq1AqqhUXbwOxznfHYo7kO47tRQOYzahrq2IQD9J/mHrVXpIdQkvDHef3
	 9NtqrXHnWUq2fvStacIKtlRw/Tbmgq5WzxjJSpLmIJQMZSKA66q3cTi+pClnKgXmjn
	 /cSvkORhd7QrnMgnzaA608GwNDu9fdpV4oxMbUAgYpcS2nuVXNStfxSvclUIXQqAcX
	 fADjlSrFqqnWJT8tZOSBkil3pqQP1GkmNCMZySLaMuHv5OkrPBdOTDhwFcZt6Yc/Sy
	 tznb6zllLPPtQ==
Date: Sun, 26 Jan 2025 06:19:23 +0000
To: Marc SCHAEFER <schaefer@alphanet.ch>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: nftables DNAT routes to wrong iface
Message-ID: <o-Kdk2GAq901xVkHQ5Aru09OR2zTnTDL0Dl4V_SkKMgUtNUrTTgP_dBjqTs5qukem5k3sekFKj88zrlZYr_fzHCSaiNDq8i_7w9mz3dY1TQ=@protonmail.com>
In-Reply-To: <Z5UJheaMk+bZsEFe@alphanet.ch>
References: <Z5UJheaMk+bZsEFe@alphanet.ch>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 348923e978e0a361de5c01edc37c4a7e79573898
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

> The routing table has:

> default via 46.140.72.217 dev br0 onlink
> 46.140.72.216/29 dev br0 proto kernel scope link src 46.140.72.218
> 192.168.202.0/24 dev enp2s0.202 proto kernel scope link src > 192.168.202=
.2
> 193.72.186.128/26 dev enp2s0.300 proto kernel scope link src 193.72.186.1=
30

Oops! Old reply (please disregard): '193.72.186.128/26' is poorly subnetted=
; the correct base address is 193.72.186.192/26. Did you mean '193.72.186.1=
28/25'? As a result, '193.72.186.130' is not part of the subnet that you ar=
e routing. Consider if 25 bits is the correct mask.

New reply (and now public): '193.72.186.128/26' does not cover all of '193.=
72.186.0/24', and some packets will not get routed. You could try changing =
your route to '193.72.186.0/24', or edit the firewall policy to reflect the=
 '193.72.186.128/26' route.

sunny

Sent with Proton Mail secure email.

On Sunday, January 26th, 2025 at 4:55 AM, Marc SCHAEFER <schaefer@alphanet.=
ch> wrote:

> Hello,
>=20
> I am trying to do this:
>=20
> Both local IP addresses, when access from outside:
>=20
> enp2s0.310: 193.72.186.130:8080
> br0: 46.140.72.218:8080
>=20
> are DNATed to
>=20
> enp2s0.202: 192.168.202.10:80 (a remote machine)
>=20
> I know there are two steps:
>=20
> - the incoming DNAT in prerouting (and the forward accept)
> -> this part I am stuck, see below
>=20
>=20
> - then when the reply comes back, route to the proper interface where
> it came from (using conntrack + marks + specific routing tables)
> -> this part I have not done yet -- it would be required for
>=20
> 193.72.186.130:8080 obviously because the default route
> does not go there.
>=20
> What I observe:
>=20
> telnet 46.140.72.218 8080 from outside works (*), it connects to 192.168.=
202.10:80
> and there is nothing bizarre in tcpdump either on br0 nor on
> enp2s0.202 (no delays, lost packets, e.g.) (**)
>=20
> telnet 193.72.186.130 8080 gives this on enp2s0.300
>=20
> IP 193.72.186.190.52636 > 193.72.186.130.8080 (normal)
>=20
> IP 193.72.186.190.52636 > 192.168.202.10.80 (good, it was DNATted, BUT sh=
ould be on enp2s0.202!)
>=20
>=20
> aka the DNAT is executed, but then 192.168.202.10 is not routed
> correctly. From the diagram https://wiki.nftables.org/wiki-nftables/index=
.php/Netfilter_hooks
> I thought that routing would be done AFTER prerouting/DNAT.
>=20
> The routing table has:
>=20
> default via 46.140.72.217 dev br0 onlink
> 46.140.72.216/29 dev br0 proto kernel scope link src 46.140.72.218
> 192.168.202.0/24 dev enp2s0.202 proto kernel scope link src 192.168.202.2
> 193.72.186.128/26 dev enp2s0.300 proto kernel scope link src 193.72.186.1=
30
>=20
> (*) not from 193.72.186.0/24, however, gets the same bug.
>=20
> The nftables config:
>=20
> table ip filter {
> # obviously a later goal is also to encode the L4 protocol here
> # and not hardcode it in the prerouting
> map multihoming_ext {
> type ipv4_addr . inet_service : ipv4_addr . inet_service
> elements =3D { 193.72.186.130 . 8080 : 192.168.202.10 . 80,
> 46.140.72.218 . 8080 : 192.168.202.10 . 80 }
> }
>=20
> set w_all {
> type ipv4_addr
> flags interval
> elements =3D { 46.140.72.216/29,
> 192.168.202.1, 193.72.186.0/24
> }
> }
>=20
> chain input {
> type filter hook input priority filter; policy drop;
> ct state invalid counter packets 3 bytes 120 drop
> ct state { established, related } counter packets 1092 bytes 76846 accept
> iif "lo" counter packets 0 bytes 0 accept
> counter packets 324 bytes 13539 jump whitelist
> counter packets 323 bytes 13455 jump blacknets
> counter packets 323 bytes 13455 jump blacklist
> counter packets 323 bytes 13455 jump incoming
> }
>=20
> chain forward {
> type filter hook forward priority filter; policy drop;
> ct state invalid counter packets 0 bytes 0 drop
> ct state { established, related } counter packets 12 bytes 548 accept
>=20
> # already after DNAT, obviously
> iifname "br0" ip daddr 192.168.202.10 tcp dport 80 accept
> iifname "enp2s0.300" ip daddr 192.168.202.10 tcp dport 80 accept
> }
>=20
> chain output {
> type filter hook output priority filter; policy accept;
> ct state invalid counter packets 0 bytes 0 drop
> ct state { established, related } counter packets 890 bytes 182096 accept
> oif "lo" counter packets 0 bytes 0 accept
> counter packets 1 bytes 76 jump outgoing
> }
>=20
> chain rejectcounter {
> meta l4proto tcp counter packets 0 bytes 0 reject with tcp reset
> meta l4proto udp counter packets 0 bytes 0 reject
> counter packets 0 bytes 0 drop
> }
>=20
> chain dropcounter {
> counter packets 320 bytes 13349 drop
> }
>=20
> chain whitelist {
> ip saddr @w_all counter packets 1 bytes 84 accept
> }
>=20
> chain blacknets {
> }
>=20
> chain blacklist {
> }
>=20
> chain incoming {
> icmp type echo-request counter packets 3 bytes 106 accept
> icmp type echo-reply counter packets 0 bytes 0 accept
> tcp dport 22 ip saddr { 46.140.72.216/29, 192.168.202.1, 193.72.186.0/24 =
} counter packets 0 bytes 0 jump dropcounter
> udp dport 22 ip saddr { 46.140.72.216/29, 192.168.202.1, 193.72.186.0/24 =
} counter packets 0 bytes 0 jump dropcounter
> counter packets 320 bytes 13349 jump dropcounter
> }
>=20
> chain outgoing {
> }
>=20
> chain multihoming_prerouting {
> type nat hook prerouting priority dstnat; policy accept;
>=20
> # this is the DNAT
> dnat ip to ip daddr . tcp dport map @multihoming_ext
> }
> }
> table ip myhelpers {
> chain prerouting {
> type filter hook prerouting priority filter; policy accept;
> }
> }
>=20
> [ I removed ip6 entries ]
>=20
> Any idea what could be wrong?
>=20
> Thank you.
>=20
> (**) very nice:
> br0:
> IP 46.140.72.222.60394 > 46.140.72.218.8080
>=20
> IP 46.140.72.218.8080 > 46.140.72.222.60394
>=20
> IP 46.140.72.222.60394 > 46.140.72.218.8080
>=20
>=20
> enp2s0.202 (another connection):
> IP 46.140.72.222.57790 > 192.168.202.10.80
>=20
> IP 192.168.202.10.80 > 46.140.72.222.57790
>=20
> IP 46.140.72.222.57790 > 192.168.202.10.80
>=20
> 
