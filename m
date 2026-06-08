Received: from anxur.fi.muni.cz (anxur.fi.muni.cz [147.251.48.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592DF25B0A5
	for <netfilter@vger.kernel.org>; Mon,  8 Jun 2026 16:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=147.251.48.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780936746; cv=none; b=FDdKviLnBATZTtNqQLdIuyn3ylCn/TePRGAXXcVmplpKOIE9VfAUNRnuEZ8uEyEX2U/ABARu94fWyTn61GR3h4JMnkmFCYGRP9wYnaiVJNhbDxsUam2nCsmGwmmr8ANLDmI3kejK1LCWfzq6/98R5ZfSFV+FxULRsPChJ0GqTX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780936746; c=relaxed/simple;
	bh=yPwrAeQ6RVUxNgmB6BtCU9DPye9e6Bzn1xyTo5klpgE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AnP5vIhrsxpfgdC6EhhO8QxqAqE6I9JMfEEi43gshw3lP5Aiaus//CD8Tp79ID24BoncZbFD45G7Sy3ycDTA5oi6bZduCQbwiVel5yNZX8yd+3pD5+T1KbR98lICyyM8uWl3/I5mHKA4kXHvP/RV9c8KYg8xdSF7ue9oD/UPc10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fi.muni.cz; spf=pass smtp.mailfrom=fi.muni.cz; dkim=pass (2048-bit key) header.d=fi.muni.cz header.i=@fi.muni.cz header.b=t95+yL98; arc=none smtp.client-ip=147.251.48.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fi.muni.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fi.muni.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fi.muni.cz header.i=@fi.muni.cz header.b="t95+yL98"
Received: by anxur.fi.muni.cz (Postfix, from userid 11561)
	id 67D9B208DD1B; Mon,  8 Jun 2026 18:38:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fi.muni.cz;
	s=20230215; t=1780936734;
	bh=9/Ch8h7iDzRsBdWic0kUYgqdShN410Yfc6Z6Yis6E04=;
	h=Date:From:To:Subject:From;
	b=t95+yL98DzVrOsAOXU6XmODQTSaelblFVaUM0c2HATRWX40rihvNwq6NqZbaeXgtZ
	 jkCrrAmyAMgiyZkVwu1Xbi6LI+UdUad0kTKUF9KNMWHpEJLFjRdr3sl0zYqajCiU+M
	 3FFUvbqyLMaklCK0GaGMLpxrGr2/vb/Iq3Ki9qq4Sj421uny+jO8RklxoCWcHtAZRy
	 JRPUN/97EY3FpO+ckH5xhcSf1NsP+ROo4eBrFoB14gNKKXNaZWCu/XHcxJccblHF2D
	 nZQet0jXbm4BMxfsUOo6aymEXqOD4duhV9tFnp8jPFA1oQzx9Q4RLhqJgypTZvpScU
	 mrbjfHhLtDFDA==
Date: Mon, 8 Jun 2026 18:38:54 +0200
From: Jan Kasprzak <kas@fi.muni.cz>
To: netfilter@vger.kernel.org
Subject: Logging SNAT'ed connections
Message-ID: <aibwHhKDBOgr2p7M@fi.muni.cz>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Clacks-Overhead: GNU Terry Pratchett

Hi all,

how do you log SNAT'ed connections for further forensic purposes,
when somebody complains about your public IP address and you want to be
able to find a local user behind NAT?

I used to run something like

conntrack --event --buffer-size 1600000 -o id,timestamp --src-nat >> $LOGFILE

which did what I want. But now I tried to run the same on AlmaLinux9 host,
and it seems that --src-nat filter does not get applied - it shows
even connections which are not SNAT'ed at all, because they are for my
own IP address:

[1780936563.343940]	    [NEW] icmp     1 30 src=128.1.227.61 dst=xx.yy.zz.13 type=8 code=0 id=8724 [UNREPLIED] src=xx.yy.zz.13 dst=128.1.227.61 type=0 code=0 id=8724 id=2525400839
[1780936563.343994]	 [UPDATE] icmp     1 30 src=128.1.227.61 dst=xx.yy.zz.13 type=8 code=0 id=8724 src=xx.yy.zz.13 dst=128.1.227.61 type=0 code=0 id=8724 id=2525400839
[1780936565.281121]	    [NEW] icmp     1 30 src=128.1.227.61 dst=xx.yy.zz.11 type=8 code=0 id=8724 [UNREPLIED] src=xx.yy.zz.11 dst=128.1.227.61 type=0 code=0 id=8724 id=2574615308
[1780936565.281167]	 [UPDATE] icmp     1 30 src=128.1.227.61 dst=xx.yy.zz.11 type=8 code=0 id=8724 src=xx.yy.zz.11 dst=128.1.227.61 type=0 code=0 id=8724 id=2574615308

Here xx.yy.zz.11 and .13 are my public IP addresses. Why do these connections
show up in the conntrack --event --src-nat output? Thanks!

-Yenya

-- 
| Jan "Yenya" Kasprzak <kas at {fi.muni.cz - work | yenya.net - private}> |
| https://www.fi.muni.cz/~kas/                        GPG: 4096R/A45477D5 |
    I don't like Python; its lack of inline, anonymous, multi-statement
    functions makes me sad.                                --Eric Wastl
