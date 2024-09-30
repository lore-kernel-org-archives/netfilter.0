Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA4929429
	for <netfilter@vger.kernel.org>; Mon, 30 Sep 2024 09:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727689788; cv=none; b=ctRYwZRthBUYn6j2UaAT+ytfFEoZerL5KaWQGGZqVdOYMdHvq5anVgfizoC2ANV8gvSnJZtbW+LVl9JJfq8VNqiEI9gwTyLBI0jQQ8Qzz349dgxx16QlHjsLwFL69vFRpGzHUsUYRGZHmiPbQyC1u7bmtmRQ1SuMtZscnpudrPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727689788; c=relaxed/simple;
	bh=4Qn+uStcJ9uYao0gkdKiZl9wDJDvZj2h3atw2T9H2C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N//TqG9bQ5c1KIMmurb7n8wJPfS9IBfCIT6WiKS6mBrPwaL/U91Yz2pcE4DPD7JsYJ2LJcEFrtMhSLBeou6Jov9bBbGFcATfnYsBvCpbAp/mkZMqJylSIe5L16P699cf+H+JquNqSUXlqgwYTxQfpD/6E8ZPBIn2GD8Yu9hM1Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=45126 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1svD25-007vuo-IA; Mon, 30 Sep 2024 11:49:36 +0200
Date: Mon, 30 Sep 2024 11:49:32 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Avinash Dige <avinash.dige@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Clarification on the functioning of "ct count"
Message-ID: <Zvp0LFHNttuMbjKw@calendula>
References: <CAG0FA8UwEBU7NMzj63aU93AuJSaXzFciu0Qi3fOn-YNwB8F9MQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAG0FA8UwEBU7NMzj63aU93AuJSaXzFciu0Qi3fOn-YNwB8F9MQ@mail.gmail.com>
X-Spam-Score: -1.9 (-)

Hi,

On Mon, Sep 30, 2024 at 01:09:11PM +0530, Avinash Dige wrote:
> Posting this again without HTML formatting in case the first mail has
> been rejected. I have questions about how exactly using "ct count" or
> "ct count over" in dynamic nft sets works. I want to implement nft
> rules for the following use cases:
> 1. Limit the max TCP sessions from one host to 5000.
> 2. Limit the max TCP sessions to one host to 5000.
> 
> I tried using 'ct count' for the 1st use case. I have questions about
> how exactly using "ct count" or "ct count over" in dynamic nft sets
> work.
> https://wiki.nftables.org/wiki-nftables/index.php/Meters#Doing_connlimit_with_nft
> I tried the example from the above link: (For testing, just changed
> the "ct count over 20" part to "ct count over 3" & for my use case I
> would change it to 5000.)
> '''
> table ip filter {
> set my_connlimit {
> type ipv4_addr
> size 65535
> flags dynamic
> }
> 
> chain output {
> type filter hook output priority filter; policy accept;
> ct state new add @my_connlimit { ip saddr ct count over 3 } counter drop
> }
> }
> '''
> I have a setup of 3 machines (VMs).
> Host machine: 192.168.56.1
> Then on virtualbox, I set up 2 VMs.
> Machine 1: 192.168.56.101
> Machine 2: 192.168.56.103

What is your topology to reach the VMs? Is this a bridged or routed?

> I put the above nft rules on "Machine 1".
> I have recorded videos.
> Left half of the screen: Top 4 terminal windows are from the "host machine".
> Left half of the screen: Bottom 4 terminal windows are from the "Machine 2".
> Right half of the screen: Output on "Machine 1" for the commands:
> 'sudo conntrack -L' & 'sudo nft list table ip filter'. We can monitor
> the actual conntrack tables entries on "Machine 1" & the nft set
> elements in the my_connlimit set on "Machine 1".
> Then I tried the following test- "Test 1".
> From "Host machine", initialised 4 ssh connections to "Machine 1".
> (Watch the top 4 terminal windows on the left half of the screen)
> Expectation: 192.168.56.1 should get added to the my_connlimit set
> after the number of connections from 192.168.56.1 exceeds 3.

- Your ruleset is in "Machine 1" (one of the VMs)
- You start ssh from "Host machine" to "Machine 1"
- Your ruleset in "Machine 1" is not correct, you use the output chain:

        type filter hook output priority filter; policy accept;

  it seems your intention is to use input instead:

        type filter hook input priority filter; policy accept;

  add this to "Machine 1" instead:

-o-
flush ruleset

table ip filter {
        set my_connlimit {
                type ipv4_addr
                size 65535
                flags dynamic
        }

        chain input {
                type filter hook input priority filter; policy accept;
                ct state new add @my_connlimit { ip saddr ct count over 3 } counter drop
        }
}
-o-

> Actual observation: 192.168.56.1 does not get added to the my_connlimit set.
> I have recorded a video of the test: test1.webm (Watch the right half
> of the screen)

Right, because your ruleset uses the output chain, not the input
chain to restrict the maximum number of incoming connection to
"Machine 1".

> Then I tried the following test- "Test 2".
> From "Machine 2", initialised 4 ssh connections to "Machine 1". (Watch
> the bottom 4 terminal windows on the left half of the screen)
> Expectation: 192.168.56.103 should get added to the my_connlimit set
> after the number of connections from 192.168.56.103 exceeds 3.
> Actual observation: 192.168.56.103 does not get added to the my_connlimit set.
> I have recorded a video of the test: test1.webm (Watch the right half
> of the screen, that's the c)
> 
> I. I am having trouble understanding how exactly using "ct count" or
> "ct count over" in dynamic nft sets work.
> The documentation says- 'For each packet matching this rule, it adds
> an element to the set whose key is 'ip saddr' and it allows a maximum
> number of 20 established connections to such IP source addresses.'
> Does that mean-
> 1. For a particular source IP address, when the first packet matches
> this rule, its 'ip saddr ct count over 20' would get added to the
> my_connlimit set.
> 2. When the ct count for this source IP address goes over 20, we would
> start dropping these packets.
> II. What changes do I need to do to make the rule work so that I can
> track connection count individually for separate IP addresses? I need
> to do this without having separate rules for each IP address.

No.

> Having separate nft rules for each IP address manually works (Rules like below)
> '''
> meta l4proto tcp ct state new ip saddr 192.168.56.102 ct count over
> 5000 add @my_connlimit { ip saddr } counter
> meta l4proto tcp ct state new ip saddr 192.168.56.103 ct count over
> 5000 add @my_connlimit { ip saddr } counter
> meta l4proto tcp ct state new ip saddr 192.168.56.104 ct count over
> 5000 add @my_connlimit { ip saddr } counter
> meta l4proto tcp ct state new ip saddr 192.168.56.105 ct count over
> 5000 add @my_connlimit { ip saddr } counter
> '''

No, this is not correct.

> But this is not a feasible solution as the number of clients
> increases. Thus I am looking at a rule like 'meta l4proto tcp ct state
> new add @my_connlimit { ip saddr ct count over 5000 } counter drop' to
> work, but it is not working as expected.
> 
> 
> -- 
> 
> Avinash Dige
> 9028317335



