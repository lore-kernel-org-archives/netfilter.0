Received: from a3i686.smtp2go.com (a3i686.smtp2go.com [203.31.38.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9376A2116F5
	for <netfilter@vger.kernel.org>; Fri, 21 Feb 2025 15:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.31.38.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153365; cv=none; b=MZOmCgQHDhhIBq7tyMPk/vyqFqJN7MRj0LXhuP/B4ISNSG8rmlEzh+wrRnkxYIMXqVih+zNR17VckmzkTmepqMlrWFlgxh6DWkJwwAT18/hA70VVl4ZZBWmzG3LVfAtkf/BRZ54LoC6/l6EA45dwvOUVPrugJ4GlqJek4NE+fno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153365; c=relaxed/simple;
	bh=iS0ZdQSaoZjKa9Ce4jzj7mPf1SSCsha1y81XTZqJb5c=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HjiHrGkPxmR/SV3c78V5hKcT1/YaIbNtqJzmL3MUGmCdTFEPrfFmvGlX2KVIFFXy68ZnN6lx5ODmXNb5TVmNHCjDlujh7XuszrDU+YUx6Xd4kENAsE4vZnsxOTA+OMkSUzxt19i0mWoTl56Xibun7EQnb1A1hXRnRtvNPYj8HzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=return.smtpcorp.com; dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b=i6ljwrZh; arc=none smtp.client-ip=203.31.38.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=return.smtpcorp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpcorp.com header.i=@smtpcorp.com header.b="i6ljwrZh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpcorp.com;
 i=@smtpcorp.com; q=dns/txt; s=a1-4; t=1740152455; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=71w/nqPVOrDSMYHfmCQ5aPF8J1lblbHKY0M3Ij8157s=;
 b=i6ljwrZhBo4Z9163DaxMsSXeL+z6N2Vlv+ig8/TAjkAVbe2Hbi8zYNiw9gcE3KOhPuulQ
 wFEFBTUYIquUe5n2Pv33/H12JF1b12YOZrdFY2Si9+YsC5UqSGGlRFTI+gSIuZvUwlqWO30
 hpEjvHdRfBNHRrZcAcbRjggOYJvUzovaKA75aS+CFpmyukDFCljXu9/UhEi3wviNn3F2WQo
 MU1mphDngRNvzvUm0cPDXxlAtIQ1uy9gflN2RWAkL3M8eTUo6fAQgBERn/6fHTI4tNwGyMW
 QhS0c3CfN4UUekjNMn/96viDpo7V66UKKblfnVDqFg13idO5VveDlFFlvUsA==
Received: from [10.188.239.178] (helo=stodi.digitalkingdom.org)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97.1-S2G)
	(envelope-from <robinleepowell@gmail.com>)
	id 1tlV92-4o5NDgriJmh-tBOf
	for netfilter@vger.kernel.org;
	Fri, 21 Feb 2025 15:40:53 +0000
Received: from rlpowell by stodi.digitalkingdom.org with local (Exim 4.98)
	(envelope-from <robinleepowell@gmail.com>)
	id 1tlV91-00000003NYw-2qtS
	for netfilter@vger.kernel.org;
	Fri, 21 Feb 2025 07:40:51 -0800
Date: Fri, 21 Feb 2025 07:40:51 -0800
From: robinleepowell@gmail.com
To: netfilter@vger.kernel.org
Subject: What is *supposed* to happen with automated nftables accept rules?
Message-ID: <Z7ieg3BGT2gxXqP3@stodi.digitalkingdom.org>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 555302m:555302aHyVB35:555302sel_H8RWRL
X-smtpcorp-track: ZDphU5IBmres.6O9wDkOxNcHp.nGTxiAbU8CK

So I'm working with a libvirt issue that partly turned out, after
many hours, to be "libvirt is adding rules to make its VMs work but
it can't override my default reject in my main nftables rule set so
nothing works for the VMs".

There are many many posts with libvirt specifically about problems
like this with nftables.  I assume similar things happen with docker
and anything else that needs to be like "yeah I know you want to
reject traffic but this system I'm managing needs to work".

The "problem" is that I have "reject with icmpx type
port-unreachable" in my INPUT chain.  Which, by the way, I got
straight from /etc/nftables/main.nft in the nftables RPM on Fedora
41 (which is what I am running).  30 years of sysadminning leads me
to believe that default-deny anything that isn't explicitely
accepted is the correct move.  :)

So my question is, what *should* happen here?  As far as I can tell,
there is absolutely nothing the libvirt tooling can do to override
my reject.  I can't jump between tables so I can't do like "jump
libvert_inp" in my chain.  What's the right move?  Options I've
thought of; I'm hoping there's something better:

- I try to add a very generic blanket accept for "traffic that's
  probably libvirt related"; I dunno can I add a rule for virbr0 if
  libvirt hasn't set it up yet?, that seems unlikely to work, and I
  can't see what else I could do for such a rule

- libvirt and I both move to firewalld which I gather doesn't have
  this problem?

- It's just expected that I have to copy the libvirt rules in
  details into my chain so the accepts happen in the right place

Surely this comes up regularly and there must be a standard
response?, but I definitely couldn't find anything on the nftables
wiki.
