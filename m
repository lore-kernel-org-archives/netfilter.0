Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E251CAAF
	for <netfilter@vger.kernel.org>; Sun, 11 Aug 2024 14:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723387419; cv=none; b=HFQ43FClPy2mEXuubTCYIao0M1sLgDPjqcdHSzPG3bO5Q+BdBxHECqzB9bfYi21zIZLhyeuhBehvJjWvc5dUK2CpPRohDGbHqAmHffhJLnUq/AmGAPHnaP9qVcFkQu8B/doAFkBaEaqXNzejA2wmA05wyt+OoGQe9f3yVRuStCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723387419; c=relaxed/simple;
	bh=zx2es6El0EVA6LUUOeGzAG4kmcfvAME/H71zgMqiVmw=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=j67jNkDOr9gvOm3Yy0tTtzWd3U8FY/AXd7l94EQnH0n/3U2yX0N5Or1DuKOX0XHp+Mv7RoWa2cyq1+CdCR5S5vS7xmk5tDDcc/o5IQzch8s2FYEVBJQDwFBYR7WNMjU2FEWqFadQOuATyfk37oQbtjqb5+/gC8kDPBLGAySqVeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev-mail.net; spf=pass smtp.mailfrom=dev-mail.net; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=I38aKiGf; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dev-mail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dev-mail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="I38aKiGf"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id 0795C138FC2E
	for <netfilter@vger.kernel.org>; Sun, 11 Aug 2024 10:43:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Sun, 11 Aug 2024 10:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1723387416; x=1723473816; bh=b/fYiflZWPLj0
	81WJfpPG1agajGrwVvpUBoUsfsjR8c=; b=I38aKiGfljONlx78cHrRrY6TO1cLw
	YZbrHtc8nj7Vb3BiJa8Q6aywG2HSjQTaZV5JQFCkehL+r+hLB3LK8onI6fkkRmzp
	oA+fUtEKSsWjHcnMzJM5lE+RcL5faDA3PxJqgzPfcwz5xJobe8AmJ0B6tN+qE+Ya
	5F6yyhDNaGL4224AQBRRTN4G6yyu2jZcHxDoOKOVbTZWKapoxr3lAvqeXcmwb8lS
	VigSP3bK19rfXS65zkpC4U/z6lu1SNWOLCTJTaGN3LsimpLF4HXk9mS7PozbwXem
	Q6ra8YaW+x3AV67gfMTMIaBpdXrXcMd/wAIycXqwKHW0SS3g/m3OSI2CA==
X-ME-Sender: <xms:F864ZnV3HHcqBTfdhkA1Y3Spf3mljmeREiAIjmYaiz300sHbr3QQNw>
    <xme:F864ZvkWRCh1gy139wApnlOtbRnOzGCJkf-A9kp4isLlO08jiZ6NRM_FBsoVaLzuG
    82v4r1LQNFaLten>
X-ME-Received: <xmr:F864ZjbWjWSs7DIxdwj7Fj3cZLaTE79DWISaDPWNaW-sxV5QaszwqPxUlo7TmwBNzis3uTU8ts78LXTr1lEps10eScO7_tuVQscwzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrleekgdektdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepkfffgggfrh
    fhvffutgfgsehtjeertddtvdejnecuhfhrohhmpehpghhnugcuoehpghhnugesuggvvhdq
    mhgrihhlrdhnvghtqeenucggtffrrghtthgvrhhnpeeggeegleekhfethedtgeegffelue
    fgvdetudeutdduheefhfeuvdejieehiedvkeenucffohhmrghinhepnhhfthgrsghlvghs
    rdhorhhgpdhkvghrnhgvlhdrohhrghdpthhhvghrmhgrlhgtihhrtghlvgdruggvpdhnvg
    htfhhilhhtvghrrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepphhgnhguseguvghvqdhmrghilhdrnhgvthdpnhgspghrtghpthhtoh
    epuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepnhgvthhfihhlthgvrhesvhhg
    vghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:F864ZiUlhNEoXOQz-q6JP3uVYV8ebTAbveuzcGWyzGjvCjagwaKZww>
    <xmx:F864ZhnTAn_yEJtG9TR0JAVE51roQQxH_CCOieyyrntiY4XCi1XrNQ>
    <xmx:F864Zvfzzmf8B4scEUMy3SRa-DHxeB1BqKaDcYm5zuEKC9JROPQkcA>
    <xmx:F864ZrFbn67YxNP3IsrmB7ugRxuRWrxyG9LZNh-JcVxFzHjId0TU9Q>
    <xmx:GM64ZqBPBAHdQFhiL9_3AvxINJbBDO1wOY331_hRQWSfdA69annNTr3S>
