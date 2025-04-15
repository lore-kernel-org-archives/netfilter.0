Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B447F9DA
	for <netfilter@vger.kernel.org>; Tue, 15 Apr 2025 14:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744726241; cv=none; b=G47z5OrqvSmzma+OWAl+XIBaeYv4ZordodtAy2I8bEyM6cLcfWSCmLQ8mT8YbxUbpX6CI7e7MCXLoDywaRsrAcdU0jbxYkWucI3erYU88EOtbo7UXfFJbzey189QtL99vk3XcN2ozIQyDJVIMlxqoaPATURIAhyuFoph2kiFI2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744726241; c=relaxed/simple;
	bh=bYkqmEGcBQHD1mY43pSlVAdYsvYudl7ucejvfO2nNug=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BiirchCGbwWDwdcaueMlVmKCd5C8MfgX4RcaTrR4TIcSh8Z/WZkuMSYTVXWKnf64mU1lVf1vFU2chs+WB/OoR0RAzw0uzutG9D74DV/u1iNMNo01DI7hFdQossEzBv0MGUO8Un/3p+OJxf7UuiPDptSP+kGZEDik9A+Ks2WjNgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=G3+wFLLQ; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="G3+wFLLQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1744726222; x=1744985422;
	bh=bYkqmEGcBQHD1mY43pSlVAdYsvYudl7ucejvfO2nNug=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=G3+wFLLQw4eiaL+3qK0GcjohcnZbn/rQxrLiKnHnAXJqZBv2PyDt0TPAd7VWo7E2c
	 FOAaBetCSyDo5DLcyppNytB0O0kXE03bZKxQmGCdbPS+inBPCYHMxaDlz+sRXdEfkK
	 as5fNI6Bp7luXivDj06PgecKfo5LchZzliIwxoa+PnOZ91xJhNks9goL+P2yhK/QGP
	 8Xb2jbZbf8YE8XIjQ+MMQWrswpKNhn8mJeMs9IfScQ4UmAbXiQAuuy/uHhxz8IwPx7
	 Gb6JV0iLRinqTyxAFd1clUYxkSVagrHP1vypdnL5X6U+0tZ5CtsGMDJArfjVKjIEHq
	 v81mugwGSMVZw==
Date: Tue, 15 Apr 2025 14:10:16 +0000
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: Are Palo Alto and Check Point Firewalls using netfilter iptables?
Message-ID: <SSjuqIdDpwB74EBZjS2RZDQQ3W62i-MRyON_zD4em6PIdI6OIXbddmhA-_KiQLNul8laSaYI5vX37xBEEV05sdJbIc644AgnpLiD5eEpXdo=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: 1d721558e747c8442cde53fa68da9577c2fbe9dc
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: Are Palo Alto and Check Point Firewalls using netfilter iptables?

Good day from Singapore,

As far as I know, Palo Alto VM-Series Software Firewall 10.0.4 is based on =
CentOS Linux.

And Check Point Firewall R81.20 is based on Red Hat Enterprise Linux (RHEL)=
.

Are Palo Alto and Check Point Firewalls using netfilter iptables as the und=
erlying firewalling mechanism?

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals in Singapore
GIMP =3D Government-Induced Medical Problems
15 Apr 2025 Tuesday





