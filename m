Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E662927A127
	for <netfilter@vger.kernel.org>; Tue, 23 Sep 2025 17:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758647226; cv=none; b=O174hdsVehaeYRetQlfq4oHNtsj6X4CQZxYzrTWrw9co+NHCXyHG0OKpBdByUzE1KgZgUwzKeun097u+pMZP741HgImjNXViMY+vRVDIXbL3bRpuhohAkGVRdVXaO1JO8vvpJKLubwtBMgGxi+WsXFXra4a2hHnx7Ped+wEeymM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758647226; c=relaxed/simple;
	bh=Y6cTg1Jc2LuMU7UDxu/om1etG7PYu0TmxXv77Gl7vaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l3kNKVqJ8u7W6IiEi+JMWyQUj7MZ62YiKGmnAH9r23PN55gvUVImPJVYiGwXNKmK8jScrUtzgoInMvDJ1h49V5kNuXinnyRmchrRoo5qGSlwFjWQJiUwqM6uo3hF45LZTeM7Ypoz2d0CwSGkBLqQv3LY22GiLG111tVEkmwdenU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id CCA7F61935; Tue, 23 Sep 2025 19:07:01 +0200 (CEST)
Date: Tue, 23 Sep 2025 19:07:01 +0200
From: Florian Westphal <fw@strlen.de>
To: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Confirming conntrack behavior on environments with multiple
 network namespaces
Message-ID: <aNLTtcdGNJT8FuYk@strlen.de>
References: <CABhP=tYo-R_vFJhfUGj_GmW5mCAFR3VNEkkhJDp7pHpHNYvD5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABhP=tYo-R_vFJhfUGj_GmW5mCAFR3VNEkkhJDp7pHpHNYvD5g@mail.gmail.com>

Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> My assumptions are:
> 
> Global hash table: There is a single global hash table for the entire
> system. Its size is governed by nf_conntrack_buckets, and since commit
> 3183ab89 ("netfilter: conntrack: allow increasing bucket size via
> sysctl too"), it is possible to resize this table at runtime. The hash
> key correctly includes the network namespace ID to differentiate per
> namespace entries.

Yes.

> Per-namespace limit: net.netfilter.nf_conntrack_max is a per-namespace
> value (inherited from the init_net default) that limits the number of
> entries that a single namespace is allowed to create.

Yes, there is a patch rotting in backlog that allows non-init netns to
shrink it so the lower value is used.  As-is, only init_net can change
this.

I hope I can get to this patch by mid of october.

> Kubernetes "double-accounting": In Kubernetes, if a pod/container
> enables conntrack internally (e.g., a service mesh sidecar or network
> function), a single application connection will create two conntrack
> entries in the global table: one for the pod's namespace and one for
> the root namespace (for node-level routing/NAT).

2 conntrack entries -> 4 hash entries (origin, reply).

> Monitoring the load factor: To monitor the system state (as suggested
> by commit c77737b's focus on chain length), a key metric is the Load
> Factor: global_count / nf_conntrack_buckets.

Yes.

> I was surprised to find that reading
> /proc/sys/net/netfilter/nf_conntrack_count from the root namespace
> (init_net) returns the global sum of all entries. Reading the same
> file from inside a pod's namespace returns the per-namespace count.

No, its always per namespace, even in init_net.
Try not enabling conntrack in init_net.

Or add 'notrack' rules in init_net for the netns originating traffic.
Or create a netns, enable conntrack and then only create connections
to addresses reachable via loopback. In all these cases init_net won't
be affected by the net namespace.

> Is this behavior correct? It seems to be the simplest and most
> accurate way to monitor the global Load Factor is doing something like
> 
> watch -n 2 "awk 'NR==1{count=\$1} NR==2{buckets=\$1; printf
> \"Connections: %-10d | Buckets: %-10d | Load Factor: %.2f\n\", count,
> buckets, count/buckets}' /proc/sys/net/netfilter/nf_conntrack_count
> /proc/sys/net/netfilter/nf_conntrack_buckets"

That will only monitor that namespace, I'm not aware of a global counter.

> Causes of bloat: One of the common causes of high connection counts
> seems to be the very long default timeout for established connections
> (nf_conntrack_tcp_timeout_established = 5 days). However, it seems
> most distros override the default and set it to a lower number by
> default, like one hour.

5 days is the historic value inherited from ip_conntrack.
I don't know of a good default value to use instead.

Changing it to 1h seems to short for a default value, changing it to
4 days looks pointless to me.

> Per-namespace statistics: Finally, is there a recommended,
> programmatic way to get a breakdown of conntrack statistics per
> namespace? I'm especially interested in the total number of entries
> for each namespace. We know we can nsenter each network namespace and
> read its local sysctl, but this is very inefficient. Is there a better
> way to get this breakdown from the root namespace, perhaps via
> netlink, procfs, or eBPF with something like bpftrace?

Not at this time.  There is ctnetlink but it requires the nsenter
dance.
