Received: from mta202a-ord.mtasv.net (mta202a-ord.mtasv.net [104.245.209.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145EB2A1D3
	for <netfilter@vger.kernel.org>; Thu, 10 Oct 2024 16:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=104.245.209.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728577132; cv=none; b=eldQOzWBDlFLZ8wrW326ZO7GXN6eutQIButoXwKAgZ9qx2Bmu3vMaYOJlGoY/PQTj5N/JsTwKZxw7EbxBCYSzUwXhr794e+ui/Q9tRX1PIsLK6hBe8Ba6e7GoMMZ6mQm3cL+uFstf+NybqNu6nbVBjFDIW1Ee3064W8Wn5pH83w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728577132; c=relaxed/simple;
	bh=hnoA35bPUdujQomEOh24ElkcMgjuSws95HTbQ3R0F50=;
	h=From:Date:Subject:Message-Id:To:MIME-Version:Content-Type; b=oecgLFYo0sobpngEwPdv7hl2qtibqWL691cfTi0YvjnaHsXAxdbhstGqSGsOJAs3sentQOCYXmHlP2AR9+ds7whFXDtNWo+GEBtMUzM1XBvBasCuDkyHjJQo2kY2z8y+mUcJcIZJ1dvhEUWLjI7NKemCoMpjdEjb1fZs1pLdezs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=black-sheep-research.com; spf=pass smtp.mailfrom=pm-bounces.black-sheep-research.com; dkim=pass (2048-bit key) header.d=pm.mtasv.net header.i=@pm.mtasv.net header.b=Ene9fV+Y; dkim=pass (1024-bit key) header.d=black-sheep-research.com header.i=martin@black-sheep-research.com header.b=h3G5ixhU; arc=none smtp.client-ip=104.245.209.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=black-sheep-research.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm-bounces.black-sheep-research.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.mtasv.net header.i=@pm.mtasv.net header.b="Ene9fV+Y";
	dkim=pass (1024-bit key) header.d=black-sheep-research.com header.i=martin@black-sheep-research.com header.b="h3G5ixhU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=pm20241004; d=pm.mtasv.net;
 h=From:Date:Subject:Message-Id:Reply-To:To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Date:From:Message-ID:Reply-To:Sender:Subject:To:CC;
 t=1728577130; x=1728663530;
 bh=hnoA35bPUdujQomEOh24ElkcMgjuSws95HTbQ3R0F50=;
 b=Ene9fV+YXSc96mKkBki0zYH6mNxtXvGCXAjHEI6Uc2i8So6qJAXwGt94OwwRgJsGmlxdokOsh4KY
   dr55RJISDSjlfVCjTVG9ONqOqCs0NQb7FiZ2tVNHJTcOkb1DN/6YZd4lpeP4QTJcDnQLoDKMjzYF
   FqgSOYmABr9V/cqllEMx2D/D4VhUN53SFl04Xibf92wTyd5D7vQE88Yt/prFU6J0glfHydic/N/F
   hRZasSGdES54oJ1A8R29h2qxQChpiIOXUGS959keDT3TNpJi6VQA6FWkB3WICzudiwhPCvGNKWr6
   sgU7tG1g1vjihUf3evli7OpHs5nge0iN+lfDpg==
Received: by mta202a-ord.mtasv.net id h0vv663864o0 for <netfilter@vger.kernel.org>; Thu, 10 Oct 2024 12:18:43 -0400 (envelope-from <pm_bounces@pm-bounces.black-sheep-research.com>)
X-PM-IP: 104.245.209.202
X-IADB-IP: 104.245.209.202
X-IADB-IP-REVERSE: 202.209.245.104
DKIM-Signature: v=1; a=rsa-sha256; d=black-sheep-research.com;
	s=20220127112152pm; c=relaxed/relaxed; i=martin@black-sheep-research.com;
	t=1728577123; x=1728749923;
	h=date:date:from:from:message-id:reply-to:reply-to:sender:subject:subject:to:
	to:cc:feedback-id:mime-version:content-type:content-transfer-encoding;
	bh=hnoA35bPUdujQomEOh24ElkcMgjuSws95HTbQ3R0F50=;
	b=h3G5ixhUp4no9NGTIShBuarbQTbKSJq8xrLa/n3W9I9ycH49C/c92z6wQFnvdPilqP1eFsi4ukr
	NFgQ9SAtgBG+3cZvveTfgVt5SmZWp4R/hpqBFt6CgB0edEk0L1Ru47d/rBGniom3xsst7eHLAjjWP
	8TTvaXZIi30emf6q8hE=
From: Martin Brampton <martin@black-sheep-research.com>
Date: Thu, 10 Oct 2024 16:18:43 +0000
Subject: VPN nftables
Message-Id: <b80835b3-5e07-4631-92b3-3c04b58a43d0@mtasv.net>
Reply-To: martin@black-sheep-research.com
To: netfilter@vger.kernel.org
User-Agent: Mozilla Thunderbird
Feedback-ID: s8569101-_:s8569101:a226829:postmark
X-Complaints-To: abuse@postmarkapp.com
X-PM-Message-Id: b80835b3-5e07-4631-92b3-3c04b58a43d0
X-PM-RCPT: |bTB8MjI2ODI5fDg1NjkxMDF8bmV0ZmlsdGVyQHZnZXIua2VybmVsLm9yZw==|
X-PM-Message-Options: v1;1.ZijqHYGyXUirMCIy_O1mJQ.JkVXFWiRJ6003yw3TTVUPFnmWo7IonMVgnUm9Sp_wwXgIu8JIxcj4AqW7fVGU40YFqNuvqGvIdTQTsWP1Vz4kVRq0x8aCyrljzHenQnAE_aH9KdAvSEiMCiXiEMCEgsz3UEORYHQl0OGVx8iIWIrIpmmWL28GILvrTu5hoWJUAvy9Qw-d0WPBAmMUHoDF_AI
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-PM-MTA-Pool: transactional-3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On a Debian 12 VPS with openvpn installed, I am having difficulty=20
finding an nftable ruleset that works. The following is the current=20
ruleset, excluding the set definitions. I can connect to the VPN, but=20
then cannot access any services.

I'm aware there are overlapping rules, but that is because I'm=20
attempting to use a standard ruleset across all servers, with additions=20
according to the services needed. Any thoughts?

table inet firewall {
 =C2=A0=C2=A0=C2=A0 chain input {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type filter hook input priority=
 filter; policy accept;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ct state { established, related=
 } accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iifname "lo" accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 icmpv6 type { destination-unrea=
chable, packet-too-big,=20
time-exceeded, parameter-problem, echo-request, mld-listener-query,=20
nd-router-solicit, nd-router-advert, nd-neighbor-solicit,=20
nd-neighbor-advert } accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip protocol icmp icmp type echo=
-request ip saddr @servers_ipv4=20
accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip protocol icmp icmp type echo=
-request ip saddr 127.0.0.1 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip saddr @spamhaus_blacklist dr=
op
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip saddr @blacklist_v4 drop
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcp dport 443 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iifname "tun0" accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcp dport 22 ip saddr @always_i=
pv4 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcp dport 22 ip saddr @privileg=
ed_ipv4 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcp dport 22 ip saddr @tunnelin=
_ipv4 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcp dport 22 ip saddr @security=
_v4 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcp dport 22 ip saddr 193.107.2=
0.105 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcp dport 22 ip6 saddr @always_=
ipv6 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcp dport 22 ip6 saddr @privile=
ged_ipv6 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcp dport 22 ip6 saddr @tunneli=
n_ipv6 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcp dport 22 ip6 saddr @securit=
y_v6 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcp dport 22 log prefix "Denied=
 SSH: " drop
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 udp dport 60000-61000 ip saddr =
@always_ipv4 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 udp dport 60000-61000 ip saddr =
@privileged_ipv4 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 udp dport 60000-61000 ip6 saddr=
 @always_ipv6 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 udp dport 60000-61000 ip6 saddr=
 @privileged_ipv6 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 udp dport 60000-61000 log prefi=
x "Denied MOSH: " drop
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip saddr @munin_host_v4 tcp dpo=
rt 4949 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip6 saddr @munin_host_v6 tcp dp=
ort 4949 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcp dport 3306 ip saddr 127.0.0=
.1 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log prefix "nftables input drop=
ped: " flags all counter packets=20
86 bytes 9203 drop
 =C2=A0=C2=A0=C2=A0 }

 =C2=A0=C2=A0=C2=A0 chain forward {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type filter hook forward priori=
ty filter; policy drop;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ct state { established, related=
 } accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iifname "tun0" oifname "eth0" a=
ccept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iifname "eth0" oifname "tun0" c=
t state new accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 log prefix "nftables forward dr=
opped: " flags all counter=20
packets 0 bytes 0 drop
 =C2=A0=C2=A0=C2=A0 }

 =C2=A0=C2=A0=C2=A0 chain output {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type filter hook output priorit=
y filter; policy drop;
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ct state { established, related=
 } accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip protocol icmp icmp type echo=
-request ip daddr @servers_ipv4=20
accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip protocol icmp icmp type echo=
-request ip daddr 127.0.0.1 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 icmpv6 type { destination-unrea=
chable, packet-too-big,=20
time-exceeded, parameter-problem, echo-request, mld-listener-query,=20
nd-router-solicit, nd-router-advert, nd-neighbor-solicit,=20
nd-neighbor-advert } accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip protocol { tcp, udp } th dpo=
rt 53 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcp dport 123 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tcp dport { 80, 443 } accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip daddr @postmark_v4 tcp dport=
 587 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip daddr @postmarklists_v4 tcp =
dport 587 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip daddr @smtp2go_v4 tcp dport =
587 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip6 daddr @postmark_v6 tcp dpor=
t 587 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip6 daddr @postmarklists_v6 tcp=
 dport 587 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip6 daddr @smtp2go_v6 tcp dport=
 587 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip daddr @vault_v4 tcp dport 22=
 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip6 daddr @vault_v6 tcp dport 2=
2 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip daddr 127.0.0.1 tcp dport 33=
06 accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip protocol tcp accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip6 nexthdr tcp accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip protocol udp accept
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ip6 nexthdr udp accept
 =C2=A0=C2=A0=C2=A0 }

 =C2=A0=C2=A0=C2=A0 chain prerouting {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type nat hook prerouting priori=
ty dstnat; policy accept;
 =C2=A0=C2=A0=C2=A0 }

 =C2=A0=C2=A0=C2=A0 chain postrouting {
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 type nat hook postrouting prior=
ity srcnat; policy accept;
 =C2=A0=C2=A0=C2=A0 }
}

