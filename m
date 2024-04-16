Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC1E13957B
	for <netfilter@vger.kernel.org>; Tue, 16 Apr 2024 20:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713298136; cv=none; b=ZKOs99THCU85erGHroNKNnFLlLCXpw8Nw6V2Bv4YqDsT985wqb93Sj9e7ISeHZKnKXQNooLjABM8P+p//MLOYVP1s0iBQjpO1MpZxCflFjXKwHHddyecPHeWu4UIQx4pjEgZoiNrndjUEb3aoxbxtY20V47DKjm4asJB45dK3II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713298136; c=relaxed/simple;
	bh=CuYBWPGB9atIlFTtZ1+2kP5T16H4u4H+25D/sXDI5Kg=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=jTo/zE6/cOXgsdyyYwuIBkpZMeMvpLjP3oHCC+FkMI69nMH/OYSkIhJmdBy7r6lkcR4Bpzl6EW7cS8pe15iA2gDnIZNOMA7/+LlOt3uyFrrRyn94ubm/ETL6BBU4M2P/TunzXISkvUG8XDBjdyTsJBOnIPXMVFVAaIQA1o6uI/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net; spf=pass smtp.mailfrom=plushkava.net; dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b=kAtelREh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FUG9tB25; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=plushkava.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=plushkava.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=plushkava.net header.i=@plushkava.net header.b="kAtelREh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FUG9tB25"
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfout.nyi.internal (Postfix) with ESMTP id 5B080138013A;
	Tue, 16 Apr 2024 16:08:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Tue, 16 Apr 2024 16:08:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1713298133; x=1713384533; bh=DChSevf+ncbSDzLHDTSxrAIi+5L5VX4K
	CD2dhmsVOz4=; b=kAtelREhoctnetgHtH2jYKmH9n5709fFP0EwwRkqw3EPcVkf
	sgobZba+IafmcXQ9lYgh3rfnsfvZ1PdFtwvtgJT9bwNopFQ00wpl4geJeNvomDhb
	M53Wluee5lL3WjkJDfIo47jvIIKezKftVFVj5QhjzI39Agy7kP0vKMo9O4xIZbkP
	o8eLSfgGBDdhNztY8vbXHCysk6UoeFA0oxEghlNyxD/Tn0fIvV1wans0QYOsRf1W
	LS5pW0AhjSk7WsVUZ64hj0zxH1/QzD80jvMwaQ0j+vYyK6yUyd34zcNIgiIw56SC
	DvfbUiyKCpTeHwFDe8RpoDrUCshDtinsWfNZ/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1713298133; x=
	1713384533; bh=DChSevf+ncbSDzLHDTSxrAIi+5L5VX4KCD2dhmsVOz4=; b=F
	UG9tB25TpPk6tYqgUrovaFaOAL+U8KlJpLDDSS0S4/2JHbi0VFrTUBVAxRI6UTVG
	2GdQyQBXZDq+nwfqwZ+DF+rIiO1f5S/jaxo0kDGxWw+P0oBfnNf/a9AD0FrQ57Sa
	q258NUxYNj/VMIu3UDnPvxlQqdr0AdX6ZVZeqShjLh1yBsCNIbagcfh9+gQnbARr
	t7Nw63lJvUpXqBaAxYu/Hh/APjY6fVIc10CxH3eOn+Cr9ejJ9FR50483nE1cG/Zt
	Qdq5dVlaS+4/MghEhEWxvzwRjha8dvMsDvxTepbzJLF608wnrfD/bdUyaMALLhi0
	ik1RqYDKmQlaqbhsjng0A==
X-ME-Sender: <xms:1NoeZh3c0nux2mgG4AuveI3OHdopr2yEfw6rphKUk5TZXZ-DsaZHpg>
    <xme:1NoeZoHiO4NPWx7sFwI2tLHMsHqp7qmY6MmxUw1ulxyM1ba7JIDkADCzulCb9j-xe
    8fNZ5LYYrWMts2D>