Feedback-ID: if6e94526:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <netfilter@vger.kernel.org>; Sun, 11 Aug 2024 10:43:35 -0400 (EDT)
Message-ID: <890f23df-cdd6-4dab-9979-d5700d8b914b@dev-mail.net>
Date: Sun, 11 Aug 2024 10:43:35 -0400
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: pgnd@dev-mail.net
From: pgnd <pgnd@dev-mail.net>
Content-Language: en-US, fr, de-DE, pl, es-ES
To: netfilter@vger.kernel.org
Subject: correct nft v1.1.0 usage for flowtable h/w offload? `flags offload`
 &/or `devices=`
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

i'm setting up nftables flowtable for h/w offload, per

	https://wiki.nftables.org/wiki-nftables/index.php/Flowtables
	https://docs.kernel.org/networking/nf_flowtable.html#hardware-offload
	https://thermalcircle.de/doku.php?id=blog:linux:flowtables_1_a_netfilter_nftables_fastpath
&
	a slew of older posts @ ML ...


on

	/usr/local/sbin/nft -V
		nftables v1.1.0 (Commodore Bullmoose)
		  cli:          editline
		  json:         yes
		  minigmp:      no
		  libxtables:   no

	uname -rm
		6.10.3-200.fc40.x86_64 x86_64


with

	lspci | grep -i eth
		02:00.0 Ethernet controller: Intel Corporation I350 Gigabit Network Connection (rev 01)
		03:00.0 Ethernet controller: Intel Corporation I350 Gigabit Network Connection (rev 01)

	ethtool -k enp3s0 | grep -i offload.*on
		tcp-segmentation-offload: on
		generic-segmentation-offload: on
		generic-receive-offload: on
		rx-vlan-offload: on
		tx-vlan-offload: on
		hw-tc-offload: on

	(which, iiuc, is sufficient?)

a test config

	cat test.nft
		#!/usr/local/sbin/nft -f

		table inet filter {

			flowtable f {
				hook ingress priority 0;
				devices = { enp2s0, enp3s0 };
			}

			chain input {
				type filter hook input priority 0;
				policy accept;
			}

			chain forward {
				type filter hook forward priority 1;
				policy drop;

				ct state invalid drop;

				tcp dport { 80, 443 } ct state established flow offload @f;

				ct state { established, related } accept;
				accept;
			}
		}

fails conf check,

	nft -c -f ./test.nft
		./test.nft:8:12-12: Error: Could not process rule: Operation not supported
		        flowtable f {
		                  ^

otoh, per example @

	https://docs.kernel.org/networking/nf_flowtable.html#hardware-offload

edit

	flowtable f {
		hook ingress priority 0;
-		devices = { enp2s0, enp3s0 };
+		flags offload;
	}

passes conf check. and after load

	nft list flowtables
		table inet filter {
		        flowtable f {
		                hook ingress priority filter
		                flags offload
		        }
		}

what's the correct/current usage for flowtable declaration in hardware offload use case?
as documented @ wiki, or kernel docs?
_seems_ it's kernel docs ...


reading @,

	https://netfilter.org/projects/nftables/files/changes-nftables-1.1.0.txt

i don't find (yet) the change re `flags offload` usage.

what commit introduced it?

