Received: from sonic308-12.consmr.mail.ne1.yahoo.com (sonic308-12.consmr.mail.ne1.yahoo.com [66.163.187.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D75E23CF08
	for <netfilter@vger.kernel.org>; Fri,  7 Mar 2025 17:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.187.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741367867; cv=none; b=IRwmBPL8Pkz9wHIFav2ub0aHaHq55GLcCTZ1TWPK1KqqEGIpBFrWiED5WwRJWlO9VlvOSEOUmkBLFmI4MKr1Wo7dzBENQ4l1s33zeNKJRMXUZlNfeus8oSliNV58CD+FMTjP4ENcVRIkuTE7+wMsYjdxdd6PvFbOtjWqxDMadMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741367867; c=relaxed/simple;
	bh=EV2x61xFZfKu+uAyBkTcqovufEtWiy/hdW1xPVH8PPw=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type:
	 References; b=mBxvO0/tseULIVdkad2y2GFm+vldFUT4XKSuGgcN6Kf2jCR/y1y0E8UUTZSxUGSHgCRU+uAe5uhTLZfo2xr/VGrLON++KBss7EDCOyEvBi68l+3HDYnHltrEILDLaeDwdbLel5xoW1K3OWs/6/u8dmzZ97dCtdbRLNdLwcSjvmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sbcglobal.net; spf=none smtp.mailfrom=sbcglobal.net; dkim=pass (2048-bit key) header.d=sbcglobal.net header.i=@sbcglobal.net header.b=qq2rA7sY; arc=none smtp.client-ip=66.163.187.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sbcglobal.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sbcglobal.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sbcglobal.net header.i=@sbcglobal.net header.b="qq2rA7sY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sbcglobal.net; s=s2048; t=1741367865; bh=jCI8zZcUOctBgdTEsURo/CT25vQL24p4zv68GKMyjFs=; h=Date:To:From:Subject:References:From:Subject:Reply-To; b=qq2rA7sYXVcWq1HtfpNEdutrB0d6PdOUzhvIPfpNYUJStRhObsr9ID0e9Al4EnN9Snxs7rO9lmXXNjOtIKuxrADTU4+HGczxrgD3CFlC6H+nrJXRDqdB129BHPFxQXeYJM53KPE2q1BljGekqlmMDdq5NEJITsKaV2ufrIwAAA+S7bte0cQtPQoSpKeGhrM8TS2C6kTYL8qgfP/a1w4qVD5+ah7PfHxu/ILYDvK1gdAvK739TUqWdDOaXhYbNjXcYmekiyrOj0U8XCYWra3XOAhTqIoUYOvWb4qzNVmhnlKsmj+RgIM83O3J3fOm77vz+RABf20BzM+AZHwPMaV0/A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1741367865; bh=FcdaGDvaSk9HdKJr8B5UvI8azBgTA9HiVPO+ZRyQrKO=; h=X-Sonic-MF:Date:To:From:Subject:From:Subject; b=Ay62gtpqbjBZ6BIBCkJYKkX1S+gUZ5LNo3/S7kWkKUK+W9hmzzjnegflgmc+QqJN2vtLQLJHjdHkPn74SEjenkZ/O6/T7rA1TIKuXKRqiGNyvFMv3NBTwg9QJfqf7uhQXQvjfCcUNbNoJ3qwAfoe3p0p34PqpGvBoz0QaSjIa4LY5zR2c0TW/gVrhvV9lffKspQcT9BOCCrPctLJx942GmSgaazz68Vh5A6yZrrr6WqMJMlkaDD6jlaNUVr3BADDJS9IU67pjSZ6g5mutp0wt+ZAoYWH5SuipCPYUc6bkT0vTqFicL364z6EwciBEwhAOqQCdQ6JtybHUU+4U4YgHw==
X-YMail-OSG: NxiUiZsVM1lEfvhVUFzhn2gNiMZrHHPFEtSnA8501Fy5X3YKCtEQJFEpbfkrjKS
 pI3KXmPbTvp9IDXLRsfgAeACbh5Xs1AAtcSP5310FH7h51ED76kthOMa0iqBagHv6p.A9Py1ciJf
 hcUbkyqGoigKH1bsCR9EauetCGk.ZrtsNbqp8ST6CvmMciVt1RtR7_ctrVXNzcPWDKDpMtZx1jNY
 s1OJmEOgqKakKq6Abm_TibDMinL_E4a420mo44RRk2V..d8V1JE4E_LAO5PdqiAe8DnD2ETUJYgw
 DZqbTThqc2NMQXDpZzlgvaBr3QByfuhb6vs0hZmChY.UsVi3_cFsXDZs_s2KcaQUH6ck6yKO6P.7
 Kf574OtkUYD70gFMH2knjwrqoyE41FrdAYFoKbXVJhRWia1w6Jo67NqYiMZSeKn75ejNb3UI.qlT
 aA.Lcehb4yNWm6u4I5hnWuL9OS0GEtwHsH7nz_06sAC4dzL1Ndsq5Z_Sb_bwAC1ZDhd3aSXOL00v
 _JqUdcmKbb4d4PRBei4WPsUblPgFRYzyu8iYL2412QeaCYJjBEqLHbH8nEbRDNAlXyv3o1Y6Lroo
 ehUi2jx9g._ERiBmTv9hA6dA6u.1Q01e8F5RI8MfuboqfctDviGaq8oHQT.voaxxf9g4vpjZ2PN7
 bJrjQAQUcqXqdTWsGmOm6QEjoU6rMBoRR0n5PkgSoxL8BxnkehDmlKiHeN7lH99DD6hjjmZ4Oawl
 DisvPk0b0XmSJHSbGLeJRYrtw6RXnTBSLTnhdedjrTQdiewmiYodd7EpWd6_GubRIMbzv68t6Sku
 uoWseaPe.njTtQEszeuBINESBxPOAbsuE8DJXfU9TnTXqxxM2gvbRL.UA1Vpb3WtOgB_zNoQouJB
 gAEfLeain4sEh9g6R0id706wSx7dSfsqlHodgDJXWzDVVoHN0LMw.U10HdzIfwpuRR.NzD7lbsP6
 WYtIiSMuLsmixeXg9U3S0dSP6cTobWkOlfX3u3PCk9fCsg38MbJXCWADJaTWa5cYvUQ39ITizdgq
 UGQ_dmCGBeZnwMRvg9YcO_6CIdbSDnjBCcFMcxoAiGe92AesL9Cu7_91TPzf1B3IqxfQmcVXAKR_
 lVArol.5QmDxFIKKV9v8Qonb6z2SJ5tG_biBNlQ8JoAlPQxgrSuja2i4sxx5KxMRIEjUTWSruxlw
 IacITtHGDWTajnAuXAdisD4tum9htDQzXIrxzU7S03XbkQAZf_xQhmjrtWrtXjVhmcr.UYI2y4Zw
 sVPfBFvGpycZ2PKMxJB.jQpqhL5rlJ3huPpCC9grfc8hrmCnFVfvcwizj0.PDPUSOoQtXZbf.Iu4
 y4i8RjKqh7JCXS6dZm_4tLKOh__ng00_2.n9bxiP4q043Ra4J7WtYqBq.nyAFZIN6EihmXxTpiE1
 Go49YaF8jwG5odlQmRMN3mOVt7jVnr45PFN.ZqL0zO.uvTEsxGdgqo2gALONu7DLkTQLFBIA6kUX
 9tEkQNykDfEdCtgruLFyIFA90_eI2Nss2DTJnudWdLDeUIyEXGWonKIr6vsCpHE9LZ35KtTMlgGX
 UbNnq8LosbePuXSWbGOMvYWdp.yAPWSNeAD8tFTuwv8oyY.RL_WZoPTNyuE0cLHxV.iwGrbVB.pp
 0cjygMT8D7gh9ji5OOyz8tYlRNWanknL7hO5532UKl_f0R3CLyus0G99EKN6T_nb6y3wprKBFgkY
 jlqNnJfPkKLgQbPamrukcyyS3FmCSS.fAmrTuauOerHlbqoBbuXeZVwuiAip4yq1Q5A_h2s51dC2
 _JMS0ZeTEQGE6fctD0bFM3nFMLPGVEitn8HINv8hAbvu_LKnldl71MuKCYkVzBHCUxBXeYGhs_fX
 CcM139AmWMn3CGxL5oxo6c3hp_M.KxywEpvCjIe_xB_SAqZDIaAZt5Go3eNzdZucJKgVx1CbW0oK
 AqKhiucOP9oupqDhQdE7i2iEzcb5ZUJIkfsRUcIxswYCPjr4BSz6PNawv5nriCRs4dJ8pWQzfxNs
 T.t325B8XkiwxFegb3U7d8VHDcgSVBi3kWH5pdZADgF15uHy9Iji7k0JYDF1Lg72PF8P_OGqF7I2
 1iQAqhJQs_dE3e_zDsjFeYb2f711LD622YObTU3qhZQJcqpJfaY3.bGSup_TvgDfvm0BtIxoK7LX
 36519A7UI13C2P1bbwgBBL0wukjYlGG2SoWvjdJpenZ.9OsGeMOmjRBjj3x1CaOgs08qeo_41dI4
 rvg4dIJtHBdYKSKA41L.afYF8CgvtAnkTsz8uOoTfUIr11cks9wGnEvVsbcI8Vwf7GjbWm6PVOuP
 J2ZE-
X-Sonic-MF: <s.egbert@sbcglobal.net>
X-Sonic-ID: 8eefc660-7983-4528-9e0c-b1fcd72c7892
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.ne1.yahoo.com with HTTP; Fri, 7 Mar 2025 17:17:45 +0000
Received: by hermes--production-ne1-8446b9c656-v642n (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 9ad9f2709abd4d39b70ab699fd27d8bf;
          Fri, 07 Mar 2025 16:57:31 +0000 (UTC)
Message-ID: <744a8f97-e72c-4a7c-b2f2-a121f0019778@sbcglobal.net>
Date: Fri, 7 Mar 2025 10:57:31 -0600
Precedence: bulk
X-Mailing-List: netfilter@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
List-Subscribe: <mailto:netfilter+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netfilter+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: netfilter@vger.kernel.org
From: S Egbert <s.egbert@sbcglobal.net>
Subject: Yet another Syntax Highlighter for NFTABLES
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
References: <744a8f97-e72c-4a7c-b2f2-a121f0019778.ref@sbcglobal.net>
X-Mailer: WebService/1.1.23435 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

Want syntax highlighting of your nftables?

I might be able to help.  I want to help.  I might be able to deliver as 
   this is 3-year in the making (on-and-off).

Link below is an animated GIF of an edit session that is perusing over 
13,000 unique lines of nftables commands, statements, expressions and 
actions:

https://github.com/egberts/vim-nftables/blob/master/test/nftables.gif



Installation (suitable for offline/closed-network install):

https://github.com/egberts/vim-nftables/blob/master/INSTALL.md



README

https://github.com/egberts/vim-nftables/blob/master/INSTALL.md



90-95% done.  Could use a tiny bit more fleshing out notably within the 
`stmt` parse tree.  Only requirement is a mastery of Vimscript/VimL 
programming.  I find this not easy despite my mastery of this.

Please don't roast me.  :-)

Enjoy.

S. Egbert
