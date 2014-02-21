From: Bourne Without <blackhole@airpost.net>
Subject: Fwd: CT target without options
Date: Fri, 21 Feb 2014 10:18:33 +0100
Message-ID: <530719E9.9090005@airpost.net>
References: <51692849.6090505@airpost.net>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=mesmtp;
	 bh=dHs1u8QXI4AYGOWGGGvyUXmX75M=; b=jpMUWfz1lGmM3eOCTvw9j+xFgPjo
	jKWUmBQj7ETL/VjKxljQaWhV3LiUp8rqny/e5/NIZ7bsRJkjMwVrypiQ00Rk2tZs
	w4XasOud6NgD83qZlDYBriimDWILB9RBP58Sz2KZKuVQwhlDlJ7OC0fCJMpUlr9y
	XdF8w3XT6/YL2MQ=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding; s=smtpout; bh=dHs1u8QXI4AYGOWGGGvyUX
	mX75M=; b=tvPqg3eyZdpfLm2gwNsBJyYSy3uehCTLFIpnfHGJaZ0N5UJ6dYYcgj
	WlSCHBHxpXL3udyrZJVcyQTsvU2ZXA3UU2UvrPRIbAyIw6be/21766Wg1YzJg0Uq
	8GM8qCD0yVi3jA6t0xjBMMA8Z6zCWFKhsz0I6K43uQVjySWdUlJuc=
In-Reply-To: <51692849.6090505@airpost.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello list :)

I'd still would be happy to get an answer on that old query of mine...
Thanks a lot!


-------- Original Message --------
Subject: CT target without options
Date: Sat, 13 Apr 2013 11:41:29 +0200
From: Bourne Without <blackhole@airpost.net>
Reply-To: blackhole@airpost.net
To: netfilter@vger.kernel.org <netfilter@vger.kernel.org>

Good day,

I wonder what a rule like this:
-A foo -t raw -j CT

actually does?
It shows up like this:

Chain foo (0 references)
target     prot opt source               destination
CT         all  --  anywhere             anywhere             CT

but what does it mean?
The opposite of --notrack?

thanks for your answers




