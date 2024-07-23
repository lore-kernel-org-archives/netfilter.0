Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E84814A4FF
	for <netfilter@vger.kernel.org>; Tue, 23 Jul 2024 09:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721727576; cv=none; b=nXX9AnjvHV+uS2KP9RHhnl0awkG0BtsOeuXhrA3PUwV7hbpg7F6Ltm5Eue0N4CBzlrjaa4Pd0j13cjz+UXt+sIafAXKTMM4rZXbCfg1eFZTPioI3Zf8xzTt+VnkWE4/tyEmBgOHqKPyZFqF59xHA1YFdz1/WDIg0XxxwCVoD9TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721727576; c=relaxed/simple;
	bh=C155dypFqcJjuw35aONqGYTtigdCTyGadODvai6STcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=utojPYPCfP/MgFSx+/otdSd3ukZSJ1L/LorXMCRshoEHo4DRubeXdu/BrdjSzYSQe6uGTa2kQQLTrA6oqnPWQUwFvDvsYolBcyhumwbcLZWg78x4LTQvjVHDBCAposErY6f+wKEruuV7VqpzgrdV17EzBUSf4TMPHlVHQGAsf08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [46.222.212.173] (port=7574 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1sWBzT-000R0U-28; Tue, 23 Jul 2024 11:39:29 +0200
Date: Tue, 23 Jul 2024 11:39:24 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Slavko <linux@slavino.sk>
Cc: netfilter ML <netfilter@vger.kernel.org>
Subject: Re: Sets update
Message-ID: <Zp96TJrXOz3ZIPLK@calendula>
References: <A1B9EF5A-1696-4A6D-B0D1-81DD32DC41C0@slavino.sk>
 <ba07a45c-7564-4b40-92de-ea698d16f49f@app.fastmail.com>
 <20240721132337.29d2fbc9@bonifac.skk>
 <4a9d6e4b-61e8-4aa6-ac50-8cbb9357e398@app.fastmail.com>
 <20240723092439.7b9f7b58@bonifac.skk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240723092439.7b9f7b58@bonifac.skk>
X-Spam-Score: -1.9 (-)

On Tue, Jul 23, 2024 at 09:24:39AM +0200, Slavko wrote:
[...]
> (The host has >6 GB of free RAM, the list has ~1700 items)
> 
> Initially i blame IP duplicates in downloaded list of IPs, but that was
> unrelated to this error. When i remove the first "add" and "delete"
> lines from script (thus just one "add"), it works. After initial fill it
> works with all three commands (add+delete+add) on already filled set
> and even when i flush that set, it still works. Only first fill (after
> boot) ends with that error.
> 
> When i delete and create that set, i got "Out of memory" again, the set
> is defined as::
> 
>     table inet fw4 {
> 	set myset {
> 		type ipv4_addr
> 		last counter
> 		timeout 2d
> 	}
>     }
> 
> I tried to add "size" into it, but that doesn't help.
> 
> I roughly remember, that i read something about some memory limit in
> container (i am not in container), but i am not able to find that
> again to check if that is problem.
> 
> Please, what can cause that initial fill error, how i can debug/solve
> it?

Kernel is likely missing this patch:

commit fa23e0d4b756d25829e124d6b670a4c6bbd4bf7e
Author: Florian Westphal <fw@strlen.de>
Date:   Wed May 8 14:52:47 2024 +0200

    netfilter: nf_tables: allow clone callbacks to sleep

You mentioned you are on 5.15, right?
