Received: from Chamillionaire.breakpoint.cc (Chamillionaire.breakpoint.cc [91.216.245.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5FC175A8F
	for <netfilter@vger.kernel.org>; Sun,  1 Mar 2026 23:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.245.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772409227; cv=none; b=ACsMq1AP9eBtwyFLoB0L0jCZFXmgLTRH1K7+hzAk8TBULB08l9pKwvTbLaw4Z+MNoDTTlDl0qoONFh8dVHBmFwoTqisPACKTE5wrHW/XO/COzA3tqgiFLaf0f+GAaaaboo3cqPe3cXer65ZqhWsD1r0Pg27lD34Z7CcGKAYoo8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772409227; c=relaxed/simple;
	bh=Hxdf/ZlpAeLURTCe1kSRQGUSQpPdnFCzFfkFLQ2anY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bfi5YvJzZgdN1ujgFjrbXPX4cedQ93UAoLg3S7/Dza7/YRkyRFa1TuZCq0In7DvuV7W9jE0+1In8BtNr8gNvP6irrtKrSu6aAb+n0DNoqdBFt5G6aXTCT36m/yzbG5R2DiaRTMfAVJiPfk3bg+tyxGXwYJjDlxQeKNHChNiXZMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de; spf=pass smtp.mailfrom=strlen.de; arc=none smtp.client-ip=91.216.245.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strlen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=strlen.de
Received: by Chamillionaire.breakpoint.cc (Postfix, from userid 1003)
	id 12AEB6047A; Mon, 02 Mar 2026 00:53:43 +0100 (CET)
Date: Mon, 2 Mar 2026 00:53:37 +0100
From: Florian Westphal <fw@strlen.de>
To: Mathias Dufresne <mathias.dufresne@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Fwd: [nftables] is it possible to declare multiple tables for a
 given family type?
Message-ID: <aaTRgeXDaznuZvgh@strlen.de>
References: <752a3ecd-b379-4b82-8ac1-a64450e14167@gmail.com>
 <fc37db9e-39ed-4478-bb53-887156e309b2@gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc37db9e-39ed-4478-bb53-887156e309b2@gmail.com>

Mathias Dufresne <mathias.dufresne@gmail.com> wrote:
> Le 2026-03-01 à 14:52, Florian Westphal a écrit :
> The goal would have been to have one table per service containing 
> everything related to that specific service and nothing else.

I see.  One way to do it is to include such sub-configurations
from a central ruleset file.

> > Just like in iptables, 'accept' in raw table just means packets
> > continue to travel through the stack, you need to accept them in mangle
> > and again in filter table.
> Do you meant the network stack or the nftables' rules stack?

The former.  E.g. (staying with iptables, its same in nftables):

if a packet is accepted in mangle prerouting, it will continue and will
eventually make it to mangle input or forward.

> > Also, base chains (those with a line like
> > 'type filter hook input priority filter; policy accept;') always cause a
> > slow-down: they divert all packets into the nftables vm, so its a good idea to
> > minimize the amount of times this happens per packet.
> 
> Again, I'm lost there... I'm certainly lacking the basic knowledge to 
> understand :/

No problem.  Consider an nftables ruleset that has ONLY
chain foo {
	some rule ..
}

This ruleset is very fast.  And useless.  Because it never processes
any packets.

In iptables, this isn't possible, because all tables have
builtin-chains: PREROUTING, INPUT, and so on.

In nftables, one has to manually declare which chains are the 'starting
point' for packets passing through the networking stack.

E.g. type filter hook input priority filter; policy accept;

tells that you'd like semantics that are identical to iptables filter
INPUT chain: it will see incoming packets that have passed through the
routing step and are destined for the local host.

Makes sense so far?

This means, ALL incoming local packets will appear in this chain
(minus those that were dropped earlier on in the stack of course).

Example:
	chain myinput {
		type filter hook input priority filter; policy accept;

		tcp dport 22 jump ssh
		tcp dport { 80, 433 } jump httpd
	}
	...

... will be faster than making
'ssh' and 'httpd' two independent 'type filter hook input' chains.

Why?  Because in the case above, all incoming packets pass though
'myinput', then only a small subset gets passed on to ssh and httpd,
respectively.

If you make the two user chains base chains ('type filter...', both reveive
all the traffic).  In case you haven't tried it: See if 'nft list hooks'
provies some assistance to you.

> --------------------------------------------------------------------
> 
> Here is a working single table to SSH the firewall and one LAN through 
> that firewall:
> 
> table ip filter_them_all {
>    chain ip_log_svc_administrative_services/ssh {
>      counter packets 0 bytes 0 log prefix "Accept ip SVC for 
> 'administrative services/ssh': " group 2
>      counter packets 0 bytes 0 accept
>    }
>    chain input {
>      type filter hook input priority filter; policy accept;
>      ct state {established,related} counter log prefix "ACCEPT CT for 
> INPUT" group 2
>      ct state {established,related} accept
>      iif vdi-lan ip daddr 10.9.9.252/32 tcp dport 22 ct state new jump ip_log_svc_administrative_services/ssh
>      iif vdi-lan oif svc-web ip daddr 10.54.80.0/24 tcp dport 22 ct state new jump ip_log_svc_administrative_services/ssh
>      counter packets 0 bytes 0 log prefix "REFUSED INPUT packet as it reached the end of filtering rules stack." group 2
>      counter packets 0 bytes 0 drop
>    }
>    chain forward {
>      type filter hook forward priority filter; policy accept;
>      ct state {established,related} counter log prefix "ACCEPT CT for > FORWARD"  group 2

I'd suggest to add some rate limiting for your log lines.

>      # these two are working and can't be omitted
>      iif vdi-lan oif svc-web ip daddr 10.54.80.0/24 tcp dport 22  log prefix "ACCEPT FORWARD for ssh" group 2
>      iif vdi-lan oif svc-web ip daddr 10.54.80.0/24 tcp dport 22 accept

If you don't want to limit, you can combine this into one line, you can
'log prefix ... accept' in nftables.

>    chain output {
>      type filter hook output priority filter; policy accept;
>      ct state {established,related} counter log prefix "ACCEPT CT for 
> OUTPUT" group 2
>      ct state {established,related} accept
>      counter packets 0 bytes 0 log prefix "REFUSED OUTPUT packet as it 
> reached the end of filtering rules stack." group 2
>      counter packets 0 bytes 0 drop

Are you sure you need output filtering?  This prevents e.g. dns
resolution, ntp (time) refresh etc.

> table ip tracked_packets {
>    chain input {
>      type filter hook input priority 300; policy accept;
>      ct state {established,related} counter log prefix "ACCEPT CT for 
> INPUT" group 2
>      ct state {established,related} accept
>    }
>    chain input {
>      type filter hook input priority 310; policy accept;
>      iif vdi-lan             ip daddr 10.9.9.252/32 tcp dport 22 ct 
> state new jump ip_log_svc_administrative_services/ssh
>      iif vdi-lan oif svc-web ip daddr 10.54.80.0/24 tcp dport 22 ct 
> state new jump ip_log_svc_administrative_services/ssh
>    }

This works, but as you found there is no 'memory' and all chains have
to accept all packets for them to make it though.

> His this approach - several filtering tables - valid? I mean I could 
> easily have made errors in the syntax...

Yes, but I don't consider it a good idea, I also don't think its suited
for what you have in mind.

If this is about enabling / disabling services, I would use a set for
that.

set s {
	typeof iif . oif . ip daddr . meta l4proto . th dport
	flags interval
}

 chain forward {
      # these two are working and can't be omitted
      iif . oif . ip saddr . meta l4proto . th dport @s accept

[ totally untested, for illustrative purposes ... ]
