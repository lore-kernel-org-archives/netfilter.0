Received: from npcomp.net (npcomp.net [69.61.8.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEE21FE479
	for <netfilter@vger.kernel.org>; Wed, 11 Dec 2024 17:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=69.61.8.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733937967; cv=none; b=gPR3oPi5dCAcjAvgJal/pKriBR3cNc/Ycla2demAUvhQIUgb1UCTx1MoKansKzpACJj6sNrnYpGfSk9vOlNcl9C8nWsqNtMxAl0790OjRA6VbO9nBBJJYqMFWv9b5MOc/kzY9LywvQ9L8rw8wF8N4gcxjDG388rOhw7YVQv+9Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733937967; c=relaxed/simple;
	bh=3jXWHxZ24XuoVgoQM0HiLIQJtC1X6w9oVNrIRvTndi8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GWPG5XmVldjViKZYCbnnha6VFnked45JTjNaCAkV3byTUx7JpKxbzE1+DHZuc/iiDfKSsPJfI9V87+o8RAYL/EmpZlU57CrxOU5g2cYyNk4SY3vAVyuKrmP5+03dye13doVcaFvZes6bwhgvx3cfq4jYxp13dmzXthgP13LYTvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eldondev.com; spf=pass smtp.mailfrom=eldondev.com; dkim=pass (1024-bit key) header.d=eldondev.com header.i=@eldondev.com header.b=HSJDzrfc; arc=none smtp.client-ip=69.61.8.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eldondev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eldondev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eldondev.com header.i=@eldondev.com header.b="HSJDzrfc"
Received: by npcomp.net (Postfix, from userid 1000)
	id 840C34670A9; Wed, 11 Dec 2024 16:47:44 +0000 (-00)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eldondev.com;
	s=eldondev; t=1733935664;
	bh=3jXWHxZ24XuoVgoQM0HiLIQJtC1X6w9oVNrIRvTndi8=;
	h=Date:From:To:Subject;
	b=HSJDzrfcdCHPKEyG0ZZa/NcSqKG2RiUQ1PPn7cYbz87ei7h5t9tdppdba911jjryc
	 6X80NSEdQIA3QkDojRefuxPtXbthqiESywP412jnIBtci2rk2vE0VyqmlT/eXUHNjx
	 1jAtC6D+RMv71lCCh1s1lAQvkgXSzCgB04L130Sk=
Date: Wed, 11 Dec 2024 16:47:44 +0000
From: eldon-nfv@eldondev.com
To: netfilter@vger.kernel.org
Subject: conntrack-tools conntrack cli json output option?
Message-ID: <Z1nCMHHK6EjEMekj@localhost>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,
I see some other netfilter tools support json as an output format,
apparently this is done elsewhere with libjansson. Would it be
obvious or a welcome patch to add support to this similar to the
xml output of conntrack -L? Is anyone using an existing tool for this?

I searched this list archives, sorry if I missed previous discussion.

Thanks,
Eldon