X-ME-Received: <xmr:1NoeZh6vS1LstJBbF73mQ7c3mKdIMvdyUfHnS39805hvLdA1C64qVRe7hiGqDVjOhGzjqZwSefIej08CiCs23w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejiedgkeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfgjfhfogggtgfesth
    ejredtjfdtvdenucfhrhhomhepmfgvrhhinhcuofhilhhlrghruceokhhfmhesphhluhhs
    hhhkrghvrgdrnhgvtheqnecuggftrfgrthhtvghrnhepiefhteethfegfeetgfehueegfe
    efheekudekfeffjeeguedtgeegjedtieehhfevnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepkhhfmhesphhluhhshhhkrghvrgdrnhgvth
X-ME-Proxy: <xmx:1doeZu3vGcLLWm_ogv_WR2WbKGoLOHzN85OtR4lxMVRBtUxdu5eTYw>
    <xmx:1doeZkHaWeNqn1wWKGjZxtiD9VSJgfolHpCX0zUWMKYZgzcMSzB_yw>
    <xmx:1doeZv_vKppDM4AVRSzB4_xQnE_kbCy399JcWK7SR5preNjMpWSAMw>
    <xmx:1doeZhnbmAs1A6rMA0geU8nOcQwEFOelSSEVOq3Hv_SGjnKrrox8mQ>
    <xmx:1doeZpSOU8Tl0pxVME7KPCL1a5SwJODNhHgWh72S3WQX-2hij5D66qJp>
Feedback-ID: i2431475f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Apr 2024 16:08:52 -0400 (EDT)
Date: Tue, 16 Apr 2024 21:08:51 +0100
From: Kerin Millar <kfm@plushkava.net>
To: netfilter@riseup.net
Cc: netfilter@vger.kernel.org
Subject: Re: Combining/compacting 2 rules into 1
Message-Id: <20240416210851.a9f14dc3c046ce42af06d87a@plushkava.net>
In-Reply-To: <20240416191250.04884e9b@localhost>
References: <20240416174748.5612bd27@localhost>
	<20240416195445.41b40f624e2dbec1c593c789@plushkava.net>
	<20240416191250.04884e9b@localhost>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 16 Apr 2024 19:12:50 -0000
"William N." <netfilter@riseup.net> wrote:

> Thank you, Kerin!
> 
> Could you please also tell me:
> 
> What is the way to actually test this rule? I.e. how do I send
> "improper" packets to see it do its work?
> 
> I have been successfully testing my other rules using nmap from another
> host and watching the 'journal -kf' and 'nft monitor trace' but this
> one is difficult for me.
> 

Firstly, I wrote the rule in such a way as to ease the testing process.

tcp flags syn meta protocol . tcp option maxseg size { ip . 0-535 counter, ip6 . 0-1219 counter }

Secondly, I wrote a crude script to generate a SYN packet while being able to set the MSS option to an abitrarily value.

#!/usr/bin/perl
use Net::RawIP;
@ARGV == 3 or exit 1;
my ($saddr, $daddr, $mss) = @ARGV;
my $pkt = Net::RawIP->new;
$pkt->set({
    'ip'  => {
        'saddr' => $saddr,
        'daddr' => $daddr
    },
    'tcp' => {
        'source'  => 1234,
        'dest'    => 1234,
        'syn'     => 1
    }
});
$pkt->optset('tcp' => { 'type' => [ 2 ], 'data' => [ pack('n', $mss) ] });
$pkt->send(0, 1);

Note that this requires the Net::RawIP module, which should be offered by your distribution as an installable package.

Thirdly, I ran the script, specifying a value that was not expected to match the rule.

# ./test-mss 127.0.0.1 127.0.0.1 536

By listing the ruleset, I could see that the counter had not increased.

Fourthly, I ran the script again, specifying a value that was expected to match the rule.

# ./test-mss 127.0.0.1 127.0.0.1 535

By listing the ruleset, I could see that the counter had increased.
 
tcp flags syn meta protocol . tcp option maxseg size { ip . 0-535 counter packets 1 bytes 44, ip6 . 0-1219 counter packets 0 bytes 0 }

There are probably some utilities that can do this. Certainly, there are other libraries; I hear that Scapy is a particularly good one.

-- 
Kerin Millar
