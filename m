Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E6B178CC8
	for <netfilter@vger.kernel.org>; Mon,  9 Sep 2024 21:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725916857; cv=none; b=JmrWPb50KgYCZvGgwE2W4mMNEfdlZqt6uxa5Ligy7U7Cs4uXEF1tPxWs9QOFKTzK2c+Jbfwu/IUJBcrvP21YiOprb9vesnng1bc3FsnnZsvWru+Ggb8z1rnedHegxBzUjQyho9JFnZPQa62kriuifOdeKkgfXqWcYA2PZ2uFhig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725916857; c=relaxed/simple;
	bh=1i0lZDRRlWtCZflExEZk3jahV16go0B9LcITCbhd7Y0=;
	h=MIME-Version:Date:From:To:Message-Id:Subject:Content-Type; b=PA+hPi8gVBb7jSzQIs0qaO8sR7/V+NaWMf5asWzUjfAHtbnKyxIVgwgpi4XyubZ84c9lo2DE71bNQLEQ+R5UvxYBEhrgUV9VeleVqvu9pn2xqyHsSyzjZ4D02Ra0nQFa1ceplHtsGKjNoY3xNeXdOOlhqYExGPJ90lS4t89pa08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com; spf=pass smtp.mailfrom=fastmail.com; dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b=pch3db3D; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fNy+ATxp; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fastmail.com header.i=@fastmail.com header.b="pch3db3D";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fNy+ATxp"
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id E5BDC1380181
	for <netfilter@vger.kernel.org>; Mon,  9 Sep 2024 17:20:54 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Mon, 09 Sep 2024 17:20:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1725916854; x=1726003254; bh=Jp4oIBOa63
	MvfZNuoJTVfz0hLu99uhKxuXBNnhGWk0c=; b=pch3db3D9OQN9K2hryxpIvdnjY
	Kz9fVYnD1lKbgZbCYYxqaX6CZRgB4PboaBr01xH8fBbxqppdaCBmOL/uGuVgmOr7
	qj0AiLyuG9TUzP67GQHAx+bn2Ykh5xPhO7vYErriSMy5/vbThwwbloteCJpc99Ak
	75AjMyQM7TIVm0WR+vOoK+L5TqlKtAVyIpjiTgjMe8Ga9qsjqvfF2hdT1U2Q2eYc
	jWLogBQ4hCL6cv/1lTPrf3HhQyUR/7D2hq9UBqFkwZZmpzlw+3P8UOO18bSnZlA8
	0G7nOu8EIlUSN28vkJOidrlCL7QZl7oqAWW6IMm+9mSCPudF4FTIpR0Pqr7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1725916854; x=1726003254; bh=Jp4oIBOa63MvfZNuoJTVfz0hLu99
	uhKxuXBNnhGWk0c=; b=fNy+ATxpravsWI0DaThBpVBZPHYdy5759GznaMsRCPsr
	KXwhjsoE3lBip0yohbT3bHxuUfjzw7sohqlETHLQ3TVP8Hg9BsUyD7DHES/3vaPC
	H/EcBXJ1XiPBMkSZK3sm/KFSpxDi9jT3udfkqb/BKZ94jwfWQT/XOKktAiHyoAtZ
	TLLvaZuHNR9eEIDO+QIfGCJGlzdz6atGA4sgcj0rrb1mBcvC5S4/WW+EyrAZZIEN
	yfkH6W5uYXDpJe3Nte2ySe4TYmZmIaiD7u2UFj27QP+iKvqn3ErXAmMV+iKZ5I76
	ickR0KHZd/DRAkB1rv/TH2hLTWQkvTWwgqL/pAAchg==
X-ME-Sender: <xms:tmbfZtjGjcfaYq5dU7mGwedGDA_-LfPP69ad26eCqQAMbITMuNxxvA>
    <xme:tmbfZiDWGT8l1Sokq7Iqvb3qvVJAGs5QDxHrOUo_0oaYUufQvm4H8xvu0XCKXG2uP
    iqGlYIb4qN5K5Wqies>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeijedgudeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepofggff
    fhvffkufgtgfesthejredtredttdenucfhrhhomhepfdffuhhsthhinhcunfhivghufdcu
    oeifhhgrlhgvpgduieefsehfrghsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnh
    ephfehtefggfevgeekhfehudeffedvleektedtvdetffehjeeglefffffgheefteegnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepfihhrghlvg
    gpudeifeesfhgrshhtmhgrihhlrdgtohhmpdhnsggprhgtphhtthhopedupdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehnvghtfhhilhhtvghrsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhg
X-ME-Proxy: <xmx:tmbfZtFDQTEUWAqzmlhDyD99oJK5rbObAE7I8xo4EXrZ3u2vaSnA8Q>
    <xmx:tmbfZiQSR6OOEsQPR_sAR05UyXjL7YSUM69-7DvlcV5t-5dohYEAOA>
    <xmx:tmbfZqzVAo0I88optoEL_gdyK0F1s5jF2fWhXpvcVdpWyQ2FuSzxsw>
    <xmx:tmbfZo4epDmvLTWPK70uVpnawUeEneVMxMQ4q7M7Xb4V3t8JGMXKxQ>
    <xmx:tmbfZgaqCqdhN8Zii8_DL6VQa2VtjWr23WEKF008yLC3PuuLGtal9bpx>
Feedback-ID: i3cc949fe:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id B7E1BB00067; Mon,  9 Sep 2024 17:20:54 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 09 Sep 2024 14:20:09 -0700
From: "Dustin Lieu" <whale_163@fastmail.com>
To: netfilter@vger.kernel.org
Message-Id: <31a149f7-3775-46c3-80ae-5a11a389976b@app.fastmail.com>
Subject: Issue Setting meta broute
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello,

When I try adding a rule to set meta broute, I get an error that says it's not supported. I'm running nftables version v1.0.9, which should support broute. Does anyone know what the issue could be?

$ nft --version
nftables v1.0.9 (Old Doc Yak #3)

$ nft add table bridge bridge_rules
$ nft add chain bridge bridge_rules prerouting "{ type filter hook prerouting priority 0; policy accept; }"
$ nft add rule bridge bridge_rules prerouting meta broute set 1
Error: Could not process rule: Not supported
add rule bridge bridge_rules prerouting meta broute set 1
                                        ^^^^^^^^^^^^^^^^^

Thanks,
Dustin
