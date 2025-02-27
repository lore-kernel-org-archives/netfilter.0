Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A341E51E0
	for <netfilter@vger.kernel.org>; Thu, 27 Feb 2025 16:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740675096; cv=none; b=W+4nY1ZI5G9gfLCbecL2l19hsXLS/5x8i2kUpaC1Uw/IWG5bFBz41TP4ryiQ8jDAsoqow9vbGTGkwmSTufrboOg1VNReCva+szO38IvEYsKx8mMIA/WHlamNnSXkz7VFjYc5JF0YmGSNHgcTss6JzyAsfNI7E/hpmdtFhF26EFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740675096; c=relaxed/simple;
	bh=dpbl4baVpLIhbidu0kkiUclzEgKY3uyQxk6vLBC1cUA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=QraQuPDckr33r74c03UMKJBADWI6ra+NyobRtc8rJ5HR121ZicNq1BBOogzLT5451E71aImz1zzZudJrA4a6TsYuY3U817QyCf0eZ7PXBD4j6jLVRDtn4pon/ZozzdvltZ0kA6HlD32CjDH3Xy3rMPVSY64/MLSogXfSX7hMc6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=QmXGF16j; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=mzM/0qvU; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="QmXGF16j";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="mzM/0qvU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:From:
	Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:Content-Type:Message-Id;
	bh=mQ/3SqOKE2i6fZBr06vzKrao+3SPa4X8gHEvF7eJHYo=; t=1740675092; x=1741884692; 
	b=QmXGF16jEY+uHgLgz/0DhnSVschSlu23ixo8SR4eFFvdb6lIgQd3rU/9gVO/2+7nSwtCR8Ae4Mh
	1mvFVswGcIwNl1rNFEcnpzfjwYXzxLxaSHYB8TOATyxCutGafmfAV8fXlictx89V0G+SEmSe6ZpuS
	WxSUvpQ10hITJD1re+I=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:Message-ID:Subject:To:From
	:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:Content-Type:
	Message-Id; bh=mQ/3SqOKE2i6fZBr06vzKrao+3SPa4X8gHEvF7eJHYo=; t=1740675092;
	x=1741884692; b=mzM/0qvUPSU9yP+fzV9BCiq7rmiI01ihFYPUz5SQiqdBJ18niPmULzKCm0Ky5
	17dJdm5rO8FPFGuXQNmLioMDQ==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1tnh6Z-001Zgr-0I
	for netfilter@vger.kernel.org;
	Thu, 27 Feb 2025 17:51:23 +0100
Date: Thu, 27 Feb 2025 16:51:21 +0000
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
Subject: Log ARP headers
Message-ID: <FADC1D05-BC58-45CF-AEBA-2D4B85928185@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

i want to log ARP headers, thus i create arp family table
with one chain with only one rule, somethong as:

    arp operation request limit =2E=2E=2E countef log group 2 prefix =2E=
=2E=2E

It basically works, counter grows and packets are logged
via ulogd2 stack::

    stack=3Dlog2a:NFLOG,base1:BASE,ifi1:IFINDEX,ip2str1:IP2STR,mac2str1:HW=
HDR,gp1:GPRINT

Except that the log entries has not any ARP headers=2E

Then i found this article [1], which mentions the ARP as
sysctlt key:

    net=2Enetfilter=2Enf_log=2E3

Thus i set it to "nfnetlink_log", but that doesn't help=2E It
is hard to find what these numbers are, but i guess that
family constants, as 2, 7 and 10 (from ulogd2 start log)
coresponds to inet, inet6 and bridge family, but i am not
aware of arp family=2E=2E=2E

I guess that ulogd2 is able to log ARP headers as i found
them in BASE plugin's info output, but please what i have
to do to get them into log? Or problem is, that i play with
it inside LXC container (other logging works in it)?

regards

[1] <https://fedoramagazine=2Eorg/network-address-translation-part-4-connt=
rack-troubleshooting/

--=20
Slavko
https://www=2Eslavino=2Esk/
