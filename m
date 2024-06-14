Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F13A12FF87
	for <netfilter@vger.kernel.org>; Fri, 14 Jun 2024 19:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718392528; cv=none; b=fhJG9y8zGYHd/J8HNB8LfAjOCLQDjzlw9DVdFru6ga9pLkoO4T0YTGIcnsrsNu6KSeeRJ7VQysOSFqzV7EWfmDPYkqgF4GYnA1DryecbiLjRfumaRDJHAlIQFSbHf3GD6Rsxs58ICeOx1XT25jOfDXeJhk+uCjyy4L0HVxfs2BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718392528; c=relaxed/simple;
	bh=ZX+PRz2w/CfL8uXrvXy56lsf1AbWVlsYBQO0kE2NapA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=mpWwc+8xf4rswtkYjC54zXzzOLxC2agzxpXnQkbFrRB4lcjsEmb67Ey0N7+2MOnU94I9WconK8HqH0SsH8rvjbTGMsc8xF11OFAdQdaMjYr7YO1Deic25aB5i6GxvJUJ3OsFuKKXlTCwzF7buXVULYnsU1b60oP3/LutKwcLj1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=mVjkQ/oT; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="mVjkQ/oT"
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4W18B06B15z9x1V
	for <netfilter@vger.kernel.org>; Fri, 14 Jun 2024 19:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1718392520; bh=ZX+PRz2w/CfL8uXrvXy56lsf1AbWVlsYBQO0kE2NapA=;
	h=Date:From:To:Subject:Reply-To:From;
	b=mVjkQ/oTcNhH3eNYYhCmGYHHxKm+jJcwdcd+yMMCIPBZNOdpYFBwl9HY6Q1CAIYfl
	 oUawyxClS4UJOYgTwZZFvxNtBDvM/BV+fdscHHq35FK7th+lIsVoNLrRhiTUzH6XkF
	 fUI79CBUFjUtRSt/MLS+huXYFIZTEX8dHoFC6KtE=
X-Riseup-User-ID: 38EB1545AF15F57D39EF5788165F1C3AC81B46FC591E0CFE17E3EF9B475639A9
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4W18B01D1TzFw0G
	for <netfilter@vger.kernel.org>; Fri, 14 Jun 2024 19:15:19 +0000 (UTC)
Date: Fri, 14 Jun 2024 19:15:11 -0000
From: "William N." <netfilter@riseup.net>
To: netfilter@vger.kernel.org
Subject: How to have a counter for vmap verdicts?
Message-ID: <20240614191511.3e9cd1a6@localhost>
Reply-To: netfilter@vger.kernel.org
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I have this anonymous vmap:

ct state vmap {                                                 
	invalid: drop,                                          
	established : continue,                                 
	related : continue                                      
}

Is there a way to have:

- a counter for each individual verdict
- a counter only for the drop

but without jumps to other chains, shown in the wiki?
