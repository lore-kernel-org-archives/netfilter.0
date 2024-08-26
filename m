Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE69194AEB
	for <netfilter@vger.kernel.org>; Mon, 26 Aug 2024 18:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724697909; cv=none; b=u3bJJS3v9bd5snTNsfSKK+o/sBRb78ogJ4g6dfegp2OekVGlMXSJEU/6bBwHRvlj+aRjDPm3FEFMWHyFkV0Jcs/iOe1tjbJCpxzPmk8Buy0CTc5eEVZiG+sLtLGDrtC/AcntdRS5jjL+95WUNPRpsWygNSbiP3wvOFjI+uSxT8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724697909; c=relaxed/simple;
	bh=3UK7l9L+t1+uBDRnZX6lw9KDwY+Joppq1SUSZrFUMkY=;
	h=Date:From:To:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Id2wLyyR9seIwgIaBoAILs/X4Q2kKkyGJBTGzacwy1YepjfCVJ1b2r2RQXX7sJ52BffY0h95lAVTtSjtdqPHIO8fVlS3JnDWhGIJrpk21HhpWCCDnGvLId2RqB+GG4e+fySviSaaIEhffr8QjTKe/jok1HFhqSel6eJ9MUQlOqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=qduvkGbN; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=JfZJF36g; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="qduvkGbN";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="JfZJF36g"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:
	Content-Type:Message-Id:In-Reply-To:References;
	bh=bxauyQfLSioOVfNwlypkzECiwEodnd1sM3QBgi29wfM=; t=1724697906; x=1725907506; 
	b=qduvkGbNQzyBuddkB1oGe0LQl7AIZtiIOOA8H5O9JEjfGX87UjgQxQAWXD3eUkmSkrt+GeJnREK
	oXJ4UqYEvhCFfRPzzrEJ04x44lTlGe+DKDG9sH1Kinhq1LveO2WWrRvLWZ1zv97mdKKVfQaiiCIqZ
	/QSilgDNkF8kAgWMO3I=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:From:Reply-To:Sender:Subject:To:Cc:Date:
	MIME-Version:Content-Type:Message-Id:In-Reply-To:References;
	bh=bxauyQfLSioOVfNwlypkzECiwEodnd1sM3QBgi29wfM=; t=1724697906; x=1725907506; 
	b=JfZJF36g4bogRqKpbmMq3TbUl/aOIW+5SaHoU159EMMwKd8hmGdUOVAF4wFJTfyfxSdKyDBMT3W
	d5wsyAMIRAw==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3)(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1siei8-003ZDj-1N
	for netfilter@vger.kernel.org;
	Mon, 26 Aug 2024 20:45:04 +0200
Date: Mon, 26 Aug 2024 18:45:00 +0000
From: Slavko <linux@slavino.sk>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Subject: RE: Understanding output from "nft list"
In-Reply-To: <DM8PR06MB771745C3C21BA67F1D90C848F98B2@DM8PR06MB7717.namprd06.prod.outlook.com>
References: <20240823185036.85bd988a1ee2baab2f73b307@fourthriver.com> <a4f113dd-9749-4fd8-bb9e-21eff30370dc@app.fastmail.com> <20240824003902.7c838f9e49773fa44b7d037d@fourthriver.com> <DM8PR06MB7717FA374DEC43522FF205EBF98B2@DM8PR06MB7717.namprd06.prod.outlook.com> <5F6FBD88-BFCF-41EF-8B7A-5047ABC992CA@slavino.sk> <DM8PR06MB771745C3C21BA67F1D90C848F98B2@DM8PR06MB7717.namprd06.prod.outlook.com>
Message-ID: <F385FADA-1F1C-4F41-AEEE-C6BF2312D29A@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

D=C5=88a 26=2E augusta 2024 18:12:58 UTC pou=C5=BE=C3=ADvate=C4=BE "Atkins,=
 Brian" <Brian=2EAtkins@netapp=2Ecom> nap=C3=ADsal:
>In the nft(8) man page, I see the following=2E  I have not tested this be=
havior myself=2E
>accept
>        Terminate ruleset evaluation and accept the packet=2E The packet =
can still be dropped later by another hook, for instance accept in the forw=
ard hook still allows to drop the packet later in the postrouting hook, or =
another forward base chain that has a higher priority number and is evaluat=
ed afterwards in the processing pipeline=2E
>
>I was keying off "another hook"=2E  I think another base chain with the s=
ame hook type but a different priority is considered a different hook=2E  I=
t's hard to describe 'the set of chains reachable from the current base cha=
in' with a single word=2E  They are all executing within the context of the=
 current hook+priority, which is what is terminated on accept=2E

Perhaps it is only terminology problem, or my English is not enough
to see difference, but it seems that we both talk about the same=2E=2E=2E

When i start to use nftables (switch from iptables) i read that and
"another hook, for instance accept in the forward hook" i understand
exactly as example points, eg=2E accept in output hook mens go to
postrouting hook=2E And it works exactly as this, if (and only if) one hav=
e
only one chain per hook=2E

Then i start to experiment with multiple chains in the same hook
(really it was mix of ip/ip6 and inet tables) and i was surprised,
that accept eg=2E in "ip input" chain can be not enough as packet can
be dropped in "inet input" chain (both in input hook)=2E The same
applies to multiple chains of one table in the same hook=2E

Then i read somewhere (perhaps in this ML, i forgot), that accept
ends only current chain (with hook definition), which was more
undestandable for me=2E

Perhaps one have to distinguish "hook" and "hook type" (or so),
and perhaps my "chain" suggestion is wrong, as here are "user
chains" (without hook definition)=2E=2E=2E

regards


--=20
Slavko
https://www=2Eslavino=2Esk/
