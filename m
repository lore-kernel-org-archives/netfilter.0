From: Bourne Without <blackhole@airpost.net>
Subject: Re: [Announce] ipset - programmable completion (bash)
Date: Mon, 18 Mar 2013 06:04:01 +0100
Message-ID: <5146A041.9010309@airpost.net>
References: <5112CA9C.1040802@airpost.net>
Reply-To: blackhole@airpost.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=airpost.net; h=
	message-id:date:from:reply-to:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding; s=mesmtp;
	 bh=Dwb53MLs0h82WYL4YKHIie4vCCI=; b=puYyXfC49wBDJUsawGYVtwtZstcR
	7uO1FJv81MA2YYkW+wtzagyFw0eO5GCLh4TEwP7Xt6FwyeXa14Nm1DgnqxKcNjQa
	2ou7laq/Dp/QNS+BytuX60WtYzDeq9yA1c6A2p0Qws+tIn91Dkqhke6nlipjVed2
	5C10NPSLhVCYoyQ=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:date:from:reply-to
	:mime-version:to:subject:references:in-reply-to:content-type
	:content-transfer-encoding; s=smtpout; bh=Dwb53MLs0h82WYL4YKHIie
	4vCCI=; b=e1eBQPuCn8XdjCcFSj5vssatdaByge5dE00iPejs3vc1NHWDNyn8Dm
	xlaRFUObGfs0V3Er8Ff1+t3kCeDlyVcZDWlS+O9Hu/nA47cGQRLtlsF1D+D2HKzb
	7mypkfljys5q0P13l+uWLDFSPeslD+LJtDHYdVSWY/GzTx6Fid3zU=
In-Reply-To: <5112CA9C.1040802@airpost.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 06.02.2013 22:26, Born Without wrote:
> Hello community!
>
> I've written programmable completion code for ipset.
[...]

> Code and files are available here:
>
> https://sourceforge.net/projects/ipset-bashcompl/
> https://github.com/AllKind/ipset-bash-completion


I'm glad to announce a new version (2.0).
This release comes with a lot of fixes and improvements.

New features are:

Choose short, long or both forms of options by setting an environment 
variable.

Completion on add/create/del options has been added.

Hostname completion has been extended.

MAC and IP addresses can be retrieved from the system and/or from a file.


Direct download link:
https://sourceforge.net/projects/ipset-bashcompl/files/latest/download?source=navbar


Best regards


