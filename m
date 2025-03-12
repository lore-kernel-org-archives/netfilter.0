Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BBA1E9B03
	for <netfilter@vger.kernel.org>; Wed, 12 Mar 2025 07:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741763513; cv=none; b=AKKJMD9LsLZ3UGW6J+BjJoEeLwMQeN+xTrQ7d+7AbVKQ2WXh64Y/kxqmVTMIWOOC7uXKmtrncwr1slh1L/M2YsnB8BvOHj/0UVjWdi6EbDSATfmjo/j8EsLd96Io2ELS50HqjbLBNmqwF8PCL4ga8Bnovopmkv8pUaMsXpNCCAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741763513; c=relaxed/simple;
	bh=afXB7yE+wUwJ/H211nVP6bX+GgJt+Me5EcH66Dd589c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MYQ3T3sXPihE5bzy7WGs9IumweBtAN1aZzc/Lr7k4Te2s8nMjuSrgKRC+jqljOIThUr201bFSTwQzLBfK/HZosBj7O7Q3Q+Mq1wFEG2o00tLl6HmbZKph1iE8i1ZinrreMZXP1d+tWewRyku8GhrkWnbtTH0lNwTxPeABevYq5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: from fw by Chamillionaire.breakpoint.cc with local (Exim 4.92)
	(envelope-from <fw@strlen.de>)
	id 1tsGFo-00033A-Pu; Wed, 12 Mar 2025 08:11:48 +0100
Date: Wed, 12 Mar 2025 08:11:48 +0100
From: Florian Westphal <fw@strlen.de>
To: Antonio Ojea <antonio.ojea.garcia@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: netfilter expected behavior for established connections
Message-ID: <20250312071148.GA11288@breakpoint.cc>
References: <CABhP=tYOynShd82rwVuDMJDTE8LcM6+FHwx7Tfuk183EW+ipPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABhP=tYOynShd82rwVuDMJDTE8LcM6+FHwx7Tfuk183EW+ipPA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Antonio Ojea <antonio.ojea.garcia@gmail.com> wrote:
> Hi,
> 
> I'm puzzled trying to understand the following behavior, appreciate it
> if you can help me to understand better how this works.
> 
> The setup is like this:  Client --- Router --- Server
> 
> - Router DNATs to a Virtual IP and Port of the Server.
> - Client establishes a permanent connection to the Virtual IP.
> - Router adds a REJECT rule in the FORWARD hook for the Server IP
> 
> I expect the REJECT to match the established connection, but the
> client keeps reaching the Server using the existing connection.
> 
> The packets of the established connection do not show up on the traces
> using nftrace.
> 
> Is it possible to "DROP/REJECT" the established connection ?
> 
> I've created a selftest to reproduce this behavior, please find it attached.

Unfortuntely this selftest passes for me.

PASS: ns1-apNbtu can reach ns2-VgBo5h
PASS: test_ip_conntrack_reject_established: ns1 got reply "PING" connecting to ns2
PASS: test_ip_conntrack_reject_established: ns1 got reply "PING" connecting to vip using persistent connection
> 2025/03/12 08:10:58.000388001  length=5 from=0 to=4
PING
< 2025/03/12 08:10:58.000388848  length=5 from=0 to=4
PING
PASS: test_ip_conntrack_reject_established: ns1 got reply "PING" connecting to vip
PASS: test_ip_conntrack_reject_established: ns1 got reply "PING" connecting to vip using persistent connection
PASS: test_ip_conntrack_reject_established: ns1 got "Connection refused" connecting to vip (ns2)
PASS: test_ip_conntrack_reject_established: ns1 connection to vip is closed (ns2)
PASS: test_ip_conntrack_reject_established: ns1 got no response and client is closed to vip (ns2)
PASS: test_ip6_conntrack_reject_established: ns1 got reply "PING" connecting to ns2
PASS: test_ip6_conntrack_reject_established: ns1 got reply "PING" connecting to vip using persistent connection
> 2025/03/12 08:11:00.000519768  length=5 from=0 to=4
PING
< 2025/03/12 08:11:00.000520866  length=5 from=0 to=4
PING
PASS: test_ip6_conntrack_reject_established: ns1 got reply "PING" connecting to vip
PASS: test_ip6_conntrack_reject_established: ns1 got reply "PING" connecting to vip using persistent connection
PASS: test_ip6_conntrack_reject_established: ns1 got "Connection refused" connecting to vip (ns2)
PASS: test_ip6_conntrack_reject_established: ns1 connection to vip is closed (ns2)
PASS: test_ip6_conntrack_reject_established: ns1 got no response and client is closed to vip (ns2)

Linux 6.13.5-200.fc41.x86_64
nftables v1.0.9 (Old Doc Yak #3)
