Received: from mta200a-ord.mtasv.net (mta200a-ord.mtasv.net [104.245.209.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBB020CCF7
	for <netfilter@vger.kernel.org>; Tue,  8 Oct 2024 20:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.245.209.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728418116; cv=none; b=gk8YqRAjKbO+2aHfxu28xs3T5PBbKcQ6wGOE5mwx+31R4CRxaa6cpDEF5nDdu2y37wlsdMFqCf/SiuNsBoVoygMnwbc+T6GTiECy5kJ9pnk96XQze7BraarP737a1KG3wsrfI5PNh+ZHEmw2LX6hlUyUSjYauLGbf1NPEtlGjNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728418116; c=relaxed/simple;
	bh=ipviyP4P5ZWpRUUQNclUaHcDyBX6sr6TEka3YL5HwUY=;
	h=From:Date:Subject:Message-Id:To:MIME-Version:Content-Type; b=bwZjUihxooJ0gCR1Zmts0he/9ULA+goiv7XDl4ZagsdCjKKMTcEiJhEaq2QDsnHIXT05PvDUiUP/l7NvXODblO71ewYPLqMydnWAk8FNSF3lbltvy95G1RINieVQuPfSUYZia8U9ji+CTAwN8IRYs7X+BfD1WW7ERgy6f3/ciuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=black-sheep-research.com; spf=pass smtp.mailfrom=pm-bounces.black-sheep-research.com; dkim=pass (2048-bit key) header.d=pm.mtasv.net header.i=@pm.mtasv.net header.b=LWI+h12Y; dkim=pass (1024-bit key) header.d=black-sheep-research.com header.i=martin@black-sheep-research.com header.b=EjdZw77R; arc=none smtp.client-ip=104.245.209.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=black-sheep-research.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm-bounces.black-sheep-research.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.mtasv.net header.i=@pm.mtasv.net header.b="LWI+h12Y";
	dkim=pass (1024-bit key) header.d=black-sheep-research.com header.i=martin@black-sheep-research.com header.b="EjdZw77R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=pm20241004; d=pm.mtasv.net;
 h=From:Date:Subject:Message-Id:Reply-To:To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Date:From:Message-ID:Reply-To:Sender:Subject:To:CC;
 t=1728418114; x=1728504514;
 bh=ipviyP4P5ZWpRUUQNclUaHcDyBX6sr6TEka3YL5HwUY=;
 b=LWI+h12Y1ELYho3rRMiJ2rGUnQDoLT75YrKTA5Wz7mn3teSQUxWPDWZ3LAWkFefR86BvRU2y8vlJ
   3YP1FqDOO4jeo0AxgnMHacexh9YjWRPQl6bORFULCL5N6buCUpQrXRob5lFK7ZeJ2nYhFMLDyJ06
   cD3KWYaQOqvO4QQoIq/NKMcIvChc7mV1mACVC5Z6fB2j72Xa84c69K0VbNFlI1Ds5e3E87N6XMmZ
   6mHfFOT748I/cvOlz1ie7ur7XSCW12TldErzGXhvU3ZI+dDqfyBzzfa3xeYDaQ4jDV5nFXzu8ZRw
   ZTex51U7U4CXRncL3DoEQqbp//EwPMv1ZN0ffw==
Received: by mta200a-ord.mtasv.net id h0m8k23864o8 for <netfilter@vger.kernel.org>; Tue, 8 Oct 2024 16:08:33 -0400 (envelope-from <pm_bounces@pm-bounces.black-sheep-research.com>)
X-PM-IP: 104.245.209.200
X-IADB-IP: 104.245.209.200
X-IADB-IP-REVERSE: 200.209.245.104
DKIM-Signature: v=1; a=rsa-sha256; d=black-sheep-research.com;
	s=20220127112152pm; c=relaxed/relaxed; i=martin@black-sheep-research.com;
	t=1728418113; x=1728590913;
	h=date:date:from:from:message-id:reply-to:reply-to:sender:subject:subject:to:
	to:cc:feedback-id:mime-version:content-type:content-transfer-encoding;
	bh=ipviyP4P5ZWpRUUQNclUaHcDyBX6sr6TEka3YL5HwUY=;
	b=EjdZw77RaonfEwQ4/tjXU2UzvNoia02DlZuUGBT+3bd9WeCP1Cy0FCGy2LT0NKVbdHCTixfbWzK
	kAfP36c+yVmA/EplCAJ0uuRUAlHB/4oBSaalg7pUeIrFZFHyNECWZcvsLo1TGbqBqJAqG1woQyVQ0
	nKkovcJUuxF5olcp9y0=
From: Martin Brampton <martin@black-sheep-research.com>
Date: Tue, 08 Oct 2024 20:08:33 +0000
Subject: Problem with ipv6
Message-Id: <c3e11308-7b43-456b-af93-a03a6040f223@mtasv.net>
Reply-To: martin@black-sheep-research.com
To: netfilter@vger.kernel.org
User-Agent: Mozilla Thunderbird
Feedback-ID: s8569101-_:s8569101:a226829:postmark
X-Complaints-To: abuse@postmarkapp.com
X-PM-Message-Id: c3e11308-7b43-456b-af93-a03a6040f223
X-PM-RCPT: |bTB8MjI2ODI5fDg1NjkxMDF8bmV0ZmlsdGVyQHZnZXIua2VybmVsLm9yZw==|
X-PM-Message-Options: v1;1.TagpA4u5Jvnbtnq7GvGh5A.6k1f1dyjhkslBmbXl5hFz1GrA01Bug3jCk0L2eAyg_ahVuVMdaUut8jFCBQtk8_8_kjVRSqHXHlnw7zR8QVNetDhTZTC0vdY2ZIrAExUlwU9jR95QGb4FXJmiW3YF1taGhbgTgrV8SQeCDdyxR1I3ObfYM066ltMbMRsK2AzmSMH5r8uETt7QCIFc6c2g9X2
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-PM-MTA-Pool: transactional-3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I've been struggling to get nftables to handle IPv6 traffic on selected=20
ports. First efforts were on Debian 12, with nftables 1.0.6.

The setup was quite complex, but included simple rules to open port 25=20
for SMTP. They worked for ipv4, but about a minute after starting up=20
nftables, ipv6 was blocked. The problem is not specific to port 25, a=20
similar problem applied to 80 and 443.

I know that the service provided by Postfix works, as it is possible to=20
send email via ipv6 when nftables is stopped.

The complexity was mainly to do with a lot of sets to control different=20
options.

To try to pin things down, I then created a Digital Ocean VPS using=20
Ubuntu 24.04 to get a later version of nftables - 1.0.9. The rules were=20
hacked down to a bare minimum. The ruleset is shown below. The problem=20
continues - without nftables I can submit mail. After "systemctl restart=20
nftables" access remains possible - but only for about a minute. There=20
are messages in syslog about the client when it is able to connect, but=20
none in respect of dropped packets. There are many ipv4 dropped packets=20
- probably just internet noise. Any thoughts?

table inet firewall {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain input {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 type filter hook input priority filter; policy accept;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ct state { established, related } accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 iifname "lo" accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 icmpv6 type { destination-unreachable, packet-too-big,=20
time-exceeded, parameter-problem, echo-request, mld-listener-query,=20
nd-router-solicit, nd-router-advert, nd-neighbor-solicit,=20
nd-neighbor-advert } accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ip protocol icmp icmp type echo-request ip saddr=20
127.0.0.1 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ip6 nexthdr tcp tcp dport 25 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ip protocol tcp tcp dport 25 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 tcp dport 22 ip saddr 62.3.121.238 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 udp dport 60000-61000 ip saddr 62.3.121.238 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 log prefix "nftables input dropped: " flags all counter=20
packets 242 bytes 12885 drop
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain forward {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 type filter hook forward priority filter; policy drop;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ct state { established, related } accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 log prefix "nftables forward dropped: " flags all=20
counter packets 0 bytes 0 drop
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain output {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 type filter hook output priority filter; policy drop;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ct state { established, related } accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ip protocol icmp icmp type echo-request accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ip protocol icmp icmp type echo-request ip daddr=20
127.0.0.1 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 icmpv6 type echo-request accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 ip protocol { tcp, udp } th dport 53 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 tcp dport 123 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 tcp dport { 80, 443 } accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 tcp dport { 25, 465, 587, 993, 995, 4190 } accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain prerouting {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 type nat hook prerouting priority dstnat; policy accept;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }

 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chain postrouting {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 type nat hook postrouting priority srcnat; policy accept;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
}

