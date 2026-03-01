Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B11E27E1C5
	for <netfilter@vger.kernel.org>; Sun,  1 Mar 2026 13:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772373156; cv=none; b=oUuZn+7xnv3uXZHEtYUxVBdSizCXyEauPJwDX8XwB3Kx+7dZDAK8iX4yPtfFKjoh4XQfP4rjK/fqnq2yFkE2dciwR7Go6loBUja+AhVllfuWV37mxzW8MOiuozOzPQaQol7b92PGB94TsKkN2EdfW2Zi4621JJ0jxK6DL8cyK50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772373156; c=relaxed/simple;
	bh=e6/2b14YDxkAjriMr2Wx5XemUmDAF8GBW0xEsKrlXsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FliDsHkBmrimLxkOZ/zlmRbFBiQEnJHnT+vHkUIqbyIY7zpj6ixgNISJGvoJdYc94wEil0eJINcNbLsNW72pWK35/a/RujbydgafWLAcpyL01IlUYQUwdH1ruZ54vDpOOYgkhRQ0/XcSIoDjGomsMfLG7dNKZFQMYj4nh/3Idcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id C88396047A; Sun, 01 Mar 2026 14:52:30 +0100 (CET)
Date: Sun, 1 Mar 2026 14:52:32 +0100
From: Florian Westphal <fw@strlen.de>
To: Mathias Dufresne <mathias.dufresne@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: [nftables] is it possible to declare multiple tables for a given
 family type?
Message-ID: <aaREoEE9j4MwEyq9@strlen.de>
References: <ecfa18a6-3488-43cb-8ba5-00dfeeac8a01@gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ecfa18a6-3488-43cb-8ba5-00dfeeac8a01@gmail.com>

Mathias Dufresne <mathias.dufresne@gmail.com> wrote:
> Hi everyone,
> 
> I'm trying to replace my very old iptables script with nftables and I'm 
> wondering if it is possible to declare several tables of the same family.

Sure it is.

> The goal would be to sort my rules among these tables...

Why? Its awkward.  In iptables its much better to place all filter rules
in the filter table rather than spread them out over raw, mangle +
filter.

So why would you do that in nftables?

>          chain input {
>                  type filter hook input priority filter; policy accept;
>                  iif "eth12" ip daddr 172.16.0.1 tcp dport 22 ct state 
> new jump ipv4_log_ssh
>                  oif "eth12" ip saddr 172.16.0.1 tcp sport 22 ct state 
> new jump ipv4_log_ssh

You have lots of 'sport 22 ct state new' rules, they make no sense.
If you already use connection tracking, why do you need statless-alike
rule?  The replies from sshd should be handled via 'ct state
established'.
>          chain forward {
>                  type filter hook forward priority filter; policy accept;
>                  iif "eth12" ip daddr 172.16.0.1 tcp dport 22 ct state 
> new accept
>                  oif "eth12" ip saddr 172.16.0.1 tcp sport 22 ct state 
> new accept
>          }

This entire chain has no effect whatsoever, the filter policy is accept
so all packets are accepted, hence, the entire chain can be removed.

>          chain output {
>                  type filter hook output priority filter; policy accept;
>                  iif "eth12" ip daddr 172.16.0.1 tcp dport 22 ct state 
> new accept
>                  oif "eth12" ip saddr 172.16.0.1 tcp sport 22 ct state 
> new accept
>          }

Same.  All packets are accepted, so why not remove the entire chain?

>          chain input {
>                  type filter hook input priority filter; policy accept;
>                  ct state { established, related } counter packets 556 
> bytes 48604 accept
>                  jump ipv4_log_drop
>          }

That makes more sense.  I suggest you place your other input rules here.

Just like in iptables, 'accept' in raw table just means packets
continue to travel through the stack, you need to accept them in mangle
and again in filter table.

Also, base chains (those with a line like
'type filter hook input priority filter; policy accept;') always cause a
slow-down: they divert all packets into the nftables vm, so its a good idea to
minimize the amount of times this happens per packet.
