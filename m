Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD41319AD56
	for <netfilter@vger.kernel.org>; Wed,  4 Sep 2024 09:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725440555; cv=none; b=qBUUEjZKyzlM5FuCxD0VfgoWLA5OPADxxIJ345+DD8BH8kvCtvbYUeraZnkdM8ubCH2Jw+bIg7eBLdAglZVot8+0CPFspmSXw9VREDVOT+C6TTHSOscl0eKUdgMm/fb9/4pKr+qaLRdoI5wGUP6dz5Xa3OeHXimBmtk9FE6Cvk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725440555; c=relaxed/simple;
	bh=r2Je/kEzD/HjpYmVaxnm9E96e25VguU4hQD5O1WGz2U=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=PntjDzrDV7ss1ykafNQL2MYSkbJHpIduWepZKm570rpObrVmI/K0Da83tXpyeH94/ByvXuNDUxUwpicsyWqZDop/FvbE1a+sZ9VImKsqndLRRsySTbrCA4xVAvRMMdznd1FMrHcqTosSmg3lL8KeGCm2V41TEFbx2yW00XuMEIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com; spf=pass smtp.mailfrom=gmx.com; dkim=pass (2048-bit key) header.d=gmx.com header.i=aros@gmx.com header.b=hryVs+66; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.com header.i=aros@gmx.com header.b="hryVs+66"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
	s=s31663417; t=1725440551; x=1726045351; i=aros@gmx.com;
	bh=r2Je/kEzD/HjpYmVaxnm9E96e25VguU4hQD5O1WGz2U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=hryVs+66ztKH7AO8Ht6xA9YgjzS/cpAHtmz0/kvsyxddBKTUCBQ46IZh5N5S05EU
	 dCPJras78A24AGcUiTqa8SjaIAJEyjPInTXgpVAfQP946I1O9Kq6w1AudZesho7gt
	 fv/Sq78F6i7Mq9Z0hcB9rrHXdmtAWIcRReh3nph5zap4kOH46qZQiUlelu+BA/F+D
	 CHQXIqmRumSM7qGaFZPZZVvpBjTmzlIJI6JmpIJGabM7dAGw5D4TRnZ+XnrxEdMTA
	 RwwwuDfZ7N1rcVmjSmexw5/puCL2TDSqIZiFIcB8z4PDUyBZzRshnpH7QmNBgu+i0
	 Q5gYrHk4J6OfZNR5cw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.2.19.9] ([98.159.234.3]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1N95eJ-1s1Ubh37Wp-00y2wB for
 <netfilter@vger.kernel.org>; Wed, 04 Sep 2024 11:02:30 +0200
Message-ID: <ce0df381-389f-44ce-93ab-c1f8db5faea6@gmx.com>
Date: Wed, 4 Sep 2024 09:02:29 +0000
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: netfilter@vger.kernel.org
From: "Artem S. Tashkinov" <aros@gmx.com>
Subject: nftables are non-deterministic
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:II4aJ0Viyb3Q/qXwiyiQobKQ5EoBCVn/8tR55qpSp+c9QxKNNWg
 P/t6acc/Cra9PhWY8BnETIC3xpk9z61nN8uiKjwJamgMSe74dlUnfvbJB9kdH/JHHga2uBC
 g/13keF3Q4grILz2uM7XRqyAr2WaN4bBj6OcfOxVbz5jVm3VXegdEE6EpT4q7feSgLf3Qbj
 HFtCqIGxI4pE3O/33OfuA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gclVvu8kvyI=;9jirvLg/NNpi1dOsq8/5NX3uFW2
 AIj+e3CeVEPUBNNrdvEMYh9Bp3s5/PIcZO4uXseKfLWcbz61/5i3YpycZwTj8ap6tS8gcosLM
 xbfxfneNs47d+OWuDj0nm/8BqMeHs3LlWVudEXL3dXWluyklQRmZA4GmskE73PSIudwa2w60v
 fdaOewpzRyoUgcvxwJWrMY4CTUY5bb4P4p1dmoTPny5AdNDgao1jRrDqKi9wJllaU8j+t8/gS
 a4JuNIwJ0z7e7k8X/uRA5pPkZzFMa3EnEU71tXWDUGkMunvNbqMLG92KLnH9/Bsd6IPQk9FFg
 dP9gZz+psUtEHxP70BIv4OdQ3620rvEd8IcysNZ4CCi66HKWTe6YgcffuL46zULyWAozfryEs
 mZmrVfxKh7a3qb4/DbOM9mmw9o6dE/rQmet0qIAq71C5dAUNl52+ini40SeQfTIE16c6vgKBb
 Lnqg6BLK4UgbCyyIc5QyMbJvqVlg24nzTt7o9bN5lA7flk/JBmW/AVxoji/WmKgcSbcBxblBh
 TtzyaDjY4yDEEJxAGJjL/l4W2JiwKEz6bJzRLSfl8ZZPQNiUSs169+OdWA7PR8EVPbUmhl7Oi
 UOhUsaXvUwEBvYbeA4Qe4D+9+Bejq6CRU80ATYSUhxWJ8+dS5E0+rhEpEyG1DcEaF1zyZtY+h
 MCouFfV5R4SBCUtVVGz+dQIKYb8BAIxDXvhn/Ra2+FWQO89vPWY+lQBAQlp0FhvwrqS4Zb5Si
 b9VH7DJkIspxPyJlnZkbHfEIGr0sttBU0U6Qv+grg+YyMZkfV+/CSFFEcffRFDjGhtay+IQQj
 bEUOObaPIWtfiiz68yr3qzjw==

Hello,

Connections to a certain port are _randomly_ delayed by up to three second=
s.

This is not down to the service, it works perfectly.

This has been happening for the past couple of years. This has never
happened with iptables.

I wouldn't want to share my nftables config, so if someone's willing to
take a look, please give me your email so that I could send you the
config privately, off-mailing-list.

Best regards,
Artem
