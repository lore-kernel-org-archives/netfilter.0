Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BD6625
	for <netfilter@vger.kernel.org>; Sun, 21 Apr 2024 17:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713721668; cv=none; b=sG9bmhmQCPsWD6SPBNBxf0ugA3yzUxMUSpncOYAS0//GsKSm16UelxunNYGqcbDB37oj/5LSjNaEs8beBZSZ0Arjri0/ROQGhwcIryl+ZrKlxG7mUlGziTwpWlxJ/E04zACHbmj2PgiehGwKD4uQQQ8dZvigPSgd3pNJpmFxCvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713721668; c=relaxed/simple;
	bh=UmFObwuHUia3aO/C/wXFN9/vaIIdhIiYidgL1qaxnT8=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PqDNh9lxuLLOBHVj65s8GpWskJTtetUzibLUVJk4WVdzpd80n9To8zXtL8HJ/7qQC3ZBGwPvo/TUw/lpuor6rbrPqCwWwMiqA3mbxLspKtgYld5c26lbL46LQAPUh3VS+RiVjUq0IXm3amjbyhYwTd9Z1/dvojHDPDp3L4t6ymk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=ghXbO69p; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="ghXbO69p"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4VMwnl6t67zDqDL
	for <netfilter@vger.kernel.org>; Sun, 21 Apr 2024 17:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1713721660; bh=UmFObwuHUia3aO/C/wXFN9/vaIIdhIiYidgL1qaxnT8=;
	h=Date:From:To:Subject:In-Reply-To:References:Reply-To:From;
	b=ghXbO69pGgcf5oO70Q7LXW85Fz7k+VcpzxA77cDlNaAqTkV2gtycRT+1vbKzoRBs5
	 E8AAxbK/4JuS2HdurKtcGbK6c56RpulgCLTCQba9rYVao4gn9+oNvMYZbHlBnn/cVE
	 Y/1bTAapn15j3lurF/4uqCwJz8sOYNDz1UIJpN1M=
X-Riseup-User-ID: 7CDE4AE5A4098EF8CC404788C7C0E03D33B81778765085BFCF4D488411288141
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4VMwnj6qYLzFsf8
	for <netfilter@vger.kernel.org>; Sun, 21 Apr 2024 17:47:37 +0000 (UTC)
Date: Sun, 21 Apr 2024 17:47:26 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: Re: [Thread split] nftables rule optimization - dropping invalid in
 ingress?
Message-ID: <20240421174726.7345861d@localhost>
In-Reply-To: <31f21bca-c442-40f9-a1a3-d9cfe9778570@app.fastmail.com>
References: <20240420084802.6ff973cf@localhost>
 <20240420183750.332ffbad@localhost>
 <31f21bca-c442-40f9-a1a3-d9cfe9778570@app.fastmail.com>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 20 Apr 2024 20:16:49 +0100 Kerin Millar wrote:

> If using the ingress hook in this way is to make any measurable
> difference to your load average at all, my expectation would be for
> it be observable in the event that you are subjected to a
> concentrated flood of invalid TCP packets.

I was thinking the same.

> You could use hping3 to conduct a series of stress tests.

The question is how to measure the difference correctly. I am not a
network expert. I see some articles about firewall performance testing
using  iperf3 but in a VM-to-VM test (which I use) it is quite
inconsistent. Additionally, iperf3 is not able to do what hping3
does and I have no idea how to measure anything using hping3, which is
probably the correct test, as it would trigger the rules.

My clumsy attempt to have at least some comparison:

Testing procedure
-----------------

1. Design the ruleset
2. Put the rule to be tested in a separate file and include that file
3. In the file, have the line with the rule, followed by a single
'continue' on a new line. Repeat this combination 1000 times (to make
it have an observable effect)
4. In VM1 run (where rules reside):

iperf3 -s -p <port>
5. In VM2 run:

for (( i=0; i<10; i++)); do iperf3 -c 10.137.0.82 -p <port> -V; done

6. Note the speed after each iteration.

I am doing it 10 times because my observation shows that the first
iteration is always faster and the next ones decline to a point of
"saturation" (my interpretation - some resource exhaustion, e.g. memory
buffer). That is the inconsistency, mentioned above and my attempt to
get rid of it. Additionally, I also tested 'time ./my-firewall' to
compare this too.

Results
-------

# Early drop:

time to load = 23 sec
Bitrates (in Gbits/sec):

3.53
2.88
2.92
2.91
2.66
2.80
2.83
2.79
2.83
2.82

# Drop in prerouting (using conntrack and 'invalid'):

time to load = 1.326 s
Bitrates:

4.19
3.48
3.46
3.50
3.53
3.52
3.51
3.48
3.42
3.40

For comparison, the speed without any ruleset (after 'nft flush
ruleset'):

Bitrates:

5.54
4.96
4.66
4.33
4.32
4.32
4.33
4.34
4.31
4.32

Summarized
----------

Given the rules are repeated 1000 times, early drop is ~82% of the
speed of dropping using conntrack in prerouting and takes x20 more time
to load.

My interpretation (may be completely wrong, so corrections are welcome)
-----------------

conntrack is faster because it is compiled (binary), i.e. the same rule
written in nftables syntax needs additional processing (hence the much
higher load time), which makes it less efficient.

Additional info
---------------

If the rule is set only once (not repeated 1000 times, as in the test)
there is no difference between the 3 cases above - same speed. So,
ceteris paribus, the question comes down to: is there a security
benefit in dropping invalid packets earlier (e.g. right after dropping
fragments and bogons)?

I would highly appreciate the thoughts of the experts here.
