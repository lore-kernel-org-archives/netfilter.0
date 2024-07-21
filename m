Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB5917FD
	for <netfilter@vger.kernel.org>; Sun, 21 Jul 2024 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721548404; cv=none; b=jtkAxvWUbozPwoosII9FV/aFXxneCrZvV9mmcH2stPUivgTWb23GK49VjjzWKGY+q8BJ9UD0FRR7YRHjzkXPnZ/NXy64qGd0h2jq2AZHO6jXJM2LcdNe4F2nE4zTqr0Dts2jdd5OrG0gAMw+9XEnPPLb8VHUxm3vAnrZcvsdOfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721548404; c=relaxed/simple;
	bh=b5MK+ahgB1QTMjltvZZUqdlAA78ERXTpDqjHttOjyK8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=UMPbf+TNeSs/mAwEdWbH5td/bZTI8gQ/x1bsOIp2zYP6DVYvSxWFq4bRm5OIb7f62dUXidIuUde9VW0NRyLBKFicj4M0xg0j+kZukb23Y+667ELHefiKiRoYmONlP4yg3akTRvMNA6gGkSoCIulDwB+Hvu+f90IfebdL569uhFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=Pu4Jqe2D; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=WeOZyK6S; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="Pu4Jqe2D";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="WeOZyK6S"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2023; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:From:
	Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:Content-Type:Message-Id;
	bh=ZN8yxNZDYl9fUQHWTQfkxWLLwDGqUHXKDEbAHj4hBx0=; t=1721548397; x=1722757997; 
	b=Pu4Jqe2DeDHNKp27F0DjMkVmE62UbasDENo6iF67tqdGkfyl3yzngj3rf29+AFw26cdHu1V1ILF
	V7gp4Lrkye6EXQkwkFx4ZIekD2HeIALWdQ0ccId8WFEHRyw2wj97woQOdh65hnLtjwx3vdvN25ymM
	wSVSj4JdqMjt0Lb7+RI=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2023; h=Content-Type:MIME-Version:Message-ID:Subject:To:From
	:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:Content-Type:
	Message-Id; bh=ZN8yxNZDYl9fUQHWTQfkxWLLwDGqUHXKDEbAHj4hBx0=; t=1721548397;
	x=1722757997; b=WeOZyK6SwYtgc5uK3St0WwBju3lrBVCsri4OQmaQoUlkfEoFaLe6ohZ6+Jeaq
	rWkmGVHlzLuFk2cwskvZTulCw==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1sVRFa-000Nfx-16
	for netfilter@vger.kernel.org;
	Sun, 21 Jul 2024 09:44:58 +0200
Date: Sun, 21 Jul 2024 07:44:51 +0000
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
Subject: Sets update
Message-ID: <A1B9EF5A-1696-4A6D-B0D1-81DD32DC41C0@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all,

i recently start to port my ipsets to nftables set=2E I was using these
ipsets (beside other) in manner, where they was some timeout set
and its content was regulary updated (from various sources, online
and local)=2E If some IP(v6) was removed, i didn't bother to remove it
from ipset, as it was removed by timeout=2E=2E=2E

Now i fight with the same approach in nftables sets (kernel 5=2E15, nft
1=2E0=2E8)=2E I learned, that to update element's timeout i need to remove
element and then (re)add it again=2E As here is not simple way to do
it from shell (simple shell command) i play with python script, which
consumes IP list on input and produces appropriate nft commands,
eg=2E:

   fetch someiplist | myscript=2Epy | nft -f -

Now i am not sure, how to produce that output=2E Have i do it per IP?
Eg=2E:

    add element =2E=2E=2E {IP1}
    delete element =2E=2E=2E {IP1}
    add element =2E=2E=2E {IP1 =2E=2E=2E}
    add element =2E=2E=2E {IP2}
    delete element =2E=2E=2E {IP2}
    add element =2E=2E=2E {IP2 =2E=2E=2E}
    etc

Or have i produce output for all IPs at once? Eg:

    add element =2E=2E=2E {IP1, IP2, =2E=2E=2E}
    delete element =2E=2E=2E {IP1, IP2, =2E=2E=2E}
    add element =2E=2E=2E {IP1 =2E=2E=2E, IP2 =2E=2E=2E, =2E=2E=2E}

Please, is here technical difference or something other to consider?
The IP lists ranges from some hundreds to some thounsand of IPs,
thus nothing really big, but not small=2E

Another question/problem is, that this approach (delete/add) does't
preserve counters=2E Please, how to preserve counters? Is only way
to fetch and parse counters before i delete element and then add
them into final add? IMO, this isn't very memory friendly (in script=2E=2E=
=2E)=2E

While these counters are not crucial for me, i use them in some
ipsets for statistics, eg=2E i fill items from various sources into one
ipset and group/count them by comment then=2E In ipset it is really
simple task for awk and it was working even on small OpenWrt
devices=2E But nftables sets doesn't produce as straighforward output=2E
Please, how i can/have to parse element' counters? I am even not
sure, if i will able to parse it by python (but i didn't try it yet), is h=
ere
some tool for that?

regards

--=20
Slavko
https://www=2Eslavino=2Esk/
