Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9DE19644B
	for <netfilter@vger.kernel.org>; Sat, 28 Feb 2026 15:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772291040; cv=none; b=tQGWzAlxSMBq5FtmVru5zlKZgCEdbux/CIspt/KqHV4bgsXQtrwud8I7KrS2Yv33bhZC3WHZM5VSJnX6JJ5ZiQC3uz7sCqNVYqAqkoNOaPqlodvA15TELzWdI26JoVmBDP78nIOFdlt+x40Gb/NvO7Gn43kDLtnwzXHhgAPhY4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772291040; c=relaxed/simple;
	bh=N2gpGuRxuILLfqxmP6jy2ZrGiMyU5MC39er3gdPme8M=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To; b=CZe8Ajv1EYNvoHVkXTJPpClt2dnItgPBIFzlJNwfSGsTU9P6btb56cnMagjtCFWprWpIS/jSjKfXHHfcMBSisTPqebI/Nvr7YnKX3Qmyi9HFdcZqUkjh1HjsYC8fF2aqRlaSn0HvOxsEDT9RK8bCAbSe0xDpyIYTzkJPT5GPL1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=willowbarraco.fr; spf=pass smtp.mailfrom=willowbarraco.fr; dkim=pass (2048-bit key) header.d=willowbarraco.fr header.i=@willowbarraco.fr header.b=qDf054bx; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=willowbarraco.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=willowbarraco.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=willowbarraco.fr header.i=@willowbarraco.fr header.b="qDf054bx"
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=willowbarraco.fr;
	s=key1; t=1772291036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7v4oITyOKMJGBLXb+4QNsrt9DEiuFTrLKspWorElBTY=;
	b=qDf054bxgh0/kHql4ZZGAPPkg1PAHt+TRHYCQaolmKaKvyHLxkDGNIHzob1UT3gbvojKIR
	efakUMsKAY2186/VT6wj855k0g2dqTkjA5OjOjTv/zkumuUz/AIFxuZRAPL/4ivTpH4wmp
	UBZG8lsVqEhj4Os5F2Nae9LwPL0BIeoAeg4ZNhemzojglicT2qcxnjx8//HkPnBbE12nQb
	hnxsLFjp/rRhE3wwm3WHQ0FzhtlFUXOAfCYIIB5tF/3kbVgrInvL57tcwLCBnSfcpE1VNH
	xRSwg5G6XXElVcI/bqc9olGDbKAKQhehKCcZw84XGeJ4stFtkoUi8jiMqUi2mg==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Sat, 28 Feb 2026 16:03:42 +0100
Message-Id: <DGQOQG1S6RZZ.189MCAVQ44YDX@willowbarraco.fr>
Subject: "include" directive should skip broken symlinks?
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Willow Barraco" <contact@willowbarraco.fr>
To: <netfilter@vger.kernel.org>
X-Migadu-Flow: FLOW_OUT

Hey there,

At Alpine Linux, we embark a default nftables configurations containing
this line:

	include "/etc/nftables.d/*.nft"

Then, we have a meta package, and related sub-packages containing
holes on the firewall, related to their package. By example, a user
using nftables, and installing "nftables-rulesets" and "syncthing"
would install a dedicated ruleset installed at this location
"usr/share/nftables.avail/50_syncthing.nft". The users then can either
copy or symlink this to /etc/nftables.d/.

Now the problem: When the user symlink this, and then uninstall
the package, the symlink is left broken. In that situation, nftables
can't start, and the service generally silently remains as crashed on
system restarts.

I'm not sure what is the best way for nftables to handle this. Probably
it should skip this included entry? But this could lead to
unpredictable behaviors. Or maybe there should be a "include_if"
alternative config entry, to skip unreadable files?

Thanks,
Willow
