Received: from mx03.uni-tuebingen.de (mx03.uni-tuebingen.de [134.2.5.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48E725F984
	for <netfilter@vger.kernel.org>; Fri, 28 Feb 2025 14:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.2.5.213
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751923; cv=none; b=lcmTh9fE486azHV2WhMf3Lg9pwjwKlL+1knp//s142/zsqIjqdhvf43ypUCpYs9Z4xFLsxQv3ieeeOUZHpPyTV7GTHOKhAUFVPTHPunuoejB80cVS42EI+NqZAX20hbimz4q4QBGHHnx51nKXSXt+pa5l8GwDx6oleWX+5/ixTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751923; c=relaxed/simple;
	bh=ah/EaLdaGKRjgGy9i2wGUo9t1rgOvs/6XpMoDVrKiFA=;
	h=Date:Message-ID:From:To:Subject:Content-Type:MIME-Version:
	 Content-Disposition; b=GyrszSYtS9hy8gJkZ4UFu0e8WtinL/FEs/drqUcfuQQ7ejBs+6p7jLVapWiJMG/P+wQmDp/RndRvQfqj/IdjrY0lYQ9xJBzHHUtI4wv4+G46CS06Nv+lF/7OBuydZVAe6JUscKNyJELmpOpV21NpXLGAaQAYG8YeWtYVy7/FOgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zdv.uni-tuebingen.de; spf=pass smtp.mailfrom=zdv.uni-tuebingen.de; dkim=pass (2048-bit key) header.d=uni-tuebingen.de header.i=@uni-tuebingen.de header.b=Tf0v25n8; arc=none smtp.client-ip=134.2.5.213
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zdv.uni-tuebingen.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zdv.uni-tuebingen.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uni-tuebingen.de header.i=@uni-tuebingen.de header.b="Tf0v25n8"
Received: from webmail1.uni-tuebingen.de (webmail1.uni-tuebingen.de [IPv6:2001:7c0:300c:3105::8602:5c2])
	by mx03.uni-tuebingen.de (Postfix) with ESMTPS id EBF6B20AA0C7
	for <netfilter@vger.kernel.org>; Fri, 28 Feb 2025 15:11:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx03.uni-tuebingen.de EBF6B20AA0C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uni-tuebingen.de;
	s=20211202prod; t=1740751918;
	bh=wpruD+ncs74Ua/+XgSBFA9Uqo9n0CLkSFdBVkkiUgIQ=;
	h=Date:From:To:Subject:From;
	b=Tf0v25n8Iv1uIsgGNTdwlLvbnZIk2pXxhnENw+ZgUD8ni7rXUad7y+Dfuph6vBWan
	 /BQ+K3aP0WBO3DIskQ08kAqmBEaKkL4bPlO64DxN8kT4m0HgCO4FA1ySEDk5MYelHD
	 xv/sHV4IZyGCQc3sSZeP+bTIIijNNZdCOQkdtn02+AwHRull+xXXKhc0SXvn8asOQs
	 V7+egfBY/sjnMmjbRlBQ2LdwUdsAz0ao6zR2SXQpXqiR4irMp1IZWEJmZLkmFDnCTa
	 cWCDUu07UYCj1fqWxGYCmfm76BGqFl6yYvLceSvZ/w8z1+7SxAQFSSjdUuLbI5fWR2
	 m2D37RxT/eUsA==
Received: from webmail1.uni-tuebingen.de (localhost [127.0.0.1])
	by webmail1.uni-tuebingen.de (Postfix) with ESMTPSA id E408160AE195
	for <netfilter@vger.kernel.org>; Fri, 28 Feb 2025 15:11:58 +0100 (CET)
Received: from maxwell.wi113.uni-tuebingen.de
 (maxwell.wi113.uni-tuebingen.de [134.2.232.77]) by webmail.uni-tuebingen.de
 (Horde Framework) with HTTPS; Fri, 28 Feb 2025 15:11:58 +0100
Date: Fri, 28 Feb 2025 15:11:58 +0100
Message-ID: <20250228151158.Horde.S7bxprjzrKb3P7rZjqTDZz_@webmail.uni-tuebingen.de>
From: Michael Menge <michael.menge@zdv.uni-tuebingen.de>
To: netfilter@vger.kernel.org
Subject: nft reset element crashes with error BUG: unhandled op 8
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

i want to use a named set in nftables to to restrict outgoing http(s)  
connections only to
update servers. As the update servers are behind CDNs with multiple  
changing IPs i need
to automatically update the named set.

I discovered that "reset element" was added to the nft command which  
should enable me to reset
the timeout without removing the IPs already in the set, and to keep a  
clean list of IPs.

Fetch list of IPs, Call
"nft add element inet filter updatesv4 {a.b.c.d timeout 1h}" and
"nft reset element inet filter updatesv4 {a.b.c.d}" for each IP

(I know that i can use multiple IPs, in the add and reset element command)

In my test I triggered the following error:
===
[root@mail ~]# nft add element inet filter updatesv4 {1.2.3.4 timeout 1h}
[root@mail ~]# nft list set inet filter updatesv4
table inet filter {
	set updatesv4 {
		type ipv4_addr
		flags interval,timeout
		elements = { 1.2.3.4 timeout 1h expires 59m53s324ms }
	}
}
[root@mail ~]# nft reset element inet filter updatesv4 {1.2.3.4}
BUG: unhandled op 8
nft: evaluate.c:1734: interval_set_eval: Assertion `0' failed.
Aborted (core dumped)
[root@mail ~]#
===
I am using:
- AlmaLinux release 9.5 (Teal Serval)
- Kernel 5.14.0-503.23.2.el9_5.x86_64
- nftables-1.0.9-3.el9.x86_64

I could not find any related bugs in bugzilla.
Is this a know bug? already fixed in newer version?
Should this have worked?
How can i help to debug/fix this?

Kind Regards

    Michael Menge

--
--------------------------------------------------------------------------------
Michael Menge                          Tel.: (49) 7071 / 29-70316
Universität Tübingen                   Fax.: (49) 7071 / 29-5912
Zentrum für Datenverarbeitung          mail:  
michael.menge@zdv.uni-tuebingen.de
Wächterstraße 76
72074 Tübingen

