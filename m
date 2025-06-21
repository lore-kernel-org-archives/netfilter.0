Received: from smtp-out.kfki.hu (smtp-out.kfki.hu [148.6.0.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CD24207A
	for <netfilter@vger.kernel.org>; Sat, 21 Jun 2025 16:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.6.0.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750521945; cv=none; b=AM688lsx21mjgxSYhlU2ZHO/F0HPF23wmXj4ketl/oeXD8de2/aSYzR1PtL8yqceNxIz3BPDYjmZSdPhWG1kpuskaqRNijjdUhZg+wkgvnBPc7IILm3kioYLy0hE9EmM6JklzK+AGXIrViMDIaMNwq1DgbaPKFJigTR29E7hHfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750521945; c=relaxed/simple;
	bh=JG59w8/zTKPC0DPSCUuireoOBsZhP2sqer4cl78Lmy0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aiNEqkV/Jfg2Vwqwb2419Na4nMUlPROW/SoyDWJLfRGIhgZLg1ucc8gQ5H/1C2CDW2023TVPhLkbnYAH3e1xdei/hy9eth7DDVIcejRG33cotXyg7ZHCwsljcn4becQ6cactXJTQvRiKTu/1m2y0UGL+h7uKFVGNjwP1AH43QbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=netfilter.org; arc=none smtp.client-ip=148.6.0.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.kfki.hu (Postfix) with ESMTP id 4bPfMK4kpRz7s855;
	Sat, 21 Jun 2025 18:05:33 +0200 (CEST)
X-Virus-Scanned: Debian amavis at smtp2.kfki.hu
Received: from smtp2.kfki.hu ([127.0.0.1])
 by localhost (smtp2.kfki.hu [127.0.0.1]) (amavis, port 10026) with ESMTP
 id SQbODK7DhgND; Sat, 21 Jun 2025 18:05:31 +0200 (CEST)
Received: from mentat.rmki.kfki.hu (unknown [148.6.192.8])
	(Authenticated sender: kadlecsik.jozsef@wigner.hu)
	by smtp2.kfki.hu (Postfix) with ESMTPSA id 4bPfMH5NTQz7s854;
	Sat, 21 Jun 2025 18:05:31 +0200 (CEST)
Received: by mentat.rmki.kfki.hu (Postfix, from userid 1000)
	id 974D2140EA3; Sat, 21 Jun 2025 18:05:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mentat.rmki.kfki.hu (Postfix) with ESMTP id 93222140549;
	Sat, 21 Jun 2025 18:05:31 +0200 (CEST)
Date: Sat, 21 Jun 2025 18:05:31 +0200 (CEST)
From: Jozsef Kadlecsik <kadlec@netfilter.org>
To: Michael Tokarev <mjt@tls.msk.ru>
cc: netfilter@vger.kernel.org
Subject: Re: order of netfilter hooks and check for martian source
In-Reply-To: <9fc435dd-547f-4e50-8c2c-862a1ff62a2c@tls.msk.ru>
Message-ID: <c1ecb68e-d4ce-9773-8649-ebac5171da06@netfilter.org>
References: <075d8041-5e10-43ae-bae9-12a3f25c70d5@tls.msk.ru> <ec2a6853-a864-4708-a565-267e61c5162a@tls.msk.ru> <b69fa9d9-6e56-0e08-adec-ba768a108938@netfilter.org> <9fc435dd-547f-4e50-8c2c-862a1ff62a2c@tls.msk.ru>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 21 Jun 2025, Michael Tokarev wrote:

> On 21.06.2025 17:42, Jozsef Kadlecsik wrote:
> ..
> > However, routing decisions can be affected by marking packets. So I'd mark
> > packets before routing and use routing tables according to the mark value.
> 
> The prob with replies to DNAted packets is that these packets traverse
> routing rules first, BEFORE they're seen by netfilter code.  Who can
> mark them for routing if routing is done before it's in netfilter?

No, not at all. You can mark the incoming first packet, store the packet's 
mark value in conntrack and restore from conntrack for the reply packets 
in mangle/prerouting. Which is exactly that, before routing.

Best regards,
Jozsef
-- 
E-mail : kadlec@netfilter.org, kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
Address: Wigner Research Centre for Physics
         H-1525 Budapest 114, POB. 49, Hungary
