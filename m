From: Olaf Zaplinski <olaf@zaplinski.de>
Subject: RE: lots of ACKs for DPT=1433
Date: Mon, 08 Aug 2016 13:56:56 +0200
Message-ID: <14f3006c1e6929ef8fd457fb33823ca9@mail.zaplinski.de>
References: <d5bbb8f26b17a1d6cf8044864b7aa587@mail.zaplinski.de>
 <5342a37e-1534-59bd-16ac-dc4df108fea7@sterenborg.info>
 <bf5e106359174bc234805b6d5539d136@mail.zaplinski.de>
 <e0b3415fe427476e94df8050ef14e529@CCDEX021.corp.corpcommon.com>
 <cd37a7570597bcb79afbdc64c72dc162@mail.zaplinski.de>
 <dbcb8e516e9d42369eaf288261fcefaf@CCDEX021.corp.corpcommon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zaplinski.de;
	s=20150415; t=1470657416;
	bh=qF5kmTTjBvvy71VP2alsczyexr7Q57lh3AnRT179fIw=;
	h=To:Subject:Date:From:In-Reply-To:References;
	b=hgcoYqgFWokV64Qjv27G8rBMF7RxRtUp0qVCuI0seksWhBbm2fF/ugRxqrXXbFZA+
	 WQZaiOB11woKyRnIluy/XLxZfnPZoyiJK8mEqBzfOQrjhC+Izzgs4Wvm3X4s0g7VOJ
	 JVXWqPtJg1sYE3PHkOGAbXEomQrmSWsaYIceECTJIhIhhmDTb8ahWkRVHQtAG1TSTb
	 B0nDDkSsoF5uLnTakQVR/uRNAQAvWd8qxATu617prm27LxCx8H0nv2UFYYBxsW+gZy
	 W9iIZZdcY4I8tAXHcUDeqZICvy6Q2ZD2FmO2F8I89CRVpeJ13yVR5K4yPC8H364A+n
	 RAADH7RlbA/1A==
In-Reply-To: <dbcb8e516e9d42369eaf288261fcefaf@CCDEX021.corp.corpcommon.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Am 2016-08-08 13:14, schrieb Andr=C3=A9 Paulsberg-Csibi:
> I adjusted logs to keep only "smallest crital" data left :)

Hmm, I think I should filter that a bit. ;-)

> From what I can see these logs show , you have 2 things happening :
> the last from AUG 6 seem like a normal session that is no longer
> responding ( maybe timed-out )

No outbound connections to TCP 1433 here, and no inbound either.

> Maybe the attackers are looking for systems behind old non-stateful FW
> who only block SYN packets and
> allows any other flaged packets into their systems assuming they are=20
> "safe" ...
> ... most likely ( and you can try ) if you grep for
> "SRC=3D109.170.163.174" you will most likely find
> 3-8 tries , and maybe 1 or 2 with SYN first .

Actually that have been 53 connections, berhaps because I am tarpitting=20
instead of rejecting.

Olaf
