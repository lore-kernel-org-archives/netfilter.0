From: Bourne Without <blackhole@airpost.net>
Subject: CT target without options
Date: Sat, 13 Apr 2013 11:41:29 +0200
Message-ID: <51692849.6090505@airpost.net>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:subject
	:content-type:content-transfer-encoding; s=mesmtp; bh=ZWmPNPSXbh
	qdaQFOFrjTq7ASS0U=; b=ivGtWoMcM28IW4GJVft8upmsbQJToPNlxMsOE+xLWt
	qnIN/23Oewr9Rr9PEb7ROkvDaifAH2GUYQgOEfnjU/2+3iXvf62KbuYyIlOMisAZ
	abaFf2WfSOqtBU0WKSssFk7KmeHkKZ5tR5kBnHyEoyiln6nsEJv0CjnFSGMM+OEz
	g=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:subject:content-type:content-transfer-encoding;
	 s=smtpout; bh=ZWmPNPSXbhqdaQFOFrjTq7ASS0U=; b=QSSS+rf+cLh30UFRd
	51Bjt6pa/n7spHactYSlXNnLyUH+2/1tbIdFsnEKjzUAESPBbUYEDBScnjZEXDDd
	UUKLpxptmbEZyGw/78oCPsIC5XAyMgJwe95OFFw41JJDq68hFo4im4CM1oZugBND
	BoeU/FjGfs56XCIyb29H4amjy4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

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

