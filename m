Received: from primex.slavino.sk (primex.slavino.sk [185.25.250.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB4818BC2F
	for <netfilter@vger.kernel.org>; Sat, 15 Feb 2025 15:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.25.250.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739631926; cv=none; b=tmMZsifxYi8GnMVjSKXyShpQMfZG3DBo45VATbEL5wiQNSLZO7XlwT5BhxD7e9OpTcR4Sqa134smCpvQYvA5FUL/hE/AP2aVcBScNqUUwJLmYoA7TwzwP7vseDdjVUoTQjh/4Zh6y3US15n+n6amzpg5nIvK5fo/bt2D8NfpCDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739631926; c=relaxed/simple;
	bh=OZVTTPktL0w5BDJGg7G6gxMdzWuOI/Zavj9SR7qQ3Ww=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=TtbzyfOKd3tsF2zxw7y62NUdHk80AwUD+RK5VlKdiOR2iYZXiRg8OMQwYHfvMoRX9adawyWXX4djl9nuhPB2MMOlTVF/F7Y3u4jRXO0Tv/9DpNOHkwTx/19ILDPQfv3kwhinwAkqAYTiMguEOgwRVPJVtoh7oM0dNEu8ScmtLZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk; spf=pass smtp.mailfrom=slavino.sk; dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=hoh+PIzT; dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b=xaNnIUtD; arc=none smtp.client-ip=185.25.250.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=slavino.sk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=slavino.sk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="hoh+PIzT";
	dkim=permerror (0-bit key) header.d=slavino.sk header.i=@slavino.sk header.b="xaNnIUtD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=slavino.sk;
	s=r2025; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:From:
	Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:Content-Type:Message-Id;
	bh=RFvlfjf7BvWLGVJkZ1OChnBo2EPnZMJW7MC1azhVI2M=; t=1739631922; x=1740841522; 
	b=hoh+PIzTE9/U7NU5xpr3ShJ7s0ITU0Hup2v0NHAXA55PodIcZ7XmkyUKwHaBPfSmuDxHOEDcs8m
	vCHxUYvkSptatSwE7w1ou/r/oTzW3zXGtm81M9YO15ALL6ZIeQg4YQ4RvEcrtioLZFZDc+96NElkR
	NyUeLyT6jILalZsWPOw=;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=slavino.sk; s=e2025; h=Content-Type:MIME-Version:Message-ID:Subject:To:From
	:Date:From:Reply-To:Sender:Subject:To:Cc:Date:MIME-Version:Content-Type:
	Message-Id; bh=RFvlfjf7BvWLGVJkZ1OChnBo2EPnZMJW7MC1azhVI2M=; t=1739631922;
	x=1740841522; b=xaNnIUtD2vWKMmhRxpyJ2oHQVzhuorzSknzJNdzr/vdEQIUCDOQ/trDy9jlUb
	Gpl56itF/f3PoS2kmUUTa/4Dg==;
Received: from dovex.skk ([192.168.10.12])
	by primex.slavino.sk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <linux@slavino.sk>)
	id 1tjJbe-000YAu-32
	for netfilter@vger.kernel.org;
	Sat, 15 Feb 2025 15:57:23 +0100
Date: Sat, 15 Feb 2025 14:57:21 +0000
From: Slavko <linux@slavino.sk>
To: netfilter ML <netfilter@vger.kernel.org>
Subject: Cannot browse SQL files in ulog2 git
Message-ID: <468BFBD9-371E-46E5-9BEC-018B8C3F5D11@slavino.sk>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

i recently play with SQL in ulog2, it works, but i want to
read recent SQL examples in doc directory in web browser,
but i got 403 response, the same response provides the
wget tool::

    wget -qSO- https://git=2Enetfilter=2Eorg/ulogd2/plain/doc/mysql-ulogd2=
=2Esql                                            =00
    HTTP/1=2E1 403 Forbidden
    Date: Sat, 15 Feb 2025 14:48:34 GMT
    =2E=2E=2E

The Makefile in this dir is readable=2E=2E=2E

Please, is it really blocked or by some mistake?

regards

--=20
Slavko
https://www=2Eslavino=2Esk/
