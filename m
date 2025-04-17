Received: from mail-106101.protonmail.ch (mail-106101.protonmail.ch [79.135.106.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01D82153DA
	for <netfilter@vger.kernel.org>; Thu, 17 Apr 2025 22:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744929229; cv=none; b=cjx4z2ArDbWUpf+nIEoACDuoT9wBuKmqtpmAkN3NoxJt0Ydc6gcHf1OCSUMhN7wtxeKas3RQslYE39jNo9qtghGKn0Rnz/WXu89p6hM2ZnP/W/OF/LgNSMxNjR71L7dgFbTNiJ9aOBpZIWpXex1581SPMe2Z3N1SEHyEwyUc5Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744929229; c=relaxed/simple;
	bh=rSsEtUnTIkLzjasZMiVExqOjjHaLG8Hr2mRB+PspGAo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QHyNqZ0Oi1dMWuQ5wZnkWSaTxVrybUdHDIuY67KEwgutDiWHycr9UuZOOTxEB46vxiFwl6ucI1kEQinTEaD3a9/6+WKNs9KENkcnp0ZHWXUXR9gKGTWotpdt6750LT+ghcULpFTyH3X2WRbIwyT0OkSSllXgXa2qme6656FDgAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=hg4ydHMV; arc=none smtp.client-ip=79.135.106.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="hg4ydHMV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1744929224; x=1745188424;
	bh=rSsEtUnTIkLzjasZMiVExqOjjHaLG8Hr2mRB+PspGAo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=hg4ydHMVsNXCjiqEf+siuoAyqgF8GpybntyodSG4NKylVLrQ3qVI1rygHt+mIU/fZ
	 UP7g1JUwvz+Mcaya3YNIs8+K9fc85TbfAitN6qX8xmLkspnpm9P7Wr9TXaKmdzSHqd
	 PmqBnfKbjeUqnymSXvRh18G3gkLJdksD9DVWMfiQBId/jfYB8XmOow4V4fyxwNMVXj
	 YqgixUOQodRMfvPMjZv/5b2bYll3YzmUul84wbFBXsqpvQhQZ9/IJTE5cJawhhcVPy
	 bUsZtaDuxLx8WwRzNj6U0VHyV9eg6VDIZIwo9W3Bp7c9GlpRmqWxQd59f+f2JsJpAa
	 o9XdmsvKwj6EA==
Date: Thu, 17 Apr 2025 22:33:40 +0000
To: Kevin Vigouroux <ke.vigouroux@laposte.net>
From: Sunny73Cr <Sunny73Cr@protonmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: Can the PCP field be set in the netdev table?
Message-ID: <Gu3V89R_iHD59fwn-XkS_Bg5f2Mw9rLEfE4s1ByGZZy6gVONt1WwiNAyvg2Qui3NtRDfnJRwkFDddYnMiah_FL3EMCzJvzyT85U3hX1_IkM=@protonmail.com>
In-Reply-To: <QeFwNvN8Q3lUul6dSJmJlq8MTp9ifHpuXYYhyra79MKEQf5bxqf8kdBtyvzUFMsJfXBoG3fDo_5Cn0m1DOdhPzyS3x4K46tSPAhcsZuwxVQ=@protonmail.com>
References: <877c3kvzyk.fsf@laposte.net> <ULYEvwyZR2o5mOmJi1GCdWxJu-bftNMqoV8y_KVt3i9eXaWu7uTOBZk9D2-cXABoNO_SUbnRRKRUj9NyYjHbnO5NfkViqsjUsLBdfbyZc_Q=@protonmail.com> <QeFwNvN8Q3lUul6dSJmJlq8MTp9ifHpuXYYhyra79MKEQf5bxqf8kdBtyvzUFMsJfXBoG3fDo_5Cn0m1DOdhPzyS3x4K46tSPAhcsZuwxVQ=@protonmail.com>
Feedback-ID: 13811339:user:proton
X-Pm-Message-ID: 277b51924cc2069afcf5667329e3682cb6f92757
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Another correction....

It is matching a priority of 6, DEI of 0, VID of 96.

sunny

