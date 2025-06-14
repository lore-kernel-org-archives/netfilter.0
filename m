Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005881FDA
	for <netfilter@vger.kernel.org>; Sat, 14 Jun 2025 15:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749914939; cv=none; b=jqUa7ZE5yCLh7FromlyUqNTboYjMk03d7M4o/e5KPZ7iNoy7BCyaxV+biLS/WKLZOlbGrKcy8L7JfjsZUrJ4+nc86EhWuzK96K+T3Vynh8BLfTiD+O92dZ+q3d6LF2NBet0dBI/zBU9skfQURZNF2U++MD7f8leb+mUuyo8stMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749914939; c=relaxed/simple;
	bh=XT9Biltuo3FrAd4AzrTZBnm+2P/NR5Q6mDQo+QKMjAo=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=rKfo7opOSmA907RyZf/GOj2DTyoLvPCK3ahcCQCauhetdjmF8ZDt7nbOPR7F+x+xvk1CYyx0CUsTFICA0VZdZZt4i/1p5Eh2vA+2lBSmBztZOJsw6GAUkm91D+ABU5un/TyH95IoAF7zTNOc41T9SPLyz5OgkJcdFXIMHfkXuKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=VcyEpDhp; arc=none smtp.client-ip=185.70.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="VcyEpDhp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1749914934; x=1750174134;
	bh=jpaSu/yjwunTFSKVMbF9GyUWNprNAyBOqgtWMhK6eeE=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=VcyEpDhp9xmfbAhqP47kQS/z0JrVI+r/uwlOX2Y+XmKG7s6aHgFFAU9/wi9gCFXER
	 e1ivQzeH31dqmx/oIpyL+AV8iUAocOkcqD90GxtmywsvQ4h0F0gxbBUnoP3FiXtlGC
	 ysxcMQhYQfcb2pqTOk+xEnnmp/23JMd6eHF6vb8n/70rgngOlsQkI7wOHreeFAERAY
	 8OFNJ8c7RWtcHdQcKNdClnAGtbzIOXAvj8ehfPA/xeZ31HgQrPpGI8VIBPheUwrdY8
	 b/pj6qlNxR/XjrVWlkTyUq1GyEHne/GG/myJSA2Sb5RQIy42/K6CYYfUJlxQL8qunV
	 mDNrz/5/LU4Og==
Date: Sat, 14 Jun 2025 15:28:48 +0000
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
From: =?utf-8?Q?Pavel_Hor=C3=A1=C4=8Dek?= <horacek.pavel@protonmail.com>
Subject: CPU usage problem for offloaded flows with mlx5
Message-ID: <GWSKknFWTZvpY548VJJxkEOvg1h_vkJZsepn3Eea7AhaRFyEZHJvThaOX4g_O-zmIjE6gtsn51VJCVTMQZvF-o-BOMs46j7UNnJ9pzhpG8I=@protonmail.com>
Feedback-ID: 9081103:user:proton
X-Pm-Message-ID: 63f89782019a9f899c45e8485329cca38638a920
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi!

I've been testing out some of the tc rule offloading features in the kernel=
 and came across a weird issue for offloaded rules that use the connection =
tracking offload.

The main idea was to implement a kind of basic routing offload, something a=
kin to [1], with tc ct added to support creation of conntrack records, like=
 in [2]. Compared against that was the nftables flowtables [3] that was set=
 up to perform conntrack offloading in software.

When using the tc ct hardware offload, however, a drastic increase in CPU u=
sage was measured. On average, ~2.5 times higher, but increasing linearly w=
ith the number of offloaded flows. The testing consisted of sending a lot o=
f short-lived UDP and/or TCP connections, at speeds of 4.5, 9, and 13.5 kcp=
s. The CPU usage increase was measured in all cases. Kernel 6.6.9-1.7 was u=
sed, with ConnectX6-Dx NIC in switchdev mode and native mlx5 driver.

Looking into the culprit with perf, the following three calls used up the m=
ost CPU time:

9.54% [kernel] [k] native_queued_spin_lock_slowpath
5.49% [kernel] [k] pv_native_safe_halt
3.39% [kernel] [k] rhashtable_jhash2

With the call stack on native_queued_spin_lock_slowpath:

0. ret_from_fork_asm
1. ret_from_fork
2. kthread
3. worker_thread
4. process_scheduled_works
5. process_one_work
6. nf_flow_offload_work_gc
7. nf_flow_table_iterate
8. nf_flow_offload_gc_step
9. nf_flow_offload_stats
10. flow_offload_queue_work
11. queue_work_on
12. __queue_work
13. _raw_spin_lock
14. native_queued_spin_lock_slowpath

This led me to discover that the garbage collector in nf_flow_offload_gc_st=
ep is updating the statistics with nf_flow_offload_stats for every HW offlo=
aded conntrack record, which seems to create a lot of collisions on the spi=
nlock in workqueues, increasing the CPU usage with more HW offloaded flows.

Has anyone encountered this issue before, and do you think this can be some=
how mitigated?

With regards,
Pavel


The tc rules used (it only routes the 48.0.0.0/16 back on the same device, =
while creating and using the conntrack entry):

# Drop packets with TTL 1
tc filter add dev ${DEV} ingress \
  chain 0 pref 1 protocol 802.1Q \
  flower skip_sw vlan_ethtype ipv4 ip_ttl 1 \
  action drop

# Decapsulate VLAN
tc filter add dev ${DEV} ingress \
  chain 0 pref 1 protocol 802.1Q \
  flower skip_sw vlan_ethtype ipv4 vlan_id ${VLAN} \
  action vlan pop pipe action goto chain 1

# Track untracked connections
tc filter add dev hge21 ingress \
  chain 1 pref 1 protocol ip \
  flower ct_state -trk \
  action ct pipe action goto chain 2

# Send established connections to forwarding
tc filter add dev ${DEV} ingress \
  chain 2 pref 1 protocol ip \
  flower ct_state +trk+est-new \
  action goto chain 4

# Send newly tracked connections to routing
tc filter add dev ${DEV} ingress \
  chain 2 pref 1 protocol ip \
  flower ct_state +trk+new \
  action goto chain 3

# Tag connections in prefix 48.0.0.0/16
tc filter add dev ${DEV} ingress \
  chain 3 pref 1 protocol ip \
  flower dst_ip 48.0.0.0/16 \
  action ct commit mark 0x01 pipe action goto chain 4

# Forward connections with tag 0x01
tc filter add dev ${DEV} ingress \
  chain 4 pref 1 protocol ip  \
  flower ct_mark 0x01 \
  action pedit ex munge eth dst set ${MAC_DST} munge eth src set ${MAC_SRC}=
 munge ip ttl dec pipe \
  csum ip4h pipe \
  action vlan push id ${VLAN} pipe action mirred egress redirect dev ${DEV}


[1] https://archive.fosdem.org/2024/events/attachments/fosdem-2024-3337-fly=
ing-higher-hardware-offloading-with-bird/slides/22273/flower-routed-fosdem2=
4_gUABpPa.pdf

[2] https://netdevconf.info/0x14/pub/slides/48/Netdev_0x14_CT_offload.pdf

[3] https://wiki.nftables.org/wiki-nftables/index.php/Flowtables
