Received: from achilles.binarus.de (achilles.binarus.de [167.235.4.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D3E35966
	for <netfilter@vger.kernel.org>; Sun,  2 Feb 2025 18:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=167.235.4.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738522140; cv=none; b=raIcIwUlbazIjztFGroFlTBOBK/Fbw7ixnc0DKp6IS1dUM+QgtI06jKPirL5sOKUvhztzfwIpMG9QX4vRPYBe5/zMD0QNDVK+eLHxcNrJqYjowTbfwbUAiYLe/3iCXa+m9qFMo3gh0xC0tAItNH0NwXnIBPiGQKZXtxJKMlKN5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738522140; c=relaxed/simple;
	bh=3vD7uVfgxtJazVMFLuSgONgeLJF14yoiyVcLCO8+l8M=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=Hw3p0CPVgY1RbWN1068zTWl2swxr7un0mBFSr+2veVm18S6eioEhRs1o9TFliC9ZW53cOOalggMawtOV3NmO4cUQ8di4WhvwlRc/Xfl9V5ogjG3Zae4oo+3W8RjA/xAJTULM9zgXxF+FVyTFG+KZDoQtDy3laePKLx2ScoiQ9kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de; spf=pass smtp.mailfrom=binarus.de; dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b=UYla2dux; arc=none smtp.client-ip=167.235.4.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=binarus.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=binarus.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=binarus.de header.i=@binarus.de header.b="UYla2dux"
X-Envelope-To: <netfilter@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=binarus.de;
	s=b201601; t=1738522130;
	bh=3vD7uVfgxtJazVMFLuSgONgeLJF14yoiyVcLCO8+l8M=;
	h=Date:To:From:Subject:From:Reply-To:Subject:Date:To:Cc:Resent-Date:
	 Resent-From:Resent-To:Resent-Cc:In-Reply-To:References:List-Id:
	 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
	 List-Archive;
	b=UYla2duxbzLlhxBO5aM+gAOZ90WLQeFIYicoDexC5ZYkxUsvQGy+M3NAkEmtABByB
	 Y8QDf4x/tz4Ad+0j34qzAasrvVfrGT9PKtmuXVOD5OzmEG2mwaT02c/EVRG+1ZJOzV
	 VoyErglceaUb/BS7FtaxydSB0NzTn3r0X3TqudRJaS1/OrCd8LOm+K4Ak2db3Ha3Fp
	 jv3a9G/W/iE/rQrR0XChKxMWdtnl9nZD49t+QQmU0vw2eaL4Fi28v7zZjMFxfg5/De
	 SI+fwUQh/cJYbRaJtj3vaIsRtyP87kA0LA0T8pNIipC0Se9t3jz9ncA+CBoyPg6Ybl
	 OgNCSZSfyXDf2GjWoFYXeFc0Bsn9XsLtpOfCzxL8jKLVgTLd/th88uI1upG17EoOva
	 DFEsPDfJeXVJd1MJxDDYp8/NHKOB9kRNQbtKEOTtwwkc2JNhh805DmY5TnXxldQZzu
	 DUE9gtfhhdb9JjfioSWBHnAUoX7GyjbvnVrPEVxHOaoJT6cFNvO0N4QRRt4IanSOGq
	 yWmXDm/XT23u3nIL7xO9w+pPgclvmHvEuz0Qsnvclbd1SdDuHrWIOCnxM4rC4cRqsR
	 rRFJ4GP9fTZlcX6VdB0JONCtCTXwY0NB25ZCZADZopvsI2nqE4fZk/gH5Lfjl1s2JX
	 hCqKj3dn59mmlBWxQt2m5yZM=
Received: from [192.168.20.100] (p54969e67.dip0.t-ipconnect.de [84.150.158.103])
	(authenticated bits=0)
	by achilles.binarus.de (8.15.2/8.15.2/Debian-22+deb11u3) with ESMTPSA id 512ImmtI3491097
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <netfilter@vger.kernel.org>; Sun, 2 Feb 2025 19:48:49 +0100
Message-ID: <d8c877f0-bdcc-4fce-91c1-f92d267d66f4@binarus.de>
Date: Sun, 2 Feb 2025 19:48:47 +0100
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Content-Language: en-US, de-DE
To: netfilter@vger.kernel.org
From: Binarus <lists@binarus.de>
Subject: Documentation regarding priorities possibly wrong - clarification /
 update appreciated
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Bin-MAIL-FROM: <lists@binarus.de>
X-Bin-RCPT-TO: <netfilter@vger.kernel.org>

Dear experts,

hoping that the development team can kick in here ...

I have used the whole weekend for trying to understand why packets do not traverse the chains in my ruleset in the expected order. The documentation in the wiki [1] states:

"Within a given hook, Netfilter performs operations in order of increasing numerical priority. Each nftables base chain and flowtable is assigned a priority that defines its ordering among other base chains and flowtables and Netfilter internal operations at the same hook."

IMHO, this statement is not ambiguous and cannot be misunderstood. Packets traverse chains that are registered at the same hook in the order that is determined by the priority of these chains, no matter what. Period.

However, when setting nftrace to 1 in my ruleset and monitoring the packet flow, I noticed that the chains were not traversed in the order stated above. Since I am a netfilter newbie, I searched for my mistake for a long time, but to no avail. It is very well possible that there are mistakes on my side, though.

On the other hand, during my research, I have found a post [2] that was an eye opener. The first and only reply to the question (at the time of writing) explains in great detail and in an understandable manner that the priority of a nat type chain is simply ignored* and that every nat type chain instead is always executed at priority -100. [* The relative order of nat type chains that are at the same hook is preserved, though, according to the post. ]

The post further contains an example ruleset and shows traces that prove the statements made. In summary, it seems convincing to me.

Now, the problem is that either the netfilter documentation is wrong or that that post is wrong. In both of them, there is no room for interpretation. Rather, the netfilter documentation states the exact opposite of what that post states, regarding one of the most crucial points in understanding nftables / netfilter and monitoring its operation.

Could somebody please clarify which of them is correct?

If it's the netfilter documentation that is wrong:

- We would be very grateful if somebody could fix it soon. This would save a lot of time for everybody who is in the process of learning netfilter and nftables.

- Furthermore, could somebody please let us know if nat type chains are the only exception from the "chains are evaluated in priority order" rule, or if there are more chain types that are an exception?

Best regards, and thank you very much in advance,

Binarus

[1] https://wiki.nftables.org/wiki-nftables/index.php/Netfilter_hooks#Priority_within_hook

[2] https://unix.stackexchange.com/questions/762402/nftables-are-chains-of-multiple-types-all-evaluated-for-a-given-hook

