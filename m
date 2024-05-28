Received: from xmbghk7.mail.qq.com (unknown [119.28.226.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A5116DEC1
	for <netfilter@vger.kernel.org>; Tue, 28 May 2024 13:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=119.28.226.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716901267; cv=none; b=efT/Bc78uxvrzhNrjfNxs5srW6NcExmb2ahMLrl7GwRQWAYPXpgACBiGxfKpw/RGUlEBVW5/M9qsujtofS360NZhDERApkikc7xi+N5/ttc5tAnNI2/o3jQR7nK2shXIJoYH6GATyCW/00tokREVNx7dlk2/UwCgbaYB26aFBo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716901267; c=relaxed/simple;
	bh=Kbf7D9hTy1UYLEOTMdWzFB5kSchyXPiF64BluYscPQQ=;
	h=Message-ID:From:To:Subject:Date:MIME-Version; b=RwBtR09XMp5qnp6ozQufw+iO0mh6Y6Azk8xZ6NN1yG76WqaNZrTDmD+zdEYi9NRy2KO5+l/uYbmo3Ab2qrRNe4VLzDM4Tq57A1nCcEWa6D59aj55vaDzgLtrlnxP6mbERbu+KuL/VHRRgh6wkkUAzIRe4iaz+iaYl+73PH3s30I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=Red54.com; spf=pass smtp.mailfrom=red54.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=mL2ZzpFf; arc=none smtp.client-ip=119.28.226.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=Red54.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=red54.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="mL2ZzpFf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1716901262; bh=Kbf7D9hTy1UYLEOTMdWzFB5kSchyXPiF64BluYscPQQ=;
	h=From:To:Subject:Date;
	b=mL2ZzpFfjDSDZsRynEKdW8QBy3iivK0gw45LFb/od3oXGQujiyWH4eWhrL6vFdsnW
	 gAiCNRnBpy4wFNga0k8Vt9LBKUWYU3xEz+634wyvaTdl3C0bHt1z/rlsnxxB1s5HRu
	 tK9t7kzK0NBEecSkfFolpp8SdjR0rbSNR+J88734=
Received: from mail.red54.com ([2a09:bac5:80cc:15f::23:1f1])
	by newxmesmtplogicsvrszc5-2.qq.com (NewEsmtp) with SMTP
	id EF030290; Tue, 28 May 2024 20:59:48 +0800
X-QQ-mid: xmsmtpt1716901188tj2fwj5o4
Message-ID: <tencent_74F5D51FD6F36D7BDACF7720052D690F9B06@qq.com>
X-QQ-XMAILINFO: MsVh1D+XQWnXKIJrrQVVO6jEM1g/ld1eDTHl2kzl6u1ahkVziQjn12UIhzMuV0
	 Hx3iFON88hSLWDRtTQxkhTkVMZQcgH9xyQEQgtxpKrreVYZTRGwzWjq4KyoweXm+kTVdFXASOQgZ
	 tfYGHuFunklWiwmlkukjMg5DImQeYLBt/+4NPyhM/77hXJJ+2KyU/iRSjZMrE2ahfVTcghLhhxgw
	 Yfrhb6WRNV9FUeTAkbp2G2TF8vVUPnc/59lgQhqkkZ6A1H7q6lSsgIbT3LxmdoJrLwXhf3p/Sn/v
	 PB5KQYYyyJtDD3pCzNgbitsXrglloUodevb2kL/rqjxP77TF7zP2h/qc7UikKQ5PgMmBMb/V1J+P
	 W2/pRTASIBF8USYNVfwky2LhmHNyUdUNvbPgFMJvpD5VWRM4t2r9D/80bX1xAa26vG+PDZ6omYj5
	 BNHDEfLSSkunOTnZjInBT0V6dYdLODBwTTbgE21mXuk2GPoFlrROzkU50qpaxWvYqmxi4qMeQlPy
	 M7zft0QmALknQcWFyrSSMW8gAEo24IbYtDtAn7fKaBQY57A6/Wyr2gebNPPl27bEq+LcidBlpEQx
	 ewmMLSejFp2aPrgFLGpUC+RKUf7ZPgH9BheDEZsDMp1QNIdE+enkDkrmV/rzQkweknRXtZeaF2xU
	 LI4xYB4XpAg+okAkS6/3izTpQNob0yKfEmQnfmojKNAYx9pyQcnFwtwBxzNcyX7WPeQ6zq3RYPEx
	 ftCOIR9+/O4AouNQjmHn2l989dvBGhKsVNYQPa4GyswTnfbgRAQ/pff9YeNMTVJxbhdJjL9HewuN
	 4wOOOiL3+HzbCpJgXMXpCo41CdetVR8+PXne/JGJjXHxfXnEvepkbx3UvA4R4JfcsnYF66nH7Urj
	 nzAYlnVFRtb37ycDlvPl/rhBuI1/u0lLPyTbcr1ticLqR8xjXh50NuUCs9t+VxlCR3uq5noxzptY
	 rmRyUI7P0RgJQj0bB+DvE+cTQBqXZGKTMh3p9QVu9D4Sva87PGbZ1suWHn83GszP/Y3BGzspspqn
	 V6Fc9VhaT5STqXuFl5wCTu34rvm6xJ2m0j0qJGe2oV9PFJ2dZLCyw1sl8cJDzUtVnJif3aAw==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
Sender: yeking@red54.com
From: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>
To: netfilter@vger.kernel.org
Subject: [wiki] typo in Nftables families
Date: Tue, 28 May 2024 12:59:47 +0000
X-OQ-MSGID: <20240528125947.164800-1-Yeking@Red54.com>
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

https://wiki.nftables.org/wiki-nftables/index.php/Nftables_families
"New in nftables 0.9.7 and Linux kernel 4.10 is the inet family ingress hook"
It should be "kernel 5.10".

