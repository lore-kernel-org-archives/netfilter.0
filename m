From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Updating set elements from command line
Date: Sun, 9 Oct 2022 06:05:30 +0100
Message-ID: <20221009060530.2c9abac3abc199bfffb49e5f@plushkava.net>
References: <Eio6D1ukecFTMx3qFhiCTbHRPOiSKqei5fvfeaGcMc4SfXxZriRAXGFv_HgaBa-wVulHKr7D-6mE6RNQOJztUM1tooTU5nCqQ1Z9AO_o_IM=@proton.me>
        <20221009053950.be64bd6555d9c7060e363136@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1665291932; x=
        1665378332; bh=7ZIm323GAAYAEMzWkrZovxt+UM2fU6vsKgXToq+n6Nk=; b=D
        ao/RkvzulY8Sgj6cOgsCxnBzaaZZ+XknUHZIFApriMZwsgwer1KodSFBUE3BwRQD
        VUEBQzwAniYnp70Mlnp8O3qsCXW93s/O6/9lo3mkYqT085yRzb52o+fvKC7fTsf4
        dsqMic5CJluzdWS+vZSwnZRifx6oEeVehJm3X1EKA3KfuL1+yEOb4YBRFn6DftR7
        3EJw5qvdz9lKhOFTeDnkSJuIx+LogiVFsAIvvl9eooNN4P+mYgUfs9AKKx2JhhA5
        coyzRa8tNDK2u3KEg+/nrC4fibwis+VPZpn1zMouDEumcanv/12kFmKARaFDbBrh
        TFnhqwwM9TpMmCQBkJ7iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665291932; x=
        1665378332; bh=7ZIm323GAAYAEMzWkrZovxt+UM2fU6vsKgXToq+n6Nk=; b=p
        7aXLV+ueMSGVr9K5gAUU7F2rJxjwMsXdZhgm1ldRBP23Yhq47SRmxe5WRqohXwRj
        W+UPfeANPT1IgcH7cSDzuogcpnsqwq/GFUvA6o9ep+UJmAZMS+28DWlNzvMq0Wv1
        ot+6WCbbbJbRXWVBcj893p7KFQo+Q81sukKV60c+h6yma3vsdEMLdRyFchuqJzSk
        EGgRjGIviU9qrZ7G1ISvRjivALFJHxk66IshvpvkSBgQ55ig8z5MGquawt/MMNIY
        g7jKpAQcGO4CVRqICxv21yj52C3yfV6BA0w2dLX1oIz2k1TdqqT6C+zekSPU3/73
        RA3iRLJ1S+x6UKq+s1VRw==
In-Reply-To: <20221009053950.be64bd6555d9c7060e363136@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kerin Millar <kfm@plushkava.net>
Cc: Eric <evil.function@proton.me>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is just to correct a silly mistake in my previous message.

On Sun, 9 Oct 2022 05:39:50 +0100
Kerin Millar <kfm@plushkava.net> wrote:

> table ip filter doh_ipv4 {
> 	type ipv4_addr
> 	flags interval,timeout
> 	counter
> 	auto-merge
> 	timeout 3d
> }

Of course, that example should have been presented as follows.

table ip filter {
	set doh_ipv4 {
		type ipv4_addr
		flags interval,timeout
		counter
		auto-merge
		timeout 3d
	}
}

-- 
Kerin Millar
