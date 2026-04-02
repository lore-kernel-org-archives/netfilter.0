Received: from aib29agb126.bom1.oracleemaildelivery.com (aib29agb126.bom1.oracleemaildelivery.com [192.29.172.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9588E37FF65
	for <netfilter@vger.kernel.org>; Thu,  2 Apr 2026 22:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.29.172.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775170412; cv=none; b=r+EloLRMkMv689OWjI1YmBKox3c4O7wweHpAhbzmG5FiI7QYthZh3nRb1+qkO9rbdyz0pDsrkxSkCWmquoC4zsHeDHZ1VyH9EifiP6N5LWDX7qd/kURifp8vSJY0nYT5r8243lJomTWycKg8la6cS8W4zeRkzgEz6hs+4UaTeAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775170412; c=relaxed/simple;
	bh=DOGNxOuGnChhZQLwlrQLOpL2pK7O5LofYIVDLE+YYWc=;
	h=From:To:Subject:Date:Message-id:MIME-version:Content-type; b=BVBA4nhaj/6Fgs2Iie/gfnpMEpCcC2QMGsKxHO9O0QVFCoK76LQEDur5FOpJm8Dhu8CZgMzAqn0yYX4SBx0xQM6dgRCeI/Wtd/WlPAuUSSaTrs9m3pUYEK++YGXZSUGSQgr6Z8TxJikvO/EZFyQvwZuVM8VLjp7YfEzMY+TwAW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linknsell.com; spf=pass smtp.mailfrom=bom1.rp.oracleemaildelivery.com; dkim=pass (2048-bit key) header.d=linknsell.com header.i=@linknsell.com header.b=DdK98yjO; dkim=pass (2048-bit key) header.d=bom1.rp.oracleemaildelivery.com header.i=@bom1.rp.oracleemaildelivery.com header.b=pKS3YJDs; arc=none smtp.client-ip=192.29.172.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=linknsell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bom1.rp.oracleemaildelivery.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linknsell.com header.i=@linknsell.com header.b="DdK98yjO";
	dkim=pass (2048-bit key) header.d=bom1.rp.oracleemaildelivery.com header.i=@bom1.rp.oracleemaildelivery.com header.b="pKS3YJDs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=smtp.linknsell.com.20250508;
 d=linknsell.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=DOGNxOuGnChhZQLwlrQLOpL2pK7O5LofYIVDLE+YYWc=;
 b=DdK98yjO57WWQwaHnZupyX72AMIs46k2chje3OMqp4fJBded9o6tnHozHk+ZPOMpPLZgY0m4EHZv
   054yhADqW9e4fnd9HzOZJj+lhMlGOchHepjf4dVCXvHyVZ8xro5dg1gt4CgCqWA6Z5xkg5cD5l1f
   yUxxGrp7LYdE9zV7oZoem+thofbKpBxnO56q/7LhODWt+AFH5iskUYw27HxjuJhmeIwGpkhzKMhE
   HSwv6To68DEyi9Vt8rmS5T2iwG7fB9X9t4QzYIOmio8sVcb8ok7XTQTVAHOHrdyuXUnfF5Cnb0re
   c1hfFRMxb7oXTIs3p35RZSLWVxZ4M0HP+dqmFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-bom-20200207;
 d=bom1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=DOGNxOuGnChhZQLwlrQLOpL2pK7O5LofYIVDLE+YYWc=;
 b=pKS3YJDsFR3OU6/C1uL+/VpSwBCtwu+++S6Y3Y/jNvwDOYUP6cbTQWaiNmhKo2qUXBuvIaYEhMY8
   HBX8cGXdgMOqLMpqpsdSriSxo52rZA8IwTBCwUZP383hK/LrZprKpt0YXZisEdIoFZPOxXhDsqpm
   NfpHEv8uHArDG2ZdKdO0xG58+yXaDa4Lo1fp3sAnG4nnzHCs3QKxv6nQrFq8QzM4UfVIJ+yWVlJi
   fDs9kHvsecz974OsqyFvAqKbM/mB0edHIvFtUvZAdFxBAOldY99A5JO3Eh894Qg1CBloj180e4gk
   kHRb0JVEtfwUB+djMM81VgdVVG+ksduRwV//Lg==
Received: by omta-ad1-fd3-401-ap-mumbai-1.omtaad1.vcndpbom.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260212 64bit (built Feb 12
 2026))
 with ESMTPS id <0TCW00D7U294B940@omta-ad1-fd3-401-ap-mumbai-1.omtaad1.vcndpbom.oraclevcn.com> for
 netfilter@vger.kernel.org; Thu, 02 Apr 2026 22:53:28 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Reply-to: jisunlee@gmilweb.com
From: Jisun Lee <NoReply@linknsell.com>
To: netfilter@vger.kernel.org
Subject: I need your help
Date: 2 Apr 2026 23:53:27 +0100
Message-id: <20260402224340.62A951D9C183E80C@linknsell.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-version: 1.0
Content-type: text/plain;	charset="utf-8"
Content-transfer-encoding: quoted-printable
Reporting-Meta:
 AAEiHiatFjPQtxzvOwdRtCAxqgKoewxHgL8R49XOkmgpfkjB5rRxKLNicSCnUgbF
 fUj9TRxpThO8d3eWrr2n5d4nH6ZAy1tEeTYyYhyDZV9EVFe3q+p4e+4PMB743Ox4
 7I3wR1hRexLooxKAZI/8JSllxVI49qKi9t9/bTdELJOk3dwcA5qxDzyBqnNg7PBx
 3OT1fZCU/KLsPoRVOtHhf7+/NTEKUOHUvN1I0mmq++Urm58+PfXb9N9ghgMSheW/
 +T7MKrKAS36NyTswMtEridsWbQfKPxI5nW4T0AMejcSD/hlCnGQV7oAqZemjfPNe
 wVtdD+e5oSjoJeQU3jetGraSEgkvfw19IFpPTkltZwtKFdSKHE6aqYAQzJSd1GLA
 X/fIE9niDtXy2oS8XslacnAI7krwESNTttX/t8d3FS9glTOi2GYsvvVDiLn8uZ4B
 1vm5VjqLyFMAoEK7yc/wd38O4+6Y1eWvs970C1bjEAv3m2MY+Iwq7v0o

Dear Beloved

My ex Husband Song Lee refuse to pay our divorce settlement
funds. =E2=80=8BI need your help to recover Assets from the bank for=20
healthcare and child support
=E2=80=8Bpurposes, diagnosed with (bladder cancer).

=E2=80=8BI need your advise and support

=E2=80=8BThank You
Jisun Lee
